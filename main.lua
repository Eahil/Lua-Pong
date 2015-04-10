function love.load()

    scores = {}
    scores.p1 = 0
    scores.p2 = 0

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

    -- Paddle 
    paddle = {}
    paddle.image = love.graphics.newImage("paddle.png")
    paddle.x1 = 30
    paddle.y1 = 10
    paddle.x2 = 750
    paddle.y2 = 10
    paddle.width = 20
    paddle.height = 160
    paddle.ceiling = 0
    paddle.floor = 440
    paddle.ceiling_collide = false
    paddle.floor_collide = false
    paddle.ceiling_collide2 = false
    paddle.floor_collide2 = false
end

function ball_move_x(move)
    -- Ball X
    if ball.left then
        -- Makes Ball Go Right
        if ball.x == ball.l_wall then
            ball.wall_collide = true
            scores.p2 = scores.p2 + 1
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
            scores.p1 = scores.p1 + 1
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

function paddle_move(move)
    if paddle.y2 == paddle.floor then
        paddle.floor_collide2 = true
end
end

function player_paddle(keychange)
    -- Player Moved Paddle Down
    if love.keyboard.isDown("down") then
        paddle.y1 = paddle.y1 + keychange
        if paddle.y1 > 440 then
            print("Player Paddle Floor collide!")
            paddle.floor_collide = true
            paddle.y1 = paddle.floor
        else
            paddle.floor_collide = false
        end
    end
    -- Player Moved Paddle Up
    if love.keyboard.isDown("up") then
        paddle.y1 = paddle.y1 - keychange
        if paddle.y1 < 0 then
            print("Player Paddle Ceiling collide!")
            paddle.ceiling_collide = true
            paddle.y1 = paddle.ceiling
        end
    end
end

function love.update(dt)
    -- Allow Player To Move Paddle
    player_paddle(3.5)

    -- Move The Ball
    ball_move_x(2.5)
    ball_move_y(2.5)
end
    
function love.draw()
    --love.graphics.circle("fill", 300, 300, 10, 10)
    love.graphics.draw(paddle.image, paddle.x1, paddle.y1)
    love.graphics.draw(paddle.image, paddle.x2, paddle.y2)
    --love.graphics.draw(paddle.image, paddle.x2, ball.y - ((paddle.height / 2) - ball.height))
    --love.graphics.draw(paddle)
    love.graphics.draw(ball.image, ball.x, ball.y) 
    love.graphics.print("[ "..scores.p1.." :: "..scores.p2.." ]", (width / 2), (height - 20))
end
