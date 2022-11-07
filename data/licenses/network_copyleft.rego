package network_policy

import data.licenses

network_copyleft_ids := [
  "AGPL-1.0",
  "AGPL-3.0",
  "RPL-1.1",
  "RPL-1.5",
  "OSL-1.0",
  "OSL-1.1",
  "OSL-2.0",
  "OSL-2.1",
  "OSL-3.0",
  "AGPL-1.0-only",
  "AGPL-1.0-or-later",
  "AGPL-3.0-only",
  "AGPL-3.0-or-later"
]

network_copyleft[license] {
    license := licenses[_]
    license.licenseId == network_copyleft_ids[_]
}

default is_network_copyleft := false

is_network_copyleft {
  license := network_copyleft[_]
  license.licenseId == input.licenseId
}

