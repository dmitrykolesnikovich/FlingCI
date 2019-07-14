
build:
	@docker-compose -p fling_jenkins build
run:
	@docker-compose -p fling_jenkins up -d
run-win:
	@docker-compose -p fling_jenkins up -d
stop:
	@docker-compose -p fling_jenkins down
clean-data: 
	@docker-compose -p fling_jenkins down -v
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
ps:
	@docker-compose -p fling_jenkins ps
jenkins-log:
	@docker-compose -p fling_jenkins exec master tail -f /var/log/jenkins/jenkins.log