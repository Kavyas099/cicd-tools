

variable "instances" {
  default = {
    jenkins-master = "jenkins.sh"
    jenkins-agent  = "jenkins-agent.sh"
  }
}

variable "zone_id" {
  default =  "Z04757596NZDGVB9VM0A"

}

variable "domain_name" {
    default = "koti.lat"
}
  