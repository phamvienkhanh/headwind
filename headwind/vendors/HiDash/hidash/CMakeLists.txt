
qt_add_library(HiDash SHARED)
qt_add_qml_module(HiDash
    URI HiDash
    VERSION 1.0
    SOURCES
        hidash.h hidash.cpp
        debouncefunction.h debouncefunction.cpp
)

set_target_properties(HiDash PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER com.hidash
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(HiDash PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(HiDash PRIVATE Qt6::Quick)

target_include_directories(HiDash PUBLIC ${CMAKE_CURRENT_SOURCE_DIR})
