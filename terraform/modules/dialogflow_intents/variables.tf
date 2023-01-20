variable "parent" {
  description = "parent of intent, usually the agent"
  type        = string
}

variable "tags" {
  description = "Tags  (if supported)"
  type        = map(string)
  default     = {}
}
