-- 炎帝的宝藏比赛定时器
--每天下午2点到下午12点整点触发

Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\leaguematch\\timetable.lua")
Include("\\script\\leaguematch\\head.lua")


function TaskShedule()
	TaskName("YANDIBAOZANG");	
	local nStartHour = tonumber(date("%H")) + 1;
	if (nStartHour == 23) then
		nStartHour = 0;
	end;
	TaskTime(nStartHour, 25);
	TaskInterval(60); 
	TaskCountLimit(0);
	OutputMsg("=======================================================")
	OutputMsg("[Start]		Vi猰 д B総 u V祇 C竎 Gi�");
	OutputMsg("	08:25 - 10:25 - 12:25 - 14:25 ");
	OutputMsg("	16:25 - 18:25 - 20:25 - 22:25 ");
end

function TaskContent()
	local TB_YDBZ_DATE_START =
	{
		8,10,12,14,16,18,20,22,
	}
	local nhour = tonumber(date("%H"))
	for nindex,ndate_hour in TB_YDBZ_DATE_START do
		if (nhour == ndate_hour) then
--			if gb_GetModule("YANDIBAOZANG") == 1 and gb_GetModule("YANDIBAOZANG_TALK") == 1 then
				OutputMsg("[YANDIBAOZANG]"..tonumber(date("%H"))..":55 StartSignUp...");
				--GlobalExecute("dw LoadScript([[\\settings\\trigger_challengeoftime.lua]])");
				GlobalExecute("dwf \\script\\missions\\yandibaozang\\yandibaozang_trigger.lua YDBZ_OnTrigger()");
				szMsg = "Ho箃 ng vt 秈 b秓 t祅g vi猰   b総 u b竜 danh r錳, m鋓 ngi h穣 nhanh ch鉵g n B譶h B譶h c� nng � Bi謓 Kinh  ng k� nh�, th阨 gian b竜 danh l� 5 ph髏."
				GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
--			end
			break;
		end
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end