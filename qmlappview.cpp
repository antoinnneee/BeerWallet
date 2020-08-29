
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include "qmlapp.h"
#include <QNetworkAccessManager>
#include <QNetworkReply>

void    qmlApp::viewChanger(ViewPage pageId)
{
    if (pageId == MainPage)
        QMetaObject::invokeMethod(this, "loadMain", Qt::QueuedConnection);
}


void    qmlApp::loadMain()
{
    setSource(QUrl("qrc:/main.qml"));
    m_pageId = MainPage;

}

void qmlApp::replyFinished()
{
    QNetworkReply* reply =(QNetworkReply*) sender();
     qDebug()<<reply->error();
     if (reply->error() == QNetworkReply::NetworkError::InternalServerError || reply->error() == QNetworkReply::ContentNotFoundError)
         return;
    QList<QByteArray> fields = reply->readAll().split('\n');
    //qDebug()<<fields;
    m_wallet->setAddress(fields.value(0).split(':').last());
    m_wallet->setBeerToken(fields.value(1).split(':').last().toInt());
    m_wallet->setMojitoToken(fields.value(2).split(':').last().toInt());
    m_wallet->setServiceToken(fields.value(3).split(':').last().toFloat());
    reply->deleteLater();
}
