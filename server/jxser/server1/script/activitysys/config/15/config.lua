Include("\\script\\activitysys\\config\\15\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Load NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"NpcFunLib:AddDialogNpc",	{tbLvTongXinPos.szName,tbLvTongXinPos.nId,tbLvTongXinPos} },
		--{"NpcFunLib:AddDialogNpc",	{tbShiJianZongGuanPos.szName,tbShiJianZongGuanPos.nId,tbShiJianZongGuanPos} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "NPC LvTongXin dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbLvTongXinPos.szName},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia t譵 nguy猲 li謚",3} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "nil",
	szName = "Open flipcard",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   tham gia ho箃 ng, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "NPC ShiJianZongGuan dialog",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T鎛g Qu秐 S� Ki謓"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("H頿 th祅h %s", tbAward_1.szName),5} },
		{"AddDialogOpt",	{format("H頿 th祅h %s", tbAward_2.szName),6} },
		{"AddDialogOpt",	{format("H頿 th祅h %s", tbAward_3.szName),12} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Compose award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_1.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   tham gia ho箃 ng, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
		{"AddOneMaterial",	{tbMaterail_4.szName,tbMaterail_4,1} },
		{"AddOneMaterial",	{tbMaterail_5.szName,tbMaterail_5,1} },
		{"AddOneMaterial",	{tbMaterail_1.szName,tbMaterail_1,1} },
		{"AddOneMaterial",	{tbMaterail_3.szName,tbMaterail_3,1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H頿 th祅h th蕋 b筰, h祅h trang c馻 c竎 h� kh玭g  � tr鑞g."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_1,1,EVENT_LOG_TITLE,"GhepQuocKhanhVang"} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Compose award_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_2.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   tham gia ho箃 ng, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
		{"AddOneMaterial",	{tbMaterail_4.szName,tbMaterail_4,1} },
		{"AddOneMaterial",	{tbMaterail_5.szName,tbMaterail_5,1} },
		{"AddOneMaterial",	{tbMaterail_1.szName,tbMaterail_1,1} },
		{"AddOneMaterial",	{tbMaterail_6.szName,tbMaterail_6,1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H頿 th祅h th蕋 b筰, h祅h trang c馻 c竎 h� kh玭g  � tr鑞g."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_2,1,EVENT_LOG_TITLE,"GhepQuocKhanhDo"} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "Use award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   s� d鬾g o c�, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
		{"ThisActivity:CheckTask",	{TSKI_AWARD_NUM_1,MAX_USE_LIMIT_AWARD_1,"C竎 h� s� d鬾g Qu鑓 Kh竛h (v祅g)  t n 1000 c竔, kh玭g th� ti誴 t鬰 s� d鬾g.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh玭g gian h祅h trang c馻 ngi kh玭g ."} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKI_AWARD_NUM_1,1} },
		{"ThisActivity:UseAward1",	{EXP_OPEN_AWARD_1} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Use award_2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_2},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   s� d鬾g o c�, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
		{"ThisActivity:CheckTask",	{TSKI_AWARD_NUM_2,MAX_USE_LIMIT_AWARD_2,"C竎 h� s� d鬾g Qu鑓 Kh竛h ()  t n 2000 c竔, kh玭g th� ti誴 t鬰 s� d鬾g.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{4,"Kh玭g gian h祅h trang c馻 ngi kh玭g ."} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTask",	{TSKI_AWARD_NUM_2,1} },
		{"ThisActivity:UseAward2",	{EXP_OPEN_AWARD_2} },
	},
}
tbConfig[9] = --一个细节
{
	nId = 9,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"PlayerFunLib:GetItem",	{tbMaterail_4,10,"",""} },
	},
}
tbConfig[10] = --s� d鬾g t骾 qu� m鮪g Qu鑓 Kh竛h
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Use award_1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_4},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   s� d鬾g o c�, h穣 c� g緉g luy謓 t藀 th猰.",">="} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh玭g gian h祅h trang c馻 ngi kh玭g ."} },
	},
	tbActition = 
	{		
		{"PlayerFunLib:GetItem",	{tbMaterail_2,5,EVENT_LOG_TITLE,"SuDungTuiMungQuocKhanh"} },
	},
}
tbConfig[11] = --s� d鬾g qu鑓 khanh xanh
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Use award_3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   s� d鬾g o c�, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{BITTSK_AWARD_NUM_3,MAX_USE_LIMIT_AWARD_3,"Х t n gi韎 h筺, kh玭g th� s� d鬾g ti誴","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Kh玭g gian h祅h trang c馻 ngi kh玭g ."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {BITTSK_AWARD_NUM_3, 1}},
		{"PlayerFunLib:AddExp",	{EXP_OPEN_AWARD_3,0,EVENT_LOG_TITLE,"SuDungQuocKhanhXanh"} },
	},
}
tbConfig[12] = --一个细节
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Compose award_3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {tbAward_3.szName,1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"Ъng c蕄 c馻 c竎 h� kh玭g   tham gia ho箃 ng, h穣 c� g緉g luy謓 t藀 th猰.",">="} },
		{"AddOneMaterial",	{tbMaterail_2.szName,tbMaterail_2,1} },
		{"AddOneMaterial",	{tbAward_1.szName,tbAward_1,1} },		
		{"PlayerFunLib:CheckFreeBagCell",	{1,"H頿 th祅h th蕋 b筰, h祅h trang c馻 c竎 h� kh玭g  � tr鑞g."} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{tbAward_3,1,EVENT_LOG_TITLE,"GhepQuocKhanhXanh"} },
	},
}