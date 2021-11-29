/*************************************************************************
 *
 * Copyright (c) 2019, Klaralvdalens Datakonsult AB (KDAB)
 * All rights reserved.
 *
 * See the LICENSE.txt file shipped along with this file for the license.
 *
 *************************************************************************/

#include "User.h"


User::User(const QString name, const QDate& birthDay, Role role)
    : m_name(name), m_birthDay(birthDay), m_role(role)
{
}

/*lectura del nombre desde QML*/
QString User::name() const
{
    return m_name;
}

/*Establece  nombre desde QML*/
void User::setName(const QString &name)
{
    /*!IMPORTANTE: no emitir señales si no ha
    cambiado el valor*/
    if ( name == m_name )
        return;
    m_name = name;
    emit nameChanged(); // La señal se debe emitir una vez cambiado el valor
}

int User::age() const
{
    // Yes I know the code is broken if you haven't had the birthday this year yet
    // It's an exercises for the interested student to fix :-)

    // Further, notice we would have to set up a signal to fire when we reaches his birthday.
    /*No es necesario que la propiedad tenga correspondencia
    con una variable privada de la clase, las propiedades existen
    como concepto*/
    return QDate::currentDate().year() - m_birthDay.year();
}

User::Role User::role() const
{
    return m_role;
}

void User::setRole(User::Role role)
{
    if ( role == m_role )
        return;

    m_role = role;
    emit roleChanged();
}

bool User::loggedIn() const
{
    return m_loggedIn;
}

void User::setLoggedIn(bool loggedIn)
{
    if (loggedIn == m_loggedIn)
        return;

    m_loggedIn = loggedIn;
    emit loginChanged(loggedIn);
}

void User::changeRole()
{
    setRole(m_role == User::Developer ? User::ProjectManager : User::Developer);
}
