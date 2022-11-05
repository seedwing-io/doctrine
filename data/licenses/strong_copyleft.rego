package strong_copyleft

import data.licenses

strong_copyleft_ids := [
  "GPL-3.0",
  "GPL-3.0-only",
  "GPL-2.0",
  "GPL-2.0-only",
  "GPL-1.0-only",
  "GPL-1.0-or-later",
  "GPL-2.0-or-later",
  "GPL-3.0-or-later",
  "MS-RL",
  "ODbL-1.0"
]

strong_copyleft[license] {
    license := licenses[_]
    license.licenseId == strong_copyleft_ids[_]
}

default is_strong_copyleft := false

is_strong_copyleft {
  license := strong_copyleft[_]
  license.licenseId == input.licenseId
}

