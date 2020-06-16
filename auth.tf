# Pulls data from cluster in oreder to authenticate to it using token
# In order to run authentication and cluster at the same time depends on 
# has to be added, otherwise it might not find eks

data "aws_eks_cluster" "eks_master" {
  name = "${var.cluster_name}"

    depends_on = [
    "aws_eks_cluster.eks_master"
  ]
}

data "aws_eks_cluster_auth" "eks_master" {
  name = "${var.cluster_name}"
}


# load config file should be changed from false to true
provider "kubernetes" {
  host                   = "${data.aws_eks_cluster.eks_master.endpoint}"
  cluster_ca_certificate = "${base64decode(data.aws_eks_cluster.eks_master.certificate_authority.0.data)}"
  token                  = "${data.aws_eks_cluster_auth.eks_master.token}"
  load_config_file       = true
} 

