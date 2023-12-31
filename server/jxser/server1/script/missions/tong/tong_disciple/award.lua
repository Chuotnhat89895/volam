-- 奖励.lua (帮会招募弟子活动)
if (not __DIS_AWARD_H__) then
	__DIS_AWARD_H__ = 1;
Include([[\script\missions\tong\tong_disciple\head.lua]]);
IncludeLib("FILESYS");
SFHD_DATAFILE = [[\settings\tong\workshop\huodong_level_data.txt]];

dis_tabExp = {
2000000,
2000000,
2000000,
1500000,
1500000,
1500000,
1000000,
1000000,
1000000,
500000
};

dis_tabRate = {
	{0, 0.69, 0.27, 0.04},
	{0, 0.83, 0.14, 0.03},
	{0, 0.86, 0.13, 0.01},
	{0, 0.85, 0.15, 0},
	{0, 0.9, 0.1, 0},
	{0, 0.95, 0.05, 0},
	{0.27, 0.68, 0.05, 0},
	{0.37, 0.59, 0.04, 0},
	{0.61, 0.36, 0.03, 0},
	{0.72, 0.26, 0.02, 0}
};


function disciple_aword(nTongID, nWorkshopID)
	if (GetTaskTemp(193) == 1) then
		return
	end;
	SetTaskTemp(193, 1);
	--获得活动坊等级
	local nLevel = TWS_GetLevel(nTongID, nWorkshopID);
	if (nLevel < 1 or nLevel > 10) then
		Say("Bang h閕 c馻 b筺 ch璦 x﹜ d鵱g T竎 Phng n祔.", 1, "Ta bi誸 r錳!/oncancel")
		return 0;
	end;
	
	local nCount = GetTask(DIS_COUNT_ONETIME);
	local nRank = GetTask(DIS_TK_RANK);
	SetTask(DIS_COUNT_ONETIME, 0);
	SetTask(DIS_TK_RANK, 0);
	if (nCount == 0 or nRank == 0) then
		Say("T鎛g qu秐 Ho箃 ng phng: Ngi dng nh� kh玭g a  t� chi猽 m� n祇 n y.", 1, "Theo c� ph蕋 tay bay ra/oncancel");
		SetTaskTemp(193, 0);
		return
	end;
	local strSay = format("Th藅 hay qu�, ngi  chi猽 m� 頲 t蕋 c� %d <color=yellow> t�<color>, x誴 h筺g th� ", nCount, nRank);
	local isDouble = dis_double(nLevel);--看看是否获得双倍
	if (1 == isDouble) then
		strSay = strSay.."Th藅 may m緉, ngi  nh薾 頲 <color=red>ph莕 thng nh﹏ i<color>, ";
		giveaward(nRank);
	end;
	
	Describe(strSay.."Зy l� ph莕 thng d祅h cho ngi.", 1, "Nh薾 l蕐 l� v藅./oncancel");
	giveaward(nRank);
	SetTaskTemp(193, 0);
end;


function dis_double(nLevel)--是否领取双倍奖励
	local nResult = 0;
	local nSeed = random(100);
	local nRate = tonumber(GetTabFileData(SFHD_DATAFILE, nLevel + 1, 5));
	if (nSeed <= nRate * 100) then
		nResult = 1;
	end;
	return nResult;
end;

function giveaward(nRank)
	expaward(nRank);
	goodsaward(nRank);
end;

function expaward(nRank)
	AddOwnExp(dis_tabExp[nRank]);
end;

function goodsaward(nRank)
	local nGoodsType = getgoodtype(nRank);
	if (nGoodsType == 1) then
		AddItem(6, 1, 1008, 1, 0, 0, 0);
		local strsay = "B筺 nh薾 頲 m閠 h箃 Ho祅g Kim"
		Msg2Player(strsay);
	elseif (nGoodsType == 2) then
		AddItem(6, 1, 1007, 1, 0, 0, 0);
		local strsay = "B筺 nh薾 頲 m閠 h箃 Th駓 Tinh"
		Msg2Player(strsay);
	elseif (nGoodsType == 3) then
		AddItem(6, 1, 1006, 1, 0, 0, 0);
		local strsay = "B筺 nh薾 頲 m閠 h箃 Hoa h錸g"
		Msg2Player(strsay);
	elseif (nGoodsType == 4) then
		AddItem(6, 1, 1005, 1, 0, 0, 0);
		local strsay = "B筺 nh薾 頲 m閠 h箃 May m緉"
		Msg2Player(strsay);
	end;
end;

function getgoodtype(nRank)
	local nSeed = random(100);
	local nRate = {}
	local i;
	for i = 1, 4 do
		nRate[i] = dis_tabRate[nRank][i] * 100
	end;
	local nBase = 0;
	for i = 1, 4 do
		nBase = nBase + nRate[i];
		if (nBase >= nSeed) then
			return (5 - i);
		end;
	end;
end;

function onsale()

end;

function oncancel()	--取消

end;

end; --// end of __DIS_AWARD_H__