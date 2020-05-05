resource "aws_iam_role_policy" "ec2_policy" {
  name = "ec2_policy"
  role = "${aws_iam_role.docker_role.id}"

policy = "${file("ec2-policy.json")}"
}

resource "aws_iam_role" "docker_role" {
  name = "docker_role"

  assume_role_policy = "${file("iam-assume-role.json")}"
}  

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "ec2_profile"
  role = "${aws_iam_role.docker_role.name}"
}
