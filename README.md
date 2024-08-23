# terraform# Terraform-b2

# Setup
Local & Remote

# Installation
Terraform installation on Ubuntu Linux

# VS-Code
Extention
1. Harshicop Terraform
2. Terraform
3. AutoGit 

# Data Types
1. string = "jarvis"  "tony"  "spider123"
    note: string always being in  double quote
2. Number = 1325 4568
3. List = [apple, banana]
4. boolean = true false 0 1
5. Map/dictonary = omkar {Edcution = BE, City = Pune, Mobno = +915316565}


# terraform symbolic identification
+ --> resorce add
- --> resouece destroy
~ --> resource change


# Block Behavior:
1. Block Type
2. Block Name
3. Reference name of Block
4. Bock Configuration

# Block type
1. Provider
2. Terraform ###
3. Data Block ###
4. Resource (Ubuntu Serevr - aws_instance)
5. Output Block

####################################################################################
 # Terraform Registry
 resource: aws_instance

 # Examples:
 1. Basic example using AMI lookup
 2. Spot instance example
 3. Network and credit specification example
 4. CPU options example (Argumetns)

 Note: Host resource group or Licence Manager registered AMI example
 Example:
    1. Host resource group or Licence Manager registered AMI example

# Host resource group or Licence Manager registered AMI example

A host resource group is a collection of Dedicated Hosts that you can manage as a single entity. As you launch instances, License Manager allocates the hosts and launches instances on them based on the settings that you configured. You can add existing Dedicated Hosts to a host resource group and take advantage of automated host management through License Manager.

NOTE:
A dedicated host is automatically associated with a License Manager host resource group if Allocate hosts automatically is enabled. Otherwise, use the host_resource_group_arn argument to explicitly associate the instance with the host resource group.


# Tag Guide: 
1. five types tags we can apply in aws_instance
2. Tags always mention in between block configuraiton. (Block Type: aws_instance)

Do not use: Outside Tag


# argument Reference:
Block Configuration = value (Data Types)
###############################################################################################################################

# Standard way to handle the Terraform Code with backend & state-locking

```shell
mkdir ec2
main.tf
variable.tf
data.auto_var.autotf
output.tf
```
###############################################################################################################################

# Generic way to handle the Terraform Code with backend & state-locking:




















