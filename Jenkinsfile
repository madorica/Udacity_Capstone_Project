pipeline{
	agent any
    stages {
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
            	sh 'pylint --disable=R,C,W1203,W1309,E0401 app.py'
            }
        }
        stage('test')
        {
        	steps
        	{
        		sh 'pytest app.py'
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