# IAM - Identity and Access Management

[User Guide](https://docs.aws.amazon.com/IAM/latest/UserGuide/id.html)

## Users

These are the core unit of a 'thing' that is allowed to do things on AWS

* People
* Applications

## Groups

These are tools to organize users, the primary benefit being attaching rules (policies) at the group level which applies to every user inside it

## Policies

These are the actual **rules** that dictate what you can and cannot do

## Roles (not to be assumed with rules)

These are similar to users, but dont have any credentials (password or keys)

These are meant to be used by any number of Users to perform a specific task

* One use case is a **federated user** who signs in using an external identity provider, is then granted a **role** to do tasks for which the authed user is allowed
