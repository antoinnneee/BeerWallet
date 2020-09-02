
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


void    qmlApp::handleChecker(int val)
{
    qDebug() << Q_FUNC_INFO << val;
}

void qmlApp::handleWallet(QObject *obj)
{
    m_wallet = (Wallet*)obj;
    connect(this, &qmlApp::changeAddress, m_wallet, &Wallet::setAddress);
}

void qmlApp::getWallet(Wallet *wallet)
{
    QNetworkRequest getWalletRequest(QUrl(QString(serveurAddress + "wallet/").append(wallet->address()).append('/')));
    getWalletRequest.setRawHeader("User-Agent", "BeerWallet 1.0");
    QNetworkReply *reply = m_manager->get(getWalletRequest);

    connect(reply, &QNetworkReply::finished, this, &qmlApp::replyWalletContent);
}

void qmlApp::generateWallet(QString username, QString password)
{
    QList<QPair<QString, QJsonValue>> jList;
    QPair<QString, QJsonValue> userVal("user", QString(QCryptographicHash::hash(username.toUtf8(),QCryptographicHash::Sha256).toBase64(QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals)));
    QPair<QString, QJsonValue> passVal("pass", QString(QCryptographicHash::hash(password.toUtf8(),QCryptographicHash::Sha256).toHex()));

    jList.append(userVal);
    jList.append(passVal);

//    payload.append(QJsonValue()));
//    payload.append(QJsonValue(QString("pswd=").append(QCryptographicHash::hash(password.toUtf8(),QCryptographicHash::Sha256).toHex())));

    m_jwtBuilder.setSecret(QCryptographicHash::hash(password.toUtf8(),QCryptographicHash::Sha256).toHex());
    m_jwtBuilder.setCustomField(jList);
    //    m_jwtBuilder.setPayload(doc.toJson(QJsonDocument::Compact));

    QByteArray jwt = m_jwtBuilder.buildJWT();
    qDebug()<<jwt;
    QNetworkRequest request(QUrl(QString(serveurAddress + "generate/")));

    request.setRawHeader("User-Agent", "BeerWallet 1.0");
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/x-www-form-urlencoded");
    QNetworkReply *reply = m_manager->post(request,QByteArray("jwt=").append(jwt));
    connect(reply, &QNetworkReply::finished,this, &qmlApp::receiveChangeAddresse);
//    connect(reply, &QNetworkReply::errorOccurred,this, &qmlApp::errorChangeAddresse);
}

void qmlApp::checkConnection(QString username, QString password)
{
    QByteArray hashpass = QCryptographicHash::hash(password.toUtf8(),QCryptographicHash::Sha256).toHex();
    QByteArray userHash = QCryptographicHash::hash(username.toUtf8(),QCryptographicHash::Sha256).toBase64(QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals);
    m_wallet->setAddress(userHash);
    m_wallet->setHashPassword(hashpass);
    sendCheckConnection(userHash, hashpass);
}

#include <QProcess>
void qmlApp::reloadGraph()
{

    qApp->quit();
    QProcess::startDetached(qApp->arguments()[0], QStringList());
//    viewChanger(GraphicTest);
}

void qmlApp::loginWallet(QString username, QString password)
{
    m_wallet->setHashPassword(QCryptographicHash::hash(password.toUtf8(),QCryptographicHash::Sha256).toHex());
    m_wallet->setAddress(QCryptographicHash::hash(username.toUtf8(),QCryptographicHash::Sha256).toBase64(QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals));

//    getWallet(m_wallet);


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

