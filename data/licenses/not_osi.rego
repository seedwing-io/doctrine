package licenses

import data.licenses

not_osi[license] {
    license := licenses.licenses[_]
    license.isOsiApproved == false
}

