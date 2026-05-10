
Section: 1
Intro of  Retail store application : 
 ![alt text](image.png)

Section 2 : Docker Command
Docker Concepts Covered  :
 ![alt text](image-1.png)

Create EC2 Instance and Install Docker:
1. Launch EC2 Instance
Use the AWS Console to launch a new EC2 instance .
2. Connect via SSH
ssh -i your-key.pem ec2-user@<your-ec2-public-ip>
 ![alt text](image-2.png)
________________________________________
3. Install Docker on Amazon Linux 2023
sudo dnf update -y
sudo dnf install docker -y
sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker ec2-user

 ![alt text](image-3.png)

 ![alt text](image-4.png)

# Check Docker version
docker version
 ![alt text](image-5.png)

# List Docker images (should be empty initially)
docker images
# Run a test container
docker run hello-world
# List images again (should now include hello-world)
docker images
 
 ![alt text](image-6.png)

docker ps : Docker all currently running containers
docker ps -a : list all contanier Which is running and stopped
docker ps  -aq  : it will give container id 
docker rm  $( docker ps  -aq  ) : it will removed stopped container
docker rmi :  Delated images 
docker  images  -q : gives image id 

 ![alt text](image-7.png)

 ![alt text](image-8.png)

Pull and Run Docker Images from Docker Hub and Run
 ![alt text](image-9.png)

# Pull Docker image from Docker Hub
docker pull stacksimplify/retail-store-sample-ui:1.0.0
![alt text](image-10.png)
# Alternatively, pull from GitHub Packages (no download limits)
docker pull ghcr.io/stacksimplify/retail-store-sample-ui:1.0.0
# List Docker images to confirm the image is pulled
docker images
 
![alt text](image-11.png)

Run the Downloaded Docker Image
•	HOST_PORT: The port number on your host machine where you want to receive traffic (e.g., 8888).
•	CONTAINER_PORT: The port number within the container that's listening for connections (e.g., 8080).
# Run Docker Container
docker run --name <CONTAINER-NAME> -p <HOST_PORT>:<CONTAINER_PORT> -d <IMAGE_NAME>:<TAG>
 ![alt text](image-12.png)
 
![alt text](image-13.png)

Connect to Docker Container Terminal
docker exec -it <CONTAINER-NAME> /bin/sh
# Inside the container, you can run the following commands:
## Basic OS Info
uname -a                    # Kernel version and system details
cat /etc/os-release         # Check base OS details
whoami                      # See current user (usually 'root')
## File System + App Structure
pwd                         # Current directory (usually /)
ls                          # List files
ls -l /app                  # Check where app.jar is located (if /app is used)
## Java Runtime
java -version               # Verify Java is installed and check version
## Test Application (from inside container - Container port 8080)
curl http://localhost:8080  # Send a request to the app running inside
## Exit container shell
exit 
 
![alt text](image-14.png)

 Stop and Start Docker Containers
stop a running container
docker stop <CONTAINER-NAME>
# Start the stopped container
docker start <CONTAINER-NAME>

 ![alt text](image-15.png)

remove the container
docker rm <CONTAINER-NAME>
#  stop and remove the container in one command
docker rm -f <CONTAINER-NAME>
docker rm -f myapp1

 ![alt text](image-16.png)

 ![alt text](image-17.png)

How to Create and Push Docker Images to Docker Hub : 
![alt text](image-18.png)
 

Verify Docker Version and Log In via Command Line
# Check Docker version
docker version
# Log in to Docker Hub
docker login
# To Logout from Docker Hub (Optional)
docker logout

![alt text](image-19.png)


 Docker Image  built:
# Create a Folder
mkdir demo-docker-build
cd demo-docker-build
# Download the Application Source
wget https://github.com/aws-containers/retail-store-sample-app/archive/refs/tags/v1.2.4.zip
# Unzip Application Source
unzip v1.2.4.zip
# Make change to file
cd /home/ec2-user/demo-docker-build/retail-store-sample-app-1.2.4/src/ui/src/main/resources/templates
File name: home.html
We are making a change for UI stating V2 at line 
# List to Verify if we are at that file
ls home.html
ls -lrt

# Changes we are doing 
## Before
          The most public <span class="text-primary-400">Secret Shop</span>
## After
          The most public <span class="text-primary-400">Secret Shop - V2 Version</span>          
# Command to Make That Change via Terminal (No Manual Editing)
sed -i 's/Secret Shop<\/span>/Secret Shop - V2 Version<\/span>/' home.html
# Verify It Worked:
grep 'Secret Shop' home.html
 
![alt text](image-20.png)
 
![alt text](image-21.png)

Build Docker Image and Run It
# Change to the directory containing your Dockerfile
cd /home/ec2-user/demo-docker-build/retail-store-sample-app-1.2.4/src/ui
# Verify Dockerfile before starting the build
ls -lrt Dockerfile
# Build the Docker image
docker build -t <IMAGE_NAME>:<TAG> .
# List Docker images
docker images
# Run the Docker container and verify
docker run --name <CONTAINER-NAME> -p <HOST_PORT>:<CONTAINER_PORT> -d <IMAGE_NAME>:<TAG>
# Access the application in your browser
http://<EC2-Instance-Public-IP>:8889
## RUN Container: 1.0.0 version on Host port 8888 (TO COMPARE WITH 2.0.0)
# Example using Docker Hub image:
docker run --name myapp1 -p 8888:8080 -d stacksimplify/retail-store-sample-ui:1.0.0

# Or using GitHub Packages image:
docker run --name myapp1 -p 8888:80 -d ghcr.io/stacksimplify/retail-store-sample-ui:1.0.0
![alt text](image-22.png)

![alt text](image-23.png)

![alt text](image-24.png)

# Dockerfile
![alt text](image-25.png)

# Multistage Docker Build
![alt text](image-26.png)

![alt text](image-27.png)

![alt text](image-28.png)

# CleanUp 
docker stop retail-ui
docker rm retail-ui
docker rmi retail-ui:9.0.0

![alt text](image-29.png)

![alt text](image-30.png)

 If you want to rebuild from scratch and ignore cache:
docker build --no-cache -t retail-ui:10.0.0 .

docker builder prune : Remove  cache 
docker builder prune –all : Remove all Caches
# clean Everything Unused (Stopped containers, volumes, networks, cache, images)**
docker system prune

![alt text](image-31.png)

![alt text](image-32.png)

![alt text](image-33.png)






 
