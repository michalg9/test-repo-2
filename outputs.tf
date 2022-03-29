output "generated_pet_name" {
    value = module.pet-module.pet_name
}

output "url" {
  value = aws_s3_bucket.website_bucket.website_endpoint
}


