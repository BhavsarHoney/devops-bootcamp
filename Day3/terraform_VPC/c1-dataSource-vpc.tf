data "aws_vpc" "example" {
  id = "vpc-02358ddc1cb955bcd"
}

data "aws_internet_gateway" "bootcamp" {
  # id = "igw-095a43d99a5ec72d6"
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.example.id]
  } 
}

data "aws_nat_gateway" "bootcamp" {
  id = "nat-054be5efc41467fef"
}