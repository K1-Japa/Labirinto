require("conf")

--function love.load()
    
--end

local tam_lab = 25
local tam_quad = HEIGHT/tam_lab

local aux = true
local labirinto = {}
for i=1, tam_lab do
    labirinto[i] = {}
    for j=1, tam_lab do
        if aux then
            labirinto[i][j] = 1
            aux = false
        else 
            labirinto[i][j] = 0
            aux = true
        end
    end
end

labirinto[20][20] = 2
local player_position = {20,20}

for i=1, tam_lab do
    print()
    for j=1, tam_lab do
        io.write(labirinto[i][j] .. " ")
    end
end

local down = false

function love.update(dt)
    if love.keyboard.isDown("up") then
        if not down then
            if player_position[1] ~= 1 and (labirinto[player_position[1] - 1][player_position[2]]) ~= 1 then
                labirinto[player_position[1]][player_position[2]] = 0
                player_position[1] = player_position[1] - 1
                labirinto[player_position[1]][player_position[2]] = 2
                down = true
            end
        end
    else
        down = false
    end
end

function love.draw()
    for i=1, tam_lab do
        for j=1, tam_lab do
            if labirinto[i][j] == 1 then
                love.graphics.rectangle("fill", (j-1)*tam_quad, (i-1)*tam_quad, tam_quad, tam_quad)
            elseif labirinto[i][j] == 2 then
                love.graphics.polygon("fill", (j-1)*tam_quad, i*tam_quad, j*tam_quad, i*tam_quad, (j-1)*tam_quad+(tam_quad/2), (i-1)*tam_quad)
            end
        end
    end
end