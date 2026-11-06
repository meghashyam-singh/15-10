variable "project" {
    default = "roboshop"
    type = string
}

variable "environment" {
    default = "dev"
    type = string
}

variable "eks_version" {
    default = "1.33"
}

variable "enable_blue" {
    default = true
}

variable "enable_green" {
    default = true
}

variable "eks_nodegroup_blue_version" {
    default = "1.32"
}

variable "eks_nodegroup_green_version" {
    default = "1.33"
}