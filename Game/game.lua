local Game = {}

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    Core.image.new("Game/Ressources/"..file)
  end
end

return Game