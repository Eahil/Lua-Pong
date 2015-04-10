function love.load()
    width, height = love.graphics.getDimensions()
    -- Ball
    ball = {}
    ball.image = love.graphics.newImage("ball.png")
    --[[ball.x = 380
    ball.y = 10]]
    ball.x = (width / 2)
    ball.y = (height/ 2)
    ball.width = 20
    ball.height = 20
    ball.left = true
    ball.up = true
    ball.down = true
    ball.l_wall = 0
    ball.r_wall = (width - 20)
    ball.wall_collide = false
    ball.floor_collide = false
    ball.ceiling_collide = true
    ball.floor = (height - 20)
    ball.ceiling = 0
    ball.paddle_collide = false

    -- Paddle 
    paddle = {}
    paddle.image = love.graphics.newImage("paddle.png")
    paddle.x1 = 30
    paddle.y1 = 10
    paddle.x2 = 750
    paddle.y2 = 10
    paddle.width = 20
    paddle.height = 160
end

function ball_move_x(move)
    -- Ball X
    if ball.left then
        -- Makes Ball Go Right
        if ball.x == ball.l_wall then
            ball.wall_collide = true
            ball.left = false
            print("Left Wall Touched.")
        -- Moves Ball Left
        else
            ball.wall_collide = false
            ball.x = ball.x - move
            --print("Ball Moves Left.")
        end
    else
        -- Makes Ball Go Left
        if ball.x == ball.r_wall then
            ball.wall_collide = true
            ball.left = true
            print("Right Wall Touched.")
        else
        -- Moves Ball Right
        ball.wall_collide = false
        ball.x = ball.x + move
        --print("Ball Moves Right.")
    end
    end

end

function ball_move_y(move)
    -- Ball Y
    if ball.up then
        -- Bump Ball Down
        if ball.y == ball.ceiling then
            ball.ceiling_collide = true
            ball.up = false
            print("Ceiling Touched.")
        -- Move Ball Up
        else
            ball.ceiling_collide = false
            ball.y = ball.y - move
            --print("Ball Moves Up.")
        end
    else
        -- Bump Ball Up
        if ball.y == ball.floor then
            print("Floor Touched.")
            ball.floor_collide = true
            ball.up = true
        -- Move Ball Down
        else
            ball.floor_collide = false
            ball.y = ball.y + move
            --print("Ball Moves Down.")
    end
    end
end

function paddle_move()
end

function player_paddle(keychange)
    -- Player Moved Paddle Down
    if love.keyboard.isDown("down") then
        paddle.y1 = paddle.y1 + keychange
    end

    -- Player Moved Paddle Up
    if love.keyboard.isDown("up") then
        paddle.y1 = paddle.y1 - keychange
    end
end

function love.update(dt)
    orig_paddle_y1 = paddle.y1
    
    -- Allow Player To Move Paddle
    player_paddle(3.5)

    -- Move The Ball
    ball_move_x(2.5)
    ball_move_y(2.5)
end
    
function love.draw()
    --love.graphics.circle("fill", 300, 300, 10, 10)
    love.graphics.draw(paddle.image, paddle.x1, paddle.y1)
    love.graphics.draw(paddle.image, paddle.x2, ball.y - ((paddle.height / 2) - ball.height))
    --love.graphics.draw(paddle)
    love.graphics.draw(ball.image, ball.x, ball.y) 
end
