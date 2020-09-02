
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QDebug>

#include "qmlapp.h"
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QCryptographicHash>
#include <QJsonArray>
#include <QJsonValue>
#include <QJsonDocument>
#include <QJsonObject>



void qmlApp::sendCheckConnection(QByteArray hashUser, QByteArray hashPass)
{
    QList<QPair<QString, QJsonValue>> jList;
    QPair<QString, QJsonValue> userVal("user", QString(hashUser));
    jList.append(userVal);

//    payload.append(QJsonValue()));
//    payload.append(QJsonValue(QString("pswd=").append(QCryptographicHash::hash(password.toUtf8(),QCryptographicHash::Sha256).toHex())));

    m_jwtBuilder.setSecret(hashPass);
    qDebug()<<"sign:" << hashPass;
    m_jwtBuilder.setCustomField(jList);
    //    m_jwtBuilder.setPayload(doc.toJson(QJsonDocument::Compact));

    QByteArray jwt = m_jwtBuilder.buildJWT();
    QNetworkRequest request(QUrl(QString(serveurAddress + "checkConnection/")));

    request.setRawHeader("User-Agent", "BeerWallet 1.0");
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkReply *reply = m_manager->post(request,QByteArray("jwt=").append(jwt));
    connect(reply, &QNetworkReply::finished,this, &qmlApp::checkConnectionResult);

}

void qmlApp::checkConnectionResult()
{
    QNetworkReply* reply =(QNetworkReply*) sender();
    qDebug()<< Q_FUNC_INFO << reply->error();

    if (reply->error() != QNetworkReply::NoError)
    {
        m_wallet->setConnectionState(Wallet::NotConnected);
        m_wallet->clear();
        return;
    }
    QByteArray res = reply->readAll();
    qDebug()<<Q_FUNC_INFO << res;
    if (res.toInt() == 1)
    {
        m_wallet->setConnectionState(Wallet::Connected);

    }
    else{
        m_wallet->setConnectionState(Wallet::NotConnected);
        m_wallet->clear();
    }

}



void qmlApp::replyWalletContent()
{
    QNetworkReply* reply =(QNetworkReply*) sender();
     qDebug()<<reply->error();
     if (reply->error() == QNetworkReply::NetworkError::InternalServerError || reply->error() == QNetworkReply::ContentNotFoundError)
    {
         m_wallet->clear();
         return;
    }
    QList<QByteArray> fields = reply->readAll().split('\n');
    qDebug()<<fields;
    m_wallet->setAddress(fields.value(0).split(':').last());
    m_wallet->setBeerToken(fields.value(1).split(':').last().toInt());
    m_wallet->setMojitoToken(fields.value(2).split(':').last().toInt());
    m_wallet->setServiceToken(fields.value(3).split(':').last().toFloat());
    reply->deleteLater();
}





