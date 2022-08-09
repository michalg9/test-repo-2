
resource "random_password" "password" {
  length           = 20
  special          = true
  override_special = "_%@"
}


module "pet-module" {
  source  = "spacelift.io/michalg9/pet-module/default"
  version = "0.1.2"
}

module "pet-module2" {
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
        <h2>Now I want two cats: ${module.pet-module.pet_name} and ${module.pet-module2.pet_name}</h2>

        <img alt="hello" src="https://cataas.com/cat/says/Hello%20from%20${module.pet-module.pet_name}" /> 
        <img alt="hello" src="https://cataas.com/cat/says/Hello%20from%20${module.pet-module2.pet_name}" /> 
</body>

</html>
EOF
}
