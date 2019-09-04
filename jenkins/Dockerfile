FROM jenkins/jenkins
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Create log folder
USER root

# Install curl
RUN apt-get update
RUN apt-get install curl

# Sudo so that we can run docker inside the container 
RUN apt-get -y install sudo

# Create log dir for jenkins
RUN mkdir /var/log/jenkins

# Install docker inside this container
RUN curl -fsSL https://get.docker.com -o get-docker.sh
RUN sh get-docker.sh

# Copy plugin settings
COPY plugins.txt /var/jenkins_home/plugins.txt
RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Add jobs
COPY jobs/1-fling-engine-job.xml /usr/share/jenkins/ref/jobs/1-fling-engine-job/config.xml

# Make a log directory and a jenkins user
RUN chown -R jenkins:jenkins /var/log/jenkins
USER jenkins

# Setting up environment variables for Jenkins admin user
ENV JENKINS_USER admin
ENV JENKINS_PASS admin

# Set default options
ENV JAVA_OPTS="-Xmx4096m"
ENV JENKINS_OPTS=" --handlerCountMax=100"

# Create a docker user so that we can run docker without sudo
RUN usermod -aG docker jenkins

