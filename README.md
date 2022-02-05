## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/network-diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the readme file may be used to install only certain pieces of it, such as Filebeat.

  /Playbooks

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting access to the network.
 - load balancer protect againts DDOS attacks and increase availability.  
 - the jump box will provide restricted access to the virtual network. 

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the operating system and system services.
- file beat will collect log events. 
- metricbeat records statistics of operating system and services running on the servers.

The configuration details of each machine may be found below.

| Name       | Function              | Private IP | Public IP     | Operating System |
|------------|-----------------------|------------|---------------|------------------|
| Jump Box   | Gateway               | 10.0.0.4   | 168.62.172.72 | Linux-Ubuntu     |
| WEB1       | DVWA Container        | 10.0.0.5   | 20.85.226.164 | Linux-Ubuntu     |
| WEB2       | DVWA Container        | 10.0.0.6   | 20.85.226.164 | Linux-Ubuntu     |
| ELK Server | EKL Kibana monitoring | 10.2.0.4   | 20.114.154.32 | Linux-Ubuntu     |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JUMPBOX machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
69.169.83.89 

Machines within the network can only be accessed by the jump box machine with ip 10.0.0.4


A summary of the access policies in place can be found in the table below.

| name       | Publicly Accessible | Allowed IP Addresses |
|------------|---------------------|----------------------|
| Jump Box   | YES                 | 69.169.83.89         |
| WEB1       | ONLY PORT 80        | 10.0.0.4             |
| WEB2       | ONLY PORT 80        | 10.0.0.4             |
| ELK Server | YES                 | 69.169.83.89         |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because it can take a longer time to manually configure and install containers on each machine seperatly. when using ansible the playbook can be saved in order to user it for future configurations and install them on a lot of machine all togther. this will save a lot of time when there is a need to set up a lot of machines at the same time.



The playbook implements the following tasks:

- install docker 
- install docker module 
- increase virutal memory 
- use more memory
- download and launch elk contaier


The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker-ps.png)

### Target Machines & Beats

This ELK server is configured to monitor the following machines:

Web1 - 10.0.0.5

Web2 - 10.0.0.6

We have installed the following Beats on these machines:

- Filebeat
- Docker Metrics

These Beats allow us to collect the following information from each machine:

- Filebeat is used for forwarding and centralizing log data. it will monitor log files, collect log events and forward them to Elasticsearch, kibana   for indexing. 

- Docker Metrics will monitor the dockers performance. it will analyze metrics like CPU usage, Memory Usage, Storage, Network load and other metrics we choose to monitor. 
 

### Using the Playbook

In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the ansible playbook file to  /etc/ansible/files
- Update the install-elk.yml file to include ports, name, state, image, memory usage.
- Run the playbook, and navigate to http://[ELK-SERVER-PUBLIC-IP]:5061/ to check that the installation worked as expected.

### Using the Filebeat and Docker Metric Playbooks

***MAKE SURE YOUR ELK SERVER CONTAINER IS UP AND RUNNING

*** Filebeat Installation

- SSH into the control node and follow the steps below:
- Copy the ansible playbook and configuration files to  /etc/ansible/files
- Edit Filebeat-config.yml - scroll down to line #1106 and edit the hosts ip address to your ELK machine private ip address using port 9200, scroll down to  line #1806  and       edit the hosts ip address to your ELK machine prive ip address usinf port 5601. 
- save the file
- now run filebeat-playbook.yml to start the playbook and install filebeat 
***please note if the group you want to install file beat name is different then 'websrvers' please edit the file (filebeat-playbook.yml) and change line #3 hosts to the desire group name.

*** Dcoker metric Installation

still whitin ansible follow these steps below: 
- Copy the ansible playbook and configuration files to  /etc/ansible/files
- Edit metricbeat-config.yml - scroll down to line #62 and change the ip to your ELK machine private ip using port 5601, scroll down to line #96 and change the hosts ip address   to you ELK machine prive ip using port 9200.
- save the file 
- now run metricbeat.yml to start the playbook and install filebeat 
***please note if the group you want to install file beat name is different then 'websrvers' please edit the file (metricbeat.yml) and change line #3 host to the desire group name.

Answer the following questions to fill in the blanks:_
-  Which file is the playbook? install-elk.yml  Where do you copy it? /etc/ansible/install-elk.yml
-  Which file do you update to make Ansible run the playbook on a specific machine? update the /etc/ansible/hosts file  How do I specify which machine   to install the ELK server on versus which to install Filebeat on? by specifying the group name (webservers/elk) - two groups we have set on the     hosts file. 
- Which URL do you navigate to in order to check that the ELK server is running? http://[ELK-SERVER-PUBLIC-IP]:5061/

 As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc.
 
 - All playbooks, configurations file and this readme file can be downloaded using: git clone https://github.com/jacobkor/project1.git
 - To update any of the .yml files use: nano <filname.yml> 
 - TO run a playbook use: ansible-playbook <file.yml>
