# Configuring SSH

* 0) Create ACM cert and apply CNAME to DNS

https://docs.aws.amazon.com/acm/latest/userguide/gs-acm-request-public.html

* 1) Modify to be load balanced
https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features-managing-env-types.html#using-features.managing.changetype

* 2) Find IPs of load balancer

	* https://aws.amazon.com/premiumsupport/knowledge-center/elb-find-load-balancer-IP/

To see environment LB is assigned to
-> click load balancer instance
-> go to 'Instances' tab


* 3) Configure HTTPS Termination at Load Balancer

https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-elb.html

**Dont forget to hit apply**

* 3.1) Add .ebextension file for Classic Load Balancer
	--> .ebextensions/securelistener-clb.config
	--> grab arn from ACM

	JUST THIS ONE

	DO NOT CONFIGURE SECURITY GROUP
	

* 4) Force http upgrade to https:
https://stackoverflow.com/questions/21878024/configure-apache-on-elastic-beanstalk

second answer with the file config
