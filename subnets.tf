resource "aws_subnet" "public-a" {
  vpc_id		= "${aws_vpc.docker-vpc.id}"
  cidr_block 		= "10.69.1.0/24"
  availability_zone	= "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_subnet" "public-b" {
  vpc_id 		= "${aws_vpc.docker-vpc.id}"
  cidr_block 		= "10.69.2.0/24"
  availability_zone 	= "us-east-1b"
  map_public_ip_on_launch = true
}
