node {
  stage('do something with git') {
    sshagent (credentials: ['github-key']) {
      sh 'git ls-remote -h --refs git@github.com:wardviaene/jenkins-course.git master /awk "{print $1}"'
    }
  }
}
