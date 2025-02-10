--[[
Build this: Gridlocked Player
https://love2d.org/wiki/Tutorial:Gridlocked_Player

Read through each line carefully.

Build a file on your computer.

Make edits to the maze. Change something about the coding to make your version unique.
]]

function love.load()
    
    -- added the code below to give my own flair 
    love.graphics.setBackgroundColor(0.5, 0.25, 0) -- brown background color

    player = {
        -- x = 256,
        -- y = 256
        grid_x = 256, 
        grid_y = 256,
        act_x = 200, 
        act_y = 200, 
        speed = 10
    } -- player bracket end
    
    map = {
        { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
		{ 1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
		{ 1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 1 },
		{ 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1 },
		{ 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
		{ 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1 },
		{ 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }
    } -- map bracket end
end 

function love.update(dt)
	player.act_y = player.act_y - ((player.act_y - player.grid_y) * player.speed * dt)
	player.act_x = player.act_x - ((player.act_x - player.grid_x) * player.speed * dt)
end

function love.draw()
    -- Draw player
	love.graphics.rectangle("fill", player.act_x, player.act_y, 32, 32)

    -- Draw map
    for y = 1, #map do 
        for x = 1, #map[y] do 
            if map[y] [x]  == 1 then 
                -- added the code below to give my own flair
                love.graphics.setColor(0, 0.5, 0) -- dark green color
                -- changed bottom from line to fill 
                love.graphics.rectangle("fill", x * 32, y * 32, 32, 32)

                -- added the codes below to give my own flair
                love.graphics.setColor(1, 1, 1) -- white color 
                love.graphics.rectangle("line", x * 32, y * 32, 32, 32)

            end 
        end 
    end 
    love.graphics.setColor(1, 1, 1) -- Reset color to white for future drawing
end

function love.keypressed(key)
	if key == "up" then
        if testMap(0, -1) then 
            player.grid_y = player.grid_y - 32
        end 
	elseif key == "down" then
        if testMap(0, 1) then 
		    player.grid_y = player.grid_y + 32
        end 
	elseif key == "left" then
        if testMap(-1, 0) then 
		    player.grid_x = player.grid_x - 32
        end 
	elseif key == "right" then
        if testMap(1, 0) then 
		    player.grid_x = player.grid_x + 32
        end 
	end
end

function testMap(x, y)
    if map [(player.grid_y / 32) + y][(player.grid_x / 32) + x] == 1 then 
        return false 
    end 
    return true 
end 