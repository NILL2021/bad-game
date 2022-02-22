function love.load()
    --other stuff
    colliding = false
    fnt = love.graphics.newFont(40)
    --player
    player = {}
    player.x = love.graphics.getHeight()/2
    player.y = love.graphics.getWidth()/2
    len = 15
    player.width = len
    player.height = len
    player.speed = 4
    score = 0
    --fruit
    fruit = {}
    fruit.x = 0
    fruit.y = 0
    fruit.width = 18
    fruit.height = 18
end

function love.update(dt)
    --if player.cx or -player.cx == love.graphics.getWidth then
        --if player.cy or -player.cy not love.graphics.getHeight then

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        player.y = player.y - player.speed
    end

    if love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        player.y = player.y + player.speed
    end

    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.x = player.x - player.speed
    end

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.x = player.x + player.speed
    end

        --end --line 21
    --end -- line 20

    colliding = checkCollision(player, fruit)

    if colliding then
        score = score + 1
        fruit.x = math.random(100,love.graphics.getWidth())
        fruit.y = math.random(40,love.graphics.getHeight())
        player.width = len
        player.height = len
        len = len + 4
    end

end

function love.draw()
    love.graphics.setBackgroundColor(0.2,0.4,0.2)
    love.graphics.setColor(1,0,0)
    love.graphics.rectangle("fill", fruit.x, fruit.y, fruit.width, fruit.height)
    love.graphics.setColor(0,1,0)
    love.graphics.circle("fill", player.x, player.y, len)
    love.graphics.setColor(0,0,1)
    love.graphics.setFont(fnt)
    love.graphics.print("Score: ".. score, 0,0)
end

function checkCollision(a, b)
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    if  a_right > b_left
    and a_left < b_right
    and a_bottom > b_top
    and a_top < b_bottom then

        return true

    else

        return false
    end

end