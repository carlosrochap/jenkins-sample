pipeline {
    agent {
        kubernetes {
            label 'mypod'
            defaultContainer 'jenkins-slave'
            yaml """
                apiVersion: v1 
                kind: Pod 
                metadata: 
                    name: dood 
                spec: 
                    containers: 
                      - name: jenkins-slave
                        image: crocha/jenkins-slave:3.0
                        command: ['cat'] 
                        tty: true
                        resources: 
                            requests: 
                                cpu: 10m 
                                memory: 256Mi 
            """
        }

    }
    stages {
        stage('Test') {
            steps {
                sh 'ls -l'
                sh 'docker -v'
                sh 'docker build -t testimg .'
            }
        }
    }
}




