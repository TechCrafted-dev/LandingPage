pipeline {
    agent any

    environment {
        IMAGE     = 'techcrafted'
        CONTAINER = 'techcrafted'
        PORT      = '4321'
        TAG       = "${IMAGE}:latest"
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
                  docker ps -q --filter "name=${CONTAINER}" | xargs -r docker rm -f
                  docker run -d --name ${CONTAINER} \
                    --restart unless-stopped \
                    -p ${PORT}:80 ${TAG}
                '''
            }
        }
    }
}