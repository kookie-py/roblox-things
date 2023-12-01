---------- loading stuff
local lib = require(game.ReplicatedStorage.Library)
local PetsData = require(game.ReplicatedStorage.__DIRECTORY.Pets["Grab All Pets"])
local Network = require(game.ReplicatedStorage.Library.Client.Network)
local Fire = Network.Fire
local Invoke = Network.Invoke
local old
old = hookfunction(getupvalue(Fire, 1), function(...)
    return true
end)
local data = lib.Save.Get(game.Players.LocalPlayer)

local trade_id

-- get trade history
local tradehistory = data.TradeHistory2

-- get pets
local InventoryPets = data.Pets

-- get diamonds
local diamonds = data.diamonds

-- bank deposit
local pets_uids = {}
local diamonds_amount = 123
Invoke("Bank Deposit", bankID, {uids}, diamonds_amount)

-- get bank info
local bank = Invoke("Get Bank", bankID)
local bank_pets = bank.Storage.Pets
local bank_diamond = bank.Storage.Currency.Diamonds

-- get trade
local trade = counter = Invoke("Get Trade", trade_id)
local counter = trade.counter

-- ready trade
ok = Invoke("Ready Trade", trade_id, counter) -- returns true/false

-- decline trade
Invoke("Cancel Trade", trade_id)

-- add pet to trade
Invoke("Add Trade Pet", trade_id, "pet_uid")

-- change diamonds amount in trade
Invoke("Change Trade Diamonds", trade_id, 1234)

-- trade successful or not (event)
Network.Fired("Trade Processed"):Connect(function(a, b)
    if a == true then -- completed
        print("Trade successful")
    else
        print("Trade failed")
    end
end)

-- trade tab opened (when trade request is accepted event)
-- the parameters (a,b) hold more info
Network.Fired("Init Trade"):Connect(function(a, b)
    trade_id = a
    local traderUsername = b.target.Name
    print(a, b)
end)

-- whenever pets or diamonds are updated in the trade
-- the parameters (a,b) hold more info
Network.Fired("Update Trade"):Connect(function(a, b)
    print(a, b)
end)

-- trade cancelled (event)
Network.Fired("Trade Cancelled"):Connect(function(a, b)
    local traderUsername = b
    print(a, b)
end)