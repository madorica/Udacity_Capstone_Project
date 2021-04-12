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
			 withAWS(region: 'eu-central-1', credentials: 'AWS Access')
			 {
			 	sh 'curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator'
			 	sh 'chmod +x ./aws-iam-authenticator'
			 	sh 'mkdir -p $HOME/bin && cp ./aws-iam-authenticator $HOME/bin/aws-iam-authenticator && export PATH=$PATH:$HOME/bin'
			 	sh 'echo "export PATH=$PATH:$HOME/bin" >> ~/.bashrc'
			 	//sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
			 	//sh 'unzip -o awscliv2.zip'
				//sh './aws/install'
				sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
				sh 'docker tag capstone:v2 mohamed992/capstoneapp'
				sh 'docker push mohamed992/capstoneapp'
				//sh 'aws ecr-public get-login-password --region eu-central-1 | docker login --username AWS --password public.ecr.aws/y5m6t7d6'
				//sh 'docker tag capstone:v2 public.ecr.aws/y5m6t7d6/capstone:v2'
				//sh 'docker push public.ecr.aws/y5m6t7d6/capstone:v2'
			}
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
			 	//sh 'curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"'
				//sh 'unzip awscliv2.zip'
				//sh 'sudo ./aws/install'
				//sh 'eksctl delete cluster --name capstone-cluster'
				sh 'eksctl create cluster --name capstone-cluster --version 1.18 --region eu-central-1 --managed --nodegroup-name linx-nodes --node-type t2.small --nodes 2'
				sh 'kubectl apply -f deploy.yml'
			 	sh 'kubectl apply -f kubernetes/loadbalancer.yml'
			 }

		 }
	
		}
	}
}