// Irlan Abushakhanov, 2023

public struct AbbreviationModel {
    public let abbreviation: String
    public let morse: String
    public let description: String
}

public let abbreviationModels = [
    AbbreviationModel(abbreviation: "SOS", morse: "•••---•••", description: "Only used by original message sender, and only for imminent danger to life."),
    AbbreviationModel(abbreviation: "OK", morse: "---  -•- ", description: "Agreement of confirmation."),
    AbbreviationModel(abbreviation: "Attention", morse: "-•-•-", description: "Transmission starting signal. Stands for Commencing Transmission."),
    AbbreviationModel(abbreviation: "Confirm", morse: "-•-•  ••-•  --", description: "Message received."),
    AbbreviationModel(abbreviation: "Say Again", morse: "••--••", description: "When standing alone, request yo repeat the message."),
    AbbreviationModel(abbreviation: "Thank You", morse: "-    ••-", description: "No comments."),
    AbbreviationModel(abbreviation: "End of contact", morse: "•••-•-", description: "Also means end of work."),
    AbbreviationModel(abbreviation: "Wrong", morse: "--••   •--   ••-•", description: "Your last transmission was wrong. Sending the correct version."),
    AbbreviationModel(abbreviation: "Who", morse: "--•-   •-•   --••", description: "You are being called by X. Or “Who if calling me?”."),
    AbbreviationModel(abbreviation: "Nothing heard", morse: "-•   ••   •-••", description: "General-purpose response meaning “noting” or “none”"),
    AbbreviationModel(abbreviation: "Wait", morse: "•-•••", description: "I must pause for a few minutes"),
    AbbreviationModel(abbreviation: "Love and kisses", morse: "---••    ---••", description: "Best wishes"),
    AbbreviationModel(abbreviation: "Best regards", morse: "--•••    •••--", description: "Also best wishes"),
]

