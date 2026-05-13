# Kubernetes Secrets 
A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key.

You can use Secrets for purposes such as the following:
•	Set environment variables for a container.
•	Provide credentials such as SSH keys or passwords to Pods.
•	Allow the kubelet to pull container images from private registries.

![alt text](image-1.png)

# Kubernetes Demon Set:
A DaemonSet defines Pods that provide node-local facilities. These might be fundamental to the operation of your cluster, such as a networking helper tool, or be part of an add-on.

# Pod Indentity Agent 


![alt text](image.png)

# Sevice Account : 
A service account is a type of non-human account that, in Kubernetes, provides a distinct identity in a Kubernetes cluster.

1.Install EKS Pod Identity Agent

![alt text](<Screenshot 2026-05-13 144825.png>)

2. Deploy Aws Cli Pod and check list S3 bucket 

![alt text](image-2.png)

3.create Iam  role for pod identity and crete pod idntity Association

![alt text](image-3.png)

4. restart pod and chcek S3 list 

![alt text](image-4.png)

# Aws Secret Manager for Eks WorkLods

![alt text](image-5.png)

## Helm 
Helm is the package manager for Kubernete 

![alt text](image-6.png)

## Benifit of Helm

![alt text](image-7.png)

## install Helm and add helm repositories

![alt text](image-8.png)

![alt text](image-9.png)

## Verify Installtion

![alt text](image-10.png)

## create Iam Role , Policy and scecrete 
![alt text](image-11.png)

## create 
![alt text](image-12.png)
