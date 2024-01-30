La ejecucion de los comandos debe realizarce en el orden siguiente

Primero, correr la instalacion del cls de aws y eksctl


Segundo, hay que asegurarse de tener el cli de aws configurado
chmod +x 1.install-eks.sh
./1.install-eks.sh

aws configure
AWS Access Key ID [****************GMXH]:
AWS Secret Access Key [****************fZK5]:
Default region name [us-east-1]:
Default output format [None]:

Tercero, crear el cluster de eks
eksctl create cluster -f cluster-configuration.yaml

Este paso anterior tomara entre 15 a 20 minutos

Ver el estado del cluster
aws eks describe-cluster - name nginx-cluster - query "cluster.{Name: name, Status: status, Endpoint: endpoint, Version: version, DateOfCreation: createdAt}" - output table


Obtener nodos
kubectl get nodes - label-columns=eks.amazonaws.com/capacityType - selector=eks.amazonaws.com/capacityType=SPOT

Actualizar kubeconfig para que use nginx
aws eks - region ap-south-1 update-kubeconfig - name nginx-cluster

Aplicamos el deployment

kubectl apply -f deployment.yaml

Visualizamos como quedo
kubectl describe deployment nginx

Exponemos el deployment por medio de un servicio
kubectl apply -f service.yaml

Exploramos el servicio
kubectl describe service nginx-service

