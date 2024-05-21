variable "REGION_AWS" {
  #Dependera de la región de dónde estén tus usuarios 
  default = "us-east-1"
}

variable "AV_ZONE" {
  default = "us-east-1a"
}

variable "INSTA_TYPE" {
  default = "t2.micro"
}

variable "AMI_SELECT" {
  default = "ami-0453898e98046c639"
}

variable "SIZE_DISK" {
  default = "4"
} 