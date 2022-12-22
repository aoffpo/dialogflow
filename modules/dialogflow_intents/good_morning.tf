resource "google_dialogflow_cx_intent" "good_morning" {
  display_name = "small_talk.greetings.good_morning"
  training_phrases {
    parts {
      text = "top of the morning to you"
    }
    parts {
      text = "good morning too"
    }
    parts {
      text = "have a nice morning"
    }
    parts {
      text = "hello good morning"
    }
    parts {
      text = "hi good morning"
    }
    parts {
      text = "good morning there"
    }
    parts {
      text = "good morning to you"
    }
    parts {
      text = "good morning"
    }
    parts {
      text = "a good morning"
    }
    parts {
      text = "have a good morning"
    }
    parts {
      text = "and a good morning to you"
    }
    parts {
      text = "morning"
    }
  }
}
