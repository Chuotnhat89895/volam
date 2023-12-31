-- 文件名　：bossbaoxiang.lua
-- 创建者　：wangjingjun
-- 内容　　：道具boss宝箱使用脚本
-- 创建时间：2011-08-29 11:44:06

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	[1]={szName="у Ph� T� M穘g Kh玦",tbProp={6,1,2714,1,0,0},nRate = 1.1,},
	[2]={szName="у Ph� T� M穘g Y",tbProp={6,1,2715,1,0,0},nRate = 1.1,},
	[3]={szName="у Ph� T� M穘g Y猽 Цi",tbProp={6,1,2717,1,0,0},nRate = 1.1,},
	[4]={szName="у Ph� T� M穘g H� Uy觧",tbProp={6,1,2718,1,0,0},nRate = 1.1,},
	[5]={szName="у Ph� T� M穘g H筺g Li猲",tbProp={6,1,2719,1,0,0},nRate = 0.5,},
	[6]={szName="у Ph� T� M穘g B閕",tbProp={6,1,2720,1,0,0},nRate = 0.5,},
	[7]={szName="у Ph� T� M穘g H礽",tbProp={6,1,2716,1,0,0},nRate = 0.7,},
	[8]={szName="у Ph� T� M穘g Thng Gi韎 Ch�",tbProp={6,1,2721,1,0,0},nRate = 0.3,},
	[9]={szName="у Ph� T� M穘g H� Gi韎 Ch�",tbProp={6,1,2722,1,0,0},nRate = 0.3,},
	[10]={szName="у Ph� T� M穘g Kh� Gi韎",tbProp={6,1,2723,1,0,0},nRate = 0.1,},
	[11]={szName="T� M穘g L謓h",tbProp={6,1,2350,1,0,0},nRate = 0.05,},
	[12]={szName="Ch譨 Kh鉧 Nh� �",tbProp={6,1,2744,1,0,0},nRate = 1,},
	[13]={nExp_tl=1,nRate = 39.29,nCount = 1500000,},
	[14]={nExp_tl=1,nRate = 32.14,nCount = 3000000,},
	[15]={nExp_tl=1,nRate = 16,nCount = 5000000,},
	[16]={nExp_tl=1,nRate = 2,nCount = 8000000,},
	[17]={nExp_tl=1,nRate = 1,nCount = 12000000,},
	[18]={nExp_tl=1,nRate = 0.2,nCount = 15000000,},
	[19]={nExp_tl=1,nRate = 0.1,nCount = 20000000,},
	[20]={szName="Ti猲 Th秓 L� c bi謙",tbProp={6,1,1181,1,0,0},nRate = 1,},
	[21]={szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3208,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
	[22]={szName="B筩h C﹗ Ho祅 c bi謙",tbProp={6,1,1157,1,0,0},nRate = 0.02,},
	[23]={szName="Ho祅g Kim 蕁 (Cng h鉧)",tbProp={0,3218,},nQuality=1,nRate = 0.2,nExpiredTime = 30 * 24 * 60,},
}

function main(nIndexItem)
	nWidth = 1
	nHeight = 1
	nFreeItemCellLimit = 1
	-- 判定如意钥匙是否存在
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("C莕 c� ch譨 kh鉧 Nh� � m韎 c� th� m� B秓 Rng Boss!", 1, "сng/no")
		return 1
	end
	
	local Genre, DetailType, Particular=GetItemProp(nIndexItem)
	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	
	ConsumeItem(3, 1, 6, 1, 2744, -1)	-- 消耗如意钥匙
	tbAwardTemplet:Give(%tbAward, 1, {"GoldBoss", "use_bossBox"})
	
	return 0
end