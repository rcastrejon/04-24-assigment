pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'bundle install'
                sh 'bundle exec bootsnap precompile --gemfile'
                sh 'bundle exec bootsnap precompile app/ lib/'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'rails test'
            }
        }
        stage('Docker Build') {
            steps {
                echo 'Deploying....'
                sh 'docker ps -a'
                sh 'docker build -t sicei-$GIT_BRANCH:1.0.0-$BUILD_NUMBER .'
            }
        }
    }
}
