import QtQuick
import QtTest

import HiDash

TestCase {
    name: "TestTools"

    Rectangle {
        width: 100
        height: 100
        color: "red"
    }

    function initTestCase() {

    }    

    function test_delay_call() {
        let checkCallback = false
        HiDash.delay(100, function () {
            checkCallback = true
        })

        wait(200)

        verify(checkCallback, "test delay call")
    }

    function test_debounce_call () {
        let checkCallback = false
        let debounce = HiDash.debounce(this, function () {
            checkCallback = true
        }, 1000, {leading: true, trailing: true, maxWait: 120})

        debounce.call()
        verify(checkCallback, "test leading")
        checkCallback = false;

        debounce.call()
        debounce.call()
        debounce.call()

        verify(!checkCallback, "recheck test leading")

        wait(130)
        debounce.call()
        verify(checkCallback, "test maxWait")
        checkCallback = false;

        wait(1200)
        verify(checkCallback, "test debounce")
    }

    function cleanupTestCase() {

    }
}
