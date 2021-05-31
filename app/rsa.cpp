#include <QDebug>
#include <QFile>
#include <QCryptographicHash>
#include <QDir>
#include <cmath>

#include "rsa.h"
#include <iostream>
#include <gmpxx.h>

RSA::RSA(QObject *parent) : QObject(parent)
{

}

bool RSA::IsPrime(long n)
{
    if (n < 1) {
        return false;
    }
    if (!(n-1)) return false;
    for (long i = 2;i<=sqrt(n);i++)
    {
        if (n%i==0) return false;
    }
    return true;
}

long int RSA::calculateD( long int e, long int phi)
{
    if ((e < 1) || (phi < 1)) {
        std::cerr << "Числа p, q и e должны быть натуральными!";
        return -1;
    }
    if (!IsPrime(e)) {
        return -1;
    }

    long int d;
    long int k = 1;

    while (1) {
        k = k + phi;

        if ( k % e == 0) {
            d = (k / e);
            return d;
        }
    }
}


long long RSA::solve_rsa(long long p, long long q, long long e, long long ct) {
    if ((p < 1) || (q < 1) || (e < 1)) {
        std::cerr << "Числа p, q и e должны быть натуральными!";
        return -1;
    }
    if (!IsPrime(p) || !IsPrime(q) || !IsPrime(e)) {
        std::cerr << "Числа p, q и e должны быть нечётными!";
        return -1;
    }


    long n = p * q;
    long phi = ( p - 1 ) * ( q - 1 );
    long d = calculateD(e, phi);

    long long decryptedText = decrypt(ct, d, n);

    return decryptedText;
}


long long RSA::decrypt(long long i, long long d, long long n)
{
        long long current, result;

        current = i;
        result = 1;

        for ( long long j = 0; j < d; j++ )
        {
           result = result * current;
           result = result % n;
        }

        return result;
}
