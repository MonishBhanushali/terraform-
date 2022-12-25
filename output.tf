output "pub_ipadrr" {
  value = [aws_instance.public.*.public_ip]
}