/**
 * This pipeline describes a multi container job, running Maven and Golang builds
 */

podTemplate(label: 'jenkins-slave', containers: [
      containerTemplate(name: 'builderslave', image: 'crocha/jenkins-slave:3.4', ttyEnabled: true, command: 'cat')

    ],
    volumes: [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
    ]
  ) {

  node('jenkins-slave') {
    stage('Test stuff') {
        echo env.BUILD_NUMBER
        echo "${env.getEnvironment()}"
        echo "${NODE_NAME}"
        
        container('builderslave'){
            sh 'ls -l /var/run'
            sh 'docker -v'
            sh 'git clone https://github.com/carlosrochap/jenkins-sample.git .'
            sh 'docker build -t testimg .'
            sh 'docker login -u carlosrocha -p Test123'            
            sh 'docker tag testimg carlosrocha/sampleimgbuild'
            sh 'docker push carlosrocha/sampleimgbuild'
        }
        
        
        
    }

    

  }
}




