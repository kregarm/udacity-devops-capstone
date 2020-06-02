pipeline {
     agent any
     stages {
         stage('Install requirements') {
             steps {
                 sh 'npm install'
             }
         }
         stage('Lint JS') {
              steps {
                  sh 'npm run lint'
              }
         }
         stage('Read lint results') {
             steps {
                  checkstyle canComputeNew: false, defaultEncoding: '', healthy: '100', pattern: '**/lint_result.xml', unHealthy: ''
             }
         }
     }
}
