# Logos

[![Copilot Agent](https://img.shields.io/badge/Copilot%20Agent-Enabled-6E40C9?style=for-the-badge&logo=githubcopilot&logoColor=white)](https://github.com/osinfra-io/pt-logos/tree/main/.github/agents) [![Dependabot](https://img.shields.io/github/actions/workflow/status/osinfra-io/pt-logos/dependabot.yml?style=for-the-badge&logo=github&color=2088FF&label=Dependabot)](https://github.com/osinfra-io/pt-logos/actions/workflows/dependabot.yml) [![Datadog Security Enabled](https://img.shields.io/badge/Datadog%20Security-Enabled-632CA6?style=for-the-badge&logo=datadog)](https://app.datadoghq.com/security/code-security/repositories?repository_id=pt-logos)

## 📄 Repository Description

This repository contains the Infrastructure as Code (IaC) that establishes the Logos layer — the platform’s primordial principle of order from which all other structure emerges. Using OpenTofu, it brings coherence across multiple cloud providers, setting the first boundaries that transform an undifferentiated technical landscape into a domain where disciplined creation is possible.

As the grounding stratum of the platform hierarchy, Logos encodes the organizational logic itself: the clear lines of access, the governance boundaries that restrain chaos, and the stable standards that enable higher-level systems to flourish. Through the lens of Team Topologies, this layer defines the hierarchy of responsibility and relationship, ensuring that each team inhabits a space conducive to productive action.

Logos is where the platform’s moral architecture begins — where order is spoken into being so that all subsequent layers may stand upon it.

### 🛠️ Tools

- [pre-commit](https://github.com/pre-commit/pre-commit)
- [osinfra-pre-commit-hooks](https://github.com/osinfra-io/pt-techne-pre-commit-hooks)

### 📋 Skills and Knowledge

Links to documentation and other resources required to develop and iterate in this repository successfully.

- [datadog logs](https://docs.datadoghq.com/logs/)
- [datadog teams](https://docs.datadoghq.com/account_management/teams/)
- [github repositories](https://docs.github.com/en/repositories)
- [github teams](https://docs.github.com/en/organizations/organizing-members-into-teams/about-teams)
- [google billing budgets](https://cloud.google.com/billing/docs/how-to/budgets)
- [google cloud platform groups](https://cloud.google.com/identity/docs/groups)
- [google cloud platform iam](https://cloud.google.com/iam/docs/overview)
- [google cloud platform resource landing-zone](https://cloud.google.com/resource-manager/docs/cloud-platform-resource-landing-zone)
- [team topologies](https://teamtopologies.com/)

## 🔄 Platform Deployment Dependency Graph

The platform follows a strict three-layer deployment hierarchy: **Logos → Corpus → Pneuma**. Logos deploys all team workspaces as a parallel matrix directly to production on merge to `main`. Corpus and Pneuma each follow a Sandbox → Non-Production → Production environment progression. Solid arrows are within-workflow job dependencies. Dashed arrows are cross-repo state dependencies consumed via `opentofu-core-helpers` — Corpus reads Logos team outputs, and Pneuma reads both Corpus main (projects, service accounts) and regional (networking, subnets) outputs. The Pneuma section shows the dependency chain for one zone — the same pattern repeats for each active zone in the environment.

```mermaid
flowchart TD
    classDef logos fill:#F9AB00,stroke:#F9AB00,color:#000
    classDef corpus fill:#34A853,stroke:#34A853,color:#fff
    classDef gke fill:#4285F4,stroke:#4285F4,color:#fff
    classDef certmanager fill:#0195D8,stroke:#0195D8,color:#fff
    classDef istio fill:#466BB0,stroke:#466BB0,color:#fff
    classDef datadog fill:#632CA6,stroke:#632CA6,color:#fff
    classDef opa fill:#23263B,stroke:#23263B,color:#fff

    subgraph logos ["pt-logos"]
        logos_arche["pt-arche"]:::logos
        logos_corpus["pt-corpus"]:::logos
        logos_ekklesia["pt-ekklesia"]:::logos
        logos_logos["pt-logos"]:::logos
        logos_pneuma["pt-pneuma"]:::logos
        logos_techne["pt-techne"]:::logos
        logos_ethos["st-ethos"]:::logos
    end

    subgraph corpus ["pt-corpus"]
        corpus_main["Main"]:::corpus
        corpus_us_east1["Regional: us-east1"]:::corpus
        corpus_us_east4["Regional: us-east4"]:::corpus
        corpus_main --> corpus_us_east1
        corpus_main --> corpus_us_east4
    end

    subgraph pneuma ["pt-pneuma (per zone)"]
        pneuma_main["Main"]:::gke
        pneuma_zone["Regional"]:::gke
        pneuma_onboarding["Onboarding"]:::gke
        pneuma_cert_manager["cert-manager"]:::certmanager
        pneuma_cert_manager_istio_csr["cert-manager Istio CSR"]:::certmanager
        pneuma_istio["Istio"]:::istio
        pneuma_istio_manifests["Istio Manifests"]:::istio
        pneuma_istio_test["Istio Test"]:::istio
        pneuma_datadog["Datadog"]:::datadog
        pneuma_datadog_manifests["Datadog Manifests"]:::datadog
        pneuma_opa_gatekeeper["OPA Gatekeeper"]:::opa
        pneuma_opa_templates["OPA Gatekeeper Templates"]:::opa
        pneuma_opa_constraints["OPA Gatekeeper Constraints"]:::opa

        pneuma_main --> pneuma_zone
        pneuma_zone --> pneuma_onboarding
        pneuma_onboarding --> pneuma_cert_manager
        pneuma_onboarding --> pneuma_datadog
        pneuma_cert_manager --> pneuma_cert_manager_istio_csr
        pneuma_cert_manager --> pneuma_opa_gatekeeper
        pneuma_cert_manager_istio_csr --> pneuma_istio
        pneuma_istio --> pneuma_istio_manifests
        pneuma_istio_manifests --> pneuma_istio_test
        pneuma_datadog --> pneuma_datadog_manifests
        pneuma_opa_gatekeeper --> pneuma_opa_templates
        pneuma_opa_templates --> pneuma_opa_constraints
    end

    logos_arche -.-> corpus_main
    logos_corpus -.-> corpus_main
    logos_ekklesia -.-> corpus_main
    logos_logos -.-> corpus_main
    logos_pneuma -.-> corpus_main
    logos_techne -.-> corpus_main
    logos_ethos -.-> corpus_main
    corpus_main -.-> pneuma_main
    corpus_us_east1 -.-> pneuma_main
    corpus_us_east4 -.-> pneuma_main
```
