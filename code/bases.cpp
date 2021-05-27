#include "bases.h"
#include <gmpxx.h>

Bases::Bases(QObject *parent) : QObject(parent)
{

}

std::string base64_chars =
    "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    "abcdefghijklmnopqrstuvwxyz"
    "0123456789+/";


bool Bases::is_base64(unsigned char c) {
    return (isalnum(c) || (c == '+') || (c == '/'));
}

QString Bases::base64_encode(QString bytes_to_encode, int in_len) {
    QString ret;
    int i = 0;
    int j = 0;
    char char_array_3[3];
    char char_array_4[4];
    int count = 0;

    while (in_len--) {
        char_array_3[i++] = bytes_to_encode.toStdString()[count++];
        if (i == 3) {
            char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
            char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
            char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
            char_array_4[3] = char_array_3[2] & 0x3f;

            for(i = 0; (i <4) ; i++)
                ret += base64_chars[char_array_4[i]];
            i = 0;
        }
    }

    if (i) {
        for(j = i; j < 3; j++)
            char_array_3[j] = '\0';

    char_array_4[0] = (char_array_3[0] & 0xfc) >> 2;
    char_array_4[1] = ((char_array_3[0] & 0x03) << 4) + ((char_array_3[1] & 0xf0) >> 4);
    char_array_4[2] = ((char_array_3[1] & 0x0f) << 2) + ((char_array_3[2] & 0xc0) >> 6);
    char_array_4[3] = char_array_3[2] & 0x3f;

    for (j = 0; (j < i + 1); j++)
        ret += base64_chars[char_array_4[j]];

    while((i++ < 3))
        ret += '=';

    }

    return ret;
}

QString Bases::base16_encode(QString bytes_to_encode) {
    std::string input = bytes_to_encode.toStdString();
    char hex_digits[] = "0123456789ABCDEF";

    std::string output;
    output.reserve(input.length() * 2);
    for (unsigned char c : input)
    {
        output.push_back(hex_digits[c >> 4]);
        output.push_back(hex_digits[c & 15]);
    }
    return QString::fromUtf8(output.c_str());
}

