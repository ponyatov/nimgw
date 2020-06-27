# Package

version       = "0.1.0"
author        = "Dmitry Ponyatov <dponyatov@gmail.com>"
description   = "MinGW cross-compiling for Nim /samples/"
license       = "MIT"
srcDir        = "src"
bin           = @["hello"]#,"hellomsg"]



# Dependencies

requires "nim >= 1.2.4"
requires "winim >= 3.3.5"
