package licenses.compatibility

import future.keywords.in

import input.root
import input.dependency

default compatible := false

compatible {
  entry := data.licenses.compatibility.matrix[root]
  dep := entry[dependency]
  print("HOWDY")
  print(dep)
  print( dep in ["Yes", "Same"] )
  dep in ["Yes", "Same"]
}
