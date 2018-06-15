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

  stage('sss Step') {
  sh "ls -l"
  }
  node('jenkins-slave') {
    
        
        
        
        
        container('builderslave'){
            sh 'cd /var/build'
            sh 'docker -v'
          
            sh 'docker build -t testimg .'
            sh 'docker login -u carlosrocha -p Test123'            
            sh 'docker tag testimg carlosrocha/sampleimgbuild'
            sh 'docker push carlosrocha/sampleimgbuild'
        }
        
    }

    

  }
}




