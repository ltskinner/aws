# Security Best Practices

## .pem keys

**DO NOT** share keys - each user should have their own key

### Local Only Workflow

* 1) Launch PuTTYGen
* 2) Generate new key
* 3) `Save private key`
* 4) [Convert to OpenSSH](https://aws.amazon.com/premiumsupport/knowledge-center/convert-pem-file-into-ppk/) `.pem` file
* 5) (optional) Can save **public key**, but not really necessary since you can always see when a .ppk or .pem is loaded in
* 6) Add **public key** to servers `~/.ssh/authorized_keys`

### AWS Workflow

1. [Creating a new pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#prepare-key-pair)
2. [Creating ppk key](https://stackoverflow.com/questions/3190667/convert-pem-to-ppk-file-format)

   Be sure to create a Private key for you locally  

   As well as a public key to add to the Server (if on linux, [use this](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#retrieving-the-public-key))  

3. [Adding new pair to EC2 instance](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#replacing-key-pair)

   `~/.ssh/authorized_keys` [file format](https://wiki.mcs.anl.gov/IT/index.php/SSH_Keys:authorized_keys)

## Passwords

Options:

* [ ] Stored as `.config` files [not under source control](https://stackoverflow.com/questions/2397822/what-is-the-best-practice-for-dealing-with-passwords-in-git-repositories)
* [ ] Stored as `ENV` variables
  * Pros: easy to swap between dev/test/prod environments
  * Cons: literally `print(os.environ)`
* [ ] AWS Secrets manager
  * Pros: all creds stored centrally
  * Cons: still need a credential to access the other credentials lmao
