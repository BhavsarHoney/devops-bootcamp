#public subnet tags for EKS LOAD BALANCER
resource "aws_ec2_tag" "eks_public_subnet_tags" {
  resource_id = data.terraform_remote_state.vpc.outputs.public_subnet_ids[0]
  key         = "kubernetes.io/role/elb"
  value       = "1"
}

#private subnet tags for EKS worker nodes
resource "aws_ec2_tag" "eks_private_subnet_tags" {
  resource_id = data.terraform_remote_state.vpc.outputs.private_subnet_ids[0]
  key         = "kubernetes.io/role/internal-elb"
  value       = "1"
}