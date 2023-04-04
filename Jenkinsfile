pipeline {
       
       
 agent any
       
       
        environment {
           
                    NEXUS_USERNAME = 'admin'
                    NEXUS_PASSWORD ='Adnen**91'
                    DOCKER_HUB_USERNAME= 'adnendeveloper'
                    DOCKER_HUB_PASSWORD= 'dckr_pat_4GalsJoNAgjYHRb61dRJknhjUHc'
                    DOCKER_HUB_ANGULAR_REPO= 'angular-esprit-repo'
                    DOCKER_HUB_SPRING_REPO= 'spring-boot-esprit-repo'
                    MYSQL_ROOT_PASSWORD = 'root'
                    MYSQL_PASSWORD = 'root'
                    MYSQL_DATABASE = 'tpachato'
                   
                         
        }
       
        stages {
           
                    stage ('GIT Checkout for Angular App') {
                steps {
                    echo '...Pulling angular app';
                    git branch: 'main',
                    url : 'https://github.com/Adnen-Developer/esprit-devops-angular'
                   // credentialsId:  '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';
                }
            }    
/*
                stage('SonarQube check for Angular') {
                    steps {
                            sh 'npm install sonar-scanner --save-dev'
                            sh 'npm run sonar'
                    }
                }
*/
                stage('Build Angular image') {
                    steps {
                      //  sh 'chmod 666 /var/run/docker.sock'
                        sh 'declare BUILD_TAG=$(date +%s-%A-%B)'            
                        sh 'docker build -t esprit-devops-angular:${BUILD_TAG} .'
                    }
                }
        /*  
                stage('Push Angular image to Nexus') {
                steps {
   
                        sh 'docker tag  esprit-devops-angular:${BUILD_TAG} 72.10.0.140:8082/docker-devops-repo/esprit-devops-angular:${BUILD_TAG}'
                        sh 'docker login -u $NEXUS_USERNAME -p $NEXUS_PASSWORD 72.10.0.140:8082'
                        sh 'docker push 72.10.0.140:8082/docker-devops-repo/esprit-devops-angular:${BUILD_TAG}'
                }
            }
       
      */  
            stage('Push Angular image to Docker Hub') {
                steps {
           
                        sh 'docker tag esprit-devops-angular:${BUILD_TAG} docker.io/${DOCKER_HUB_USERNAME}/${DOCKER_HUB_ANGULAR_REPO}:${BUILD_TAG} '
                        sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                        sh 'docker push  docker.io/${DOCKER_HUB_USERNAME}/${DOCKER_HUB_ANGULAR_REPO}:${BUILD_TAG}'
                   
                }
            }
     
     
     
     
           
            stage ('GIT Checkout for Spring Boot App') {
                    steps {
                        echo '...Pulling...';
                        git branch: 'main',
                        url : 'https://github.com/Adnen-Developer/tpAchatProject'
                       // credentialsId:  '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';
                    }
            }
           
            stage ('Build') {
                    steps {
                       sh "mvn -B -DskipTests clean package"
                    }
            }
           
            stage ('Test') {
                    steps {
                        sh "mvn test"
                    }
            }
           
            stage ('Package') {
                    steps {
                        sh "mvn package"
                    }
            }
     
           
    /*      
               
            stage("build & SonarQube analysis") {
                    steps {
                        sh  "mvn sonar:sonar -Dsonar.projectKey=tpAchatProject -Dsonar.host.url=http://72.10.0.140:9000 -Dsonar.login=334635ab13b1c886cddc5a0d9ab9673e2514e8ee"
                    }
            }
             
  */          
            stage('Build Spring Boot image') {
                           
                    steps {
                    sh 'docker build -t tp-achat-project:${BUILD_TAG} .'
                             
                    }
            }
           
/*
            stage('Push Spring Boot image to Nexus') {
                steps {
                        sh 'docker tag tp-achat-project:${BUILD_TAG} 72.10.0.140:8082/docker-devops-repo/tp-achat-project:${BUILD_TAG}'
                        sh 'docker login -u $NEXUS_USERNAME -p $NEXUS_PASSWORD 72.10.0.140:8082'
                        sh 'docker push 72.10.0.140:8082/docker-devops-repo/tp-achat-project:${BUILD_TAG}'
                }
            }
       
*/
            stage('Push Spring Boot image to Docker Hub') {
                steps {
                        sh 'docker tag tp-achat-project:${BUILD_TAG} docker.io/${DOCKER_HUB_USERNAME}/${DOCKER_HUB_SPRING_REPO}:${BUILD_TAG} '
                        sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
                        sh 'docker push  docker.io/${DOCKER_HUB_USERNAME}/${DOCKER_HUB_SPRING_REPO}:${BUILD_TAG}'
                                        sh 'unset BUILD_TAG'
                }
            }
         /*  
            stage('create Spring boot, ANgular and Mysql App') {
              steps {
                withEnv([
                  "MYSQL_ROOT_PASSWORD=${env.MYSQL_ROOT_PASSWORD}",
                  "MYSQL_DATABASE=${env.MYSQL_DATABASE}",
                  "MYSQL_USER=${env.MYSQL_USER}",
                  "MYSQL_PASSWORD=${env.MYSQL_PASSWORD}"

                ]) {
                  sh 'docker-compose -f /home/vagrant/dockerComposeDeployment/Docker-Compose-Deployment.yml up -d'
                }
              }
            }    
     

          stage('LOGOUT'){
                steps {
                  sh 'docker logout docker.io'
                  sh "docker logout ${DOCKER_HUB_USERNAME}"
                  sh 'docker logout 72.10.0.140:8082'    


                   
                }
            }  
        */
         
    }
}

