Include("\\RelaySetting\\Task\\congthanhchien\\citywar_head.lua")
function TaskShedule()
	TaskName("Dng Ch﹗ - tr薾 L玦 Уi b総 u");
	TaskSetMode(1);
	
	-- 2005年1月2号(星期日)第一次开始
	TaskSetStartDay(1, 2);

	-- 一周一个循环
	TaskInterval(7);
	
	-- 20点00分开赛
	TaskTime(20, 0);
	
	TaskCountLimit(0);
end

function TaskContent()
	-- 扬州编号为6,必须跟citywar.ini中指定的一致
	if (cw_CanStart(6,3) == 1) then
		StartArena(6);
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
