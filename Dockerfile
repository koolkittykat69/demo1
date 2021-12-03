FROM jenkins/jenkins:lts-jdk11

COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/
COPY --chown=jenkins:jenkins jenkins.yaml /var/jenkins_home/
COPY --chown=jenkins:jenkins node-key /var/jenkins_home/
ENV CASC_JENKINS_CONFIG=/var/jenkins_home/jenkins.yaml

RUN chmod 400 /var/jenkins_home/node-key \
 && /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt \
 && echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

EXPOSE 8080
