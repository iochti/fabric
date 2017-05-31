# fabric

iochti Kubernetes deployment on AWS using Terraform and kops

## Before creating the kubernetes cluster

To create the cluster kops, needs to have these things:
  1. A S3 bucket which will store kops state configs
  2. An IAM user called `kops` who has rights to manage S3, Route53, EC2s, IAMs, VPCs
  3. A domain name hosted (or not) on Route53 (see [this tutorial](https://github.com/kubernetes/kops/blob/master/docs/aws.md#configure-dns) for DNS configuration)

If you dont have any of these, use the terraform commands to creates 1 and 2 :
```shell
 terraform apply -var 'domain-name=YOUR_DOMAIN_HERE'
```

To use this tf configuration you'll need to create a base64 encoded pgp key file in `keys` directory with the following command

```shell
gpg --export "YOUR_GPG_USER" | base64 >> keys/gpg_base64
```

Finally, after the terraform script finished, add kops credentials to your aws config :
```shell
# Get the access/secret keys, copy them somewhere
terraform output user_accesskey_id
terraform output user_accesskey_secret_encoded | base64 --decode | keybase pgp decrypt

aws configure --profile kops

# Export access/secret keys
export AWS_ACCESS_KEY_ID=<access key>
export AWS_SECRET_ACCESS_KEY=<secret key>
```

## Create the cluster

To create the kubernetes cluster, just run `bin/kops-create-cluster.sh` and it will launch a **t2.micro** sized kubernetes cluster in **eu-west-1** region.
