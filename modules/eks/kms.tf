resource "aws_kms_key" "eks" {
  description             = var.aws_kms_key.description
  deletion_window_in_days = var.aws_kms_key.deletion_window_in_days
  enable_key_rotation     = var.aws_kms_key.enable_key_rotation
  tags                    = var.aws_kms_key.tags
}
