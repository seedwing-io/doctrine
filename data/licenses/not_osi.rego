package osi_policy

import data.licenses

not_osi[license] {
    license := licenses[_]
    license.isOsiApproved == false
}

