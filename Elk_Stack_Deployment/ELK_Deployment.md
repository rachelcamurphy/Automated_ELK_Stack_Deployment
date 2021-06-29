## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Network_Diagrams/CloudSecurity-RCM-Azure-Cloud-Security1.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

[Install Elk](https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/install-elk.yml)

[Filebeat Playbook](https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/filebeat-playbook.yml)

[Metricbeat Playbook](https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/metricbeat-playbook.yml)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting external access to the network.
- What aspect of security do load balancers protect? Load balancers ensure redundancy for web servers by distributing network traffic. This redundancy can be useful in the event of a DDoS attack. 
- What is the advantage of a jump box? Configuring a jump box is advantageous because it reduces your network's attack surface. A jump box is a more secure administrator workstation. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the file system and system logs.
- What does Filebeat watch for? Filebeat logs data about the file system and ships it to the centralized ELK stack for analysis. Filebeat is also known as a "log shipper." 
- What does Metricbeat record? Metricbeat records metrics and statistics and ships them to the centralized ELK stack for analysis.

The configuration details of each machine may be found below.

| Name     | Function | IP Address   | Operating System |
|----------|----------|--------------|------------------|
| Jump Box | Gateway  |   10.0.0.4   | Linux (Ubuntu)   |
|Web-1 DVWA|  Server  |   10.0.0.9   | Linux (Ubuntu)   |
|Web-2 DVWA|  Server  |   10.0.0.5   | Linux (Ubuntu)   |
|ELK Server|Log Server|   10.1.0.4   | Linux (Ubuntu)   |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump-Box Provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 

- `<Your home IP Address>`

Machines within the network can only be accessed by SSH (Secure Shell).
- Which machine did you allow to access your ELK VM? What was its IP address? The Jump-Box Provisioner machine has SSH access to the ELK server. The Jump-Box IP address is `10.0.0.4`

A summary of the access policies in place can be found in the table below.

| Name     | Publicly Accessible | Allowed IP Addresses |
|----------|---------------------|----------------------|
| Jump Box | Yes                 | `<your home IP>`     |
| Web-1    | Yes                  | `<home IP>` & 10.0.0.4|
| Web-2    | Yes                  | `<home IP>` & 10.0.0.4|
| Elk-Server | Yes | 10.0.0.4 |

 The Jump-Box Provisioner has Network Security Group rules that only allows ssh connections from your home IP. 
 The DVWA webservers can be accessed from HTTP port 80. The Elk-Server can be accessed via SSH (Secure Shell) from the Jump-Box Provisioner. 

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it saves system administrators time, it is easier to configure, and it is easier to troubleshoot if there are errors in the playbook. Ansible makes it easier to deploy, destroy, manage, and take inventory of your virtual environment.  

The playbook implements the following tasks:
- Installs docker.io
- Installs python3-pip
- Increases virtual memory
- Downloads and launches a docker elk container
- Enables service docker on boot

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Images/docker_ps_output.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:

`Web 1: 10.0.0.9`     `Web 2: 10.0.0.5` 
We have installed the following Beats on these machines:
- Filebeat 
- Metricbeat

These Beats allow us to collect the following information from each machine:
- Filebeat collects log data about your webservers file systems such as system.syslog events and system.auth logs. 
- Metricbeat collects metrics about your webservers such as CPU Usage, Load, Memory Usage, and Network Traffic. 
 
### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the configuration file from your Ansible container to your web servers.
- Update the /etc/ansible/hosts file to include the IP addresses of your webservers and your Elk server. 
- Run the playbook, and navigate to http://[your.ELK-VMExternal.IP]:5601/app/kibana to check that the installation worked as expected. 
- Which file is the playbook? 
    - [Install Elk](https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/install-elk.yml)
- The filebeat-config Where do you copy it? 
    - Copy the filebeat-config from the source: /etc/ansible/files/filebeat-config.yml
      to the destination configuration  dest:  /etc/filebeat/filebeat.yml
- Which file do you update to make Ansible run the playbook on a specific machine?
    - You can run the playbook on specific machines by updating the hosts file in /etc/ansible/hosts. 
- How do I specify which machine to install the ELK server on versus which to install Filebeat on? 
   - You will modify the individual playbook files with the name of your hosts. 
- Which URL do you navigate to in order to check that the ELK server is running?
    - Navigate to http://[your.ELK-VMExternal.IP]:5601/app/kibana 

As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.

Step by step instructions in order to set up the elk server: 

1. Configure Elk VM with Docker container
```
wget https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/install-elk.yml
```
2. Download Filebeat configuration file 
```
wget https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/filebeat-config.yml
```
3. Download Metricbeat configuration file
```
wget https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/metricbeat-config.yml
```
4. Install and launch filebeat playbook
```
wget https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/filebeat-playbook.yml
```
Run the following command to install filebeat on your webservers.
```
ansible-playbook filebeat-playbook.yml
```
5. Install and launch metricbeat playbook
```
wget https://github.com/rachelcamurphy/Cybersecurity_BootCamp/blob/main/Elk_Stack_Deployment/Ansible/metricbeat-playbook.yml
```
Run the following command to install metricbeat on your webservers.

```
ansible-playbook metricbeat-playbook.yml
```
6. Go to Kibana site and add log data for filebeat and metricbeat


---
SSH into the Jump-Box Provisioner
`ssh <Jump-Box Admin>@<Jump-Box IP>`

Start the Docker instance.
`<Jump-Box Admin>@Jump-Box-Provisioner:~$ sudo docker start interesting_johnson`

Attach to the docker container.

`<Jump-Box Admin>@Jump-Box-Provisioner:~$ sudo docker attach <DockerContainerName>`
or run `sudo docker exec -it <DockerContainerName>`

Locate the ansible directory.

`root@334d3d75d03e:/etc/ansible#`

In the ansible hosts file, add your web server IPs and the IP address of your elk server.

```
[webservers]
`10.0.0.9 ansible_python_interpreter=/usr/bin/python3`
`10.0.0.5 ansible_python_interpreter=/usr/bin/python3`
[elk-server]
`10.1.0.4 ansible_python_interpreter=/usr/bin/python3`
```

Start the docker container `sudo docker start elk`

Attach to the container `sudo docker exec -it elk bash`

Run the playbookfiles to install beats.
