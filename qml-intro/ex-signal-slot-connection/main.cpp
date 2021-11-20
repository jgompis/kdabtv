/*************************************************************************
 *
 * Copyright (c) 2010-2011, Nokia Corporation and/or its subsidiary(-ies).
 * Copyright (c) 2010-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include <QtWidgets>

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);

    QWidget* window = new QWidget(); // Crea nueva ventana
    window->setAttribute(Qt::WA_DeleteOnClose); // Destruye aplicación al cerrar ventana
    QHBoxLayout* layout = new QHBoxLayout(window); // Crea un nuevo Layout en la ventana

    // Set up of the GUI
    QSlider* slider = new QSlider(Qt::Horizontal); // Crea un Slider
    slider->setRange(0, 100); // Establece el rango del slider

    QSpinBox* spin = new QSpinBox; // Crea una SpinBox
    spin->setReadOnly( true ); // Pone la SpinBox como readonly (para el usuario)

    layout->addWidget(slider); // Agrega el slider al layout
    layout->addWidget(spin); // Agrega la spinbox al layout

    /*Conecta la señal del slider con el slot de la SpinBox*/
    // using pointer to member function
    QObject::connect(slider, &QSlider::valueChanged,
                     spin, &QSpinBox::setValue);

    /*Establece el valor inicial del slider*/
    // set the slider position and hence the QSpinBox value too
    slider->setValue(40);

    /*Muestra la ventana*/
    window->show();

    /*Ejecuta la aplicación*/
    return app.exec();
}
