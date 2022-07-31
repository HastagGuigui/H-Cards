local command = {}
function command.run(message, mt)
  print(message.author.name .. " did !give")
  
  if not message.guild then
    message.channel:send("Sorry, but you cannot give cards in DMs!")
    return
  end
  
  if not (#mt == 2 or #mt == 3) then
    message.channel:send("Sorry, but the c!give command expects 2 or 3 arguments. Please see c!help for more details.")
    return
  end
  
  local user_argument = mt[1]
  local thing_argument = string.lower(mt[2])
  local numcards = 1
  
  if tonumber(mt[3]) then
    if tonumber(mt[3]) > 1 then
      numcards = math.floor(mt[3])
    end
  end
  
  if thing_argument == "token" then
    cmd.givetoken.run(message, {user_argument, numcards})
    return
  end

  if constexttofn(thing_argument) or itemtexttofn(thing_argument) then
    cmd.giveitem.run(message, {user_argument, thing_argument, numcards})
    return
  end
    
  local uj = dpf.loadjson("savedata/" .. message.author.id .. ".json", defaultjson)
  local uj2f = usernametojson(user_argument)

  if mt[3] == "all" then
    numcards = uj.inventory[thing_argument]
  end
  
  if not uj2f then
    message.channel:send("Sorry, but I could not find a user named " .. user_argument .. " in the database. Make sure that you have spelled it right, and that they have at least pulled a card to register!")
    return
  end

  local uj2 = dpf.loadjson(uj2f, defaultjson)
  
  if uj2.id == message.author.id then
    message.channel:send("Sorry, but you cannot give something to yourself!")
    return
  end
  
  local curfilename = texttofn(thing_argument)
  
  if not curfilename then
    if nopeeking then
      message.channel:send("Sorry, but I either could not find the " .. thing_argument .. " card in the database, or you do not have it. Make sure that you spelled it right!")
    else
      message.channel:send("Sorry, but I could not find the " .. thing_argument .. " card in the database. Make sure that you spelled it right!")
    end
    return
  end
  
  if not uj.inventory[curfilename] then
    print("user doesnt have card")
    if nopeeking then
      message.channel:send("Sorry, but I either could not find the " .. thing_argument .. " card in the database, or you do not have it. Make sure that you spelled it right!")
    else
      message.channel:send("Sorry, but you don't have the **" .. cdb[curfilename].name .. "** card in your inventory.")
    end
    return
  end
  
  if not (uj.inventory[curfilename] >= numcards) then
    print("user doesn't have enough cards")
    message.channel:send("Sorry, but you do not have enough **" .. cdb[curfilename].name .. "** cards in your inventory.")
    return
  end


  print(uj.inventory[curfilename] .. "before")
  uj.inventory[curfilename] = uj.inventory[curfilename] - numcards
  print(uj.inventory[curfilename] .. "after")
  
  if uj.inventory[curfilename] == 0 then
    uj.inventory[curfilename] = nil
  end
  
  uj.timescardgiven = (uj.timescardgiven == nil) and numcards or (uj.timescardgiven + numcards)
  uj2.timescardreceived = (uj2.timescardreceived == nil) and numcards or (uj2.timescardreceived + numcards)
  
  dpf.savejson("savedata/" .. message.author.id .. ".json",uj)
  print("user had card, removed from original user")
  
  uj2.inventory[curfilename] = (uj2.inventory[curfilename] == nil) and numcards or (uj2.inventory[curfilename] + numcards)
  
  dpf.savejson(uj2f,uj2)
  print("saved user2 json with new card")
  
  local isplural = numcards ~= 1 and "s" or ""
  message.channel:send {
    content = 'You have gifted ' .. numcards .. ' **' .. cdb[curfilename].name .. '** card' .. isplural ..' to <@' .. uj2.id .. '>.'
  }


end
return command
