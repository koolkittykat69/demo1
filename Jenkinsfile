pipeline {
	agent any
	parameters {
		    gitParameter branchFilter: 'origin/(.*)', defaultValue: 'main', name: 'BRANCH', type: 'PT_BRANCH'
	}
	stages {
		stage('Build') {
			steps {
				git branch: "${params.BRANCH}", url: 'https://github.com/koolkittykat69/spring-petclinic'
				sh "pwd && ls && ./mvnw -Dmaven.test.failure.ignore=true clean package"
			}

			post {
				success {
					archiveArtifacts 'target/*.jar'
				}
			}
		}
	}
}
