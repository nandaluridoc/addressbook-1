pipeline {
    agent any
    
    stages {
        stage("COMPILE"){
            agent {label 'slave01'}
            steps{
                script{
                    echo "Compiling the code"
                    sh 'mvn compile'
                }
            }
        }

        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
            post {
                always {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        
    }
}
