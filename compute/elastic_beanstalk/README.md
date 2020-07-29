# ElasticBeanstalk

## File Structure

```
/top_level
	application.py  # may need this to be called this
	requirements.txt
```

### Non-WSGI application.py structure

```python
# application.py
application = app.server

if __name__ == '__main__':
  application.run()
```


## Environment Creation

**AWS:** `services/compute/elasticbeanstalk`

### Steps

#### Create New Application

* 1. Create New Application
* 2. Create new environment
  * Select: web server environment

#### Base configuration

* Platform:
  * python
* application code:
  * upload you code
    * --> zip up like for lambda
* **create environment**

#### After launch

On left side, go to 'Configuration'

* Software:
  * modify
    * --> WSGIPath
    * (tried with no '/'leading)

### Capacity

#### Change EC2

* Config
  * Capacity
