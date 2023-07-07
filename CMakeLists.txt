cmake_minimum_required(VERSION 3.16)

project(Headwind VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

#
# Headwind lib
#
add_subdirectory(headwind)

# Example Project
qt_add_executable(Example example/example.cpp)
qt_add_qml_module(Example
    URI "/"
    RESOURCE_PREFIX "/"
    VERSION 1.0
    QML_FILES
        example/example.qml
        example/Pages/TstHwRectangle.qml
        example/Pages/TstHwRoundedImage.qml
        example/Pages/TstHwBaseItem.qml
        example/Pages/TstHwTextInput.qml
        example/Pages/TstHwBox.qml
        example/Pages/TstHwPopover.qml
    RESOURCES
        example/images/testroundimage.jpg

)
target_link_libraries(Example PRIVATE Qt6::Quick headwind)
target_compile_definitions(Example PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
