pipeline {
    agent any
    environment {
        APP_NAME = 'techcrafted'
        PORT     = '4321'
        TAG      = "${APP_NAME}:latest"
    }

    stages {
        stage('Build image') {
            steps {
                sh 'docker build --pull -t ${TAG} .'
            }
        }
        stage('Redeploy') {
            steps {
                sh '''
                  docker stop ${APP_NAME} || true
                  docker rm   ${APP_NAME} || true
                  docker run -d --name ${APP_NAME} \
                    --restart unless-stopped \
                    -p ${PORT}:80 ${TAG}
                '''
            }
        }
    }
}
