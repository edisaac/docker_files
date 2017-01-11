>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Modificar la ruta del docker
mv /var/lib/docker /mnt/DISCO_F/docker
ln -s /mnt/DISCO_F/docker /var/lib/docker
ln -s /mnt/DISCO_F ~/F

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Eliminar imagenes none
	docker rmi $(docker images | grep "^<none>" | awk "{print $3}")
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#eliminar contenedores exited
	docker rm $(docker ps -a | grep Exit | cut -d ' ' -f 1)
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Crear imagen, necesita estar  en la carpeta  del dockerfile "cd /path"
	docker build -t odoo10 .
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#Ver el log de un contenedor
	docker logs -f cubic
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
#conectandos al bash de un contenedor
	docker exec -it container_id  bash
-------------------------------------------------------
#Otros
docker run -p 8071:8069 --name dev --link db:db -t cubicdev

docker run -v /mnt/DISCO_F/git/odoo_cubic:/etc/odoo_cubic -p 8069:8069 --name dev --link db:db -t cubicdev

docker tag e3c2a8b102c5 edisaac/cubic:prod

#Compose
docker-compose up

docker volume rm $(docker volume ls -qf dangling=true)




montar disco
https://lists.centos.org/pipermail/centos-es/2009-December/006688.html
