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

import {
  id = "pt-arche-core-helpers"
  to = github_repository.this["pt-arche-core-helpers"]
}

import {
  id = "pt-arche-datadog-google-integration"
  to = github_repository.this["pt-arche-datadog-google-integration"]
}

import {
  id = "pt-arche-google-kubernetes-engine"
  to = github_repository.this["pt-arche-google-kubernetes-engine"]
}

import {
  id = "pt-arche-google-network"
  to = github_repository.this["pt-arche-google-network"]
}

import {
  id = "pt-arche-google-project"
  to = github_repository.this["pt-arche-google-project"]
}

import {
  id = "pt-arche-google-storage-bucket"
  to = github_repository.this["pt-arche-google-storage-bucket"]
}

import {
  id = "pt-arche-kubernetes-cert-manager"
  to = github_repository.this["pt-arche-kubernetes-cert-manager"]
}

import {
  id = "pt-arche-kubernetes-datadog-operator"
  to = github_repository.this["pt-arche-kubernetes-datadog-operator"]
}

import {
  id = "pt-arche-kubernetes-istio"
  to = github_repository.this["pt-arche-kubernetes-istio"]
}

import {
  id = "pt-arche-kubernetes-opa-gatekeeper"
  to = github_repository.this["pt-arche-kubernetes-opa-gatekeeper"]
}
