--[[

    Displays message during the pause between rounds

]]

Message = Class {}

function Message:init()

    -- variables for text and font

    self.visible = false
    self.text = 'Press ENTER'
    self.limit = 200
    self.textSize = 32
    self.fontName = '8_bit_pusab'

    -- position of the text

    self.x = (VIRTUAL_WIDTH / 2) - (self.limit / 2)
    self.y = (VIRTUAL_HEIGHT / 2) - (self.textSize / 2)

    -- position of the shadow

    self.sx = self.x + 2
    self.sy = self.y + 2
end

function Message:update(dt)
    self.x = self.x
end

-- function to update the message text

function Message:changeText(text)
    self.text = text
end

-- displays text with the shadow

function Message:render()
    love.graphics.setFont(gFont[self.fontName], self.textSize)
    love.graphics.setColor(0, 0, 0)
    love.graphics.printf(self.text, self.sx, self.sy, self.limit, 'center')
    love.graphics.setColor(1, 1, 1)
    love.graphics.printf(self.text, self.x, self.y, self.limit, 'center')
end