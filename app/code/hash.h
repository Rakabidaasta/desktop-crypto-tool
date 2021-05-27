#ifndef HASH_H
#define HASH_H

#include <QObject>

class Hash : public QObject
{
    Q_OBJECT
public:
    explicit Hash(QObject *parent = nullptr);

signals:

public slots:
    QString check_hash(QString hash);
};


#endif // HASH_H
