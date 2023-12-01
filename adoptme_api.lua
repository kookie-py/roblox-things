local load = require(game.ReplicatedStorage:WaitForChild("Fsys")).load;
local router = load("RouterClient");
local clientdata = load("ClientData");

-- items database
local inventory = load("InventoryDB")

-- get local player inventory
local inventoryTable = clientdata.get('inventory')

-- get local player trade history
local tradesHistoryTable = router.get("TradeAPI/GetTradeHistory"):InvokeServer()

-- get trade state & info
local tradeInfo = clientdata.get("trade")

-- send trade
router.get("TradeAPI/SendTradeRequest"):FireServer(game.Players:FindFirstChild("playerName"))

-- decline trade
router.get("TradeAPI/DeclineTrade"):FireServer()

-- add item to trade
router.get("TradeAPI/AddItemToOffer"):FireServer("itemUniID")

-- accept trade (part 1)
router.get("TradeAPI/AcceptNegotiation"):FireServer()

-- accept/confirm trade (part 2)
router.get("TradeAPI/ConfirmTrade"):FireServer()

-- lock/unlock house
router.get("HousingAPI/SetDoorLocked"):InvokeServer(true) -- true/false
