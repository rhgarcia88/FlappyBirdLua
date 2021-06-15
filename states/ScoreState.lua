--[[
    ScoreState Class
    Author: Colton Ogden
    cogden@cs50.harvard.edu

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
    self.bronze = love.graphics.newImage('bronzeBird.png')
    self.silver = love.graphics.newImage('silverBird.png')
    self.golden = love.graphics.newImage('goldenBird.png')
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

      if self.score <= 2 then
    love.graphics.draw(self.bronze, VIRTUAL_WIDTH/2 - 20, 130)
    love.graphics.setFont(smallFont)
    love.graphics.printf('Bronze Bird', 0, 160, VIRTUAL_WIDTH, 'center')
    
    elseif self.score > 2 and self.score<=4 then
    love.graphics.draw(self.silver, VIRTUAL_WIDTH/2 - 20, 130)
    love.graphics.setFont(smallFont)
    love.graphics.printf('Silver Bird', 0, 160, VIRTUAL_WIDTH, 'center')    

    elseif self.score > 4 then
    love.graphics.draw(self.golden, VIRTUAL_WIDTH/2 - 20, 130)
    love.graphics.setFont(smallFont)
    love.graphics.printf('Golden Bird', 0, 160, VIRTUAL_WIDTH, 'center')    

    end

     love.graphics.setFont(flappyFont)
    love.graphics.printf('Press Enter to Play Again!', 0, 180, VIRTUAL_WIDTH, 'center')
end