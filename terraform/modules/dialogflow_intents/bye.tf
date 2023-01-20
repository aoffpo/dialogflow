resource "google_dialogflow_cx_intent" "bye" {
    display_name = "small_talk.greetings.bye"
    training_phrases {
      parts {
        text = "Thanks for chatting with me today. Goodbye!"
      }
    }
}