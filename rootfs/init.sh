#!/usr/bin/env bash
[ -d /bcaa/jenkins/plugins.d/ ] && \
  find /bcaa/jenkins/plugins.d/ -type f -exec cat {} \; | \
  xargs /usr/local/bin/install-plugins.sh

[ -d /bcaa/jenkins/jobs.d/ ] && \
  (ls  /bcaa/jenkins/jobs.d | xargs -I {} mkdir -p /var/jenkins_home/jobs/{})  && \
  (ls  /bcaa/jenkins/jobs.d | xargs -I {} cp -n /bcaa/jenkins/jobs.d/{} /var/jenkins_home/jobs/{}/config.xml)

exec /usr/local/bin/jenkins.sh "$*"
