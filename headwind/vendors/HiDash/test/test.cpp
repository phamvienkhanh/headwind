#include <QtQuickTest>
#include <QQmlEngine>

class Setup : public QObject
{
    Q_OBJECT

public:
    Setup() {}

public slots:
    void applicationAvailable()
    {
    }

    void qmlEngineAvailable(QQmlEngine *engine)
    {

    }

    void cleanupTestCase()
    {

    }
};

QUICK_TEST_MAIN_WITH_SETUP(hidashtest, Setup)

#include "test.moc"
