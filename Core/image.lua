local ImgManager = {}

function ImgManager.new(pfile)
    local img = {}
    img.x = 0
    img.y = 0
    img.h = 0
    img.w = 0
    img.data = love.graphics.newImage(pfile)
    img.w, img.h = img.data:getDimensions()
    function img.draw(x, y)
        love.graphics.draw(img.data, x or img.x, y or img.y)
    end
    return img
end

return ImgManager