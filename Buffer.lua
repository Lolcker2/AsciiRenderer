
Buffer = {}
function Buffer:new (o)
  o = o or {}   -- create object if user does not provide one

  o.text="world! hello" 
  o.renderedText = o.text
  o.font = FONTS[1]
  o.position = {0, 0} -- x, y
  o.zIndex = 0

  setmetatable(o, self)
  self.__index = self
  return o
end

function Buffer:render()
    love.graphics.setFont(self.font)
    love.graphics.print(self.renderedText, self.position[1], self.position[2], 0, 1, 1)
end

function Buffer:boundingBox()
  return {self.position[1], self.position[2], self.position[1] + self.font:getWidth(self.text), self.position[2] + self.font:getHeight()}
end

function Buffer:clip(xpoint, width)
    local size = round(inter[3] / a.font:getWidth("w"))
    if xpoint > buff.position[1] then
        self.renderedText = string.sub(self.text, 1, string.len(self.text) - size)
        return
    end
    self.renderedText = string.sub(self.text,size)
end


return Buffer