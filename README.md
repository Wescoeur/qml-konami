# qml-konami

A basic component to add a Konami code in a qml app.

## How to test
Make a `build` directory in `qml-konami` folder. In this directory, use `cmake ..` then `make`. 

Finally you can execute the created `qml-konami` binary.

## How to use
You can use directly the `Konami.qml` file in your qml project. You can find it in the `ui/modules/Konami/` folder.

Otherwise you can import the module with `addImportPath` on a `QQmlApplicationEngine` instance.

## Attributes
| Key         | Type                                                             | Description
|------------ |------------------------------------------------------------------|------------------------------------------------------------------
| `code`      | JS array of [Keys](https://doc.qt.io/qt-5/qml-qtquick-keys.html) | The code to enter. By default a Konami code.
| `delay`     | integer                                                          | Delay in ms you have to complete the code between each keystroke.
| `triggered` | signal                                                           | Happens when a valid code was entered.
