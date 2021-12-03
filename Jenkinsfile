pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				git 'https://github.com/koolkittykat69/sprint-petclinic.git'
				sh "./mvnw -Dmaven.test.failure.ignore=true clean package"
			}

			post {
				success {
					archiveArtifacts 'target/*.jar'
				}
			}
		}
	}
}
