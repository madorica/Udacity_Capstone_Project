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
				DOCKER_USER = credentials('docker-username')
				DOCKER_PASSWORD = credentials('docker-password')
			}
			steps
			{
				sh 'docker login -u $DOCKER_USER -p $DOCKER_PASSWORD'
				sh 'dockerpath=mohamed992/capstoneapp'
				sh 'docker tag capstone:v2 $dockerpath'
				sh 'docker push $dockerpath'

			}
		}
		// stage('create the kubeconfig file') 
		// {

		// }
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