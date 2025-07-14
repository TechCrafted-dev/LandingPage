pipeline {
    agent any

    environment {
        NAME = 'techcrafted'
        PORT      = '4321'
        TAG       = "${NAME}:latest"
        VCS_REF   = "${GIT_COMMIT}"   // cache-buster opcional
    }

    stages {
        stage('Build image') {
            steps {
                sh """
                  docker build --pull \
                        --build-arg VCS_REF=${VCS_REF} \
                        -t ${TAG} .
                """
            }
        }

        stage('Redeploy') {
            steps {
                sh '''
                    docker stop ${NAME} || true
                    docker rm   ${NAME} || true
                    docker run -d --name ${NAME} \
                        --restart unless-stopped \
                        -p ${PORT}:80 ${TAG}
                '''
            }
        }
    }
}