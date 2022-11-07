package test_all_policy

import future.keywords
import data.all_policy.all

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
  {
    "reference": "https://spdx.org/licenses/CDDL-1.1.html",
    "isDeprecatedLicenseId": false,
    "detailsUrl": "https://spdx.org/licenses/CDDL-1.1.json",
    "referenceNumber": 489,
    "name": "Common Development and Distribution License 1.1",
    "licenseId": "CDDL-1.1",
    "seeAlso": [
      "http://glassfish.java.net/public/CDDL+GPL_1_1.html",
      "https://javaee.github.io/glassfish/LICENSE"
    ],
    "isOsiApproved": false
  }
]

test_all if {
  r := all[_] with data.licenses as list
  count(r) == 2
  r[0].licenseId == "Apache-2.0"
  r[1].licenseId == "CDDL-1.1"
}
