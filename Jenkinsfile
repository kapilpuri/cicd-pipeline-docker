pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                echo 'Running build automation'
                sh './gradlew build --no-daemon'
                archiveArtifacts artifacts: 'dist/trainSchedule.zip'
            }
        }
        
        stage ('Build Docker Image') {
            when  {
                 branch 'master'
            }
            
            steps {
                scripts {
                          app = docker.build ("purikap/node-app")
                    app.inside {
                        
                        sh 'echo $(curl localhost:8080)'
                    }
                }
            }
        }
        
        stage ('Push Docker Image') {
            
            when {
                    branch 'master'
            }
            
            steps {
                scripts {
                        
                    docker.withRegistry('https://registry.hub.docker.com','purikap') {
                        
                            app.push("$(env.BUILD_NUMBER)")
                            app.push("latest")
                    }
                }
            }
        }
        
    }
}
