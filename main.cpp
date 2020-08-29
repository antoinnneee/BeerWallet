#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "qmlapp.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlApp ap;

    return app.exec();
}
