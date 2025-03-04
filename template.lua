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
  getfenv().auto = (state and true or false)
  wait(1)
  workspace.Gravity = getfenv().grav
  while getfenv().auto do
    task.wait()
  local chr = game.Players.LocalPlayer.Character
  local car = chr.Humanoid.SeatPart.Parent.Parent
    if not workspace:FindFirstChild("justapart") then
      local new = Instance.new("Part",workspace)
      new.Name = "justapart"
      new.Size = Vector3.new(10000,20,10000)
      new.Anchored = true
      new.Position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position+Vector3.new(0,1000,0)
  end
  car:PivotTo(workspace:FindFirstChild("justapart").CFrame*CFrame.new(0,7,1000))
  local pos = workspace:FindFirstChild("justapart").CFrame*CFrame.new(0,7,-1000)
  repeat task.wait()
    local speed =  getfenv().speed or 300
    local accel = 300
    workspace.Gravity = 500
            car.PrimaryPart.Velocity = Vector3.new(car.PrimaryPart.Velocity.X,-100,car.PrimaryPart.Velocity.Z) 
    car:PivotTo(CFrame.new(car.PrimaryPart.Position,Vector3.new(pos.X,car.PrimaryPart.Position.Y,pos.Z)))
            car.PrimaryPart.Velocity = Vector3.new(car.PrimaryPart.Velocity.X,-100,car.PrimaryPart.Velocity.Z) 
    car.PrimaryPart.AssemblyLinearVelocity = car.PrimaryPart.CFrame.LookVector*speed
    car.PrimaryPart.Velocity = Vector3.new(car.PrimaryPart.Velocity.X,-100,car.PrimaryPart.Velocity.Z) 
  until game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(pos.X,pos.Y,pos.Z)) < 200 or getfenv().test == false
  end
  end)
tab1.newToggle("Auto open VW", "Auto open VW! (prints the state)", false, function(state)
getfenv().open = (state and true or false)
while getfenv().open do
task.wait()
game:GetService("ReplicatedStorage").Remotes.Services.VolkswagenEventServiceRemotes.ClaimFreePack:InvokeServer()
end
 end)
tab1.newToggle("Race test", "Auto open VW! (prints the state)", false, function(state)
            _G.racetest = (state and true or false)
            while _G.racetest do
                wait()
            if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
                local chr = game.Players.LocalPlayer.Character
            local car = chr.Humanoid.SeatPart.Parent.Parent
             car:PivotTo(CFrame.new(162.18893432617188, 603.7154541015625, 6352.375))
            chr.Head.Anchored = true
            wait(1)
            chr.Head.Anchored = false
            wait(1)
workspace.Races.RaceHandler.StartLobby:FireServer("Race")
            task.wait(15)
workspace.Races.Race.Script.Vote:FireServer("10", "Vote")
            repeat wait()
            until game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true or _G.racetest == false
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
            for i =1,50 do
workspace.Races.Race.Script.Checkpoint:FireServer(i)
end
end
end
end)
tab1.newInput("Input", "Prints your input.", function(text)
    print("Entered text in Tab 1: " .. text)
end)



-- Create the second tab with a different image ID
local tab2 = DrRayLibrary.newTab("Events !", "ImageIdLogoHere")

-- Add elements to the second tab
tab2.newLabel("Hello, this is Tab 2.")
tab2.newButton("Button", "Prints Hello!", function()
    print('Hello!')
end)
tab2.newToggle("Toggle", "Toggle! (prints the state)", true, 

function ()

end)
tab2.newDropdown("Dropdown", "Select one of these options!", {"water", "dog", "air", "bb", "airplane", "wohhho", "yeay", "delete"}, function(selectedOption)
    print(selectedOption)
end)
tab.newInput("Input", "Prints your input.", function(text)
    print("Entered text: " .. text)
end)
tab.newSlider("Slider", "Epic slider", 1000, false, function(num)
    print(num)
end)
