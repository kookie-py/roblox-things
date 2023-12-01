local function howManyInTable(table, value)
    local index = 0
    for k,v in pairs(table) do
        if v == value then
            index = index+1
        end
    end
    return index
end
