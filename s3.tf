
resource "aws_s3_bucket" "website_bucket" {
  bucket = "michal-test-${module.pet-module.pet_name}"

  force_destroy = true
}

resource "aws_s3_bucket_object" "object" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  content = data.template_file.index.rendered
  content_type = "text/html"
}
