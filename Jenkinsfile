pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                bundle install
                bundle exec bootsnap precompile --gemfile
                bundle exec bootsnap precompile app/ lib/
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                rails test
            }
        }
        stage('Docker Build') {
            steps {
                echo 'Deploying....'
                docker ps -a
                docker build -t sicei-$GIT_BRANCH:1.0.0-$BUILD_NUMBER .
            }
        }
    }
}
