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
                        image: crocha/jenkins-slave:2.0
                        command: ['cat'] 
                        tty: true
                        resources: 
                            requests: 
                                cpu: 10m 
                                memory: 256Mi 
            """
            volumes
                - hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
        }

    }
    stages {
        stage('Test') {
            steps {
                sh 'ls -l /var/run'
                sh 'img build -t testimg .'
                sh '''#!/bin/bash
                    img build -t testimg .
                    '''
                sh 'img build -t testimg .'
            }
        }
    }
}




