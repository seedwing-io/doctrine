package test_strong_copyleft_policy

import future.keywords
import data.strong_copyleft_policy.is_strong_copyleft

list := [
    {
      "reference": "https://spdx.org/licenses/GPL-3.0-only.html",
      "isDeprecatedLicenseId": false,
      "detailsUrl": "https://spdx.org/licenses/GPL-3.0-only.json",
      "referenceNumber": 332,
      "name": "GNU General Public License v3.0 only",
      "licenseId": "GPL-3.0-only",
      "seeAlso": [
        "https://www.gnu.org/licenses/gpl-3.0-standalone.html",
        "https://opensource.org/licenses/GPL-3.0"
      ],
      "isOsiApproved": true,
      "isFsfLibre": true
    },
]

test_is_strong_copyleft if {
  r := is_strong_copyleft with input.licenseId as "GPL-3.0-only"
              with data.licenses as list
  r == true
}

