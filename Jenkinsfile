node {
  stage('do something with git') {
    sshagent (credentials: ['github-key']) {
      sh 'git ls-remote -h --refs git@github.com:sukengine/jenkins-terraform.git main /awk "{print $1}"'
    }
  }
}
