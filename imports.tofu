# Import Blocks
# https://opentofu.org/docs/language/import

# pt-techne-development-setup

import {
  id = "pt-techne-development-setup"
  to = github_repository.this["pt-techne-development-setup"]
}

import {
  id = "pt-techne-development-setup/.github/release.yml:main"
  to = github_repository_file.release["pt-techne-development-setup"]
}

import {
  id = "pt-techne-development-setup/SECURITY.md:main"
  to = github_repository_file.security_policy["pt-techne-development-setup"]
}
