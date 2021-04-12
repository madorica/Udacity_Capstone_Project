pipeline{
	agent any
    stages {
    	stage('Install Dependencies')
    	{
    		steps 
    		{
    			sh 'echo "installing Dependencies"'
    			sh 'pip install --user -r requirements.txt'
    		}
    	}

        stage('Linting') 
        {
            steps 
            {
            	sh 'echo linting the app file and the dockerfile'
            	sh 'make all'
            }
        }
		stage('Build image')
		{
			steps
			{
				sh './run_docker.sh'
			}
		}
		stage('test')
		{
			steps
			{

				sh 'python3.7 -m pytest test.py'
			}
		}
		stage('Push image')
		{
			environment{
				DOCKER_USER = credentials('docker_username')
				DOCKER_PASSWORD = credentials('docker_password')
			}
			steps
			{
				sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
				sh 'docker tag capstone:v2 mohamed992/capstoneapp'
				sh 'docker push mohamed992/capstoneapp'
				sh 'aws ecr-public get-login-password --region eu-central-1 | docker login --username AWS --password-stdin public.ecr.aws/y5m6t7d6'
				sh 'docker tag capstone:v2 public.ecr.aws/y5m6t7d6/capstone:v2'
				sh 'docker push public.ecr.aws/y5m6t7d6/capstone:v2'

		 	}
		}
		stage('Deploy EKS') 
		{
		 // environment {
		 //     AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
		 //     AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
		 // }
		 steps{
	         withAWS(region: 'eu-central-1', credentials: 'AWS Access')
			 {
			 	sh 'sudo apt-get aws-cli'
				sh 'eksctl delete cluster --name capstone-cluster'
				sh 'eksctl create cluster --name capstone-cluster --version 1.18 --region eu-central-1 --managed --nodegroup-name linx-nodes --node-type t2.small --nodes 2'
				sh 'kubectl apply -f deploy.yml'
			 	sh 'kubectl apply -f kubernetes/loadbalancer.yml'
			 }

		 }
	
		}
	}
}