resource "google_dialogflow_cx_intent" "hello" {
  display_name = "small_talk.greetings.hello"
  training_phrases {
    parts {
      text = "hi"
    }
    parts {
      text = "hi there"
    }
    parts {
      text = "howdy"
    }
    parts {
      text = "lovely day isn't it"
    }
    parts {
      text = "I greet you"
    }
    parts {
      text = "hey"
    }
    parts {
      text = "hello hi"
    }
    parts {
      text = "hello there"
    }
    parts {
      text = "afternoon"
    }
  }

}
