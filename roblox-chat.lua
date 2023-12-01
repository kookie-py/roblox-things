-- chat message event
local Chat = game:GetService("TextChatService").TextChannels.RBXGeneral.MessageReceived
Chat:Connect(function(object)
    local msg = object.Text
    local player = tostring(object.TextSource)
    print
end)

-- send public message
game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("Hey, I sent this message.")

-- send private message
local function send_priv_msg(username, content)
    pcall(function()
        local plr = game.Players.LocalPlayer
        local trader = game.Players:FindFirstChild(username)
        local channel_instance = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXWhisper:"..plr.UserId.."_"..trader.UserId.."") or game:GetService("TextChatService").TextChannels:FindFirstChild("RBXWhisper:"..trader.UserId.."_"..plr.UserId.."")
        if channel_instance == nil then
            spawn(function()
                game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("/w "..trader.DisplayName)
            end)
            wait(0.2)
            channel_instance = game:GetService("TextChatService").TextChannels:FindFirstChild("RBXWhisper:"..plr.UserId.."_"..trader.UserId.."") or game:GetService("TextChatService").TextChannels:FindFirstChild("RBXWhisper:"..trader.UserId.."_"..plr.UserId.."")
        end
        channel_instance:SendAsync(content)
    end)
end
send_priv_msg("playerName", "Hey, I sent you a private message.")
