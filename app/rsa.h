#ifndef RSA_H
#define RSA_H

#include <QObject>

class RSA : public QObject
{
    Q_OBJECT
public:
    explicit RSA(QObject *parent = nullptr);

signals:

public slots:
    bool IsPrime(long n);
    long long solve_rsa(long long p, long long q, long long e, long long ct);
    long int calculateD( long int e, long int phi);
    long long decrypt(long long i, long long d, long long n);

};

#endif // RSA_H
