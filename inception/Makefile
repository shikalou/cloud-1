up: build
	sudo docker compose -f ./srcs/docker-compose.yml up -d

build: 
	sudo mkdir -p /home/ldinaut/data/wordpress
	sudo mkdir -p /home/ldinaut/data/mariadb
	sudo docker compose -f ./srcs/docker-compose.yml build
	

clean:
	sudo rm -rf /home/ldinaut/data/wordpress
	sudo rm -rf /home/ldinaut/data/mariadb
	sudo docker compose -f ./srcs/docker-compose.yml down -v 

fclean: clean
	sudo docker system prune -af
	-sudo docker volume ls $(sudo docker volume ls -q) 2>/dev/null
