--[[
    Debug class to display info when needed
]]


Debug = Class {}

function Debug:init()
    self.x = 10
    self.y = 260
    self.width = 100
    self.height = 30
end

function Debug:render()
    --[[
    love.graphics.setFont(gFont['alternate'], 8)
    love.graphics.print('player2:', self.x, self.y)
    love.graphics.print(player2.x, self.x, self.y + 10)
    love.graphics.print('player1:', self.x + self.width * 1 , self.y)
    love.graphics.print(player1.x, self.x + self.width * 1, self.y + 10)
    love.graphics.print('distance:', self.x + self.width * 2, self.y)
    love.graphics.print(distance(), self.x + self.width * 2, self.y + 10)
    --love.graphics.print('arena.x:', self.x + self.width * 3, self.y)
    --love.graphics.print(arena.x, self.x + self.width * 3, self.y + 10)
    love.graphics.print('Player 1 wins:', self.x + self.width * 3, self.y)
    love.graphics.print(player1.wins, self.x + self.width * 3, self.y + 10)
    --love.graphics.print('cameraScroll:', self.x + self.width * 4, self.y)
    --love.graphics.print(arena.cameraScroll, self.x + self.width * 4, self.y + 10)
    love.graphics.print('Player 2 wins:', self.x + self.width * 4, self.y)
    love.graphics.print(player2.wins, self.x + self.width * 4, self.y + 10)

    ]]

    love.graphics.setFont(gFont['alternate'], 8)
    love.graphics.print('game.started:', self.x, self.y)
    love.graphics.print(b2str(game.started), self.x, self.y + 10)
    love.graphics.print('game.ended', self.x + self.width * 1 , self.y)
    love.graphics.print(b2str(game.ended), self.x + self.width * 1, self.y + 10)
    love.graphics.print('game.gameover', self.x + self.width * 2, self.y)
    love.graphics.print(b2str(game.gameover), self.x + self.width * 2, self.y + 10)
    --love.graphics.print('arena.x:', self.x + self.width * 3, self.y)
    --love.graphics.print(arena.x, self.x + self.width * 3, self.y + 10)
    love.graphics.print('Player 1 died:', self.x + self.width * 3, self.y)
    love.graphics.print(b2str(player1.died), self.x + self.width * 3, self.y + 10)
    --love.graphics.print('cameraScroll:', self.x + self.width * 4, self.y)
    --love.graphics.print(arena.cameraScroll, self.x + self.width * 4, self.y + 10)
    love.graphics.print('Player 2 died:', self.x + self.width * 4, self.y)
    love.graphics.print(b2str(player2.died), self.x + self.width * 4, self.y + 10)

end

function b2str(b)
    if b then
        str = 'true'
    else
        str = 'false'
    end

    return str
end