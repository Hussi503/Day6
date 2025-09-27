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


##!/bin/bash
set -e  # exit on error

# Clean up specific images, ignore if not present
sudo docker rmi -f hussi503/sagar-k-practice:latest || true
sudo docker rmi -f react-microk8s:latest || true

# Move into repo code directory (adjust path to match Ansible clone location)
cd /home/jenkins/bashscripts/Day6/Code

# Build the Docker image
sudo docker build -t react-microk8s -f golddockerfile .

# Tag correctly
sudo docker tag react-microk8s:latest hussi503/sagar-k-practice:latest

# Push to Docker Hub
sudo docker push hussi503/sagar-k-practice:latest


