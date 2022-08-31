local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !info")
   message.channel:send{embed = {
        color = 0x00FF00,
        title = "About H-Cards",
       description = "H-Cards is a closed-source fork of the RDCards bot, made exclusively for \"The H's Friends\" Discord server. \nThis bot includes custom cards, QOL features and more coming soon! Please feel free to suggest any features!\n**RDCards made by DPS2004, Random Guy JCI and BIrDIS** \n**H-Cards made by #Guigui, 1257Plays and Healion123**",
   }}
end
return command
