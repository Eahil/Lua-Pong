--canvas = love.graphics.newCanvas(800, 728)
canvas = love.graphics.newCanvas(800, 728)
love.graphics.setCanvas( canvas )
--love.graphics.setCanvas()

function love.load()
    paddle = love.graphics.newImage("paddle.png")
    ball = love.graphics.newImage("ball.png")
end

function love.draw()
    --love.graphics.circle("fill", 300, 300, 10, 10)
    love.graphics.draw(paddle, 30, 10)
    love.graphics.draw(paddle, 750, 10)
    --love.graphics.draw(paddle)
    love.graphics.draw(ball, 380, 364)
end
