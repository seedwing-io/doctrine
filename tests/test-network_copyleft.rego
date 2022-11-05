package test_network_policy

import future.keywords
import data.network.is_network_copyleft 

list := [
    {
      "reference": "https://spdx.org/licenses/AGPL-3.0-only.html",
      "isDeprecatedLicenseId": false,
      "detailsUrl": "https://spdx.org/licenses/AGPL-3.0-only.json",
      "referenceNumber": 110,
      "name": "GNU Affero General Public License v3.0 only",
      "licenseId": "AGPL-3.0-only",
      "seeAlso": [
        "https://www.gnu.org/licenses/agpl.txt",
        "https://opensource.org/licenses/AGPL-3.0"
      ],
      "isOsiApproved": true,
      "isFsfLibre": true
    },
]

test_is_network_copyleft if {
  r := is_network_copyleft with input.licenseId as "AGPL-3.0-only"
              with data.licenses as list
  r == true
}

