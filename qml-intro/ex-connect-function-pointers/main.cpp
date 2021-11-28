/*************************************************************************
 *
 * Copyright (c) 2012-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include <QtWidgets>

// this is a functor
struct LogString {
  LogString(const QString & prefix) : m_prefix(prefix) {}

  void operator () (const QString &string) {
    qDebug() << m_prefix + string;
  }

private:
  QString m_prefix;
};

void myStandAloneFunction() {
    QApplication::quit();
}

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    QWidget *window = new QWidget();
    window->setAttribute(Qt::WA_DeleteOnClose);
    QVBoxLayout* topLayout = new QVBoxLayout(window);

    // Set up of the GUI
    QSlider* slider = new QSlider(Qt::Horizontal);
    slider->setRange(0, 100);

    QSpinBox* spin = new QSpinBox;
    spin->setReadOnly( true );

    QHBoxLayout* horizontalLayout = new QHBoxLayout;
    horizontalLayout->addWidget(slider);
    horizontalLayout->addWidget(spin);
    topLayout->addLayout(horizontalLayout);

    QLineEdit* lineEdit = new QLineEdit;
    topLayout->addWidget(lineEdit);

    QPushButton* quitButton = new QPushButton("Click to quit");
    topLayout->addWidget(quitButton);

    QPushButton* pressMeButton = new QPushButton("Press Me!");
    topLayout->addWidget(pressMeButton);

    // using pointer to member function
    QObject::connect(slider, &QSlider::valueChanged,
                     spin, &QSpinBox::setValue);
    // set the slider position and hence the QSpinBox value too
    slider->setValue(40);

    // 1. using a lambda function
    QObject::connect(pressMeButton, &QPushButton::pressed,
                     [pressMeButton] {pressMeButton->setText("Release Me!");});
    QObject::connect(pressMeButton, &QPushButton::released,
                     [pressMeButton] {pressMeButton->setText("Press Me!");});

    // 2. using a functor
    /*LogString es un functor*/
    QObject::connect(lineEdit, &QLineEdit::textChanged, LogString("Log: "));


     // 3. using a stand alone function pointer
    QObject::connect(quitButton, &QPushButton::clicked,
                     myStandAloneFunction);

    // Using a context object to break the connection (when the context object
    // is destroyed)
    QLabel *selfDestroyingLabel = new QLabel("Click the button in the other window."
                                             "Then close this window and reclick the button.");
    selfDestroyingLabel->setWordWrap(true);
    selfDestroyingLabel->resize(400, 200);

    // make the label delete itself when it gets closed
    /*Cuando sea que se cierre la ventana, Qt notificará que borrará el objeto
    */
    selfDestroyingLabel->setAttribute(Qt::WA_DeleteOnClose);

    // Lambda con problemas que hace referencia a un objeto destruido
//        QObject::connect(pressMeButton, &QPushButton::clicked,
//                         [selfDestroyingLabel] {
//            selfDestroyingLabel->setText(selfDestroyingLabel->text() +
//                                         "\nButton clicked!");
//        });

    /* Problema corregido al indicar quién implementa el slot, forma preferida
    de implementar slots con expresiones lambda
*/
    QObject::connect(pressMeButton, &QPushButton::clicked, selfDestroyingLabel,
                     [selfDestroyingLabel] {
        selfDestroyingLabel->setText(selfDestroyingLabel->text() +
                                     "\nButton clicked!");
    });


    window->show();
    selfDestroyingLabel->show();

    window->raise();
    window->activateWindow();

    return app.exec();
}

