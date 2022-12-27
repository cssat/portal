# portal
Data Portal Redux De Novo

...To be continued


## Organizational Prereqs

1. Create an AWS account

2. Create a user group titled `docker-ecs-integration-group` and attach [`docker-ecs-integration-policy`](common-resources/aws/docker-ecs-integration-policy.json) to the user group. 

## Developer Prereqs

### Docker Setup

1. Download and install Docker Desktop. If you are working from a Mac, this should install `docker compose` as well, which is a cornerstone of the portal *redux de novo*. 

2. Update your daemon configuration file which should be located at `$HOME/.docker/daemon.json`. Make sure you have a DNS entry as shown below: 

```{json}
{
  "builder": {
    "gc": {
      "defaultKeepStorage": "20GB",
      "enabled": true
    }
  },
  "dns": [
    "172.20.0.3",
    "8.8.8.8",
    "8.8.4.4"
  ],
  "experimental": false,
  "features": {
    "buildkit": true
  }
}
```

This is necessary because the DNS inside the docker container was using a DNS server that wouldn't do the work of turning RDS endpoints into private ips, which is necessary in order for the PDO utility in PHP to connect to the database. This entry in the daemon file points Docker to Google's DNS servers to address this. AWS' use of private DNS servers on the Amazon VPC is described [here](https://blog.thestateofme.com/2015/09/01/forwarding-dns-queries-to-aws-vpc-resolvers/).

### Local Machine Setup

Make sure that the following two lines are added to your `/etc/hosts` file. 

```{bash}
127.0.0.1 viz.portal.cssat.org
127.0.0.1 portal.cssat.org
```

To avoid setting our own DNS server, we add these entries which your machine will check first, before contacting its DNS server. Since local host will find a domain listing here, it won't contact a DNS server and we can browse the portal locally using a production domain. 


### AWS Setup

1. Have an authorized member of the portal team create an IAM user account. This account should be added to the `docker-ecs-integration-group` user group and should be configured for programmatic access, such that the user is provided with an Access key ID and a Secret access key ID. 

2. Download the [AWS CLI](https://aws.amazon.com/cli/) and follow the installation procedures for your personal machine. 

3. Configure the AWS CLI by running `aws configure` from your local terminal. The Access key ID and Secret access key ID prompts should be filled with the values you were provided in step 1. The region and output fields should be set as shown in the following code chunk. 

```{sh}
$ aws configure
AWS Access Key ID [None]: MyValueFromStep1
AWS Secret Access Key [None]: MyValueFromStep1
Default region name [None]: us-west-2
Default output format [None]: json
```

...To be continued

