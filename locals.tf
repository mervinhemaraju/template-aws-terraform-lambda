locals {
  tags = {
    project       = "https://github.com/{ORG}/{REPO}"
    owner         = "it-platform"
    team          = "it-platform"
    product       = ""
    product-group = "IT Platform"
  }

  constants = {

    lambda = {
      SOURCE_PATH          = "./function/"
      TRACING_MODE         = "Active"
      RCE                  = 10
      RETRIES_ATTEMPT      = 0
      TIMEOUT              = "120"
      HANDLER              = "main.main"
      VERSION              = "python3.9"
      MEMORY_SIZE          = 128
      CLOUDWATCH_RETENTION = 7
      TRUSTED_ENTITIES = [
        {
          type = "Service",
          identifiers = [
            "lambda.amazonaws.com"
          ]
        }
      ]
    }
  }

}
