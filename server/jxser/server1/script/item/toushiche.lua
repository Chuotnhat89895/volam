Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--攻城战的地图ID
MSBegin = MS_TSCBEGIN;
Count = g_nMaxTscPerDoor * g_nDoorCount;
NpcTempl = 525;
NpcLevel = 60;

function main()

--看当前位置是否处在攻城战地图上
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B筺 kh玭g th� s� d鬾g H鏽 Th筩h Li謙 t筰 y ")
	return 1;
end

if (GetCurCamp() ~= 2) then 
	Msg2Player("Ch� c� phe C玭g Th祅h m韎 頲 s� d鬾g H鏽 Th筩h Li謙 ")
	return 1
end;

PosId = GetNearstPos(X*32,Y*32, TscPos);

if (PosId == 0) then 
	Say("B筺 ng c竎h H鏽 Th筩h Li謙 qu� xa, kh玭g th� s� d鬾g! ",0)
	return 1
end;

DoorId = floor( (PosId - 1) / g_nMaxTscPerDoor ) + 1;

if (GetMissionV(MS_DOORBEGIN + DoorId - 1)  ~= 0 and (mod(PosId, 3) == 2) ) then 
	Msg2Player("Th祅h m玭 ngay ph輆 trc m╰ ngi v蒼 ch璦 b� c玭g ph�, v� tr� n祔 琻g nhi猲 l� kh玭g th� d飊g 頲 H鏽 Th筩h Li謙 ")
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, TscPos[PosId][1], TscPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		Msg2MSAll(MISSIONID, GetName().."B� tr� th猰 m閠 c竔 H鏽 Th筩h Li謙, h� tr� C玭g Th祅h ");
		SetMangonelParam(ToolIndex, TscPos[PosId][3], TscPos[PosId][4], 200);
		WriteLog(GetLoop()..GetName()..":AddHSL"..ToolIndex)
		return 0
	end;
else
	Msg2Player("цi di謓 v韎 b筺  頲 b� tr� m閠 c竔 H鏽 Th筩h Li謙, t筸 th阨 kh玭g th� b� tr� th猰 n鱝 ");
	return 1
end;

return 0;
end;
