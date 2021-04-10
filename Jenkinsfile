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
				sh 'pip install pytest'
				sh 'pip install requests'
				sh 'python -m pytest test.py'
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