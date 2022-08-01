local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !h")
  message:addReaction("🇭")
end
return command