# Moved blocks for renaming google_cloud_identity_group keys from singular to plural
# (admin → administrators, reader → readers, writer → writers)
# (browser → browsers, project-creator → project-creators, xpn-admin → xpn-administrators)
# New teams (pt-arche, pt-ekklesia, pt-techne) have no existing state and are excluded.

# pt-corpus - basic groups

moved {
  from = google_cloud_identity_group.this["pt-corpus-admin"]
  to   = google_cloud_identity_group.this["pt-corpus-administrators"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-reader"]
  to   = google_cloud_identity_group.this["pt-corpus-readers"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-writer"]
  to   = google_cloud_identity_group.this["pt-corpus-writers"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-corpus-admin-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-corpus-administrators-brett-at-osinfra-io"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-corpus-reader-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-corpus-readers-brett-at-osinfra-io"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-corpus-writer-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-corpus-writers-brett-at-osinfra-io"]
}

moved {
  from = google_folder_iam_member.team_access["pt-corpus-admin-roles-admin"]
  to   = google_folder_iam_member.team_access["pt-corpus-administrators-roles-admin"]
}

moved {
  from = google_folder_iam_member.team_access["pt-corpus-reader-roles-reader"]
  to   = google_folder_iam_member.team_access["pt-corpus-readers-roles-reader"]
}

moved {
  from = google_folder_iam_member.team_access["pt-corpus-writer-roles-writer"]
  to   = google_folder_iam_member.team_access["pt-corpus-writers-roles-writer"]
}

# pt-logos

moved {
  from = google_cloud_identity_group.this["pt-logos-admin"]
  to   = google_cloud_identity_group.this["pt-logos-administrators"]
}

moved {
  from = google_cloud_identity_group.this["pt-logos-reader"]
  to   = google_cloud_identity_group.this["pt-logos-readers"]
}

moved {
  from = google_cloud_identity_group.this["pt-logos-writer"]
  to   = google_cloud_identity_group.this["pt-logos-writers"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-logos-admin-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-logos-administrators-brett-at-osinfra-io"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-logos-reader-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-logos-readers-brett-at-osinfra-io"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-logos-writer-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-logos-writers-brett-at-osinfra-io"]
}

moved {
  from = google_folder_iam_member.team_access["pt-logos-admin-roles-admin"]
  to   = google_folder_iam_member.team_access["pt-logos-administrators-roles-admin"]
}

moved {
  from = google_folder_iam_member.team_access["pt-logos-reader-roles-reader"]
  to   = google_folder_iam_member.team_access["pt-logos-readers-roles-reader"]
}

moved {
  from = google_folder_iam_member.team_access["pt-logos-writer-roles-writer"]
  to   = google_folder_iam_member.team_access["pt-logos-writers-roles-writer"]
}

# pt-pneuma

moved {
  from = google_cloud_identity_group.this["pt-pneuma-admin"]
  to   = google_cloud_identity_group.this["pt-pneuma-administrators"]
}

moved {
  from = google_cloud_identity_group.this["pt-pneuma-reader"]
  to   = google_cloud_identity_group.this["pt-pneuma-readers"]
}

moved {
  from = google_cloud_identity_group.this["pt-pneuma-writer"]
  to   = google_cloud_identity_group.this["pt-pneuma-writers"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-pneuma-admin-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-pneuma-administrators-brett-at-osinfra-io"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-pneuma-reader-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-pneuma-readers-brett-at-osinfra-io"]
}

moved {
  from = google_cloud_identity_group_membership.owners["pt-pneuma-writer-brett-at-osinfra-io"]
  to   = google_cloud_identity_group_membership.owners["pt-pneuma-writers-brett-at-osinfra-io"]
}

moved {
  from = google_folder_iam_member.team_access["pt-pneuma-admin-roles-admin"]
  to   = google_folder_iam_member.team_access["pt-pneuma-administrators-roles-admin"]
}

moved {
  from = google_folder_iam_member.team_access["pt-pneuma-reader-roles-reader"]
  to   = google_folder_iam_member.team_access["pt-pneuma-readers-roles-reader"]
}

moved {
  from = google_folder_iam_member.team_access["pt-pneuma-writer-roles-writer"]
  to   = google_folder_iam_member.team_access["pt-pneuma-writers-roles-writer"]
}

# st-ethos

moved {
  from = google_cloud_identity_group.this["st-ethos-admin"]
  to   = google_cloud_identity_group.this["st-ethos-administrators"]
}

moved {
  from = google_cloud_identity_group.this["st-ethos-reader"]
  to   = google_cloud_identity_group.this["st-ethos-readers"]
}

moved {
  from = google_cloud_identity_group.this["st-ethos-writer"]
  to   = google_cloud_identity_group.this["st-ethos-writers"]
}

moved {
  from = google_folder_iam_member.team_access["st-ethos-admin-roles-admin"]
  to   = google_folder_iam_member.team_access["st-ethos-administrators-roles-admin"]
}

moved {
  from = google_folder_iam_member.team_access["st-ethos-reader-roles-reader"]
  to   = google_folder_iam_member.team_access["st-ethos-readers-roles-reader"]
}

moved {
  from = google_folder_iam_member.team_access["st-ethos-writer-roles-writer"]
  to   = google_folder_iam_member.team_access["st-ethos-writers-roles-writer"]
}

# pt-corpus - browser groups

moved {
  from = google_cloud_identity_group.this["pt-corpus-non-production-browser"]
  to   = google_cloud_identity_group.this["pt-corpus-non-production-browsers"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-production-browser"]
  to   = google_cloud_identity_group.this["pt-corpus-production-browsers"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-sandbox-browser"]
  to   = google_cloud_identity_group.this["pt-corpus-sandbox-browsers"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-non-production-browser-pt-corpus-github-at-pt-corpus-tf61-nonprod-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-non-production-browsers-pt-corpus-github-at-pt-corpus-tf61-nonprod-iam-gserviceaccount-com"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-production-browser-pt-corpus-github-at-pt-corpus-tf16-prod-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-production-browsers-pt-corpus-github-at-pt-corpus-tf16-prod-iam-gserviceaccount-com"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-sandbox-browser-pt-corpus-github-at-pt-corpus-tfc9-sb-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-sandbox-browsers-pt-corpus-github-at-pt-corpus-tfc9-sb-iam-gserviceaccount-com"]
}

# pt-corpus - project creator groups

moved {
  from = google_cloud_identity_group.this["pt-corpus-non-production-project-creator"]
  to   = google_cloud_identity_group.this["pt-corpus-non-production-project-creators"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-production-project-creator"]
  to   = google_cloud_identity_group.this["pt-corpus-production-project-creators"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-sandbox-project-creator"]
  to   = google_cloud_identity_group.this["pt-corpus-sandbox-project-creators"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-non-production-project-creator-pt-corpus-github-at-pt-corpus-tf61-nonprod-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-non-production-project-creators-pt-corpus-github-at-pt-corpus-tf61-nonprod-iam-gserviceaccount-com"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-production-project-creator-pt-corpus-github-at-pt-corpus-tf16-prod-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-production-project-creators-pt-corpus-github-at-pt-corpus-tf16-prod-iam-gserviceaccount-com"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-sandbox-project-creator-pt-corpus-github-at-pt-corpus-tfc9-sb-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-sandbox-project-creators-pt-corpus-github-at-pt-corpus-tfc9-sb-iam-gserviceaccount-com"]
}

# pt-corpus - XPN admin groups

moved {
  from = google_cloud_identity_group.this["pt-corpus-non-production-xpn-admin"]
  to   = google_cloud_identity_group.this["pt-corpus-non-production-xpn-administrators"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-production-xpn-admin"]
  to   = google_cloud_identity_group.this["pt-corpus-production-xpn-administrators"]
}

moved {
  from = google_cloud_identity_group.this["pt-corpus-sandbox-xpn-admin"]
  to   = google_cloud_identity_group.this["pt-corpus-sandbox-xpn-administrators"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-non-production-xpn-admin-pt-corpus-github-at-pt-corpus-tf61-nonprod-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-non-production-xpn-administrators-pt-corpus-github-at-pt-corpus-tf61-nonprod-iam-gserviceaccount-com"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-production-xpn-admin-pt-corpus-github-at-pt-corpus-tf16-prod-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-production-xpn-administrators-pt-corpus-github-at-pt-corpus-tf16-prod-iam-gserviceaccount-com"]
}

moved {
  from = google_cloud_identity_group_membership.managers["pt-corpus-sandbox-xpn-admin-pt-corpus-github-at-pt-corpus-tfc9-sb-iam-gserviceaccount-com"]
  to   = google_cloud_identity_group_membership.managers["pt-corpus-sandbox-xpn-administrators-pt-corpus-github-at-pt-corpus-tfc9-sb-iam-gserviceaccount-com"]
}
