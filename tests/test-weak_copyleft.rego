package test_weak_copyleft_policy

import future.keywords
import data.weak_copyleft.is_weak_copyleft

list := [
    {
      "reference": "https://spdx.org/licenses/LGPL-2.0.html",
      "isDeprecatedLicenseId": true,
      "detailsUrl": "https://spdx.org/licenses/LGPL-2.0.json",
      "referenceNumber": 449,
      "name": "GNU Library General Public License v2 only",
      "licenseId": "LGPL-2.0",
      "seeAlso": [
        "https://www.gnu.org/licenses/old-licenses/lgpl-2.0-standalone.html"
      ],
      "isOsiApproved": true
    },
]

test_is_weak_copyleft if {
  r := is_weak_copyleft with input.licenseId as "LGPL-2.0"
              with data.licenses as list
  r == true
}

