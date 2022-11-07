package weak_copyleft_policy

import data.licenses

weak_copyleft_ids := [
  "EPL-1.0",
  "LGPL-2.0",
  "LGPL-2.1",
  "LGPL-3.0",
  "LGPL-3.0",
  "MPL-2.0",
  "MPL-1.0",
  "MPL-1.1",
  "LGPL-2.0+",
  "LGPL-2.1+",
  "LGPL-3.0+",
  "LGPL-2.0-only",
  "LGPL-2.1-only",
  "LGPL-3.0-only",
  "LGPL-3.0-only",
  "LGPL-2.0-or-later",
  "LGPL-2.1-or-later",
  "LGPL-3.0-or-later"
]

weak_copyleft[license] {
    license := licenses[_]
    license.licenseId == weak_copyleft_ids[_]
}

default is_weak_copyleft := false

is_weak_copyleft {
  license := weak_copyleft[_]
  license.licenseId == input.licenseId
}

