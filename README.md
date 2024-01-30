# Guía de Configuración de AWS EKS en Ubuntu 22.04

Para configurar un entorno de Amazon EKS, sigue estos pasos:

## Instalación de AWS CLI y EKSCTL

Primero, instala el CLI de AWS y EKSCTL. Utiliza los siguientes comandos:


```chmod +x 1.install-eks.sh```
```./1.install-eks.sh```


## Configuración del CLI de AWS
Asegúrate de tener el CLI de AWS configurado. Ejecuta el siguiente comando y sigue las instrucciones:
```aws configure```
Se te pedirá ingresar la Access Key ID, Secret Access Key, la región predeterminada y el formato de salida.

## Creación del cluster de EKS
Para crear el cluster de EKS, ejecuta el siguiente comando:
```eksctl create cluster -f 2.cluster-configuration.yaml```
Este proceso puede tardar entre 15 a 20 minutos.

## Verificar el estado del cluster
Puedes verificar el estado del cluster con el siguiente comando:
```aws eks describe-cluster --name nginx-cluster --query "cluster.{Name: name, Status: status, Endpoint: endpoint, Version: version, DateOfCreation: createdAt}" --output table```

## Obtener nodos
Puedes verificar el estado del cluster con el siguiente comando:

```aws eks describe-cluster --name nginx-cluster --query "cluster.{Name: name, Status: status, Endpoint: endpoint, Version: version, DateOfCreation: createdAt}" --output table```

## Obtener nodos
Para obtener los nodos del cluster, ejecuta:
```kubectl get nodes --label-columns=eks.amazonaws.com/capacityType --selector=eks.amazonaws.com/capacityType=SPOT```

## Actualizar kubeconfig
Actualiza el kubeconfig para que use el cluster de EKS recién creado. Ejecuta:

```aws eks --region us-east-1 update-kubeconfig --name nginx-cluster```

## Aplicar el deployment
Aplica el deployment ejecutando el siguiente comando:
```kubectl apply -f 3.deployment.yaml```

# Visualizar el estado del deployment
Para visualizar el estado del deployment, utiliza el siguiente comando:

```kubectl describe deployment nginx```

## Exponer el deployment a través de un servicio
Para exponer el deployment mediante un servicio, ejecuta:
```kubectl apply -f 4.service.yaml```

## Explorar el servicio
Para explorar el servicio, ejecuta:
```kubectl describe service nginx-service```
