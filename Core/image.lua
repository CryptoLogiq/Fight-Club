local ImgManager = {}

function ImgManager.new(pfile)
    local img = {}
    img.x = 0
    img.y = 0
    img.h = 0
    img.w = 0
    img.data = love.graphics.newImages(pfile)
    img.w, img.h = img.data:getdimensions()
    return img
end

return ImgManager