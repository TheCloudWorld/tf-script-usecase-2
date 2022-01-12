provider "aws" {
  region = "us-east-1"
}
module "codepipeline" {
  source                        = "../terraform-codepipeline"
  codebuild_project_name        = module.codebuild.codebuild_project_name
  codedeploy_app_and_group_name = module.codedeploy.codedeploy_app_name
}
module "codebuild" {
  source                 = "../terraform-codebuild"
  codebuild_project_name = var.codebuild_project_name
}
module "codedeploy" {
  source                        = "../terraform-codedeploy"
  codedeploy_app_and_group_name = var.codedeploy_app_and_group_name
}
variable "codebuild_project_name" {
  default = "codebuild"
}
variable "codedeploy_app_and_group_name" {
  default = "codedeploy"
}
output "codedeploy_app_name" {
  value = module.codedeploy.codedeploy_app_name
}
output "codebuild_project_name" {
  value = module.codebuild.codebuild_project_name
}