variable "VERSION" {
  default = "main"
}

variable "FIXID" {
  default = "2"
}

group "default" {
  targets = ["jenkins-githubaction"]
}

target "jenkins-githubaction" {
    labels = {
        "cloud.opsbox.author" = "seanly"
        "cloud.opsbox.image.name" = "jenkins-githubaction"
        "cloud.opsbox.image.version" = "${VERSION}"
        "cloud.opsbox.image.fixid" = "${FIXID}"
    }
    dockerfile = "Dockerfile"
    context  = "./"
    platforms = ["linux/amd64", "linux/arm64"]
    tags = ["seanly/toolset:jenkins-githubaction-${VERSION}-${FIXID}"]
    output = ["type=image,push=true"]
}
