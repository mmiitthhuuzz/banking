resource "aws_instance" "test-server" {
  ami           = "ami-0c768662cc797cd75" 
  instance_type = "t2.micro" 
  key_name = "Keypair"
  vpc_security_group_ids= ["sg-02fc4c018bef41d79"]
  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = file("./Keypair.pem")
    host     = self.public_ip
  }
  provisioner "local-exec" {
    command = "sleep 60 && echo 'Instance ready'"
  }
  tags = {
    Name = "test-server"
  }
  provisioner "local-exec" {
        command = " echo ${aws_instance.test-server.public_ip} > inventory "
  }
   provisioner "local-exec" {
  command = "ansible-playbook /var/lib/jenkins/workspace/banking/test-server/finance-playbook.yml "
  } 
}
