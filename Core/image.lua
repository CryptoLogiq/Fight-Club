local ImgManager = {}

function ImgManager.new(pfile)
    local img = {}
    img.x = 0
    img.y = 0
    img.h = 0
    img.w = 0
    img.data = love.graphics.newImages(pfile)
    img.data:getdimensions()
end

return ImgManager