#include "hash.h"
#include <QDebug>
#include <QFile>
#include <QCryptographicHash>

Hash::Hash(QObject *parent) : QObject(parent)
{

}

QString Hash::check_hash(QString hash) {
    QString eq_str;
    QFile wordlist("~/rockyou.txt");
    if (!wordlist.open(QIODevice::ReadOnly))
            return "Не могу открыть словарь!";

    QTextStream in(&wordlist);
    while (!in.atEnd()) {
        QString text = in.readLine();
        QString text_hash = QString(QCryptographicHash::hash((text.toUtf8()),QCryptographicHash::Md5).toHex());
        if (hash == text_hash) {
            eq_str = text;
            return eq_str;
        }
    }

    wordlist.close();

    return "Ничего не нашлось :(";
}
