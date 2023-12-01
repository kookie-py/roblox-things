-- connect to ws
local ws = WebSocket.connect("ws://127.0.0.1:8070")

-- ws on_message event
ws.OnMessage:Connect(function(Msg)
    print(Msg)
end)
ws.OnClose:Wait()

-- send data
js_data = {
    ["content"] = content,
    ["embeds"] = nil,
    ["attachments"] = {}
}
local data = {
    ["Url"] = "https://discord.com/api/v10/webhooks/"..webhook.."/messages/"..message.."",
    ["Method"] = "PATCH",
    ["Headers"] = {["Content-Type"] =  "application/json"},
    ["Cookies"] = "",
    ["Body"] = game:GetService('HttpService'):JSONEncode(js_data),
}
local dataJS = game:GetService('HttpService'):JSONEncode(data)
ws:Send(dataJS)

-- close ws
ws:Close()
