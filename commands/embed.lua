local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !embed")
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  
  if not uj.embedc then
  uj.embedc = 0x85c5ff
  end
  
  if mt[1] == "" then
  mt[1] = "list"
  end
  
  if mt[1] == "RDCards Blue" or mt[1] == "default" then
  uj.embedc = 0x85c5ff
  elseif mt[1] == "Healion Green" or mt[1] == "green" then
  uj.embedc = 0x00ff00
  elseif mt[1] == "Stylish Red" or mt[1] == "red" then
  uj.embedc = 0xff0000
  elseif mt[1] == "Nice Blue" or mt[1] == "blue" then
  uj.embedc = 0x33ccff
  elseif mt[1] == "Pretty Orange" or mt[1] == "orange" then
  uj.embedc = 0xff8000
  elseif mt[1] == "Beans Brown" or mt[1] == "brown" then
  uj.embedc = 0x481b1d
  elseif mt[1] == "Light Yellow" or mt[1] == "yellow" then
  uj.embedc = 0xfcd68d
  elseif mt[1] == "Fun Purple" or mt[1] == "purple" then
  uj.embedc = 0x7c00bf
  elseif mt[1] == "Hot Pink" or mt[1] == "pink" then
  uj.embedc = 0xff00dc
  elseif mt[1] == "list" then
   message.channel:send{embed = {
        color = uj.embedc,
        title = "All Colors",
       description = "**RDCards Blue** (default)\n**Healion Green** (green)\n**Stylish Red** (red)\n**Nice Blue** (blue)\n**Pretty Orange** (orange)\n**Beans Brown** (brown)\n**Light Yellow** (yellow)\n**Fun Purple** (purple)\n**Hot Pink** (pink)",
   }}
  end
end
return command

