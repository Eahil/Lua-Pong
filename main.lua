function love.load()
    width, height = love.graphics.getDimensions()
    -- Ball
    ball = {}
    ball.image = love.graphics.newImage("ball.png")
    ball.x = 380
    ball.y = 10

    -- Paddle 
    paddle = {}
    paddle.image = love.graphics.newImage("paddle.png")
    paddle.x1 = 30
    paddle.y1 = 10
    paddle.x2 = 750
    paddle.y2 = 10
end

function ball_move()
    for i = 1, 5 do
        ball.x = ball.x + 1
        ball.y = ball.y - 1
    end
end

function love.update(dt)
    keychange = 3.5
    orig_paddle_y1 = paddle.y1

    -- Player Moved Paddle Down
    if love.keyboard.isDown("down") then
        paddle.y1 = paddle.y1 + keychange
    end

    -- Player Moved Paddle Up
    if love.keyboard.isDown("up") then
        paddle.y1 = paddle.y1 - keychange
    end

    -- Increase Ball's x and y
    -- TODO: Replace with ball_x() and ball_y()
    if ball.x < 780 then
    ball.x = ball.x + 1
    elseif ball.x >= 780 then
    ball.x = ball.x - 1
    end

    --ball.y = ball.y + 1
    s = 600
   --[[ if paddle.y1 ~= s then
        print("\nPaddle 1 x: "..paddle.x1.." Paddle 1 y: "..paddle.y1)
        print("\nPaddle 2 x: "..paddle.x1.." Paddle 2 y: "..paddle.y1)
        print("Ball x: "..ball.x.." Ball y: "..ball.y)
    --elseif paddle.x1 == 30 then
    elseif paddle.y1 == s then
        print("Capped!")
        love.event.quit()
    else 
    end ]]
end
    
function love.draw()
    --love.graphics.circle("fill", 300, 300, 10, 10)
    love.graphics.draw(paddle.image, paddle.x1, paddle.y1)
    love.graphics.draw(paddle.image, paddle.x2, ball.y)
    --love.graphics.draw(paddle)
    love.graphics.draw(ball.image, ball.x, ball.y) 
end
