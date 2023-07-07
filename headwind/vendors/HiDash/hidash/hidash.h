#ifndef HIDASH_H
#define HIDASH_H

#include <QObject>
#include <QQmlEngine>

#include "debouncefunction.h"

class HiDash : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON

public:
    explicit HiDash(QObject *parent = nullptr);
    ~HiDash() override;

public:
    Q_INVOKABLE qint32 delay(qint32 ms, QJSValue callback);
    Q_INVOKABLE void cancel(qint32 timeId);

    Q_INVOKABLE DebounceFunction* debounce(QObject* parent, QJSValue callback, qint32 msWait, QJSValue options);

protected:
    void timerEvent(QTimerEvent * event) override;

private:
    QHash<qint32, QJSValue> _delayCalls;
};

#endif // HIDASH_H
