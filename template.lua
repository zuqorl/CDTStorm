-- Load the DrRay library from the GitHub repository Library
local DrRayLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/zuqorl/CDTStorm/refs/heads/main/Uidesign.lua"))()

-- Create a new window and set its title and theme
local window = DrRayLibrary:Load("CDTStorm", "Default")

-- Create the first tab with an image ID
local tab1 = DrRayLibrary.newTab("Information", "ImageIdHere")

-- Add elements to the first tab
tab1.newLabel("Information's Tab")
tab1.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
tab1.newToggle("Toggle", "Toggle! (prints the state)", false, function(state)
  local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local car = Humanoid.SeatPart.Parent.Parent

local auto = false
local currentSpeed = 0
local maxSpeed = 200 -- Set your desired max speed
local acceleration = 50 -- Speed increase per second
local gravity = 500 -- Adjust gravity as needed

function toggleAuto(state)
    auto = state and true or false
    wait(1)
    workspace.Gravity = gravity

    if not workspace:FindFirstChild("justapart") then
        local new = Instance.new("Part", workspace)
        new.Name = "justapart"
        new.Size = Vector3.new(10000, 20, 10000)
        new.Anchored = true
        new.Position = Character.HumanoidRootPart.Position + Vector3.new(0, 1000, 0)
    end

    local pos = workspace:FindFirstChild("justapart").CFrame * CFrame.new(0, 7, -1000)

    while auto do
        task.wait()
        updateVelocity()

        -- Move the car
        car:PivotTo(CFrame.new(car.PrimaryPart.Position, Vector3.new(pos.X, car.PrimaryPart.Position.Y, pos.Z)))
        car.PrimaryPart.Velocity = Vector3.new(car.PrimaryPart.Velocity.X, -100, currentSpeed)
        
        if LocalPlayer:DistanceFromCharacter(Vector3.new(pos.X, pos.Y, pos.Z)) < 200 then
            break
        end
    end
end

function updateVelocity()
    if currentSpeed < maxSpeed then
        currentSpeed = math.min(currentSpeed + acceleration * task.wait(), maxSpeed) -- Increase speed
    end
end

-- Example usage
toggleAuto(true) -- Call this function to start the auto-driving
tab1.newInput("Input", "Prints your input.", function(text)
    print("Entered text in Tab 1: " .. text)
end)


-- Create the second tab with a different image ID
local tab2 = DrRayLibrary.newTab("Tab 2", "ImageIdLogoHere")

-- Add elements to the second tab
tab2.newLabel("Hello, this is Tab 2.")
tab2.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
tab2.newToggle("Toggle", "Toggle! (prints the state)", true, function(toggleState)
    if toggleState then
        print("On")
    else
        print("Off")
    end
end)
tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)
    print(selectedOption)
end)
