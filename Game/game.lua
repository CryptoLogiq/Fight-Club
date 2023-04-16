local Game = {}

Game.images = {}

local player = {}
player.x = 0
player.y = 0

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    table.insert( Game.images, Core.image.new("Game/Ressources/"..file) )
  end
end

function Game.update(dt)
   if love.keyboard.isDown("d") then
    player.x = player.x + 100*dt
  end
  if love.keyboard.isDown("q") then
    player.x = player.x - 100*dt
  end
  if love.keyboard.isDown("z") then
    player.y = player.y - 100*dt
  end
  if love.keyboard.isDown("s") then
    player.y = player.y + 100*dt
  end
end

function Game.draw()
  Game.images[1].draw(player.x, player.y)
end

return Game