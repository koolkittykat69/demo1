pipeline {
	agent any
	stages {
		stage('Build') {
			steps {
				git 'https://github.com/koolkittykat69/spring-petclinic.git'
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
