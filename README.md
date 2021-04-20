# Docker LAMP Scaffolding

Easy to use LAMP stack for local development with Docker.


Includes PHP 7.2, Apache 2.4, MySQL 5.7, PMA 5.1, Composer 2.0. 

The PHP version can be changed from the Dockerfile. Apache is installed by the PHP image.

The MySQL version needs to be changed from `docker-compose.yml` file

<br>

### To run the containers:

```shell
docker compose up
```

If you can see the MYSQL version when you go to http://127.0.0.1 then your container installation was successful.

<br>

### To run PHP / Apache / Composer commands, go into the main container shell:

```shell
docker exec -it php72 bash
```

Note that the `php72` is the `container_name` configured inside `docker-compose.yml` file

<br>

### To run MySQL commands:

```shell
docker exec -it mysql57 bash
```
<br>

## License

This project is licensed under [GNU GPLv3.0](LICENSE).