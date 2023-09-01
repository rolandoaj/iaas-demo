resource "aws_ebs_volume" "datalog" {
  availability_zone = var.AV_ZONE
  size              = var.SIZE_DISK
  tags = {
    Name = "datalog"
  }
}

resource "aws_ebs_volume" "datacode" {
  availability_zone = var.AV_ZONE
  size              = var.SIZE_DISK
  tags = {
    Name = "datacode"
  }
}

resource "aws_volume_attachment" "datafs-log" {
  device_name = "/dev/sdc"
  volume_id   = aws_ebs_volume.datalog.id
  instance_id = aws_instance.apache-server.id
}

resource "aws_volume_attachment" "datafs-code" {
  device_name = "/dev/sdd"
  volume_id   = aws_ebs_volume.datacode.id
  instance_id = aws_instance.apache-server.id
} 