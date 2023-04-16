local Game = {}

Game.images = {}

local player = {}
player.x = 0
player.y = 0
player.speed = 100
player.animation = nil
player.timer = Core.timer.new()
player.sequence = {}
player.sequence.idle = {4, 5}
player.sequence.current = "idle"
player.current.frame = 1

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    table.insert( Game.images, Core.image.new("Game/Ressources/"..file) )
  end
  player.animation = Game.images[4]
  player.y = love.graphics.getHeight() - player.animation.h
end

function Game.update(dt)
   if love.keyboard.isDown("d") then
    player.x = player.x + player.speed*dt
  end
  if love.keyboard.isDown("q") then
    player.x = player.x - player.speed*dt
  end
end

function Game.draw()
  player.animation.draw(player.x, player.y)
end

return Game