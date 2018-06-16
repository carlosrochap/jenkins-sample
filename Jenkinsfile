/**
 * This pipeline describes a multi container job, running Maven and Golang builds
 */
def label = "jenkins-slave-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
      containerTemplate(name: 'builderslave', image: 'crocha/jenkins-slave:3.4', ttyEnabled: true, command: 'cat')

    ],
    volumes: [
        hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')
    ]
  ) {

   node(label) {
         
        container('builderslave'){
        
            stage('Fetch Source'){
                sh 'git clone https://github.com/carlosrochap/jenkins-sample.git .'
            }
            
            stage('Build Image'){
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




