function love.load()
    paddle = love.graphics.newImage("paddle.png")
    ball = love.graphics.newImage("ball.png")
    px1, px2, py1, py2 = 30, 750, 10, 10
    bx = 380
    by = 10
end

function love.update(dt)
    keychange = 20
    if love.keyboard.isDown("down") then
        py1 = py1 + keychange
    end
    if love.keyboard.isDown("up") then
        py1 = py1 - keychange
    end
end

function love.draw()
    --love.graphics.circle("fill", 300, 300, 10, 10)
    love.graphics.draw(paddle, px1, py1)
    love.graphics.draw(paddle, px2, py2)
    --love.graphics.draw(paddle)
    love.graphics.draw(ball, 380, 364)
end
