# - Amplify -
variable "app_name" {
  type        = string
  default     = "React Snap App"
  description = "The name of the Amplify Application"
}
variable "path_to_build_spec" {
  type        = string
  default     = null
  description = "The path to the location of your build_spec file. Use if 'build_spec' is not defined."

}
variable "source_repository" {
  type        = string
  default     = "https://github.com/prithvirajsinghsolanki/react-testapp"
  description = "The git repository URL from Github, Gitlab or Bitbucket Ex. https://github.com/example/app."

}
## https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-fine-grained-personal-access-token
variable "github_access_token" {
  type        = string
  default     = ""
  description = "Optional GitHub access token. Only required if using GitHub repo. specify Classic token"

}
variable "build_spec" {
  type        = string
  default     = null
  description = "The actual content of your build_spec. Use if 'path_to_build_spec' is not defined."
}
variable "enable_auto_branch_creation" {
  type        = bool
  default     = false
  description = "Enables automated branch creation for the Amplify app"

}
variable "enable_auto_branch_deletion" {
  type        = bool
  default     = true
  description = "Automatically disconnects a branch in the Amplify Console when you delete a branch from your Git repository"

}
variable "auto_branch_creation_patterns" {
  type        = list(any)
  default     = ["main", "dev","master","staging","production" ]
  description = "Automated branch creation glob patterns for the Amplify app. Ex. feat*/*"

}
variable "enable_auto_build" {
  type        = bool
  default     = true
  description = "Enables auto-building of autocreated branches for the Amplify App."

}
variable "enable_amplify_app_pr_preview" {
  type        = bool
  default     = false
  description = "Enables pull request previews for the autocreated branch"

}
variable "enable_performance_mode" {
  type        = bool
  default     = false
  description = "Enables performance mode for the branch. This keeps cache at Edge Locations for up to 10min after changes"
}
variable "framework" {
  type        = string
  default     = "React"
  description = "Framework for the autocreated branch"
}
variable "amplify_app_domain_name" {
  type        = string
  default     = "example.com"
  description = "The name of your domain. Ex. example.com"
}

