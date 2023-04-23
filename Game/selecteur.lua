local selecteur = {}

io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")

listeSF = {}
listeSF[1] = "Balrog"
listeSF[2] = "Blanka"
listeSF[3] = "Chun-Li"
listeSF[4] = "Dhalsim"
listeSF[5] = "E. Honda"
listeSF[6] = "Guile"
listeSF[7] = "Ken"
listeSF[8] = "M. Bison"
listeSF[9] = "Ryu"
listeSF[10] = "Sagat"
listeSF[11] = "Vega"
listeSF[12] = "Zangief"

PersoSelect = 1

function selecteur.load()
end

function selecteur.update(dt)
end

function selecteur.draw()
  y = 10
  for i=1,#listeSF do
    if i == PersoSelect then
      love.graphics.setColor(1,0,0)
    else
      love.graphics.setColor(1,1,1)
    end      
    love.graphics.print(listeSF[i],10,y)
    y = y + 15
  end
end

function selecteur.keypressed(pKey)
  print(pKey)
  if pKey == "right" then
    PersoSelect = PersoSelect + 1
  end
  if pKey == "left" then
    PersoSelect = PersoSelect - 1
  end
  if pKey == "down" then
    PersoSelect = PersoSelect + 6
  end
  if pKey == "up" then
    PersoSelect = PersoSelect - 6
  end
  if PersoSelect < 1 then
    PersoSelect = #listeSF
  end
  if PersoSelect > #listeSF then
    PersoSelect = 1
  end
  print(PersoSelect)
end

return selecteur