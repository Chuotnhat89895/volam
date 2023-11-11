Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName("SevenCityWar prepare")
	TaskInterval(24 * 60)
	TaskTime(20, 0)
	TaskCountLimit(0)
	-- 输出启动消息
	OutputMsg("[Start][SEVENCITY] Chu萵 b� b竧 u th蕋 th祅h i chi課 20:00")
end

function TaskContent()
	local day = tonumber(date("%w"))
	-- 周五
	if (day == 5) then
		BattleWorld:Clear()
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:Prepare",
			0)
		OutputMsg("[SEVENCITY] Chu萵 b� b竧 u th蕋 th祅h i chi課")
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
