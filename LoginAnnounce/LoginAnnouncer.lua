--[[
    Azerothcore 和 Trinitycore Eluna 3.3.5a 的登录公告
    Discord: elperroblack#6996
]]

local GameMasterAnnouncement = true -- false = 忽略GM
local strings = {
    serverName = "LoginAnnouncer  ",
    faction = {
        [0] = "|cff0000FF联盟|r",
        [1] = "|cffFF0000部落|r"
    },
    colorClass = {
        [1] = "|cffC79C6E", -- 战士
        [2] = "|cffF58CBA", -- 圣骑士
        [3] = "|cffABD473", -- 猎人
        [4] = "|cffFFF569", -- 盗贼
        [5] = "|cffFFFFFF", -- 牧师
        [6] = "|cffC41F3B", -- 死亡骑士
        [7] = "|cff0070DE", -- 萨满
        [8] = "|cff69CCF0", -- 法师
        [9] = "|cff9482C9", -- 术士
        [11] = "|cffFF7d0A" -- 德鲁伊
    }
}
local icons = {
    faction = {
        [0] = "|TInterface/icons/Inv_Misc_Tournaments_banner_Human:13|t", -- 联盟
        [1] = "|TInterface/icons/Inv_Misc_Tournaments_banner_Orc:13|t" -- 部落
    },
    gameMaster = "|TInterface/icons/Mail_GMIcon:13:20|t", -- GM
    logo = "|TInterface/ICONS/Temp:15|t " -- 魔兽世界标志
}

local function LoginAnnouncer(eventid, delay, repeats, player)
    local msg
    if GameMasterAnnouncement and player:GetGMRank() >= 1 then
            msg = icons.logo ..strings.serverName ..icons.gameMaster .."|cff2ECCFA" ..player:GetName() .."|r " .. "在线。|r"
    else
        if player:GetGMRank() < 1 then
            msg = icons.logo ..strings.serverName ..icons.faction[player:GetTeam()] ..strings.colorClass[player:GetClass()] ..player:GetName() .."|r "  .."在线。|r"
        end
    end
    if msg then
        SendWorldMessage(msg)
    end
end

local function OnLogin(event, player)
    player:RegisterEvent(LoginAnnouncer, 3000)
end
RegisterPlayerEvent(3, OnLogin)