#ifndef BASES_H
#define BASES_H

#include <QObject>

class Bases : public QObject
{
    Q_OBJECT
public:
    explicit Bases(QObject *parent = nullptr);

signals:

public slots:
    bool is_base64(unsigned char c);
    QString base16_encode(QString bytes_to_encode);
//    QString base32_encode(QString bytes_to_encode, int in_len);
    QString base64_encode(QString bytes_to_encode, int in_len);
//    QString base85_encode(QString bytes_to_encode, int in_len);
};

#endif // BASES_H
