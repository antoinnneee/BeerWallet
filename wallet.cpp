#include "wallet.h"

#include <QQmlEngine>
#include <QDebug>

Wallet::Wallet(QObject *parent) : QObject(parent)
{

}

void Wallet::registerQml()
{
    qmlRegisterType<Wallet>("Wallet", 1, 0, "Wallet");

}

QByteArray Wallet::hashPassword() const
{
    return m_hashPassword;
}

void Wallet::setHashPassword(const QByteArray &hashPassword)
{
    m_hashPassword = hashPassword;
}
