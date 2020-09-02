
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
    if (pageId == GraphicTest)
        QMetaObject::invokeMethod(this, "loadGraphic", Qt::QueuedConnection);
}


void    qmlApp::loadMain()
{
    setSource(QUrl("qrc:/main.qml"));
    m_pageId = MainPage;

}
void    qmlApp::loadGraphic()
{
    setSource(QUrl("qrc:/CoinTextureTester.qml"));
    m_pageId = MainPage;

}
