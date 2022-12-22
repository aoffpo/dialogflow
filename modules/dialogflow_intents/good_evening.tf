resource "google_dialogflow_cx_intent" "good_evening"{
    display_name = "small_talk.greetings.good_evening"
    training_phrases {
      parts {
        text = "good evening everyone"
     }
     parts {
         text = "hi good evening"
     }
     parts {
         text = "good evening to you"
     }
     parts {
         text = "good evening there"
     }
     parts {
         text = "hello good evening"
     }
     parts {
         text = "evening"
     }
     parts {
         text = "hey good evening"
     }
     parts {
         text = "good evening"
     }
     repeat_count = 1
  }
}