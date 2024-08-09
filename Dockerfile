# Use the official Ubuntu base image
FROM ubuntu:latest

# Update the package repository and install the OpenSSH server
RUN apt-get update && apt-get install -y openssh-server

# Create the SSH directory and set up the root password
RUN mkdir /var/run/sshd && echo 'root:password' | chpasswd

# Allow root login via SSH by modifying the sshd_config file
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Start the SSH service
CMD ["/usr/sbin/sshd", "-D"]
