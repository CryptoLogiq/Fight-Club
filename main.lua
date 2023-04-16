--###### Requires ######
Core = require("Core/core")
Game = require("Game/game")
Intro = require("Intro/intro")


--###### Love2D ######

function love.load()
  Game.load()
end
--

function love.update(dt)
  Game.update(dt)
end
--

function love.draw()
  Game.draw()
end
--

function love.keypressed(k,scan)
  Game.keypressed(k)
end
--

function love.mousepressed(x,y,button)
end
--
