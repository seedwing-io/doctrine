package osi_policy

import data.licenses

osi[license] {
    license := data.licenses[_]
    license.isOsiApproved == true
}

default is_osi := false

is_osi {
  license := osi[_]
  license.licenseId == input.licenseId
}

