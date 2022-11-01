package licenses.compatibility

import input.root
import input.dependency

default compatible := false

compatible {
  entry := data.licenses.compatibility.matrix[root]
  dep := entry[dependency]
  compatible := dep
}
