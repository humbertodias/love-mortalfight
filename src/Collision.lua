-- function to measure the distance between players

function distance()
    -- collision from left
    dist = player1.x - player2.x        
    dist = math.floor(dist)

    return dist
end

