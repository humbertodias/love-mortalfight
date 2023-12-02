--[[

    Mortal Fight

    2D Oldschool Fighing Game

    Script based on CS50 mario lecture by Colton Ogden.
    
    Simple fighting game for two players in style of Mortal Kombat made in Lua and Love2d framework.

]]

-- set scalling filter 

love.graphics.setDefaultFilter('nearest', 'nearest')

-- file with required libraries, classes and variables

require 'src/dependencies'

function love.load()

    -- set font and window title
    love.graphics.setFont(gFont['alternate'], 22)
    love.window.setTitle('Mortal Fight')

    -- setup window size and resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        vsync = true,
        resizable = true,
        canvas = false
    })

    -- play the music
    gSound['music']:setLooping(true)
    gSound['music']:setVolume(0.2)
    gSound['music']:play()
end

-- resize helper
function love.resize(w, h)
    push:resize(w, h)
end

-- function for keyboard input
function love.keypressed(key)

    if key == 'escape' then

        -- Program terminates when escape button is pressed on start screen

        if engine.state == 'main-menu' then
            love.event.quit()

        -- When escape is pressed durring the game it goes back to the start screen

        elseif engine.state == 'game' then
            engine.state = 'main-menu'
        end
    end
    
    -- register key in the array

    keysPressed[key] = true

    -- checking if players pressed the keys
    -- originally all the keys supposed to be controlled from here or separate class
    -- but during the development I placed keys controls in player's update function
    -- I may move all the keys checking here if I plan to develop this game further
    
    -- if game is running check if key is pressed

    if engine.state == 'game' then
        player1:keypressed(key)
        player2:keypressed(key)
    end
end

-- returns what keyboard was pressed ()
function love.keyboard.wasPressed(key)
    return keysPressed[key]
end

function love.update(dt)
    -- run update function in class engine
    engine:update(dt)

    --clear the keys array
    keysPressed = {}
end

function love.draw()
    push:start()

    -- render engine class
    engine:render()


    --debug
    --debug:render()

    push:finish()
    
end

