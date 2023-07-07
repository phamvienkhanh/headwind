#include "hidash.h"

#include <QTimerEvent>

HiDash::HiDash(QObject* parent)
    : QObject(parent)
{
}

HiDash::~HiDash()
{
}

qint32 HiDash::delay(qint32 ms, QJSValue callback)
{
    auto timerId = startTimer(ms);
    if(timerId)
        _delayCalls[timerId] = callback;

    return timerId;
}

void HiDash::cancel(qint32 timerId)
{
    if(timerId && _delayCalls.contains(timerId)) {
        killTimer(timerId);
        _delayCalls.remove(timerId);
    }
}

DebounceFunction* HiDash::debounce(QObject* parent, QJSValue callback, qint32 msWait, QJSValue options)
{
    DebounceFunction::InitParams params;
    params.parent = parent;
    params.msWait = msWait;
    params.callback = callback;

    auto maxWait = options.property("maxWait");
    auto leading = options.property("leading");
    auto trailing = options.property("trailing");

    if(maxWait.isNumber()) params.msMaxWait = maxWait.toUInt();
    if(leading.isBool()) params.isLeading = leading.toBool();
    if(trailing.isBool()) params.isTrailing = trailing.toBool();

    auto obj = new DebounceFunction(params);
    return obj;
}

void HiDash::timerEvent(QTimerEvent* event)
{
    qint32 timerId = event->timerId();
    if(_delayCalls.contains(timerId)) {
        auto callback = _delayCalls.take(timerId);
        if(callback.isCallable()) {
            callback.call();
        }
        killTimer(timerId);
    }
}
