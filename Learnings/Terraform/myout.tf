output "vpc_id" {
    value = aws_vpc.myvpc.id
}


output "instance_public_ip" {
    value = aws_instance.myinstance[*].public_ip
}
