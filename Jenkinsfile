pipeline {
2
    agent {
3
        label 'slave01'
4
    }
5
    stages {
6
        stage('Building our image') {
7
            steps {
8
                script {
9
                    dockerImage = docker.build "chakrapanin/addressbook:$BUILD_NUMBER"
10
                }
11
            }
12
        }
13
        stage('Deploy our image') {
14
            steps {
15
                script {
16
                    // Assume the Docker Hub registry by passing an empty string as the first parameter
17
                    docker.withRegistry('' , 'dockerhub') {
18
                        dockerImage.push()
19
                    }
20
                }
21
            }
22
        }
23
    }
24
}
