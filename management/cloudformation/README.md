# AWS CloudFormation

[Dynamic references for Secrets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/dynamic-references.html)

## Parameters

Ok, these are sick - these are how you make generic templates that can be configured per instantiation ([reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html))

* After creating a new stack and specifying the instance, youll have the option to set them

```yaml
Parameters: 
  InstanceTypeParameter: 
    Type: String
    Default: t2.micro
    AllowedValues: 
      - t2.micro
      - m1.small
      - m1.large
    Description: Enter t2.micro, m1.small, or m1.large. Default is t2.micro.
Resources: 
  Instance: 
    Type: 'AWS::EC2::Instance'
    Properties: 
      InstanceType: !Ref InstanceTypeParameter
```

## Lambda

* [Dank end to end solution from AWS CF Templates](https://github.com/awslabs/aws-cloudformation-templates/blob/master/community/services/Lambda/LambdaSample.yaml)
* [Lambda Config](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-lambda-function.html)
  * [Environment Variable Config](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-lambda-function-environment.html)

### Events

Need to set a `AWS::Lambda::Permission` to allow a service (external to lambda) or another account trigger the function ([reference](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-events-rule.html))

#### Expressions

* rate()
* [cron()]([reference](https://docs.aws.amazon.com/lambda/latest/dg/services-cloudwatchevents-expressions.html))

```yaml
ScheduledRule: 
  Type: 'AWS::Events::Rule'
  Properties: 
    Description: 'ScheduledRule'
    ScheduleExpression: 'cron(0 7 * * ? *)'
    State: 'ENABLED'
    Targets: 
      - 
        Arn: 
          Fn::GetAtt: 
            - 'LambdaFunctionSectionNameInResources'
            - 'Arn'
        Id: 'TargetFunctionV1NAMEDOESNTMATTER'
PermissionForEventsToInvokeLambda: 
  Type: 'AWS::Lambda::Permission'
  Properties: 
    FunctionName: !Ref LambdaFunctionName
    Action: 'lambda:InvokeFunction'
    Principal: 'events.amazonaws.com'
    SourceArn: 
      Fn::GetAtt: 
        - 'ScheduledRule'
        - 'Arn'
```

### Execution Role

* [Full Example](https://github.com/awslabs/aws-cloudformation-templates/blob/master/community/services/Lambda/LambdaSample.yaml#L37)
* [Documentation Example](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-resource-iam-role.html#aws-resource-iam-role--examples)

```yaml
  IAMLambdaExecutionRole:
    Type: AWS::IAM::Role
    Properties: 
      AssumeRolePolicyDocument:
        Version: 2012-10-17
        Statement:
          - Effect: Allow
            Principal:
              Service:
              - lambda.amazonaws.com
            Action:
              - 'sts:AssumeRole'
      Description: 'Basic execution role for Lambda'
      #RoleName: ''  # AWS will generate one for you
      ManagedPolicyArns: 
        - 'arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole'
```

### Caveats

* Cannot declare test cases in CF templates
  * [Something about tests being in cookies?](https://www.reddit.com/r/aws/comments/965ete/how_to_describe_aws_lambda_function_test_events/)
