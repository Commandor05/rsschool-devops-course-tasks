resource "aws_iam_role" "GithubActionsRole" {
    name = "GithubActionsRole"
    managed_policy_arns = [
        "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
        "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
        "arn:aws:iam::aws:policy/AmazonS3FullAccess",
        "arn:aws:iam::aws:policy/IAMFullAccess",
        "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
        "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
        "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess"
    ]
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
            Effect = "Allow"
            Principal = {
              Federated = "arn:aws:iam::166023593358:oidc-provider/token.actions.githubusercontent.com"
            }
            Action = "sts:AssumeRole"
            Condition = {
                StringEquals = {
                    "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
                },
                StringLike = {    
                    "token.actions.githubusercontent.com:sub": "repo:Commandor05/rsschool-devops-course-tasks:*"
                }
            }
        }
    ]
  })
}
