/**
 * This pipeline describes a multi container job, running Maven and Golang builds
 */
def label = "jenkins-slave-${UUID.randomUUID().toString()}"
def image_name = "carlosrocha/test_image_sample"
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
                sh 'git clone https://github.com/carlosrochap/jenkins-sample.git ./build'
            }
            
            stage('Build Image'){
                sh 'cd ./build; docker build -t testimg .'
            }
            
            stage('Push Image'){
                sh 'docker login -u carlosrocha -p Test123'            
                sh "docker tag testimg $image_name"
                sh "docker push $image_name"
            }
            
            
        }
        
    }

    

 
}




