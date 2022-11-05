package test_osi_policy

import future.keywords
import data.osi_policy.is_osi
import data.osi_policy.not_osi

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

test_is_osi if {
  r := is_osi with input.licenseId as "Apache-2.0"
              with data.licenses as list
  r == true
}

test_not_osi if {
  n := not_osi[_] with data.licenses as list
  n.licenseId == "CDDL-1.1"

}
