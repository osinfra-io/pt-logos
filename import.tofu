# Import Blocks
# https://opentofu.org/docs/language/import
# Only import in logos-production-main workspace

import {
  id = "main"
  to = datadog_logs_index.this["main"]
}
