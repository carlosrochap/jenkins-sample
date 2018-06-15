/**
 * This pipeline describes a multi container job, running Maven and Golang builds
 */

podTemplate(label: 'jenkins-slave', containers: [
      containerTemplate(name: 'builderslave', image: 'crocha/jenkins-slave:3.0', ttyEnabled: true, command: 'cat')

    ],
    volumes: [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
    ]
  ) {

  node('jenkins-slave') {
    stage('Test stuff') {
        container('builderslave'){
            sh 'ls -l /var/run'
            sh 'docker -v'
            sh 'git clone git@github.com:carlosrochap/jenkins-sample.git .'
            sh 'docker build -t testimg .' 
        }
        
    }

    

  }
}




