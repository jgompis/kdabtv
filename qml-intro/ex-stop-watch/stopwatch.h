/*************************************************************************
 *
 * Copyright (c) 2008-2011, Nokia Corporation and/or its subsidiary(-ies).
 * Copyright (c) 2012-2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#ifndef STOPWATCH_H
#define STOPWATCH_H

#include <QObject>

class StopWatch : public QObject
{
    /* No es necesario en Qt5 (si en Qt4) pero tiene
     * ventajas al utilizar gammaray. También es necesario
     * cuando se utilizan conexiones basadas en Macros
    */
    Q_OBJECT

public:
    explicit StopWatch(QObject *parent = nullptr); // Constructor

private slots: // Slots, no es necesario explicitarlo
    void addOneSecond();

private: // Variable interna
    int m_secs;
};

#endif
