# CyberSecurity-Projects-2021
This document contains the following details:
•  Description of the Topology (See network Diagram)
•  Access Policies
•  ELK Configuration
•  Beats in Use
•  Machines Being Monitored
•  How to Use the Ansible Build
Description of the Topology
The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.
Load balancing ensures that the application will be highly available, in addition to restricting access to the network. Load balancers help ensure environment availability through distribution of incoming data to web servers. Jump boxes allow for more easy administration of multiple systems and provide an additional layer between the outside and internal assets.
Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the event logs and system metrics.
•  Filbeats watch for log directories or specific log files.
•  Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server.
The configuration details of each machine may be found below.
Name	Function	IP Address	Operating System

Access Policies
The machines on the internal network are not exposed to the public Internet.
Only the jump box provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
-Personal IP address
Machines within the network can only be accessed by the Jump Box. The Elk Machine can have access from personal IP address through port 5601.
A summary of the access policies in place can be found in the table below.
Name	      Publicly Accessible	                     Allowed IP Addresses
Jump Box	    Yes 40.17.90.118	            Limited to Personal PC by Security Group rules
Load Balancer	Yes	52.170.33.164             Open but ports are closed by security group rules
Web 1        	No	10.0.0.8                  Private address within network
Web 2	        No	10.0.0.9                  Private address within network
Web 3	        No	10.0.0.11                 Private address within network
ELK Server	  No  10.1.0.4                  Private address within network

Elk Configuration
Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because servcies running can be limited, system installation and update can be streamlined, and processes become more replicable.

The playbook implements the following tasks:
•  installs docker.io, pip3, and the docker module.
#Use apt module- name: Install docker.io apt: update_cache: yes name: docker.io state: present #Use apt module- name: Install pip3 apt: force_apt_get: yes name: python3-pip state: present #Use pip module- name: Install Docker python module pip: name: docker state: present
•  increases the virtual memory (for the virtual machine we will use to run the ELK server)
#Use command module- name: Increase virtual memory command: sysctl -w vm.max_map_count=262144
•  uses sysctl module
#Use sysctl module- name: Use more memory sysctl: name: vm.max_map_count value: "262144"state: present reload: yes
•  downloads and launches the docker container for elk server
#Use docker_container module- name: download and launch a docker elk container docker_container: name: elk image: sebp/elk:761 state: started restart_policy: always published_ports: - 5601:5601 - 9200:9200 - 5044:5044
The following screenshot displays the result of running docker ps after successfully configuring the ELK instance.

Target Machines & Beats
This ELK server is configured to monitor the following machines:
•  Web 1 (10.0.0.8)
•  Web 2 (10.0.0.9)
•  Web 3 (10.0.0.11)
We have installed the following Beats on these machines:
•  FileBeat
•  Metric Beat
These Beats allow us to collect the following information from each machine:
•  Filebeat is a log data shipper for local files. Installed as an agent on your servers, Filebeat monitors the log directories or specific log files, tails the files, and forwards them either to Elasticsearch or Logstash for indexing. An examle of such are the logs produced from the MySQL database supporting our application.
•  Metricbeat collects metrics and statistics on the system. An example of such is cpu usage, which can be used to monitor the system health.
Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned:
SSH into the control node and follow the steps below:
•  Copy the configuration file from your Ansible container to your Web VM's
•  Update the /etc/ansible/hosts file to include the IP address of the Elk Server VM and webservers.
•  Run the playbook, and navigate to http://[Elk_VM_Public_IP]:5601/app/kibana to check that the installation worked as expected.

Name	               Function	         IP Address	     Operating System
Jump_Box_Provisionor	Gateway/Anisible 	10.0.0.4	     Linux (Ubuntu)
Web 1	Server	        Web Sever         40.17.90.118   Linux (Ubuntu)
Web 2	Server	        Web Sever         10.0.0.8	     Linux (Ubuntu)
ELK Server	          Log Server	      10.1.0.4	     Linux (Ubuntu)
Load Balancer	        Load balancer     52.170.33.164

