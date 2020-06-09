pipeline {
    environment {
        registry= 'martinkregar/udacity-capstone'
        registryCredential = 'dockerhub'
        dockerimage = ''
    }
     agent any
     stages {
         stage('Install requirements') {
             steps {
                 sh 'npm install'
             }
         }
         stage('Lint Repo') {
              steps {
                  sh 'npm run lint'
                  recordIssues enabledForFailure: true, (tools: [checkStyle(reportEncoding: 'UTF-8', healthy: 1, qualityGates: [[threshold: 1, type: 'TOTAL_NORMAL', unstable: true], [threshold: 1, type: 'TOTAL_HIGH', unstable: false], [threshold: 1, type: 'TOTAL_ERROR', unstable: false]])])
                  sh 'hadolint Dockerfile'
              }
         }
         stage('Build docker image') {
              steps {
                  script {
                      dockerImage = docker.build registry + ":$GIT_COMMIT"
                  }
              }
         }
         stage ('Image scan') {
             steps {
			    sh "echo 'Checking Security with Aqua MicroScanner'"
			    aquaMicroscanner(imageName: "$registry:$GIT_COMMIT", notCompliesCmd: "exit 1", onDisallowed: "fail", outputFormat: "html")
		}
         }
         stage('Push image to repository') {
              steps {
                  script {
                      docker.withRegistry( '', registryCredential ) { dockerImage.push() }
                  }
              }
         }
         stage('Remove local docker image') {
              steps {
                  sh 'docker rmi $registry:$GIT_COMMIT'
              }
         }
         stage('Deploy Cluster') {
             when {
                 branch 'master'
             }
             steps {
                 sh 'aws eks --region eu-central-1 update-kubeconfig --name UdacityCapstoneCluster'
                 sh "kubectl patch pod test -p '{\"spec\":{\"containers\":[{\"name\":\"test\",\"image\":\"$registry:$GIT_COMMIT\"}]}}'"
             }
         }
     }
}
