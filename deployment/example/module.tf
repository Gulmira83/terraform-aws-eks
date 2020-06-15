module "cluster-eks" {
  source = "../../"
  vpc_id = ""
  subnet_ids = ["subnet-", "subnet-"]
  region = "us-east-1"
  ssh_key_location = "${file("~/.ssh/id_rsa.pub")}"
  cluster_name = ""
  cluster_version = "1.15"
  instance_type = ""
  asg_desired_capacity = "2"
  asg_min_size = "2"
  asg_max_size = "5"
  #s3_bucket = ""
  #security_group_ids = ["sg-0df6c36b0593ec3a5"]
}