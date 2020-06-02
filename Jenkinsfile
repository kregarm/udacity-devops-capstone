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
                  sh
                  'npm run lint'
                  checkstyle('lint_result.xml')
              }
         }
     }
}
