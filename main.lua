_G.love = require("love")
local Screen = require("Screen")
local Buffer = require("Buffer")

function love.load()
    _G.scale = 1
    _G.FONTS = {love.graphics.newFont('lekton.ttf', 30)}
   
    --textPixelWidth = myFont:getWidth("hello world!")
    
    local myFont = love.graphics.newFont(32)
    myFont:setFilter("nearest", "nearest")
    love.graphics.setFont(myFont)
   
    _G.a = Buffer:new()
    _G.b = Buffer:new()
    b.renderedText = "aaaaaaaaaaaaaaaaaa"
    b.position = {90, 0}
    
    _G.LAYERS = Screen:new()

    LAYERS:setLayers({a, b})
    LAYERS:sort()

end


function love.update(dt)
end



-- no intersection if width or height are negative
function intersection(buff1, buff2)
    local x = math.max(buff1[1], buff2[1])
    local y = math.max(buff1[2], buff2[2])
    -- love.graphics.rectangle("fill", x, y, math.min(buff1[3], buff2[3]) - x, math.min(buff1[4], buff2[4]) - y)
    local rect =  {x, y, math.min(buff1[3], buff2[3]) - x, math.min(buff1[4], buff2[4]) - y}
    return rect
    --if rect[3] <= 0 or rect[4] <=0 then return end -- no intersection
end


function round(x)
    local floor = math.floor(x)
    if x - floor > 0.5 then
        return math.ceil(x) end
    return math.floor(x)
end


function love.draw()
    local windowWidth = love.graphics.getWidth()
    
    -- 2. Calculate the scale factor
    -- local scaleFactor = windowWidth / textPixelWidth
    -- a:render()
    --b:render()
    local inter = intersection(a:boundingBox(), b:boundingBox())
   
    --a:render()
    -- love.graphics.print(tryto(a, inter[1], size), 0, 250, 0, 1, 1)
    --love.graphics.print("hello world!", 0, 0, 0, scaleFactor, scaleFactor)
    love.graphics.print(LAYERS.layers[1].zIndex, 0, 0, 0, 1, 1)
end

