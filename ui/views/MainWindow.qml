/*
 * MainWindow.qml
 * Copyright 2017 Ronan Abhamon (https://github.com/Wescoeur)
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick 2.7
import QtQuick.Window 2.2

import Konami 1.0

// =============================================================================

Window {
  height: 480
  width: 640

  visible: true

  Rectangle {
    anchors.fill: parent

    color: 'black'

    Konami {
      id: konami

      property bool activated: false

      anchors.centerIn: parent

      focus: true

      height: 240
      width: 320

      Keys.onPressed: {
        if (activated) {
          return
        }

        timer.stop()
        rectangle.color = 'yellow'
        timer.start()
      }

      onTriggered: {
        timer.stop()

        konami.activated = true
        rectangle.color = 'green'
      }

      Timer {
        id: timer

        interval: 200

        onTriggered: !konami.activated && (rectangle.color = rectangle.baseColor)
      }

      Rectangle {
        id: rectangle

        readonly property color baseColor: '#FFFFFF'

        anchors.fill: parent
        color: baseColor
      }
    }
  }
}
