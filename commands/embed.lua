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
  message.channel:send{"Successfully changed color to **RDCards Blue**!"}
  elseif mt[1] == "Healion Green" or mt[1] == "green" then
  uj.embedc = 0x00ff00
  message.channel:send{"Successfully changed color to **Healion Green**!"}
  elseif mt[1] == "Stylish Red" or mt[1] == "red" then
  uj.embedc = 0xff0000
  message.channel:send{"Successfully changed color to **Stylish Red**!"}
  elseif mt[1] == "Nice Blue" or mt[1] == "blue" then
  uj.embedc = 0x33ccff
  message.channel:send{"Successfully changed color to **Nice Blue**!"}
  elseif mt[1] == "Pretty Orange" or mt[1] == "orange" then
  uj.embedc = 0xff8000
  message.channel:send{"Successfully changed color to **Pretty Orange**!"}
  elseif mt[1] == "Beans Brown" or mt[1] == "brown" then
  uj.embedc = 0x481b1d
  message.channel:send{"Successfully changed color to **Beans Brown**!"}
  elseif mt[1] == "Light Yellow" or mt[1] == "yellow" then
  uj.embedc = 0xfcd68d
  message.channel:send{"Successfully changed color to **Light Yellow**!"}
  elseif mt[1] == "Fun Purple" or mt[1] == "purple" then
  uj.embedc = 0x7c00bf
  message.channel:send{"Successfully changed color to **Fun Purple**!"}
  elseif mt[1] == "Hot Pink" or mt[1] == "pink" then
  uj.embedc = 0xff00dc
  message.channel:send{"Successfully changed color to **Hot Pink**!"}
  elseif mt[1] == "list" then
   message.channel:send{embed = {
        color = uj.embedc,
        title = "All Colors",
       description = "**RDCards Blue** (default)\n**Healion Green** (green)\n**Stylish Red** (red)\n**Nice Blue** (blue)\n**Pretty Orange** (orange)\n**Beans Brown** (brown)\n**Light Yellow** (yellow)\n**Fun Purple** (purple)\n**Hot Pink** (pink)",
   }}
  end
  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
end
return command

