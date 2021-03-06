# variable "aws-ssh-key" {}

resource "null_resource" "ansible-docker" {

  depends_on = [aws_instance.ec2-master, null_resource.ansible-provision]

  provisioner "local-exec" {
    command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key '${aws_key_pair.admin_key.key_name}' -i ansible/inventories/test ansible/roles/docker/tasks/main.yml"
  }
}