variable "reg" {
  type    = string
  default = "ap-south-1"
}

variable inst_type {
   type = list
   default = [ "t2.nano", "t2.micro", "t2.medium" ]
}


variable "name" {
   type = list 
   default = [ "web_inst", "dev_inst", "prod_inst" ] 
}
