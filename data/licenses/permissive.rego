package permissive_policy

import data.licenses

permissive_ids := [
  "AFL-1.1",
  "AFL-1.2",
  "AFL-2.0",
  "AFL-2.1",
  "AFL-3.0",
  "Apache-2.0",
  "Artistic-2.0",
  "BSD-2-Clause",
  "BSD-3-Clause",
  "BSD-3-Clause-Attribution",
  "BSD-3-Clause-Clear",
  "DSDP",
  "ECL-2.0",
  "ISC",
  "MIT",
  "WTFPL",
  "ZPL-2.1",
  "ZPL-1.0",
  "ZPL-2.0",
  "Python-2.0"
]

permissive[license] {
    license := licenses[_]
    license.licenseId == permissive_ids[_]
}

default is_permissive := false

is_permissive {
  license := permissive[_]
  license.licenseId == input.licenseId
}

