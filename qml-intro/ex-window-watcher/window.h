/*************************************************************************
 *
 * Copyright (c) 2017-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef WINDOW_H
#define WINDOW_H

#include <QWindow>

class Window : public QWindow
{
    /*Es necesario siempre que se cuente con señales
    personalizadas*/
    Q_OBJECT

signals:
    void positionChanged(const QPoint &point);

protected:
    void moveEvent(QMoveEvent *event) override;
};

#endif
