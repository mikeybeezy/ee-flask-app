
# Instructions

The hello world application has been built usiing the python flask framewor
* Note: The application will be deployed into kubernets default namespace.

## Step 1
Navigate to the ee-hello-world folder
`cd ee-hello-world`
`ls -l ` to view all the files in the directory 

```
Dockerfile       README           app.py           deployment.yaml  requirements.txt
```


## Step 2
We need to build our Docker image locally and ensure that it's in the Minikube docker registry when we deploy our application. We first need to configure our CLI environment to use the Docker engine inside Minikube. Execute the command below to initiate the configuration process. 
`minikube docker-env`


## Step 2
The command above presents us with a list of options. We will need to point our shell to the Minikube docker daemon. Copy and paste the command below that completes the configuration
`eval $(minikube -p minikube docker-env)`


## Step 5
Now let's build the docker image for the hello world application
`docker build -t ee-hello-world .`


## Step 6
Perform a Docker list to check that the newly built image is in the local Minikube Docker registry. The grep at the end of the command below will confirm that the Docker image has been built and is now listed in the Minikube Docker registry. 
`minikube image ls --format table | grep ee-hello-world`

you should expect to see something like the example below
```
| docker.io/library/ee-hello-world        | latest  | bbc0b5f6d537a | 900MB  |
```


## Step 7
Once we have confirmed that the image has been successful built we can now deploy the application with the kubernetes manifest file (deployment.yaml). 
Execute the command below to deploy the hello world application to your Minikube cluster
`kubectl create -f deployment.yaml`


## Step 
Now, check to confirm that pods in the deployment are running successfully 
`Kubectl get pods`
 
You should expect to see something resembling the output displayed below.
```
ee-hello-world-v2-df9dbbff-2prml   1/1     Running     0          3s
ee-hello-world-v2-df9dbbff-9jngf   1/1     Running     0          3s
ee-hello-world-v2-df9dbbff-cr5xn   1/1     Running     0          3s
```


## Step 12
Now that the application has been successfully deployed we want to access it in our web browser. We do this by exposing the application as a service.
Execute the command below to expose the Kubernetes Service as a load balancer service type.
`kubectl expose deployment ee-hello-world --type=LoadBalancer`



## Step 14
After we have created a service for our application we want to view the application in our browser. Execute the command below to automatically launch the hello world application in your default browser.

`minikube service ee-hello-world`

Alternatively you can execute the command below to be presented with the local host IP address that has a K8s nodeport appended to it

`minikube service hello-world-deployment --url`

Copy this and paste it into your browser. You will then see the hello world message for the application


# Clean Up 

## Step 14
Delete the service 
`kubectl delete serice ee-hello-world`


## Step 14
Delete the deployment 
`kubectl delete -f deployment.yaml`