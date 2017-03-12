# ==============================================================================
# Copyright 2017 Ronan Abhamon (https://github.com/Wescoeur)
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
# ==============================================================================

cmake_minimum_required(VERSION 3.1)
project(qml-konami)

set(EXECUTABLE_NAME qml-konami)
set(TARGET_NAME qml-konami)
set(CMAKE_CXX_STANDARD 11)

set(CMAKE_AUTOMOC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

set(QT5_PACKAGES Widgets Quick QuickControls2)

set(SOURCES
  src/app/App.cpp
  src/main.cpp
)

set(HEADERS
  src/app/App.hpp
)

set(QRC_RESOURCES resources.qrc)

# ------------------------------------------------------------------------------

find_package(Qt5 COMPONENTS ${QT5_PACKAGES} REQUIRED)

qt5_add_resources(RESOURCES ${QRC_RESOURCES})

if(WIN32)
  add_executable(${TARGET_NAME} WIN32 ${SOURCES} ${HEADERS} ${RESOURCES})
else()
  add_executable(${TARGET_NAME} ${SOURCES} ${HEADERS} ${RESOURCES})
endif()

foreach (PACKAGE ${QT5_PACKAGES})
  target_include_directories(${TARGET_NAME} SYSTEM PRIVATE "${Qt5${PACKAGE}_INCLUDE_DIRS}")
  target_link_libraries(${TARGET_NAME} ${Qt5${PACKAGE}_LIBRARIES})
endforeach ()

target_link_libraries(${TARGET_NAME})
