pipeline {
    agent any
    parameters {
        string(name: 'GIT_URL', defaultValue: 'https://github.com/cmanilkumar/perf_test10.git', description: 'Git URL')
    }
    stages {
        // Checkout code from Git SCM
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/cmanilkumar/perf_test10.git']]])
            }
        }
         stage('Build') {
            steps {
                sleep(time: 30, unit: 'SECONDS')
                echo "Build completed"
            }
        }
         stage('Test') {
            steps {
                sleep(time: 30, unit: 'SECONDS')
                echo "Test completed"
            }
        }
        // Archive test results and coverage reports
        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'junit*/*,testng*/*'
            }
        }
        
       
    }
}
