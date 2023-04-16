--###### Requires ######
Core = require("Core/core")
Game = require("Game/game")
Intro = require("Intro/intro")
menu = require("menu/menu")

scene = "menu"
--###### Love2D ######

function love.load()
  Game.load()
  menu.load()
end
--

function love.update(dt)
  if scene == "game" then
    Game.update(dt)
  else
    menu.update(dt)
  end
end
--

function love.draw()
  if scene == "game" then
    Game.draw()
  else
    menu.draw()
  end
end
--

function love.keypressed(k,scan)
  if scene == "game" then
    Game.keypressed(k)
  else
    menu.keypressed(k)
  end
end
--

function love.mousepressed(x,y,button)
end
--
