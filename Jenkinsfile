pipeline {

    agent {

        label 'slave01'

    }
 tools
    {
       maven "Maven"
    }
    stages {
    stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
    

        stage('Building our image') {

            steps {

                script {

                    dockerImage = docker.build "chakrapanin/addressbooko:$BUILD_NUMBER"

                }

            }

        }

        stage('Deploy our image') {

            steps {

                script {

                    // Assume the Docker Hub registry by passing an empty string as the first parameter

                    docker.withRegistry('' , 'dockerhub') {

                        dockerImage.push()

                    }

                }

            }

        }

    }

}

