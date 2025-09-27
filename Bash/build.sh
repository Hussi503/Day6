# #!/bin/bash
# sudo docker rmi -f $(sudo docker images -q) ##this is not recommned step, i am deleting existing images to save space
# sudo rm -r gold ## these steps are not recommened instead you can modify script as shown below
# sudo mkdir gold
# cd gold/
# sudo git clone https://github.com/Hussi503/Day6.git
# cd Day6/Code
# sudo docker build -t react-microk8s -f golddockerfile .
# sudo docker tag react-nginx-ansible:latest hussi503/sagar-k-practice:latest ##make sure you did docker login
# sudo docker push hussi503/sagar-k-practice:latest


#!/bin/bash
set -e  # exit immediately on error

# Optional: Clean up only the images you care about
sudo docker rmi -f hussi503/sagar-k-practice:latest || true
sudo docker rmi -f react-microk8s:latest || true

# Navigate to code directory (assuming Jenkins already cloned Day6)
cd /var/lib/jenkins/workspace/react-demo/Code

# Build the Docker image
sudo docker build -t react-microk8s -f golddockerfile .

# Tag the image correctly
sudo docker tag react-microk8s:latest hussi503/sagar-k-practice:latest

# Push to Docker Hub (make sure `docker login` has been run)
sudo docker push hussi503/sagar-k-practice:latest

