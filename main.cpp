#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qmlapp.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    const int RESTART_CODE = 1000;
    int returnCode = 0;
        QGuiApplication app(argc, argv);
        qmlApp ap;
        returnCode = app.exec();

    return 0;
}
