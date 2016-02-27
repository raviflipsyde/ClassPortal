json.array!(@messages) do |message|
  json.extract! message, :id, :msg, :to_user, :from_user, :readflag
  json.url message_url(message, format: :json)
end
