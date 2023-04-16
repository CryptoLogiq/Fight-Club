local ImgManager = {}

function ImgManager.new()
    local img = {}
    img.x = 0
    img.y = 0
    img.h = 0
    img.w = 0
    img.data = love.graphics.newImages()
end

return ImgManager