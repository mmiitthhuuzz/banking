resource "aws_instance" "test" {
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
  provisioner "remote-exec" {
    inline = [ "echo 'wait to start instance' "]
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
