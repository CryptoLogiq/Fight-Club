local Game = {}

Game.images = {}

local player = require("Game/player")
local ennemi = require("Game/ennemi")
local background

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    table.insert( Game.images, Core.image.new("Game/Ressources/"..file) )
  end
  player.load()
  ennemi.load()
  background = Game.images[3]
end

function Game.update(dt)
  player.update(dt)
  ennemi.update(dt)
end

function Game.draw()
  background.draw()
  player.draw(player.x, player.y)
  ennemi.draw()
end

function Game.keypressed(k)
  player.keypressed(k)
end
return Game