# Import Blocks
# https://opentofu.org/docs/language/import
# Only import in logos-production-main workspace during bootstrapping

import {
  id = "pt-ekklesia"
  to = github_repository.this["pt-ekklesia"]
}

import {
  id = "pt-ekklesia-docs"
  to = github_repository.this["pt-ekklesia-docs"]
}

import {
  id = "pt-ekklesia-repository-templates"
  to = github_repository.this["pt-ekklesia-repository-templates"]
}
