#ifndef QMLAPP_H
#define QMLAPP_H


#include <QtCore/QObject>
#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include "wallet.h"

class qmlApp : public QQuickView
{
    Q_OBJECT

public:
    explicit  qmlApp(QWindow *parent = nullptr);
    bool event(QEvent *event) override;
    ~qmlApp() override;

    enum ViewPage{
        MainPage
    };


public slots:
    void    handleChecker(int val);
    void    handleWallet(QObject *obj);
    void    getWallet(QString walletAddress);
    void    generateWallet(QString secret);
    void    loginWallet(QString username);

private slots:
    void    viewChanger(ViewPage id);
    void    loadMain();
    void    replyFinished();
    void    receiveChangeAddresse();
    void    errorChangeAddresse(QNetworkReply::NetworkError);

signals:
    void changeAddress(QString);


private:
    ViewPage m_pageId;
    QNetworkAccessManager *m_manager = nullptr;
    Wallet *m_wallet;
    const QString serveurAddress= "http://wallet.cb4tech.fr:8000/BeerDrink/";
//    const QString serveurAddress= "http://127.0.0.1:8000/BeerDrink/";
};

#endif // QMLAPP_H
