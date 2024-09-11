

resource "aws_amplify_app" "app" {
  name       = var.app_name
  repository = var.source_repository

  # Auto Branch

  enable_auto_branch_creation   = var.enable_auto_branch_creation
  enable_branch_auto_deletion   = var.enable_auto_branch_deletion
  auto_branch_creation_patterns = var.auto_branch_creation_patterns // default is just main
  auto_branch_creation_config {
    enable_auto_build           = var.enable_auto_build
    enable_pull_request_preview = var.enable_amplify_app_pr_preview
    enable_performance_mode     = var.enable_performance_mode
    framework                   = var.framework
  }

  # OPTIONAL - Necessary if not using oauth_token or access_token (used for GitLab and GitHub repos)
  access_token = var.github_access_token

  build_spec = var.path_to_build_spec != null ? file("${path.root}/${var.path_to_build_spec}") : file("${path.root}/../amplify.yml")

  # build_spec = file("${path.root}/../amplify.yml")
  # Redirects for Single Page Web Apps (SPA)
  # https://docs.aws.amazon.com/amplify/latest/userguide/redirects.html#redirects-for-single-page-web-apps-spa

  custom_rule {
    source = "</^[^.]+$|\\.(?!(css|gif|ico|jpg|js|png|txt|svg|woff|ttf|map|json)$)([^.]+$)/>"
    status = "200"
    target = "/index.html"
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.app.id
  branch_name = "main"

  framework =  var.framework
  stage     = "PRODUCTION"

  environment_variables = {
    REACT_APP_API_SERVER = "https://api.example.com",
    Username = "test_user"
  }
}

resource "aws_amplify_domain_association" "app-domain" {
  app_id      = aws_amplify_app.app.id
  domain_name = "carspace.co.nz"
  wait_for_verification = false

  # https://example.com
  sub_domain {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = ""
  }

  # https://www.example.com
  sub_domain {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = "www"
  }
}