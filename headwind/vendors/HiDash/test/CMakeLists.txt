
#--- auto test -----------------------
set(QML_IMPORT_PATH
    ${CMAKE_BINARY_DIR}/HiDash
    CACHE STRING "" FORCE)

add_definitions(-DQUICK_TEST_SOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}")

file(GLOB_RECURSE QML_FILES tst_*.qml)
add_custom_target(auto_test_files SOURCES ${QML_FILES})

enable_testing()
add_executable(auto_test
    test.cpp
)
add_test(NAME auto_test COMMAND auto_test)
target_link_libraries(auto_test PRIVATE Qt6::QuickTest Qt6::Qml HiDash)


##--- ui test -----
add_executable(manual_test
    main.cpp
)
qt_add_qml_module(manual_test
    URI ManualTest
    VERSION 1.0
    QML_FILES main.qml
)
target_link_libraries(manual_test PRIVATE Qt6::Quick HiDash)

