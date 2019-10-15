local ThreeAnnivCardUser = import(".ThreeAnnivCardUser")
local ThreeAnnivGoldUser = import(".ThreeAnnivGoldUser")
local ThreeAnnivLayer = class("ThreeAnnivLayer",function()
    return BaseView.new()
end)

function ThreeAnnivLayer:ctor()
    BaseView.init(self)
    
    self._pageIndex = 1

    self._threeAnnivInfo = MyGame:getUserData():getThreeAnnivInfo()
    self:getThreeAnnivInfo()
    if self._threeAnnivInfo then
        self:initLayer()
    end
end

function ThreeAnnivLayer:getThreeAnnivInfo()
    Commonfun.http({
		url = MyGame:getAppConfig():getThreeAnnivUrl() .. MyGame:getUserData():getUserSession(),
		callback = handler(self, self.threeAnnivInfoRep)
	})
end

function ThreeAnnivLayer:threeAnnivInfoRep(data)
    if data.code == 0 and data.json then
        dump(data.json, "threeAnnivInfoRep")
        MyGame:getUserData():setThreeAnnivInfo(data.json)
        if not self._threeAnnivInfo then
            self._threeAnnivInfo = data.json
            self:initLayer() 
        end
    end
    
end

function ThreeAnnivLayer:initLayer()
    display.newColorLayer(cc.c4b(0,0,0,180)):addTo(self):setContentSize(display.width,display.height)



    self.pv = cc.ui.UIPageView.new({
        viewRect = cc.rect(_width, _height)
    }):addTo(self)
    
    for i=1,7 do
        local item = self.pv:newItem()
        local param = {}
        param.closecallback = handler(self, self.dismiss)
        param.prevcallback = handler(self, self.prevPage)
        param.nextcallback = handler(self, self.nextPage)
        param.index = i
        local content = ThreeAnnivCardUser.new(param)

        content:setTouchEnabled(false)
        item:addChild(content)
        self.pv:addItem(item)        
    end
    self.pv:reload()

end

function ThreeAnnivLayer:nextPage()
    self._pageIndex = self._pageIndex + 1
    if self.pv then
        self.pv:gotoPage(self._pageIndex, false)
    end
end

function ThreeAnnivLayer:prevPage()
    self._pageIndex = self._pageIndex - 1
    if self._pageIndex <= 1 then
        self._pageIndex = 1
    end
    if self.pv then
        self.pv:gotoPage(self._pageIndex, false)
    end
end

function ThreeAnnivLayer:onTouchBegan(touch)
    local event = {}
    event.name = "began"
    event.x = touch.x
    event.y = touch.y
    self._pressPoint_x = touch.x

    if self.pv then
        self.pv:onTouch_(event)
    end
    return true
end

function ThreeAnnivLayer:onTouchMoved(touch)
    local event = {}
    event.name = "moved"
    event.x = touch.x
    event.y = touch.y
    event.prevX = self._pressPoint_x

    self._pressPoint_x = touch.x

    if self.pv then
        self.pv:onTouch_(event)
    end
end

function ThreeAnnivLayer:onTouchEnded(touch)
    local event = {}
    event.name = "ended"
    event.x = touch.x
    event.y = touch.y

    if self.pv then
        self.pv:onTouch_(event)
    end
end

return ThreeAnnivLayer