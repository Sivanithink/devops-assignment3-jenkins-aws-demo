// This is a Declarative Pipeline, written in Groovy syntax

pipeline {
    // Here, we tell Jenkins to find any available agent with the 'linux' label
    agent {
        label 'linux'
    }

    stages {
        // A stage is a logical block in our pipeline, like 'Build' or 'Test'
        stage('Install Dependencies') {
            steps {
                // 'sh' executes a shell command on the agent
                sh 'npm install'
            }
        }
        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }
    }
}
