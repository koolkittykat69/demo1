pipeline {
	agent any
	parameters {
		    gitParameter branchFilter: 'origin/(.*)', defaultValue: 'main', name: 'BRANCH', type: 'PT_BRANCH'
	}
	stages {
		stage('Build') {
			steps {
				git branch: "${params.BRANCH}", url: 'https://github.com/jenkinsci/git-parameter-plugin.git'
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
