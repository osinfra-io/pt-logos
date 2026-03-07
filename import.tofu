# Import Blocks
# https://opentofu.org/docs/language/import
# Only import in logos-production-main workspace during bootstrapping

# import {
#   id = "main"
#   to = datadog_logs_index.this["main"]
# }

import {
  id = "pt-techne-opentofu-workflows"
  to = github_repository.this["pt-techne-opentofu-workflows"]
}
