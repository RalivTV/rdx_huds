RDX = nil

TriggerEvent('rdx:getSharedObject', function(obj) RDX = obj end)

function getAccounts(data, xPlayer)
	local result = {}
	for i=1, #data do
		if(data[i] ~= 'money') then
			if(data[i] == 'black_money') and not Config.showBlackMoney then
				result[i] = nil
			else
				result[i] = xPlayer.getAccount(data[i])['money']
			end

		else
			result[i] = xPlayer.getMoney()
		end
	end
	return result
end

function tableIncludes(table, data)
	for _,v in pairs(table) do
		if v == data then
			return true
		end
	end
	return false
end

local allowedGrades = {
	'boss',
	'underboss'
}

RegisterServerEvent('poggu_hud:retrieveData')
AddEventHandler('poggu_hud:retrieveData', function()
	local xPlayer = RDX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local money,bank,black_money = table.unpack(getAccounts({'money', 'bank', 'black_money'}, xPlayer))

		local society = nil
		if tableIncludes(allowedGrades, xPlayer.job.grade_name) then
			TriggerEvent('rdx_society:getSociety', xPlayer.job.name, function(data)
				if data ~= nil then
					TriggerEvent('rdx_addonaccount:getSharedAccount', data.account, function(account)
							society = account['money']
					end)
				end
			end)
		end
	  TriggerClientEvent('poggu_hud:retrieveData', source, {cash = money, bank = bank, black_money = black_money, society = society})
	end
end)

--[[
RDX.RegisterServerCallback('poggu_hud:retrieveData', function(source, cb)
	local xPlayer = RDX.GetPlayerFromId(source)

	if xPlayer ~= nil then
		local money,bank,black_money = table.unpack(getAccounts({'money', 'bank', 'black_money'}, xPlayer))

		local society = nil
		if tableIncludes(allowedGrades, xPlayer.job.grade_name) then
			TriggerEvent('rdx_society:getSociety', xPlayer.job.name, function(data)
				if data ~= nil then
					TriggerEvent('rdx_addonaccount:getSharedAccount', data.account, function(account)
							society = account['money']
					end)
				end
			end)
		end
	  cb({cash = money, bank = bank, black_money = black_money, society = society})
	end
end)
]]--