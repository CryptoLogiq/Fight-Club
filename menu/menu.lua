local menu = {ready=false}

local title = {x=10, y=10, txt = "Le Comeback de Riyad".."\n".."\t By Riyad and CryptoLogiq", tor=0, sx=1, sy=1}
local pressButton = {x=120, y=90, txt = "Press buttons for Start Game", tor=0, sx=1, sy=1}
local arround = 0

function menu.load()
  menu.ready = false
  menu.timer = Core.timer.new(30)
end
--

function menu.update(dt)
  arround = arround + dt
  local multX = 1.6
  local multY = 2.6
  local sx = math.abs( math.cos(arround) ) * multX
  local sy = math.abs( math.sin(arround) ) * multY
  title.sx = math.max(0.5, math.min(multX, sx))
  title.sy = math.max(1, math.min(multY, sy))

  if menu.timer.update(dt) then
    menu.ready = true
  end
end
--

function menu.draw()
  love.graphics.scale(2, 2)
  love.graphics.print(title.txt, title.x, title.y, title.rot, title.sx, title.sy)
  if menu.ready then
    love.graphics.setColor(1,1,1,math.abs(math.cos(arround)))
    love.graphics.print(pressButton.txt, pressButton.x, pressButton.y, pressButton.rot, pressButton.sx, pressButton.sy)
    love.graphics.setColor(1,1,1,1)
  end
end
--

function menu.keypressed(k)
  if k and menu.ready then
    scene = "game"
  end
end 

return menu