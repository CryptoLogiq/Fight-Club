local menu = {}

local title = {}
title.x = 10
title.y = 10
title.txt = "Le Comeback de Riyad"

function menu.load()
    
end

function menu.draw()
    love.graphics.scale(2, 2)
    love.graphics.print(title.txt, title.x, title.y)
    love.graphics.print("By Riyad and CryptoLogiq", 22, 22)
end

function menu.keypressed(k)
    if k == "space" then
        scene = "game"
    end
end 

return menu