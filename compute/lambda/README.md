# Lambda notes

## Event Expressions

[rule and cron on AWS](https://docs.aws.amazon.com/lambda/latest/dg/services-cloudwatchevents-expressions.html)

* rule()
* cron()
  * [Useful but only has 5 params](https://crontab.guru/), and AWS requires 6 + ?

## cron

`cron(Minutes Hours Day-of-month Month Day-of-week Year)`

* One of the day-of-month or day-of-week values must be a question mark (?).

Ex: 10:15 AM (UTC) every day - `cron(15 10 * * ? *)`

## Dependency installation

* `-t ./` option
  * `-t` is short for `--target` which is the directory to download and install packages too
  * `./` is the current directory

```bash
pip install -t ./ -r requirements.txt
```

## packaging:

https://docs.aws.amazon.com/lambda/latest/dg/python-package.html