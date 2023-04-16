local Game = {}

Game.images = {}

local player = require("Game/player")

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    table.insert( Game.images, Core.image.new("Game/Ressources/"..file) )
  end
  player.load()
end
--

function Game.update(dt)
  player.update(dt)
end
--

function Game.draw()
  player.draw()
end
--

return Game