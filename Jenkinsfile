pipeline{
	agent any
    stages {
    	stage('setup')
    	{
    		steps
    		{
    			sh 'source /home/mohamed/Desktop/Udacity_Capstone_Project/.devops/bin/activate'
    		}

    	}
    	stage('Install Dependencies')
    	{
    		steps 
    		{
    			sh 'echo "installing Dependencies"'
    			sh 'pip install -r requirements.txt'
    		}
    	}

        stage('Linting') 
        {
            steps 
            {
            	sh 'echo "this is the linting stage"'
            	sh 'make lint'
            }
        }
        stage('test')
        {
        	steps
        	{
        		sh 'python app.py'
        	}
        }
		// stage('Build image')
		// {

		// }
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