local item = {}

function item.run(uj, ujf, message, mt, interaction)
  if not uj.conspt then uj.conspt = "none" end
  local replying = interaction or message
  if uj.conspt == "none" then
    uj.consumables["stickontabs"] = uj.consumables["stickontabs"] - 1
    if uj.consumables["stickontabs"] == 0 then uj.consumables["stickontabs"] = nil end
    uj.timesitemused = uj.timesitemused and uj.timesitemused + 1 or 1

    uj.conspt = "scribblednotepad"
    replying:reply("You stick the **Stick-on Tabs** inside of your level design notepad. This will surely improve your organizational skills... and also attract some editor cards I guess.")
    local randtime = math.random(4, 8)
    uj.lastpull = uj.lastpull - randtime
    message:reply('Also, your pull cooldown was decreased by ' .. randtime .. ' hours!')
    dpf.savejson(ujf, uj)
  else
    replying:reply("You already have a pull affecting item in use! You decide against using the **Stick-on Tabs** at this time.")
  end
end

return item
