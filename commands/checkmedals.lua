local command = {}
function command.run(message)
  print("checking medals for " .. message.author.name)

  local ujf = ("savedata/" .. message.author.id .. ".json")
  local uj = dpf.loadjson(ujf, defaultjson)
  local lang = dpf.loadjson("langs/" .. uj.lang .. "/checkmedals.json")

  for i, v in ipairs(medalrequires) do
    print("checking " .. v.receive)

    if not v.require(uj) then
      print("user cannot have " .. v.receive)
      uj.medals[v.receive] = false
      goto continue
    end

    print("user can have " .. v.receive)

    if uj.medals[v.receive] then
      print("user already has " .. v.receive)
      goto continue
    end

    print("user does not have it yet!")

    uj.medals[v.receive] = true

    message.channel:send { embed = {
      color = uj.embedc,
      title = lang.congratulations,
      description = formatstring(lang.gotmedal, {message.author.mentionString, medaldb[v.receive].name}),
      image = { url = medaldb[v.receive].embed }
    } }

    if v.receive == 'cardmaestro' then
      message.channel:send(lang.gotmaestro)
    end

    ::continue::
  end

  dpf.savejson(ujf, uj)
end

return command
