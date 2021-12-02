pipeline { 
    agent{ label "MASTER" }
    triggers{ pollSCM('* * * * *') }
    stages{
        stage ('Code Download From GIT'){
            steps{
                git 'https://github.com/Phani-1982/spring-hello-world.git'
            }
        }
         stage ('Build'){
            steps{
                sh "cd $WORKSPACE"
                sh "mvn clean package"
            }
        }
        stage('Deploy_Server_setup'){
            steps{
                sh "ansible -m ping -i $WORKSPACE/inventory all"
                sh "ansible-playbook -i $WORKSPACE/inventory $WORKSPACE/myplaybook.yml --syntax-check"
                sh "ansible-playbook -i $WORKSPACE/inventory $WORKSPACE/myplaybook.yml"
            }            
        }
        stage('Deploy APP'){
            agent{ label "deploy_server"}
            steps{
                sh "cd /home/jenkins" 
                sh "docker image build -t ceq_spring:1.0 ."
                sh "docker container run -d -p 8081:8081 ceq_spring:1.0 "
                           
            }
        } 
    }
}