#include "bases.h"
#include <QList>
#include <gmpxx.h>
#include<cppcodec/base32_default_rfc4648.hpp>
#include<cppcodec/base64_default_rfc4648.hpp>

Bases::Bases(QObject *parent) : QObject(parent)
{
    clipboard = QGuiApplication::clipboard();
}

QString base16_chars = "0123456789ABCDEF";
QString base32_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ234567";
QString base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
QString base85_chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!#$%&()*+-;<=>?@^_`{|}~";

QList<QString> Bases::bases_encode(QString bytes_to_encode)
{
    QList<QString> result;

    QString b64 = QString::fromStdString(cppcodec::base64_rfc4648::encode(bytes_to_encode.toStdString()));
    QString b32 = QString::fromStdString(cppcodec::base32_rfc4648::encode(bytes_to_encode.toStdString()));
    QString hexStr = bytes_to_encode.toUtf8().toHex();

    result.append(hexStr);
    result.append(b32);
    result.append(b64);

    return result;
}


QString Bases::get_from_clipboard() {
    return clipboard->text();
}
void Bases::set_to_clipboard(QString text) {
    clipboard->setText(text);
}
