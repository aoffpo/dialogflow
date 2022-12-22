provider "google" {
  project                     = "dialogflow-371521"
  region                      = "us-east1"
  zone                        = "us-east1-c"
  impersonate_service_account = "default@dialogflow-371521.iam.gserviceaccount.com"
}

module "dialogflow_intents" {
  source = "./modules/dialogflow_intents"

  parent = google_dialogflow_cx_agent.default.id

  tags = {
    iac   = "terraform"
    env = "dev"
  }
}

#data "google_project" "agent_project" {
#}

# create project 
# resource "google_project_service" "agent_project" {
#  project = data.google_project.agent_project.project_id
#  service = "dialogflow.googleapis.com"
#}
#

# create service account 
# resource "google_project_iam_member" "agent_create" {
# 

# create environment

# create tags

resource "google_dialogflow_cx_agent" "default" {
  display_name               = "dialogflowcx-agent"
  location                   = "us-east1"
  default_language_code      = "en"
  supported_language_codes   = ["fr", "de", "es"]
  time_zone                  = "America/New_York"
  description                = "Example description."
  avatar_uri                 = "https://cloud.google.com/_static/images/cloud/icons/favicons/onecloud/super_cloud.png"
  enable_stackdriver_logging = true
  enable_spell_correction    = true
  speech_to_text_settings {
    enable_speech_adaptation = true
  }
  #depends_on = [google_project_iam_member.agent_create]
}

resource "google_dialogflow_cx_flow" "default" {
  parent       = google_dialogflow_cx_agent.default.id
  display_name = "Start Flow"
  description  = "A start flow created along with the agent"

  nlu_settings {
    classification_threshold = 0.3
    model_type               = "MODEL_TYPE_STANDARD"
    model_training_mode      = "MODEL_TRAINING_MODE_AUTOMATIC"
  }
  transition_routes {
    intent = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/intents/00000000-0000-0000-0000-000000000000"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
          <<-EOT
          Hi! I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
          What can I help you with today?
          EOT
          ]
        }
      }
    }
  }
  transition_routes {
    intent      = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/intents/deb24824-d38f-43ce-8938-760b4f55ea12"
    target_page = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/pages/df20b17b-91ed-48df-9465-27eb234f21e5"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
            <<-EOT
            Good morning! Hope you are well today. 
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with?
            EOT,
            <<-EOT
            Good morning! Hope your day is going well!
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with?
            EOT,
            <<-EOT
            And a good morning to you!
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with?
            EOT
          ]
        }
      }
    }
  }
  transition_routes {
    intent      = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/intents/b56f10cd-29b4-4b9f-98f5-afb73d1ad913"
    target_page = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/pages/df20b17b-91ed-48df-9465-27eb234f21e5"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
            <<-EOT
            Good evening! How is your day going?
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Good evening! How's the day treating you so far?
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Good evening! How's your day been?
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT
          ]
        }
      }
    }
  }
  transition_routes {
    intent      = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/intents/9832593b-3df1-4702-a763-429550d8fa1c"
    target_page = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/pages/df20b17b-91ed-48df-9465-27eb234f21e5"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
            <<-EOT
              Hi there, friend!
              I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
              What can I help you with today?
            EOT,
            <<-EOT
            Hi! 
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Hey there! 
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Hey! 
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Good day! 
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Hello!
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT,
            <<-EOT
            Greetings! 
            I'm the virtual small talk agent. I can tell you a joke, tell you about myself or answer questions. You can also tell me about yourself or give me feedback.
            What can I help you with today?
            EOT
          ]
        }
      }
    }
  }
  transition_routes {
    condition   = "true"
    target_page = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/pages/df20b17b-91ed-48df-9465-27eb234f21e5"
  }
  # inherited by every page's event handlers
  event_handlers {
    event = "sys.no-match-default"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = ["I didn't get that. Can you say it again?",
            "I missed what you said. What was that?",
            "Sorry, could you say that again?",
            "Sorry, can you say that again?",
            "Can you say that again?",
            "Sorry, I didn't get that. Can you rephrase?",
            "Sorry, what was that?",
            "One more time?",
            "What was that?",
            "Say that one more time?",
            "I didn't get that. Can you repeat?",
          "I missed that, say that again?"]
        }
      }
    }
  }

  event_handlers {
    event = "sys.no-input-default"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
            "I didn't get that. Can you say it again?",
            "I missed what you said. What was that?",
            "Sorry, could you say that again?",
            "Sorry, can you say that again?",
            "Can you say that again?",
            "Sorry, I didn't get that. Can you rephrase?",
            "Sorry, what was that?",
            "One more time?",
            "What was that?",
            "Say that one more time?",
            "I didn't get that. Can you repeat?",
            "I missed that, say that again?"
          ]
        }
      }
    }
  }
}

resource "google_dialogflow_cx_page" "request" {
  display_name = "Request"
  parent       = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000"
  transition_route_groups = [
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/625d5f27-314e-45dd-a24b-1500c6701df8",
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/88c72b24-fe5c-4ac0-b0f4-b9d4c76d8314",
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/f6edb5fc-cb11-48f3-8ecb-58c4fc69ecec",
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/97ae5e89-3d04-4bcd-b14a-a26b9b7e365f",
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/abec22c6-8527-40c1-9d86-a80dadb7b575",
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/26b76469-185d-4f6a-92b2-c8b5e43b27e9",
    "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/transitionRouteGroups/e9d8d883-5ae1-4aca-8505-1362cf3031d5",
  ]
  transition_routes {
    intent      = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/intents/cf62f60f-0348-482e-9e70-170cd27b0fc1"
    target_page = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/pages/END_SESSION"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
            "You're welcome! Thanks for chatting with me today.",
          ]
        }
      }
    }
  }
  transition_routes {
    intent      = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/intents/dca73282-4d03-44c2-91c9-a073cb8f172b"
    target_page = "projects/dialogflow-371521/locations/us-east1/agents/71a127f4-46a9-43ee-89b1-a82cdbf942ef/flows/00000000-0000-0000-0000-000000000000/pages/END_SESSION"
    trigger_fulfillment {
      return_partial_responses = false
      messages {
        text {
          text = [
            "Thanks for chatting with me today. Goodbye!",
          ]
        }
      }
    }
  }
  transition_routes {
    condition = "true"
  }
}
