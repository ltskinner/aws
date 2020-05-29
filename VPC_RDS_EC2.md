# Creating a Postgres DB with RDS inside a VPC and accessing it via an EC2 bastion

## Main components

### VPC

* Virtual Pivate Cloud that contains the RDS DB
* Internet Gateway
* Elastic IP
* NAT Instance
* Public Subnet
* Private Subnet 1
* Private Subnet 2

### RDS

* Postgres server on Private Subnet

### EC2

Not sure if need stand alone bastion anymore - may just need the instance with the IGW on it

## VPC Setup

Tutorial: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html)

## DB Setup

Tutorial: [https://chartio.com/learn/postgresql/create-a-user-with-pgadmin/](https://chartio.com/learn/postgresql/create-a-user-with-pgadmin/)
