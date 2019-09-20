FROM jenkinsci/blueocean
LABEL maintainer="benjamin.hoffman.dev@gmail.com"

# Create log folder
USER root

RUN apk add py-pip
RUN apk add python-dev libffi-dev openssl-dev gcc libc-dev make
RUN pip install docker-compose

# Create log dir for jenkins
RUN mkdir /var/log/jenkins

# Copy plugin settings
#COPY plugins.txt /var/jenkins_home/plugins.txt
#RUN /usr/local/bin/plugins.sh /var/jenkins_home/plugins.txt

# Add jobs
COPY jobs/1-fling-engine-job.xml /usr/share/jenkins/ref/jobs/1-fling-engine-job/config.xml

# Make a log directory and a jenkins user
RUN chown -R jenkins:jenkins /var/log/jenkins
USER jenkins

# Set default options
ENV JAVA_OPTS="-Xmx4096m"
ENV JENKINS_OPTS=" --handlerCountMax=100"

USER root
