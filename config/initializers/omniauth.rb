Rails.application.config.middleware.use OmniAuth::Builder do
    provider :twitter, 'VrykBkP3zRjXve6pciGNow', '8XZtLHWV86XUjsEVoMEXn1fAOsO1jnfhURbXMmv5MeI'
    provider :facebook, '544167172292528', 'fcc7498307d0eb3b8b5ea829484e23ea', {:scope => 'publish_stream, email, user_birthday'}
end