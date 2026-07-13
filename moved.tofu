# Moved Blocks
# https://opentofu.org/docs/language/moved

# Consolidation of corpus_browsers, corpus_project_creators, corpus_xpn_admins → corpus_env_access

moved {
  from = google_folder_iam_member.corpus_browsers["pt-arche-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-arche-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-arche-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-arche-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-arche-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-arche-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-arche-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-arche-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-arche-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-arche-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-corpus-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-corpus-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-corpus-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-corpus-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-corpus-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-corpus-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-corpus-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-corpus-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-corpus-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-corpus-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-ekklesia-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-ekklesia-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-ekklesia-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-ekklesia-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-ekklesia-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-ekklesia-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-ekklesia-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-ekklesia-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-ekklesia-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-ekklesia-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-kryptos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-kryptos-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-kryptos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-kryptos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-kryptos-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-kryptos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-kryptos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-kryptos-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-kryptos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-kryptos-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-logos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-logos-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-logos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-logos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-logos-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-logos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-logos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-logos-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-logos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-logos-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-pneuma-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-pneuma-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-pneuma-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-pneuma-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-pneuma-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-pneuma-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-pneuma-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-pneuma-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-pneuma-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-pneuma-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-techne-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-techne-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["pt-techne-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-techne-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-techne-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["pt-techne-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-techne-non-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-techne-production"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["pt-techne-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["pt-techne-sandbox-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["st-ethos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-non-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["st-ethos-production"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-production-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_browsers["st-ethos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-sandbox-browsers"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["st-ethos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-non-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["st-ethos-production"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-production-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_project_creators["st-ethos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-sandbox-project-creators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["st-ethos-non-production"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-non-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["st-ethos-production"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-production-xpn-administrators"]
}

moved {
  from = google_folder_iam_member.corpus_xpn_admins["st-ethos-sandbox"]
  to   = google_folder_iam_member.corpus_env_access["st-ethos-sandbox-xpn-administrators"]
}
