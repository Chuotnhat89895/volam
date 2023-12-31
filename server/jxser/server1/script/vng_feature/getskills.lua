--江湖豪侠礼包道具脚本
--2012.09

Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\lib\\log.lua")
--Include("\\script\\misc\\eventsys\\type\\npc.lua")
tbFaction = 
{
	["emei"] = 1,
	["tangmen"]   = 2,
	["tianwang"] = 3,
	["tianren"] = 4,
	["wudang"] = 5,
	["cuiyan"] = 6,
	["shaolin"] = 7,
	["gaibang"]   = 8,
	["kunlun"] = 9,
	["wudu"] = 10,
}

function SetSkills(szFaction)
	--Th猰 k� n╪g, th猰 danh hi謚
	if szFaction == "emei" then
		for i=1,7 do add_em(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(64)

	elseif szFaction == "tangmen" then
		for i=1,7 do add_tm(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(76)

	elseif szFaction == "tianwang" then
		for i=1,7 do add_tw(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(69)
	elseif szFaction == "tianren" then
		for i=1,7 do add_tr(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(81)

	elseif szFaction == "wudang" then
		for i=1,7 do add_wd(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(73)

	elseif szFaction == "cuiyan" then
		for i=1,7 do add_cy(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(67)

	elseif szFaction == "shaolin" then
		for i=1,7 do add_sl(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(72)

	elseif szFaction == "gaibang" then
		for i=1,7 do add_gb(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(78)

	elseif szFaction == "kunlun" then
		for i=1,7 do add_kl(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(75)

	elseif szFaction == "wudu" then
		for i=1,7 do add_wu(i*10) end
		--X璶g hi謚 m玭 ph竔
		SetRank(80)

	else
		Msg2Player("Kh玭g c� m玭 ph竔 kh玭g th� s� d鬾g")
		return nil
	end

	--T葃 甶觤, h鋍 khinh c玭g
	local nDodgePoint = HaveMagic(210)		-- Khinh c玭g, thao t竎 kh竎
	local nRollBackPoint = RollbackSkill()

	local nAddPoint = 0
	if(nDodgePoint ~= -1) then
		nAddPoint = nRollBackPoint - nDodgePoint
	else
		nAddPoint = nRollBackPoint
		AddMagic(210,1)
	end

	AddMagicPoint(nAddPoint)
	if (nDodgePoint ~= -1) then AddMagic(210,nDodgePoint) end			-- N誹  h鋍 qua khinh c玭g ph秈 tr� v� ng c蕄 trc 
end

--Thi誸 t h祄 s� bi課 lng li猲 quan
function SetAllTasks(szFaction)
	--Thi誸 t tr筺g th竔 nhi謒 v� m玭 ph竔
	SetTask(tbFaction[szFaction], 70*256)
	--Thi誸 t bi課 lng nhi謒 v� khinh c玭g
	SetTask(32,80)
end

--Cho h祄 s� li猲 quan n ph莕 thng
function GiveAllAwards(szFaction)
	--Cho s竎h k� n╪g 90
	--PlayerFunLib:GetItem({tbProp={6,1,2426,1,0,0}, nBindState = -2,},1,"[江湖豪侠礼包]使用礼包给予物品")



	--Cho danh v鋘g
	--AddRepute(570)
	--Cho 甶觤 l穘h o
	--AddLeadExp(2222000)
	
	--Cho k� n╪g, t葃 甶觤
	SetSkills(szFaction)

	--thi誸 t m玭 ph竔, tr薾 doanh li猲 quan
	SetFaction("")
	SetCamp(4)
end

-- Nh藀 h祄 s� item
function VnGetSkill_main()

	local szFaction = GetFaction()

	--Ph竛 畂竛  tr飊g sinh hay ch璦
--	if ST_IsTransLife() == 1 then
--		Msg2Player(format("Ch� c� i hi謕 ch璦 tr飊g sinh m韎 頲 ph衟 nh薾 k� n╪g"))
--		return 1
--	end
	
	if GetLevel() < 120 then
		Msg2Player("Ъng c蕄 kh玭g , c莕 ph秈 tr猲 120 m韎 頲 ph衟 nh薾 k� n╪g.")
		return
	end
	
	--Ph竛 畂竛 l�  xu蕋 s� hay ch璦
	if tbFaction[szFaction] == nil or GetTask(tbFaction[szFaction]) >= 70*256 then
		Msg2Player(format("Ch� c� i hi謕 ch璦 xu蕋 s� m韎 頲 nh薾 k� n╪g"))
		return 1
	end

	--Ph竛 畂竛 B� Tuy襫 Chi Th駓
--	if CalcItemCount(-1, 6, 1, 2427, -1) < 5 then
--		Msg2Player(format("C莕 ph秈 c� 5 c竔 B� Tuy襫 Chi Th駓 m韎 m� 頲 l� bao n祔"))
--		return 1
--	end
	
	
	--Ph竛 畂竛 kh玭g gian h祅h trang
--    if PlayerFunLib:CheckFreeBagCell(34,"H祅h trang c馻 i hi謕 kh玭g  ch� tr鑞g , c莕 ph秈 c� 34 � tr鑞g (trong  輙 nh蕋 ph秈 c� 1 kho秐g tr鑞g 2*3)") ~= 1 
--	   or PlayerFunLib:CheckFreeBagCellWH(2, 3, 1, "default") ~= 1 then
--	   
--	   return 1;
--    	end
	
	--if ConsumeItem(-1, 5, 6, 1, 2427, -1) == 1 then
		%SetAllTasks(szFaction)
		%GiveAllAwards(szFaction)
		tbLog:PlayerActionLog("NhanKyNang","NhanKyNangThanhCong")
		--Ho祅 th祅h t蕋 c� thao t竎,  ngi ch琲 ra kh醝 tr� ch琲
		KickOutPlayer(GetName())

		--return nil
	--end

	--Msg2Player("M� l� bao th蕋 b筰.")
	--return 1	
end

--pEventType:Reg("Chi課 T﹎ T玭 Gi�", "Nh薾 k� n╪g c蕄 10 n 60", VnGetSkill_main)