package test_permissive_policy

import future.keywords
import data.permissive_policy.is_permissive 

list := [
    {
      "reference": "https://spdx.org/licenses/Apache-2.0.html",
      "isDeprecatedLicenseId": false,
      "detailsUrl": "https://spdx.org/licenses/Apache-2.0.json",
      "referenceNumber": 119,
      "name": "Apache License 2.0",
      "licenseId": "Apache-2.0",
      "seeAlso": [
        "https://www.apache.org/licenses/LICENSE-2.0",
        "https://opensource.org/licenses/Apache-2.0"
      ],
      "isOsiApproved": true,
      "isFsfLibre": true
    },
]

test_is_permissive if {
  r := is_permissive with input.licenseId as "Apache-2.0"
              with data.licenses as list
  r == true
}

