resource "google_dialogflow_cx_intent" "default_welcome_intent" {
  #parent       = var.parent
  display_name = "Default Welcome Intent"
  priority     = 500000
  description  = "Phrases for welcoming user."
  training_phrases {
     parts {
         text = "just going to say hi"
     }
     parts {
         text = "heya"
     }
     parts {
         text = "hello hi"
     }
     parts {
         text = "howdy"
     }
     parts {
         text = "hey there"
     }
     parts {
         text = "hi there"
     }
     parts {
         text = "greetings"
     }
     parts {
         text = "hey"
     }     
     parts {
         text = "long time no see"
     }
     parts {
         text = "hello"
     }
     parts {
         text = "lovely day isn't it"
     }
     parts {
         text = "I greet you"
     }
     parts {
         text = "hello again"
     }
     parts {
         text = "hi"
     }
     parts {
         text = "hello there"
     }
     parts {
         text = "a good day"
     }
     repeat_count = 1
  }

  #parameters {
  #  id          = "param1"
  #  entity_type = "projects/-/locations/-/agents/-/entityTypes/sys.date"
  #}
  #
  #labels  = {
  #    label1 = "value1",
  #    label2 = "value2"
  # } 
} 