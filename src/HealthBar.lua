--[[
    Display health bars 

]]
    
HealthBar = Class {}

function HealthBar:init()

    self.x = 12
    self.y = 10
    self.width = 200
    self.height = 15
   
end

function HealthBar:update()

end

function HealthBar:render()
    
    -- render left bar

    love.graphics.setColor(1,0,0)
    love.graphics.rectangle('fill', self.x, self.y, self.width, self.height)
    love.graphics.setColor(0,0.8,0)
    love.graphics.rectangle('fill', self.x, self.y, self.width * (player2.health / 100), self.height)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('line', self.x, self.y, self.width, self.height)

    -- render right bar

    love.graphics.setColor(1,0,0)
    love.graphics.rectangle('fill', 288 + self.x, self.y, self.width, self.height)
    love.graphics.setColor(0,0.8,0)
    love.graphics.rectangle('fill', 288 + self.x + 200, self.y, -player1.health * 2, self.height)
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle('line', 288 + self.x, self.y, self.width, self.height)

    -- display names

    love.graphics.setColor(0,0,0)
    love.graphics.setFont(gFont['PixAntiqua'], 12)
    love.graphics.printf(player2.name, self.x + 11, self.y + 2, self.width, 'left')
    love.graphics.printf(player1.name, 291, self.y + 2, self.width, 'right')

    love.graphics.setColor(1,1,1)
    love.graphics.printf(player2.name, self.x + 10, self.y + 1, self.width, 'left')
    love.graphics.printf(player1.name, 290, self.y + 1, self.width, 'right')

    -- render wins
    
    love.graphics.setColor(0,0.8,0)
    if player2.wins > 0 then
        love.graphics.circle('fill', self.x + 5, self.y + 25, 5)
    end

    if player2.wins > 1 then
        love.graphics.circle('fill', self.x + 20, self.y + 25, 5)
    end

    if player1.wins > 0 then
        love.graphics.circle('fill', VIRTUAL_WIDTH - 17, self.y + 25, 5)
    end

    if player1.wins > 1 then
        love.graphics.circle('fill', VIRTUAL_WIDTH - 32, self.y + 25, 5)
    end

    love.graphics.setColor(1,1,1)
    love.graphics.circle('line', self.x + 5, self.y + 25, 5)
    love.graphics.circle('line', self.x + 20, self.y + 25, 5)

    love.graphics.circle('line', VIRTUAL_WIDTH - 17, self.y + 25, 5)
    love.graphics.circle('line', VIRTUAL_WIDTH - 32, self.y + 25, 5)
end