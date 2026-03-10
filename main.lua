_G.love = require("love")

function love.load()
    local myFont = love.graphics.newFont(32)
    myFont:setFilter("nearest", "nearest")
    love.graphics.setFont(myFont)
    textPixelWidth = myFont:getWidth("hello world!")
    _G.a = Account:new()
end

function love.update(dt)
end



Account = {}
function Account:new (o)
  o = o or {}   -- create object if user does not provide one
  setmetatable(o, self)
  self.__index = self
  o.text="world! hello"
  return o
end

function Account:num()
    love.graphics.print(self.text, 0, 0, 0, 1, 1)
end

function love.draw()
    local windowWidth = love.graphics.getWidth()
    
    -- 2. Calculate the scale factor
    local scaleFactor = windowWidth / textPixelWidth
    a:num()
    --love.graphics.print("hello world!", 0, 0, 0, scaleFactor, scaleFactor)
end

