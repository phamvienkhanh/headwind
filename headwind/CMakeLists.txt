cmake_minimum_required(VERSION 3.16)

project(Headwind VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(QT_QML_OUTPUT_DIRECTORY  ${CMAKE_BINARY_DIR})

find_package(Qt6 6.5 COMPONENTS Quick Qml ShaderTools REQUIRED)

qt_standard_project_setup(REQUIRES 6.5)

set(QMLS_CONTROLS
    Controls/HwRoundedImage.qml
    Controls/HwBaseItem.qml
    Controls/HwRipple.qml
    Controls/HwTextInput.qml
    Controls/HwBox.qml
    Controls/HwPopover.qml
)

set(CPP_CONTROLS
    Controls/hwrectangle.cpp Controls/hwrectangle.h
)

set(UTILS
    Utils/macros.h
)

qt_add_library(headwind SHARED)
qt_add_qml_module(headwind
    URI Headwind
    RESOURCE_PREFIX "/"
    VERSION 1.0
    QML_FILES
        ${QMLS_CONTROLS}
    SOURCES
        ${CPP_CONTROLS}
        ${UTILS}
)

qt_add_shaders(headwind "headwind_shaders"
    PREFIX "/"
    GLSL "300es,330"
    BATCHABLE
    PRECOMPILE
    OPTIMIZED
    FILES
        Shaders/opacitymask.vert
        Shaders/opacitymask.frag
)

set_target_properties(headwind PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(headwind
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)

target_link_libraries(headwind PUBLIC Qt6::Quick)

target_include_directories(headwind PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/Controls)
