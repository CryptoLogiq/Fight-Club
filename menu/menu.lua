local menu = {ready=false}

local title = {x=10, y=10, txt = "Le Comeback de Riyad".."\n".."\t By Riyad and CryptoLogiq", rot=0, sx=1, sy=1}
local pressButton = {x=120, y=90, txt = "Press buttons for Start Game", tor=0, sx=1, sy=1}
local linesManager = {}
local liste_lines = {}
local arround = 0

local function line_udp(self, dt)
  self.y = (self.y + self.speed * dt)%love.graphics.getHeight()
end
--

local function line_draw(self)
  love.graphics.setColor(
    math.max(0.1, 1*math.cos(arround)), -- r
    math.max(0.1, 1*math.cos(arround)), -- g
    math.max(0.1, 1*math.sin(arround)), -- b
    math.abs(math.cos(arround)) -- alpha
  )
  love.graphics.rectangle("fill", self.x, self.y, self.w, self.h)
  love.graphics.setColor(1,1,1,1)
end
--

local function newLine()
  local line = {
    x=0,
    w=love.graphics.getWidth(),
    y=love.math.random(10, love.graphics.getHeight()-10),
    h=love.math.random(0.2, 1),
    speed=love.math.random(30, 90),
    update=line_udp,
    draw=line_draw
  }

  local rand = love.math.random(100)
  if rand >= 70 then
    line.speed = 0 - line.speed
  end

  table.insert(liste_lines, line)
end
--

function linesManager.update(dt)
  for i=1, #liste_lines do
    local line = liste_lines[i]
    line:update(dt)
  end
end
--

function linesManager.draw(dt)
  for i=1, #liste_lines do
    local line = liste_lines[i]
    line:draw()
  end
end
--

function menu.load()
  menu.ready = false
  menu.timer = Core.timer.new(30)

  liste_lines = {}
  for i=1, 10 do
    newLine()
  end

end
--

function menu.update(dt)
  linesManager.update(dt)
  --
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
  linesManager.draw()
  --
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