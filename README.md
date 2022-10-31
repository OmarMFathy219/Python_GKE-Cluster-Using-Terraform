#GKE cluster and Bastion Host on GCP Using Terraform
#### Deploy a Python Application ![Project link] (https://github.com/atefhares/DevOps-Challenge-Demo-Code)
1. Dockarize a python web application using docker
2. Pull redis image from docker Hub 
3. push 2 image to GCR on GCP
```
# Authenticate to GCR using gcloud
gcloud auth configure-docker gcr.io
# Tag the image 
docker tag web-app  gcr.io/final-project/python-app
# Push the image to GCR
docker push gcr.io/final-project/python-app

```
# Infrastructure Resoureces on GCP
1. Make backend configuration using GCP Bucket
2. Create VPC
	* subnets ( management subnet & restricted subnet )
	* Management subnet has the ( NAT gateway , Private vm )
	* Restricted subnet has the ( Private standard GKE cluster ( private control plan ))
Notes:
1. Restricted subnet must not have access to internet
2. All images deployed on GKE must come from GCR or Artifacts registry.
3. The VM must be private.
4. Deployment must be exposed to public internet with a public HTTP load balancer.
5. All infra is to be created on GCP using terraform.
6. Deployment on GKE can be done by terraform or manually by kubectl tool.
7. Don’t use default compute service account while creating the gke cluster, create
custom SA and attach it to your nodes.
8. Only the management subnet can connect to the gke cluster.

# To run Terraform code
```
# initialize terraform
terraform init
# check plan
terraform plan 
# apply the plan it will take some time to complete 
terraform apply --auto-approve
```
  <img  src="prove.png">

# authenticate with the cluster
```
gcloud container clusters get-credentials mycluster --zone us-west2-a --project final-project
```
```
gcloud compute ssh mymachine --project final-project --zone us-west2-a -- -L8888:localhost:8888
```
#### Run Kubectl using this command or do export
```
HTTPS_PROXY=localhost:8888 kubectl
## or use 
export HTTPS_PROXY=localhost:8888
kubectl
```

## Deploy Kuberentes Files
```
kubectl apply -fR ./kubernetes
```
```
kubectl get ingress
```

## Clean up 💣
```
kubectl delete -f ./k8s
```
```
terraform destroy 
```
