Screen = {}
function Screen:new (o)
  o = o or {}   -- create object if user does not provide one

  o.layers = {}
  setmetatable(o, self)
  self.__index = self
  return o
end


function Screen:setLayers(layers)
  for i = 1, #layers do
    self.layers[i] = layers[i]
  end
end

function Screen:sort()
    local l = self.layers
    table.sort(l, function(_a, _b)
        return _a.zIndex > _b.zIndex
    end)
end

function Screen:insert(layer)
  for i = 1, #self.layers do
    if layer.zIndex > self.layers[i].zIndex then table.insert(self.layers, i, layer) return end
  end
  table.insert(self.layers, #self.layers + 1, layer)
end


return Screen 