#ifndef JWTBUILDER_H
#define JWTBUILDER_H

#include <QObject>
#include <QJsonObject>
#include <QJsonValue>

class JwtBuilder : public QObject
{
    Q_OBJECT
public:
    explicit JwtBuilder(QObject *parent = nullptr);

    QString header() const;
    void setHeader(const QByteArray &header);

    QString payload() const;
    void setPayload(const QByteArray &payload);

    QByteArray buildJWT();

    QByteArray secret() const;
    void setSecret(const QByteArray &secret);

    QList<QPair<QString, QJsonValue> > customField() const;
    void setCustomField(const QList<QPair<QString, QJsonValue> > &customField);

signals:


private:
    QByteArray m_header;
    QByteArray m_payload;
    QByteArray m_secret;
    QList<QPair<QString, QJsonValue>> m_customField;
    const QByteArray HS256_HEADER= "{\"alg\":\"HS256\",\"typ\":\"JWT\"}";


};

#endif // JWTBUILDER_H
