# AWS EBS CSI Driver Architecture 

![alt text](image.png)

## Persistent Volume : (PV) 
A PersistentVolume (PV) is a piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.
## Persisent Volume Claim :(PVC)
A PersistentVolumeClaim (PVC) is a request for storage by a user. It is similar to a Pod. Pods consume node resources and PVCs consume PV resources

## Storage Class : (SC):
A StorageClass defines:
•	what type of storage to create 
•	how to create it 
•	performance type 
•	reclaim policy 
•	provisioner 
It enables dynamic provisioning.

## flow for EBS csi driver 
Application Pod
      ↓
PVC (PersistentVolumeClaim)
      ↓
StorageClass
      ↓
EBS CSI Controller
      ↓
AWS EBS Volume Created
      ↓
PersistentVolume (PV)
      ↓
Volume Attached to EC2 Worker Node
      ↓
EBS CSI Node Plugin
      ↓
Mount inside Pod


## Create Pod identity and install CSI driver 

![alt text](image-1.png)

![alt text](image-2.png)

![alt text](image-3.png)

## deploy and verify resource 


![alt text](image-4.png)

## Test contivity 

![alt text](image-5.png)

## If we delete pod Data wil persistant 

![alt text](image-6.png)

![alt text](image-7.png)

evenn if we delete pod pvc will be thier 

![alt text](image-8.png)

## ExternalName Service
In Kubernetes, an ExternalName Service is a special type of Service that does not create a real backend or load balancer.
Instead, it simply acts as a DNS alias (CNAME record).

## Eks + RDS mysql DB 

![alt text](image-9.png)

1. create Scueity group for Database 
get EKS cluster security group :
aws eks describe-cluster \
  --name  retail-dev-eks-cluster-hani \
  --query "cluster.resourcesVpcConfig.clusterSecurityGroupId" \
  --output text

2. Connect using RDS endpoint and create database 
![alt text](image-11.png)
![alt text](image-10.png)

3. we have to create one more manifests file which is called externalname service for RDS contivity.

![alt text](image-12.png)

 we can able to get data using RDS 
 ![alt text](image-13.png)

## Verify database entries in RDS 

![alt text](image-14.png)

