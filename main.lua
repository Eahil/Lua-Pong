function love.load()
    width, height = love.graphics.getDimensions()
    -- Ball
    ball = {}
    ball.image = love.graphics.newImage("ball.png")
    ball.x = 380
    ball.y = 10
    ball.left = true
    ball.right = true
    ball.up = true
    ball.down = true

    -- Paddle 
    paddle = {}
    paddle.image = love.graphics.newImage("paddle.png")
    paddle.x1 = 30
    paddle.y1 = 10
    paddle.x2 = 750
    paddle.y2 = 10
end

function ball_move()
    if ball.left then
        if ball.x == 0 then
            ball.dr = false
        else
            ball.x = ball.x - 1
            print("Ball Moves Left.")
            print(ball.x)
        end
    elseif
        ball.x = ball.x + 1
        print("Ball Moves Right.")
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

    -- Move The Ball
    ball_move(true)
end
    
function love.draw()
    --love.graphics.circle("fill", 300, 300, 10, 10)
    love.graphics.draw(paddle.image, paddle.x1, paddle.y1)
    love.graphics.draw(paddle.image, paddle.x2, ball.y)
    --love.graphics.draw(paddle)
    love.graphics.draw(ball.image, ball.x, ball.y) 
end
