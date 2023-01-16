check:
	@docker --version
	@python3 --version

clean:
	@rm -rf __pycache__
	@rm -rf .pytest_cache
	@rm -R terraform/temp

# makes things a lot easier if the image tag is the same name as the ecr repo
docker-build: 
	docker build -t template-lambda .
 
docker-run:      
	docker run -p 9000:8080 template-lambda
