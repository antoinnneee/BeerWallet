#ifndef WALLET_H
#define WALLET_H

#include <QObject>
#include <QDebug>

class Wallet : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString address READ address WRITE setAddress NOTIFY addressChanged);
    Q_PROPERTY(int beerToken READ beerToken WRITE setBeerToken NOTIFY beerTokenChanged)
    Q_PROPERTY(int mojitoToken READ mojitoToken WRITE setMojitoToken NOTIFY mojitoTokenChanged)
    Q_PROPERTY(float serviceToken READ serviceToken WRITE setServiceToken NOTIFY serviceTokenChanged)
public:
    explicit Wallet(QObject *parent = nullptr);
    static void registerQml();


    QString address() const
    {
        return m_address;
    }

    int beerToken() const
    {
        return m_beerToken;
    }

    int mojitoToken() const
    {
        return m_mojitoToken;
    }

    float serviceToken() const
    {
        return m_serviceToken;
    }

signals:

    void addressChanged(QString address);

    void beerTokenChanged(int beerToken);

    void mojitoTokenChanged(int mojitoToken);

    void serviceTokenChanged(float serviceToken);

public slots:
    void setAddress(QString address)
    {
        qDebug()<<Q_FUNC_INFO<< address;
        if (m_address == address)
            return;

        m_address = address;
        emit addressChanged(m_address);
    }

    void setBeerToken(int beerToken)
    {
        if (m_beerToken == beerToken)
            return;

        m_beerToken = beerToken;
        emit beerTokenChanged(m_beerToken);
    }

    void setMojitoToken(int mojitoToken)
    {
        if (m_mojitoToken == mojitoToken)
            return;

        m_mojitoToken = mojitoToken;
        emit mojitoTokenChanged(m_mojitoToken);
    }

    void setServiceToken(float serviceToken)
    {
        qWarning("Floating point comparison needs context sanity check");
        if (qFuzzyCompare(m_serviceToken, serviceToken))
            return;

        m_serviceToken = serviceToken;
        emit serviceTokenChanged(m_serviceToken);
    }
private:

    QString m_address;
    int m_beerToken = 0;
    int m_mojitoToken = 0;
    float m_serviceToken = 0;

};

#endif // WALLET_H
