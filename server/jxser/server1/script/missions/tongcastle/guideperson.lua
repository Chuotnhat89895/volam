Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\missions\\tongcastle\\tongcastle.lua")

--3399个人神木点
TSK_TREEPOINT = 3399

local tbTreeItem = {
	[1] = {szName = "Thanh уng Th莕 M閏 L謓h", nId = 3205, nPrice = 10,},
	[2] = {szName = "B筩h Ng﹏ Th莕 M閏 L謓h", nId = 3206, nPrice = 100,},
	[3] = {szName = "Ho祅g Kim Th莕 M閏 L謓h", nId = 3207, nPrice = 1000,},
}
--(n为占领城市:凤翔 1,成都 2,大理 3,汴京 4,襄阳 5,扬州 6,临安 7)
local tbCity = {
	[1]   = {1,	978},
	[11]  = {2,	979},
	[162] = {3, 980},
	[37] 	= {4, 981},
	[78] 	= {5,	982},
	[80] 	= {6, 983}, 
	[176] = {7, 984},
}

local tbTranPos = {
	{1638, 3851},
	{1647, 3174},
	{917,	3106},
	{983, 3884},
}

local tbGuideNpc = 
{
		szName = "Ngi ch� d蒼 bang h閕 th祅h b秓",
		nNpcId = 108,
		nLevel = 95,
		tbPos = 
		{		
				{176, 1663, 3262,},
				{11, 3191, 5188,},
				{78, 1592, 3373,},
				{1, 1647, 3276,},
				{162, 1689, 3268,},
				{37, 1701, 3216,},
				{80, 1720, 3217,},
		},
		szScriptPath = "\\script\\missions\\tongcastle\\guideperson.lua",
}

local tbGuideNpcInside = 
{
		szName = "Ngi ch� d蒼 bang h閕 th祅h b秓",
		nNpcId = 108,
		nLevel = 95,
		tbPos = 
		{		
			{978,1093,3223},
			{978,1029,3285},
			{978,1050,3718},
			{978,1114,3780},
			{978,1506,3766},
			{978,1572,3704},
			{978,1562,3321},
			{978,1499,3260},
			{978,1331,3492},

			{979,1093,3223},
			{979,1029,3285},
			{979,1050,3718},
			{979,1114,3780},
			{979,1506,3766},
			{979,1572,3704},
			{979,1562,3321},
			{979,1499,3260},
			{979,1331,3492},

			{980,1093,3223},
			{980,1029,3285},
			{980,1050,3718},
			{980,1114,3780},
			{980,1506,3766},
			{980,1572,3704},
			{980,1562,3321},
			{980,1499,3260},
			{980,1331,3492},

			{981,1093,3223},
			{981,1029,3285},
			{981,1050,3718},
			{981,1114,3780},
			{981,1506,3766},
			{981,1572,3704},
			{981,1562,3321},
			{981,1499,3260},
			{981,1331,3492},

			{982,1093,3223},
			{982,1029,3285},
			{982,1050,3718},
			{982,1114,3780},
			{982,1506,3766},
			{982,1572,3704},
			{982,1562,3321},
			{982,1499,3260},
			{982,1331,3492},
			
			{983,1093,3223},
			{983,1029,3285},
			{983,1050,3718},
			{983,1114,3780},
			{983,1506,3766},
			{983,1572,3704},
			{983,1562,3321},
			{983,1499,3260},
			{983,1331,3492},

			{984,1093,3223},
			{984,1029,3285},
			{984,1050,3718},
			{984,1114,3780},
			{984,1506,3766},
			{984,1572,3704},
			{984,1562,3321},
			{984,1499,3260},
			{984,1331,3492},
		},
		szScriptPath = "\\script\\missions\\tongcastle\\guideperson_inside.lua",
}
local szDlgText = "<npc>Ch祇 c竎 b筺, t玦 l� ngi ch� d蒼 bang h閕 th祅h b秓"
szDlgText = szDlgText.."<enter>1. Th阨 gian m� Th祅h B秓 Bang H閕 l� t� 18:00 n 01:00 th� 4, th� 7, ch� nh藅 h祅g tu莕, trong  Nh﹏ T� Ph遪g m� 18:00, мa T� Ph遪g m� 20:00, Thi猲 T� Ph遪g m� 23:40 m�."
szDlgText = szDlgText.."<enter>2. Nh鱪g th祅h vi猲 chi誱 l躰h Th祅h B秓 c� th� ng g莕 c筺h Th莕 Th� s� d鬾g Tri謚 H錳 Ph� tri謚 h錳 ra Th� V�, mua Th� V� Tri謚 H錳 Ph� c莕 c� 300 甶觤 Th莕 M閏. "
function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = %szDlgText
	tbDailog:AddOptEntry("Ta mu鑞 v祇 bang h閕 th祅h b秓 th祅h n祔", EnterCastle, {nNpcIndex})
	tbDailog:AddOptEntry("Ta mu鑞 nh薾 Th莕 M閏 L謓h", ExchangeTreePoint, {})
	tbDailog:AddOptEntry("Ta mu鑞 nh薾 bang h閕 th祅h b秓 Th� V� tri謚 h錳  ph�", ApplyGuardToken)
	tbDailog:AddOptEntry("Ta mu鑞 xem s� 甶觤 th莕 m閏 c馻 m譶h", GetTreePoint)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog:Show()
end

function GetTreePoint()
	local nTreePoint = GetTask(TSK_TREEPOINT)
	Talk(1, "", format("S� 甶觤 th莕 m閏 c馻 ngi l� %d 甶觤", nTreePoint))
end

function ApplyGuardToken()
	g_AskClientNumberEx(1, 100, "Nh藀 v祇 s� lng mu鑞 nh薾", {GiveGuardToken, {}})
end

function GiveGuardToken(nCount)
	local nPrice = 200
	local nTreePoint = GetTask(TSK_TREEPOINT)
	if CalcFreeItemCellCount() < ceil(nCount/50) then
		Talk(1, "", "Ch� tr鑞g h祅h trang kh玭g .")
		return
	end
	if nTreePoint < nPrice*nCount then
		Talk(1, "", "觤 th莕 m閏 c馻 ngi kh玭g ")
		return
	end
	SetTask(TSK_TREEPOINT, nTreePoint-nPrice*nCount)
	local tbAward = {
		{szName = "Bang h閕 th祅h b秓 Th� V� tri謚 h錳 ph�", tbProp = {6, 1, 3204, 1, 0, 0}, nCount = nCount,},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Nh薾 頲 bang h閕 th祅h b秓 Th� V� tri謚 h錳 ph�")
end

function CreateGuideNpc()
	local tbNpc = %tbGuideNpc
	local nPosPathCount = getn(%tbGuideNpc.tbPos)
	for i = 1, nPosPathCount do
		local nMapId, nX, nY = unpack(%tbGuideNpc.tbPos[i])
		basemission_CallNpc(tbNpc, nMapId, nX*32, nY*32)
	end
end

function CreateGuideNpcInside()
	local tbNpc = %tbGuideNpcInside
	local nPosPathCount = getn(%tbGuideNpcInside.tbPos)
	for i = 1, nPosPathCount do
		local nMapId, nX, nY = unpack(%tbGuideNpcInside.tbPos[i])
		basemission_CallNpc(tbNpc, nMapId, nX*32, nY*32)
	end
end

function EnterCastle(nNpcIndex)
	local szTongName = GetTongName()
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "Ngi v蒼 ch璦 gia nh藀 bang h閕, kh玭g th� v祇")
		return
	end
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local nCityId = %tbCity[nMapId][1]
	local szCityTong, _ = GetCityOwner(nCityId)
	if szCityTong == nil or szCityTong == "" then
		Talk(1, "", "Th祅h n祔 t筸 th阨 kh玭g c� bang h閕 chi誱 gi�, kh玭g th� v祇 bang h閕 th祅h b秓 th祅h n祔")
		return
	end
	local nWeek = tonumber(GetLocalDate("%w"))
	local bOpend = TongCastle:IsInOpenTime("personroom")
	if not bOpend then
		--Talk(1, "", "今天举行七城大战，帮会城堡暂时关闭。")
		Talk(1, "", "Th阨 gian m� Th祅h B秓 Bang H閕 l� t� 18:00 n 01:00 th� 4, th� 7, ch� nh藅 h祅g tu莕, c竎 th阨 gian kh竎 ngo礽 th阨 gian tr猲 th� kh玭g th� 甀 v祇.")
		return
	end
	local nTransMapId = %tbCity[nMapId][2]
	local szTongName = GetTongName()
	local _, nTmpX, nTmpY = GetWorldPos()
	SetTempRevPos(nMapId, nTmpX*32, nTmpY*32)	
	if szCityTong == szTongName then
		NewWorld(nTransMapId, 1311, 3515)
	else
		local nX, nY = unpack(%tbTranPos[random(1, getn(%tbTranPos))])
		NewWorld(nTransMapId, nX, nY)
	end
end

function ExchangeTreePoint()
	local nX32,nY32, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local szTongMaster = GetTongMaster()
	local szTongName = GetTongName()
	local szPlayerName = GetName()
	if szTongMaster ~= szPlayerName then
		Talk(1, "", "Ch� c� bang ch� m韎  c� th� s� d鬾g t輓h n╪g n祔")
		return
	end
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, nMapId)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:GetCurTreePoint", handle)
	OB_Release(handle)
end


function ExchangeDialog(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		local szTitle = format("S� 甶觤 th莕 m閏 bang h閕 c遪 l筰:%d", nSumTreePoint)
		local nMaxCount = 100
		local tbOpt = {}
		for i = 1, getn(%tbTreeItem) do
			local szOption = format("Nh薾 %s", %tbTreeItem[i].szName)
			tinsert(tbOpt, {szOption, g_AskClientNumberEx, {1, nMaxCount, "Nh藀 v祇 s� lng mu鑞 nh薾", {ApplyTreeToken, {nMapId, i, %tbTreeItem[i].nPrice}}}})
		end
		tinsert(tbOpt, {"K誸 th骳 i tho筰"})
		CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle, tbOpt)
	end
end

function ApplyTreeToken(nMapId, nType, nPrice, nCount)
	if CalcFreeItemCellCount() < ceil(nCount/50) then
		Talk(1, "", "Ch� tr鑞g h祅h trang kh玭g .")
		return
	end
	local szPlayerName = GetName()
	local szTongName = GetTongName()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, nMapId)
	ObjBuffer:PushObject(handle, nPrice)
	ObjBuffer:PushObject(handle, nCount)
	ObjBuffer:PushObject(handle, nType)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:DelTreePoint", handle)
	OB_Release(handle)
end

function GiveTreeToken(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nMapId = ObjBuffer:PopObject(ParamHandle)
	local nCount = ObjBuffer:PopObject(ParamHandle)
	local nType = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		if nCount <= 0 then
			CallPlayerFunction(nPlayerIndex, Talk, 1, "", "觤 th莕 m閏 kh玭g , kh玭g th� i l謓h b礽")
		else
			local szItemName = %tbTreeItem[nType].szName
			local nItemId = %tbTreeItem[nType].nId
		 	local tbAward = {
		 		{szName = szItemName, tbProp = {6, 1, nItemId, 1, 0, 0}, nCount = nCount,},
		 	}
		 	CallPlayerFunction(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbAward, format("Nh薾 頲 %s", szItemName))
		end
	end
end

--(n为占领城市:凤翔 1,成都 2,大理 3,汴京 4,襄阳 5,扬州 6,临安 7)
function TestGetCurTreePoint()
	local szTongName = GetTongName()
	if szTongName == nil or szTongName == "" then
		Msg2Player("Kh玭g c� bang h閕")
		return
	end
	local szPlayerName = GetName()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:TestGetCurTreePoint", handle)
	OB_Release(handle)
end

function TestShowTreePoint(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local nSumTreePoint = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, format("<color=yellow>%d<color>甶觤 th莕 m閏 hi謓 t筰", nSumTreePoint))
	end
end

function TestGetTongTreePoint()
	local szTongName = GetTongName()
	if szTongName == nil or szTongName == "" then
		Msg2Player("Kh玭g c� bang h閕")
		return
	end
	local szPlayerName = GetName()
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, szPlayerName)
	ObjBuffer:PushObject(handle, szTongName)
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:TestGetTreePoint", handle)
	OB_Release(handle)
end

function ResHaha(ParamHandle)
	local szPlayerName = ObjBuffer:PopObject(ParamHandle)
	local szMsg = ObjBuffer:PopObject(ParamHandle)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
	end
end

--AutoFunctions:Add(CreateGuideNpc)
--AutoFunctions:Add(CreateGuideNpcInside)
