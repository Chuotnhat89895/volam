-- ====================== 文件信息 ======================

-- 剑侠情缘网络版越南收费版 - 玉璧宝箱
-- 文件名　：yubi_baoxiang.lua
-- 创建者　：子非魚
-- 创建时间：2011-03-23 17:08:58

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua")

--Gi韎 h筺 甶觤 kinh nghi謒 m鏸 ng祔 l� 300tri謚 khi s� d鬾g c竎 lo筰 b秓 rng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

local tbAward = 
{
	[1]={szName="у Ph� T� M穘g Kh玦",tbProp={6,1,2714,1,0,0},nRate = 0.15,},
	[2]={szName="у Ph� T� M穘g Y",tbProp={6,1,2715,1,0,0},nRate = 0.15,},
	[3]={szName="у Ph� T� M穘g Y猽 Цi",tbProp={6,1,2717,1,0,0},nRate = 0.15,},
	[4]={szName="у Ph� T� M穘g H� Uy觧",tbProp={6,1,2718,1,0,0},nRate = 0.15,},
	[5]={szName="у Ph� T� M穘g H筺g Li猲",tbProp={6,1,2719,1,0,0},nRate = 0.01,},
	[6]={szName="у Ph� T� M穘g B閕",tbProp={6,1,2720,1,0,0},nRate = 0.15,},
	[7]={szName="у Ph� T� M穘g H礽",tbProp={6,1,2716,1,0,0},nRate = 0.15,},
	[8]={szName="у Ph� T� M穘g Thng Gi韎 Ch�",tbProp={6,1,2721,1,0,0},nRate = 0.15,},
	[9]={szName="у Ph� T� M穘g Kh� Gi韎",tbProp={6,1,2723,1,0,0},nRate = 0.01,},
	[10]={szName="у Ph� T� M穘g H� Gi韎 Ch�",tbProp={6,1,2722,1,0,0},nRate = 0.01,},
	[11]={szName="T� M穘g L謓h",tbProp={6,1,2350,1,0,0},nRate = 0.1,},
	[12]={szName="Huy襫 Vi猲 L謓h",tbProp={6,1,2351,1,0,0},nRate = 0.2,},
	[13]={szName="M苩 n� Nguy猲 so竔",tbProp={0,11,447,1,0,0},nRate = 0.2,},
	[14]={szName="B竎h Ni猲 Tr﹏ L�",tbProp={6,1,2266,1,0,0},nRate = 0.5,},
	[15]={szName="V筺 Ni猲 Tr﹏ L�",tbProp={6,1,2268,1,0,0},nRate = 0.2,},
	[16]={szName="Thi猲 Ni猲 Tr﹏ L�",tbProp={6,1,2267,1,0,0},nRate = 0.3,},
	[17]={szName="Th莕 H祅h Ph�",tbProp={6,1,1266,1,0,0},nExpiredTime=20160,nRate = 0.1,},
--Gi韎 h筺 甶觤 kinh nghi謒 m鏸 ng祔 l� 300tri謚 khi s� d鬾g c竎 lo筰 b秓 rng - Modified by DinhHQ - 20110428
--	[18]={nExp=1,nRate = 48.72,nCount = 1500000,},
--	[19]={nExp=1,nRate = 30.0,nCount = 2000000,},
--	[20]={nExp=1,nRate = 5.0,nCount = 5000000,},
--	[21]={nExp=1,nRate = 3.0,nCount = 10000000,},
--	[22]={nExp=1,nRate = 2.0,nCount = 20000000,},
--	[23]={nExp=1,nRate = 1.0,nCount = 50000000,},
	[18]={szName="觤 kinh nghi謒 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(1500000, "Ng鋍 B輈h B秓 Rng")
				end,
				nRate = 48.72,
			},
	[19]={szName="觤 kinh nghi謒 2", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "Ng鋍 B輈h B秓 Rng")
				end,
				nRate = 30.0,
			},
	[20]={szName="觤 kinh nghi謒 3", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(5000000, "Ng鋍 B輈h B秓 Rng")
				end,
				nRate = 5.0,
			},
	[21]={szName="觤 kinh nghi謒 4", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(10000000, "Ng鋍 B輈h B秓 Rng")
				end,
				nRate = 3.0,
			},
	[22]={szName="觤 kinh nghi謒 5", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(20000000, "Ng鋍 B輈h B秓 Rng")
				end,
				nRate = 2.0,
			},
	[23]={szName="觤 kinh nghi謒 6", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(50000000, "Ng鋍 B輈h B秓 Rng")
				end,
				nRate = 1.0,
			},

	[24]={szName="Ch譨 Kh鉧 Nh� �",tbProp={6,1,2744,1,0,0},nRate = 1.0,},
	[25]={szName="H鏽 Nguy猲 Linh L�",tbProp={6,1,2312,1,0,0},nRate = 0.2,},
	[26]={szName="Ng鋍 Qu竛",tbProp={6,1,2311,1,0,0},nRate = 0.4,},
	[27]={szName="C萴 nang thay i tr阨 t",tbProp={6,1,1781,1,0,0},tbParam = {60}, nRate = 5.0,},
	[28]={szName="Ti猲 Th秓 L� c bi謙",tbProp={6,1,1181,1,0,0},nRate = 1.0,},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)
	
	-- 判定如意钥匙是否存在
	local nCount = CalcItemCount(3, 6, 1, 2744, -1) 
	if nCount == 0 then
		Say("Ph秈 c� Ch譨 Kh鉧 Nh� � m韎 m� 頲 Ng鋍 B輈h B秓 Rng", 1, "сng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("в b秓 m t礽 s秐 c馻 i hi謕, xin h穣  tr鑞g %d %dx%d h祅h trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end
	if ConsumeItem(3, 1, 6, 1, 2744, -1) == 1 then	-- 消耗如意钥匙
		tbAwardTemplet:GiveAwardByList(%tbAward, "use yubi_baoxiang", 1);
	end
	return 0
end
