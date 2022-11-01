package licenses

import data.licenses

public_domain_ids := [
  "CC0-1.0",
  "PDDL-1.0",
  "SAX-PD",
  "Unlicense"
]

public_domain[license] {
    license := licenses.licenses[_]
    license.licenseId == public_domain_ids[_]
}

default is_public_domain := false

is_public_domain {
  license := public_domain[_]
  license.licenseId == input.licenseId
}

