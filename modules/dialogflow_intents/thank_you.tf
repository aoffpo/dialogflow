resource "google_dialogflow_cx_intent" "thank_you"{
    display_name = "small_talk.appraisal.thank_you"
    training_phrases {
      parts {
        text = "You're welcome! Thanks for chatting with me today."
      }
    }
}