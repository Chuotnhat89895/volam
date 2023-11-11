function TaskShedule()
	TaskName( "Chi�n d�ch qu�c chi�n T�ng Kim 21:00" );
	TaskInterval( 1440 );
	TaskTime( 20, 50 );
	TaskCountLimit( 0 );
	OutputMsg("[Start] Qu�c Chi�n T�ng Kim 21:00 Th� 2 H�ng Tu�n");
end

function TaskContent()
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		
		if CW_GetOccupant(4) == CW_GetOccupant(7) then
			local szMsg  = format("Chi�u c�o thi�n h�:\"%s\" ��ng th�i chi�m l�nh c� L�m An l�n Bi�n Kinh, bang ch� c� th� tr�c ti�p ��ng c� th�nh thi�n t�!", CW_GetOccupant(4));
			local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
			GlobalExecute(szNews);
			
			for i = 0,10 do
				NW_SetTask(i, 0);
			end
			NW_Abdicate();		
			NW_SetTask(0, 1);
			return
		end
		
		local szMsg  = format("Ti�n tuy�n m�t b�o! T�ng qu�c \"%s\" v� Kim Qu�c \"%s\" tranh �o�t ng�i v� Thi�n T� �� b�t ��u, xin m�i c�c t��ng s� h�y ��n ch� b�o danh T�ng Kim ph�a m�nh �� tham chi�n!", CW_GetOccupant(7), CW_GetOccupant(4));
		local szNews = format("dw AddLocalCountNews([[%s]], 2)", szMsg);
		GlobalExecute(szNews);
		Battle_StartNewRound( 2, 3 );
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
