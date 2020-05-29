# AWS - Virtual Private Cloud (VPC)

## Creating a VPC

Tutorial: [https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_Tutorials.WebServerDB.CreateVPC.html)

## Subnets

### Public Subnets

A Subnet **with** a routing table that has routes to an Internet Gateway (IGW)

#### Routing table info

Subnet route table to IGW:

* IPv4: `0.0.0.0/0`
* IPv6: `::/0`

### Private Subnets

A Subnet with**out** a routing table that contains routes to an IGW

### Routing tables

* select subnet
* click routing tab
* routing table is above the actual table:
  * **Routing Table:** `rtb-XXXXXXXXXXXXXX`

## NAT Gateway vs NAT Instance

Main Point: NAT Instance can be used as `Bastion Server`

[https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html](https://docs.aws.amazon.com/vpc/latest/userguide/vpc-nat-comparison.html)

## NAT vs IGW

[https://medium.com/awesome-cloud/aws-vpc-difference-between-internet-gateway-and-nat-gateway-c9177e710af6](https://medium.com/awesome-cloud/aws-vpc-difference-between-internet-gateway-and-nat-gateway-c9177e710af6)

* IGW: lets instances with public IPs access the internet
* NAT: lets private instances access the internet
  * this is more for like updating software and whatnot

## Security Groups

Find your IP: [https://checkip.amazonaws.com/](https://checkip.amazonaws.com/)

## Elastic IP

Need this to actually connect to public subnet

[https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html#d0e22943](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Internet_Gateway.html#d0e22943)
