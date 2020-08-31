#include "jwtbuilder.h"
#include <QCryptographicHash>
#include <qmessageauthenticationcode.h>
#include <qdebug.h>
#include <QJsonObject>
#include <QJsonDocument>
JwtBuilder::JwtBuilder(QObject *parent) : QObject(parent)
{
    m_header = HS256_HEADER;
}

QString JwtBuilder::header() const
{
    return m_header;
}

void JwtBuilder::setHeader(const QByteArray &header)
{
    m_header = header;
}

QString JwtBuilder::payload() const
{
    return m_payload;
}

void JwtBuilder::setPayload(const QByteArray &payload)
{
    m_payload = payload;
}

QByteArray JwtBuilder::buildJWT()
{
    QJsonObject payload;
    int i = 0;
    while (i < m_customField.count())
    {
        payload.insert(m_customField.at(i).first, m_customField.at(i).second);
        i++;
    }

    QJsonDocument doc(payload);

    m_payload=doc.toJson(QJsonDocument::Compact);
    QByteArray result = QByteArray(m_header.toBase64(QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals)).append('.').append(m_payload.toBase64(QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals));
    QByteArray sign = QMessageAuthenticationCode::hash(result,m_secret,QCryptographicHash::Sha256);
    result.append('.').append(sign.toBase64(QByteArray::Base64UrlEncoding | QByteArray::OmitTrailingEquals));
    return result;
}

QByteArray JwtBuilder::secret() const
{
    return m_secret;
}

void JwtBuilder::setSecret(const QByteArray &secret)
{
    m_secret = secret;
}

QList<QPair<QString, QJsonValue> > JwtBuilder::customField() const
{
    return m_customField;
}

void JwtBuilder::setCustomField(const QList<QPair<QString, QJsonValue> > &customField)
{
    m_customField = customField;
}
