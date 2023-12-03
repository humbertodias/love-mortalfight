--[[
    Game class 

    This is the game mechanism it counts the rounds and check which player wins etc

]]

Game = Class {}

function Game:init()

    -- round count
    
    self.round = 1
    
    -- booleans for controling the game state like start of the game, end of the round or game over
    
    self.ended = false
    self.started = false
    self.gameover = false
    
    self.fight = false
    
    -- variables for timer functions within the code
    -- mainly used at the start and the end of the round

    self.timer = love.timer.getTime()
    self.timerDelay1 = 2
    self.timerDelay2 = 4

    -- this one is to check if timer was started to prevent starting timer again 

    self.timerStarted = false

    -- is message visible

    self.messagePop = true

    -- set the message text

    message:changeText("Round " .. self.round)
end

function Game:update(dt)

    -- update arena class

    arena:update(dt)

    -- update player's class

    player1:update(dt)
    player2:update(dt)

    -- message off by default

    self.messagePop = false

    -- check the game state
        
    if self.gameover then

        -- if game over display message

        self.messagePop = true

        -- if timer's time elapsed reset variables and change engine state 
        -- to main-menu to return to main screen 

        if love.timer.getTime() - self.timerDelay1 > self.timer then
            self.messagePop = false
            self.started = false
            self.ended = false
            self.gameover  = false
            self.messagePop = false
            self:startRound()
            player1.died = false
            player2.died = false
            self.round = 1
            engine.state = 'main-menu'
        end
    else
        
        -- if not game over go to the next round

        -- if game not started and not ended displays means game is starting

        if not self.started and not self.ended then

            -- displays current message (default is ROUND NUMBER)

            self.messagePop = true

            -- when the second timer elapse start the game

            if love.timer.getTime() - self.timerDelay2 > self.timer then
                    self.started = true
            
            -- when the first timer elapse change the message to fight

            elseif love.timer.getTime() - self.timerDelay1 > self.timer then
                message:changeText("Fight!")
            end

        -- if game started and game ended it means end of the round
        elseif self.started and self.ended then

            -- run endRound function and display the message

            self:endRound()
            self.messagePop = true
            
            -- when timer elapse change the message and prepare for the next round

            if love.timer.getTime() - self.timerDelay1 > self.timer then
                message:changeText("Round " .. self.round)
                self.ended = false
                self.timerStarted = false
                self.started = false
                timer = love.timer.getTime()
            end
        end

        -- if player 1 died and game not ended then means KO

        if player1.died and not self.ended then

            -- displays message

            self.messagePop = true

            -- if one of players won two rounds he is the winner and game over

            if player1.wins == 2 or player2.wins == 2 then
                game:endRound()
                message:changeText("GAME OVER")
                game.gameover = true
            else

                -- if none of players has two wins then next round 

                self.round = self.round + 1
                player1.died = false
                game:startRound()
            end

        -- same for player 2

        elseif player2.died and not self.ended then
            self.messagePop = true

            -- if one of players won two rounds he is the winner and game over

            if player1.wins == 2 or player2.wins == 2 then
                game:endRound()
                message:changeText("GAME OVER")
                game.gameover = true
            else

                -- if none of players has two wins then next round 

                self.round = self.round + 1
                player2.died = false
                game:startRound()
            end
        end
    end
    
end

-- end of the round function start the timer and change the message to the winner

function Game:endRound()
    message:changeText(self.winner .. " wins!")

    if not self.timerStarted then
        self.timer = love.timer.getTime()
        self.timerStarted = true
    end
end

-- start of the round function, reset players health and other variables

function Game:startRound()

    -- change the message

    message:changeText("Round " .. self.round)
    self.messagePop = false

    -- set the timer if not set

    if not self.timerStarted then
        self.timer = love.timer.getTime()
        self.timerStarted = true
    end

    -- player1 one health, position, velocity, state etc

    player1.health = 100
    player1.x = (VIRTUAL_WIDTH / 2) + (player1.width / 1.5)
    player1.y = VIRTUAL_HEIGHT - player1.height - 4
    player1.dx = 0
    player1.dy = 0
    player1.died = false

    player1.block = false
    player1.kick = false
    player1.punch = false
    player1.hit = false

    player1.currentAnimation = player1.animation['idle']

    -- player2 one health, position, velocity, state etc

    player2.health = 100
    player2.x = (VIRTUAL_WIDTH / 2) - (player1.width / 1.5)
    player2.y = VIRTUAL_HEIGHT - player2.height - 4
    player2.dx = 0
    player2.dy = 0
    player2.died = false

    player2.block = false
    player2.kick = false
    player2.punch = false
    player2.hit = false

    player2.currentAnimation = player2.animation['idle']

end

function Game:render()

    -- render arena and players and scroll

    love.graphics.push()
    arena:render()
    player1:render()
    player2:render()

    -- exit scrolling and display health bar and message if visible

    love.graphics.pop()
    healthBar:render()
    if self.messagePop then
        love.graphics.setColor(0, 0, 0, 0.5)
        love.graphics.rectangle('fill', 0, 0, VIRTUAL_WIDTH, VIRTUAL_HEIGHT)
        message:render()
    end
end