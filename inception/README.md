
# 42 project - inception

## How to create our first docker!

This project aims to broaden our knowledge of system administration by using Docker.
we had to virtualize several Docker images, creating them in a new personal virtual
machine.



### About the project

We had to do the whole project on a virtual machine, and set up :

- A Docker container that contains NGINX with TLSv1.2 or TLSv1.3 only
- A Docker container that contains WordPress + php-fpm only
- A Docker container that contains MariaDB only
- Two volumes : one for WordPress websites files and one for WordPress database.
- and a docker-network to connect the containers.

The docker-compose file needs a .env file which is not on the repo for security reason :)
###
You can use ``make up`` which will call the docker-compose file and build the 3 dockers together.

``make clean`` will delete the volumes and down the dockers.

``make fclean`` will remove every image and docker data with system prune command and remove all the volumes.

###
