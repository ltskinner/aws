# Deep Learning on EC2

[https://aws.amazon.com/blogs/machine-learning/get-started-with-deep-learning-using-the-aws-deep-learning-ami/
](https://aws.amazon.com/blogs/machine-learning/get-started-with-deep-learning-using-the-aws-deep-learning-ami/
)

## Startup Commands

```bash
> ec2-user
> source activate python3

> pip install torch tensorboard
> pip install transformers
```

## Other Useful Commands

```bash
# show disk:
> df -h

# watch
> watch -d nvidia-smi

# clear gpu memory:
> nvidia-smi
> nvidia-smi | grep 'python' | awk '{ print $3 }' | xargs -n1 kill -9
```

## Info

### Write Access

> `/dev/shm/`
