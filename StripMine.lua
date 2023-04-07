function detectF()
    checkFuel()
    while turtle.detect()
    do
        turtle.dig()
        sleep(0.5)
    end
    turtle.forward()
end 

function detectD()
    checkFuel()
    if turtle.detectDown() then
        turtle.digDown()
    end
end 

function digF20(j)
    checkFuel()
    for i = 0, 18
    do  
        detectF()
        if i % 5 == 0 and j % 5 == 0 then 
            placeTorches()
        end
        detectD()
    end
end

function goForwardR()
    checkFuel()
    digF20()
    turtle.turnRight()
    detectF()
    turtle.turnRight()
end

function goForwardL()
    checkFuel()
    digF20()
    turtle.turnLeft()
    detectF()
    turtle.turnLeft()
end

function ClearLeftToRight()
    while 1 do
        checkFuel()
        goForwardR()
        goForwardL()
        goForwardR()
        goForwardL()
        turtle.turnRight()
        turtle.turnRight()
        j = j + 1
    end
end

function checkFuel()
    if turtle.getFuelLevel() < 100 then
        i = 1
        while i <= 16
        do
            turtle.select(i)        
            if turtle.getItemDetail(i) == nil and i < 16 then
                i = i + 1
            elseif (turtle.getItemDetail(i).name == "minecraft:coal" or turtle.getItemDetail(i).name == "minecraft:charcoal") and turtle.getItemCount(i) > 1 then
                print("Refueling!")
                turtle.refuel()
                break
            elseif i == 16 then 
                print("No more fuel! :(")
                while 1 do end
            elseif turtle.getItemDetail(i) ~= nil and i < 16 then
                i = i + 1
            end
        end
    end
end

function placeTorches()
    i = 1
    while i <= 16
    do
        turtle.select(i)      
        if turtle.getItemDetail(i) == nil and i < 16 then
            i = i + 1
        elseif turtle.getItemDetail(i).name == "minecraft:torch" and turtle.getItemCount(i) > 1 then
            print("Placing torches!")
            turtle.placeDown()
            break
        elseif i == 16 then
            print("No more torches! :(")
            while 1 do end
        elseif turtle.getItemDetail(i) ~= nil and i < 16 then
            i = i + 1
        end
    end
end

-- Main Code --
detectD()
j = 0
while 1
do
    ClearLeftToRight()
end
