Include("\\script\\gb_taskfuncs.lua")
greatseed_configtab = {
	{340,3,100,"\\settings\\maps\\great_night\\莫高窟.txt","M筩 Cao Qu藅"},			--莫高窟
	{336,3,100,"\\settings\\maps\\great_night\\风陵渡.txt","Phong L╪g "},			--风陵渡
	
	{322,2,100,"\\settings\\maps\\great_night\\长白山北麓.txt","Trng B筩h s琻 B綾"},	-- 长白山北麓
	{321,2,100,"\\settings\\maps\\great_night\\长白山南.txt","Trng B筩h S琻 Nam"},		-- 长白山南
	{225,2,30,"\\settings\\maps\\great_night\\沙漠山洞1.txt","Sa M筩 1"},		-- 长白山南
	{226,2,30,"\\settings\\maps\\great_night\\沙漠山洞2.txt","Sa M筩 2"},		-- 长白山南
	{227,2,40,"\\settings\\maps\\great_night\\沙漠山洞3.txt","Sa M筩 3"},		-- 长白山南
	
	{182,1,25,"\\settings\\maps\\great_night\\孽龙洞迷宫.txt","Nghi謙 Long ng"},	-- 长白山南
	{167,1,25,"\\settings\\maps\\great_night\\点苍山.txt","觤 Thng s琻"},			-- 长白山南
	{200,1,25,"\\settings\\maps\\great_night\\古阳洞迷宫.txt","C� Dng ng"},	-- 长白山南
	{92,1,25,"\\settings\\maps\\great_night\\蜀冈山.txt","Th鬰 Cng s琻"},				-- 长白山南

	{341, 4, 1, "\\settings\\maps\\great_night\\漠北草原.txt","漠北草原"},		-- 漠北草原
	{333, 4, 1, "\\settings\\maps\\great_night\\华山派.txt","华山派"},			-- 华山派
	{319, 4, 1, "\\settings\\maps\\great_night\\临渝关.txt","临渝关"},			-- 临渝关
	{959, 4, 3, "\\settings\\maps\\great_night\\双龙洞.txt","Chi課 Long чng"},			-- 双龙洞
	{181, 4, 1, "\\settings\\maps\\great_night\\两水洞.txt","两水洞"},			-- 两水洞
};

tblantern_area = {2, 21, 167, 193}

function TaskShedule()
	TaskName("h箃 Huy Ho祅g")
	TaskTime(20	, 00);
	TaskInterval(5)
	TaskCountLimit(0)
	OutputMsg("==========================================================");
	OutputMsg("[Start] Ho箃 ng H竔 Qu� Ho祅g Kim 20:00 -> 20:30");
end

function TaskContent()
	local START_TIME = 2000;
	local END_TIME = 2030;
	
	if righttime_add() ~= 1 then
		--gb_SetTask("Ho箃 ng 'Hoa Жng'", 1, 0)
		gb_SetTask("h箃 Huy Ho祅g", 12, 0);
		return
	end;
	
	OutputMsg("Ho箃 чng Иm Huy Ho祅g H竔 Qu�")
	local nNowTime = tonumber(date("%H%M"))
	if nNowTime >= 2000 and nNowTime < 2005 then	--	
		gb_SetTask("h箃 Huy Ho祅g", 12, 0);	
	end
	local nBatch = floor(mod(nNowTime,100)/5) + 1
	local nMapCount = getn(greatseed_configtab);
	for i = 1, nMapCount do
		local strExecute = format("dw Global_GreatSeedExecute(%d, %d, %d, [[%s]], [[%s]],%d)", greatseed_configtab[i][1], greatseed_configtab[i][2], greatseed_configtab[i][3], greatseed_configtab[i][4],greatseed_configtab[i][5],nBatch);
		GlobalExecute(strExecute);
		local szMsg = "";
		if (mod(nBatch,2) == 1) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "h箃 Huy Ho祅g"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "H箃 Ho祅g Kim "
		elseif (mod(nBatch,2) == 0) and greatseed_configtab[i][2] ~= 4 then
			szMsg = "Qu� Huy Ho祅g"
		elseif greatseed_configtab[i][2] == 4 then
			szMsg = "Qu� Ho祅g Kim"
		end; 
		szMsg = format("Hi謓 t筰 <%s>  xu蕋 hi謓 t筰 %s, 5 ph髏 sau s� k誸 qu�. C竎 v� i hi謕 h穣 chu萵 b� h竔 qu�.",szMsg,greatseed_configtab[i][5]);
		GlobalExecute(format("dw AddLocalNews([[%s]])",szMsg));
	end;
end
function CreateLantern(nDate)
	if (gb_GetTask("Ho箃 ng 'Hoa Жng'", 2) == 0 or gb_GetTask("Ho箃 ng 'Hoa Жng'", 2) ~= nDate) then
		lantern_area = tblantern_area[ random( getn(tblantern_area) ) ]
		gb_SetTask("Ho箃 ng 'Hoa Жng'", 1, lantern_area)
		gb_SetTask("Ho箃 ng 'Hoa Жng'", 2, nDate)
	end
	GlobalExecute("dw GN_Create_Lanterns()")
end
function righttime_add()
	local nTime = tonumber(date("%H%M"));
	if (nTime >= 2000 and nTime < 2030)  then
		return 1;
	end;
	return 0;
end

function goldenseedmap()
	local goldcity = random(1, 2);
	gb_SetTask("h箃 Huy Ho祅g", 1, goldcity);
	local RowIndex = random(2, 41)
	gb_SetTask("h箃 Huy Ho祅g", 2, RowIndex);
	OutputMsg("Th祅h ph� huy ho祅g"..goldcity);
	OutputMsg("goldenseedmap();"..RowIndex);
	return goldcity;
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
