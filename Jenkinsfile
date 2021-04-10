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
            	sh 'pylint --disable=R,C,W1203,W1309,E0401 app.py'
            	sh 'hadolint --ignore=DL3013 Dockerfile'
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
				sh 'pytest test.py'
			}
		}
		// stage(Push image')
		// {

		// }
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