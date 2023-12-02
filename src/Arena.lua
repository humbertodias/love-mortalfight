--[[
    Arena class for displaying and scrolling the background

    Author: Michal Ladkowski
]]

Arena = Class{}

function Arena:init()

    -- background dimensions

    self.width = 1200
    self.height = 300

    -- screen scrolling variables

    self.scrollSpeed = 0
    self.scrolling = false
    self.cameraScroll = 0
    self.rightSide = 860

    -- position of the background 

    self.x = -VIRTUAL_WIDTH / 2
    self.y = 0

end

-- function for scrolling from one side to another and bounce (not used in game)

function Arena:scroll(direction)
    if direction == 'left' then
        self.scrollSpeed = 60
    elseif direction == 'right' then
        self.scrollSpeed = -60
    elseif direction == 'stop' then
        self.scrollSpeed = 0
    end
end

function Arena:update(dt)

    -- check the background position to scroll the camera
    if self.cameraScroll >= -255 and self.cameraScroll <= math.floor(arena.rightSide / 2) then
        self.scrolling = true
    else
        self.scrolling = false
    end

    -- set the camera's left edge to half the screen to the left of the player's center
    -- I set the condition that players cannot be farther from each others than 400px 
    -- so both players will be always visible and screen centered

    self.cameraScroll = player2.x + (distance() / 2) - (VIRTUAL_WIDTH / 2)

end

function Arena:render()
    -- if scrolling is true then scroll the screen
    
    if self.scrolling then
        love.graphics.translate(-math.floor(self.cameraScroll), 0)
    
        -- if on the edge lock the background
    elseif self.cameraScroll > (arena.rightSide / 2) - 1 then
        love.graphics.translate(-math.floor(arena.rightSide / 2), 0)
    elseif self.cameraScroll < -254 then
        love.graphics.translate(-math.floor(-255), 0)
    end

    -- draw the background 

    love.graphics.draw(gImage['arena'], self.x, self.y, 0)
end