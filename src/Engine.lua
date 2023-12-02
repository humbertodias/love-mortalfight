Engine = Class{}

-- basic state machine check in what state the game is 

function Engine:init()
    self.state = 'main-menu'
end

function Engine:update(dt)
    if self.state == 'main-menu' then
        start:update(dt)
    elseif self.state == 'game' then
        game:update(dt)
    end
end

function Engine:render()
    if self.state == 'main-menu' then
    
        start:render()
    elseif self.state == 'game' then
    
        game:render()
    end
end