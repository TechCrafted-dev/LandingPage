pipeline {
    agent any

    /*────────────────────────────
      Variables de entorno
    ────────────────────────────*/
    environment {
        REPO_NAME  = 'techcrafted-landing'

        // --- Image ---
        SHORT_SHA  = "${env.GIT_COMMIT.take(8)}"
        TAG_UNIQ   = "${REPO_NAME}:${SHORT_SHA}"
        TAG_LATEST = "${REPO_NAME}:latest"

        // --- Container ---
        PROD_NAME  = 'techcrafted-landing'
        PROD_PORT  = '4321'

        // --- Telegram ---
        TG_TOKEN   = credentials('TELEGRAM_TOKEN')
        TG_CHAT    = credentials('TELEGRAM_CHAT_ID')
    }

    /*────────────────────────────
        Etapas del pipeline
    ────────────────────────────*/
    stages {
        /* ---------- NOTIFICACIÓN ---------- */
        stage('Notify start') {
            steps {
                script {
                    def shortCommit = env.GIT_COMMIT.take(8)
                    def msg = """
                        <b>📦 ${env.REPO_NAME}</b>
                        <b>Branch:</b> ${env.BRANCH_NAME}
                        <b>Commit:</b> <code>${shortCommit}</code>

                        🏗️ Build iniciado…
                    """.stripIndent().trim()

                    sh """
                        curl -s -X POST "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \
                             --data-urlencode "chat_id=${TG_CHAT}" \
                             --data-urlencode "text=${msg}" \
                             -d parse_mode=HTML
                    """
                }
            }
        }

        /* ---------- COMPILAR IMAGEN ---------- */
        stage('Build image') {
            steps {
                sh """
                docker build --pull --no-cache \
                    --label project=${REPO_NAME} \
                    -t ${TAG_UNIQ} -t ${TAG_LATEST} .
                """
            }
        }

        /* ---------- DEPLOY ---------- */
        stage('Deploy to PROD') {
            when { branch 'main' }
            steps {
                sh '''
                docker stop ${PROD_NAME} || true
                docker rm   ${PROD_NAME} || true

                docker run -d --name ${PROD_NAME} \
                    --restart unless-stopped \
                    -p ${PROD_PORT}:80 \
                    ${TAG_LATEST}
                '''
            }
        }

        /* ---------- LIMPIEZA ---------- */
        stage('House-keeping images') {
            when { branch 'main' }
            steps {
                sh '''
                keep=5
                ids=$(docker images ${REPO_NAME} --format "{{.CreatedAt}} {{.ID}}" | \
                    sort -r | tail -n +$((keep+1)) | awk '{print $2}')

                if [ -n "$ids" ]; then
                    docker rmi $ids || true
                fi
                '''

                sh '''
                docker image prune -a -f \
                    --filter "label=project=${REPO_NAME}" \
                    --filter "until=720h"
                '''
            }
        }
    }

    /*────────────────────────────
      Bloque post para notificar
    ────────────────────────────*/
    post {
        success {
            script {
                def msg = """
                    <b>✅ Despliegue completado</b>
                    Todo salió bien.
                """.stripIndent().trim()

                sh """
                    curl -s "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \\
                         --data-urlencode "chat_id=${TG_CHAT}" \\
                         --data-urlencode "text=${msg}" \\
                         -d parse_mode=HTML
                """
            }
        }

        failure {
            script {
                def msg = """
                    <b>❌ Build fallido</b>
                    Revisa Jenkins para más detalles.
                """.stripIndent().trim()

                sh """
                    curl -s "https://api.telegram.org/bot${TG_TOKEN}/sendMessage" \\
                         --data-urlencode "chat_id=${TG_CHAT}" \\
                         --data-urlencode "text=${msg}" \\
                         -d parse_mode=HTML
                """
            }
        }
    }
}
