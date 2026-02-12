variable "zone" {
   type        = string
  default     = "koti.lat "
  description = "description"
}



variable "instances" {
  default = {
    jenkins-master = "jenkins.sh"
    jenkins-agent  = "jenkins-agent.sh"
  }
}