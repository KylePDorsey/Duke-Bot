# route
post '/' do

  message = request["text"] # the text in the message
  username = request["user_name"] # the username of the author

  # security token
  return 401 unless request["token"] == ENV["SLACK_TOKEN"] # environment var
  # it won't listen to itself
  return 200 if username == "slackbot" # or whatever your bot is named

  if message.include? "duke"
    if message.include? "feeling"
      return JSON.dump({
        "text" => Faker::SlackEmoji.objects_and_symbols
      })
    elsif message.include? "hack"
      return JSON.dump({
        "text" => Faker::Hacker.say_something_smart
      })
    elsif message.include? "digits"
      return JSON.dump({
        "text" => Faker::PhoneNumber.phone_number
      })
    end
  else
    return JSON.dump({
      "text" => "Did someone say my name?"
    })
  end



end
