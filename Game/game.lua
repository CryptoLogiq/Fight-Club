local Game = {}

Game.images = {}

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    table.insert( Game.images, Core.image.new("Game/Ressources/"..file) )
  end
end

function Game.draw()
  Game.images[1].draw(100, 200)
end

return Game