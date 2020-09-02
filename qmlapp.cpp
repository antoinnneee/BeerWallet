
#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>

#include "qmlapp.h"
#include "jwtbuilder.h"
#include <QCryptographicHash>


qmlApp::qmlApp(QWindow *parent) : QQuickView(parent)
{
    setResizeMode(QQuickView::SizeRootObjectToView);
    setGeometry(50, 50, 600, 600);
    rootContext()->setContextProperty("cpp", this); // uncomment this line to use c++ function from QML
    Wallet::registerQml();

    m_wallet = new Wallet();
    m_manager = new QNetworkAccessManager(this);

//    connect(m_manager, &QNetworkAccessManager::finished,            this, &qmlApp::replyFinished);
    viewChanger(MainPage);
    show();
}


/*
 * Gestion Close Event
 */
bool qmlApp::event(QEvent *event)
{
    if (event->type() == QEvent::Close)
    {
        if (m_pageId != MainPage)
        {
            viewChanger(MainPage);
            return true;
        }
    }
    return QQuickView::event(event);
}

qmlApp::~qmlApp()
{

}
