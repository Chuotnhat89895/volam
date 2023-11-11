Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	-- 设置方案名称
	TaskName("SevenCityWar close signup")
	TaskInterval(24 * 60)
	TaskTime(19, 0)
	TaskCountLimit(0)
	-- 输出启动消息
	OutputMsg("[Start][SEVENCITY] k誸 th骳 ghi danh th蕋 th祅h i chi課 19:00")
end

function TaskContent()
	local day = tonumber(date("%w"))
	-- 周五
	if (day == 5) then
		RemoteExecute(
			REMOTE_SCRIPT,
			"RelayProtocol:CloseSignup",
			0)
		OutputMsg("[SEVENCITY] k誸 th骳 ghi danh th蕋 th祅h i chi課")
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
