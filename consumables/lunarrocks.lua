local item = {}

function item.run(uj, ujf, message, mt, interaction)
  if not uj.conspt then uj.conspt = "none" end
  local replying = interaction or message
  if uj.conspt == "none" then
    uj.consumables["lunarrocks"] = uj.consumables["lunarrocks"] - 1
    if uj.consumables["lunarrocks"] == 0 then uj.consumables["lunarrocks"] = nil end
    uj.timesitemused = uj.timesitemused and uj.timesitemused + 1 or 1

    uj.conspt = "charcoalpencil"
    replying:reply("You set the **Lunar Rocks** down on a table in the middle of the desert. This will surely attract the attention of people who are into geology or cool-looking rocks.")
    local randtime = math.random(4, 8)
    uj.lastpull = uj.lastpull - randtime
    message:reply('Also, your pull cooldown was decreased by ' .. randtime .. ' hours!')
    dpf.savejson(ujf, uj)
  else
    replying:reply("You already have a pull affecting item in use! You decide against using the **Lunar Rocks** for now.")
  end
end

return item
