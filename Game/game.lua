local Game = {}

function Game.load()
  local files = love.filesystem.getDirectoryItems("Game/Ressources")
  for k, file in ipairs(files) do
    print(k .. ". " .. file) --outputs something like "1. main.lua"
    Core.image.new("Game/Ressources"..file)
  end
--  for i=1,  do
--    Core.image.new()
--  end
end

return Game