--[[
    Start screen of the game
]]

Start = Class {}

function Start:init()
    engine.status = 'main-menu'
end

function Start:update(dt)

    -- if ENTER key is pressed start the game

    if love.keyboard.isDown('return') then
        engine.state = 'game'
        game:startRound()
        game.round = 1
        player1.wins = 0
        player2.wins = 0
        game.timer = love.timer.getTime()
    end
end

-- display start screen

function Start:render()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(gImage['start'], 0, 0)
end