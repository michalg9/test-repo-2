
resource "random_password" "password" {
  length           = 15
  special          = true
  override_special = "_%@"
}

resource "random_password" "password2" {
  length           = 22
  special          = true
  override_special = "_%@"
}


module "pet-module" {
  source  = "spacelift.io/michalg9/pet-module/default"
  version = "0.1.2"
}

data "template_file" "index" {
  template = <<EOF
  <html>
<head>
    <title>
        You made it with Spacelift!
    </title>
</head>

<body>
        <h1>Just generated a new env named after a pet: ${module.pet-module.pet_name}</h1>

        <img alt="hello" src="https://cataas.com/cat/says/Hello%20from%20${module.pet-module.pet_name}" /> 
</body>

</html>
EOF
}
