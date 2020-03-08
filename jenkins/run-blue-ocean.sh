#/bin/bash
# Runs jenksing on port 8080, creates a linked jenkins data folder 
# to this host machine, and attachs the docker socket so 
# jenkins can run docker jobs
docker run -u root --rm -d -p 8080:8080 -p 50000:50000 -v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkinsci/blueocean
