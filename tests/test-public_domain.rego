package test_public_domain_policy

import future.keywords
import data.public_domain_policy.is_public_domain

list := [
    {
      "reference": "https://spdx.org/licenses/Unlicense.html",
      "isDeprecatedLicenseId": false,
      "detailsUrl": "https://spdx.org/licenses/Unlicense.json",
      "referenceNumber": 405,
      "name": "The Unlicense",
      "licenseId": "Unlicense",
      "seeAlso": [
        "https://unlicense.org/"
      ],
      "isOsiApproved": true,
      "isFsfLibre": true
    },
]

test_is_public_domain if {
  r := is_public_domain with input.licenseId as "Unlicense"
              with data.licenses as list
  r == true
}

