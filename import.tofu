# Import Blocks
# https://opentofu.org/docs/language/import
# Only import in logos-production-main workspace during bootstrapping

import {
  id = "pt-techne-misc-workflows"
  to = github_repository.this["pt-techne-misc-workflows"]
}

import {
  id = "pt-techne-opentofu-codespace"
  to = github_repository.this["pt-techne-opentofu-codespace"]
}

import {
  id = "pt-techne-opentofu-workflows"
  to = github_repository.this["pt-techne-opentofu-workflows"]
}

import {
  id = "pt-techne-pre-commit-hooks"
  to = github_repository.this["pt-techne-pre-commit-hooks"]
}

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
