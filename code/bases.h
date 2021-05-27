#ifndef BASES_H
#define BASES_H

#include <QObject>
#include <QList>
#include <QClipboard>
#include <QGuiApplication>

class Bases : public QObject
{
    Q_OBJECT
public:
    explicit Bases(QObject *parent = nullptr);

signals:

public slots:
    QList<QString> bases_encode(QString bytes_to_encode);
    QString get_from_clipboard();
    void set_to_clipboard(QString text);
private:
    QClipboard *clipboard;
};

#endif // BASES_H
