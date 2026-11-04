variable "project" {
    default = "roboshop"
    type = string
}

variable "environment" {
    default = "dev"
    type = string
}

variable "eks_version" {
    default = "1.32"
}

variable "enable_blue" {
    default = true
}

variable "eks_nodegroup_blue_version" {
    default = "1.32"
}