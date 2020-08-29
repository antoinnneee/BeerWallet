
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QDebug>

#include "qmlapp.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QCryptographicHash>

void    qmlApp::handleChecker(int val)
{
    qDebug() << Q_FUNC_INFO << val;
}

void qmlApp::handleWallet(QObject *obj)
{
    m_wallet = (Wallet*)obj;
    connect(this, &qmlApp::changeAddress, m_wallet, &Wallet::setAddress);
}

void qmlApp::getWallet(QString walletAddress)
{
    QNetworkReply *reply = m_manager->get(QNetworkRequest(QUrl(QString(serveurAddress + "wallet/").append(walletAddress).append('/'))));

    connect(reply, &QNetworkReply::finished, this, &qmlApp::replyFinished);
}

void qmlApp::generateWallet(QString secret)
{
    QNetworkRequest request(QUrl(QString(serveurAddress + "generate/")));
    request.setRawHeader("User-Agent", "BeerWallet 1.0");
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkReply *reply = m_manager->post(request,QByteArray("w_adr=").append(secret));
    connect(reply, &QNetworkReply::finished,this, &qmlApp::receiveChangeAddresse);
//    connect(reply, &QNetworkReply::errorOccurred,this, &qmlApp::errorChangeAddresse);
}

void qmlApp::loginWallet(QString username)
{
    getWallet(QCryptographicHash::hash(username.toUtf8(),QCryptographicHash::Sha256).toHex());

}

void qmlApp::receiveChangeAddresse()
{
    QNetworkReply* reply =(QNetworkReply*) sender();
    qDebug()<< Q_FUNC_INFO << reply->error();

    if (reply->error() != QNetworkReply::NoError)
        return;
    emit changeAddress(QString(reply->readAll()));
}


void qmlApp::errorChangeAddresse(QNetworkReply::NetworkError)
{
    QNetworkReply* reply =(QNetworkReply*) sender();
    qDebug()<< Q_FUNC_INFO << reply->error();

}

