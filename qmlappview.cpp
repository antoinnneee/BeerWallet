
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
