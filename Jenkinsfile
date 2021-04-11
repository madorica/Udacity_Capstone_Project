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
		// stage('Build image')
		// {
		// 	steps
		// 	{
		// 		sh './run_docker.sh'
		// 	}
		// }
		// stage('test')
		// {
		// 	steps
		// 	{

		// 		sh 'python3.7 -m pytest test.py'
		// 	}
		// }
		// stage('Push image')
		// {
		// 	environment{
		// 		DOCKER_USER = credentials('docker_username')
		// 		DOCKER_PASSWORD = credentials('docker_password')
		// 	}
		// 	steps
		// 	{
		// 		sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
		// 		sh 'docker tag capstone:v2 mohamed992/capstoneapp'
		// 		sh 'docker push mohamed992/capstoneapp'

		// 	}
		//}
		stage('Deploy EKS') 
		{
		 // environment {
		 //     AWS_ACCESS_KEY_ID     = credentials('jenkins-aws-secret-key-id')
		 //     AWS_SECRET_ACCESS_KEY = credentials('jenkins-aws-secret-access-key')
		 // }
		 steps{
	         withAWS(region: 'eu-central-1', credentials: 'AWS Access')
			 {
				//sh 'curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp'
				//sh 'mv /tmp/eksctl /usr/local/bin'
				//sh 'eksctl delete cluster --name capstone-cluster'
				sh 'eksctl create cluster --name capstone-cluster --version 1.18 --region eu-central-1 --managed --nodegroup-name linx-nodes --node-type t2.small --nodes 2'	
			 }

		 }
	
		}
		// stage('Deploy blue container')
		// {
		//   when { branch 'blue'}
		// }
		// stage('Redirect service to blue container')
		// {
		//   when { branch 'blue'}
		// }
		// stage('Deploy green container')
		// {
		//   when { branch 'green'}
		// }
		// stage('Redirect service to green container')
		// {
		//   when { branch 'green'}
		// }
	}

}