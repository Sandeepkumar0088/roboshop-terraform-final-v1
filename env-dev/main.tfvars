env                     = "dev"
ami                     = "ami-09c813fb71547fc4f"
#instance_type          = "t3.micro"
#vpc_security_group_ids = [ "sg-039df2e97e51ebc17" ]
zone_id                 = "Z09354891N46GVLJSDZH0"
components    = {
    frontend  = { ports = { ssh = 22, frontend = 80 }
         instance_type  = "t3.micro"
    }
    mongodb   = { ports = { ssh = 22, mongodb = 27017 }
         instance_type  = "t3.micro"
    }
    catalogue = { ports = { ssh = 22, app = 8080 }
         instance_type  = "t3.micro"
    }
    redis     = { ports = { ssh = 22, redis = 6379 }
         instance_type  = "t3.micro"
    }
    user      = { ports = { ssh = 22, app = 8080 }
         instance_type  = "t3.micro"
    }
    cart      = { ports = { ssh = 22, app = 8080 }
         instance_type  = "t3.micro"
    }
    mysql     = { ports = { ssh = 22, mysql = 3306 }
         instance_type  = "t3.micro"
    }
    shipping  = { ports = { ssh = 22, app = 8080 }
         instance_type  = "t3.micro"
    }
    rabbitmq  = { ports = { ssh = 22, rabbitmq = 5672 }
         instance_type  = "t3.micro"
    }
    payment   = { ports = { ssh = 22, app = 8080 }
         instance_type  = "t3.micro"
    }
    dispatch  = { ports = { ssh = 22, app = 8080 }
         instance_type  = "t3.micro"
    }
}