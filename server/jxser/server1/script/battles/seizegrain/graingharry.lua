IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

-- 运粮车
-- Param3	粮车阵营
-- Param4	粮车剩余粮食包的数量

function main()
	local npcidx = GetLastDiagNpc();
	local ncount = GetNpcParam(npcidx, 4);
	local ngharry_camp = GetNpcParam(npcidx, 3);
	local n_gharry_x = GetNpcParam(npcidx, 1);
	local n_gharry_y = GetNpcParam(npcidx, 2);
	-- 该旗同时被另一个人拿走了，则不再操作
	if (ncount == 0 ) then
		return
	end;
	
	-- 不是在进行中
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("graingharry Event error, because Mission no Start, yet");
		return 
	end
	
	local n_player_camp = GetCurCamp();
	local W,X1,Y1 = GetWorldPos();
	X1 = floor(X1 / 8);
	Y1 = floor(Y1 / 16);
	
	if (ngharry_camp == GetCurCamp()) then	-- 同属阵营的 可以搬运
	-- 玩家已经在运粮时，不能拿另一袋
		if (BT_GetData(PL_PARAM3) ~= 0) then
			Msg2Player("B筺 產ng v薾 chuy觧 m閠 bao lng, kh玭g th� mang th猰 bao lng kh竎?");
			return
		end
		-- 减少一个粮车中粮食包的数量
		ncount = ncount - 1;
		SetNpcParam(npcidx,4,ncount);
		--1341
		--1342
		if (ngharry_camp == 1) then
			ChangeOwnFeature(0,0,1341);	-- 改变玩家形象为运粮包的样子
		else
			ChangeOwnFeature(0,0,1342);	-- 改变玩家形象为运粮包的样子
		end
		
		BT_SetData(PL_PARAM3, 1);
		
		Msg2Player("B筺 產ng v竎 m閠 bao lng, h穣 mau ch鉵g v薾 chuy觧 n <color=yellow>B秐 doanh<color> phe m譶h.");
		
		if (n_player_camp == 1) then
			Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T鑞g<color=yellow>%s<color=0x00FFFF> t筰 <color=yellow>%d, %d<color=0x00FFFF> 畂箃 頲 Bao lng, 產ng quay v� <color=yellow>B秐 doanh",
										GetName(),X1,Y1))
			AddSkillState(460, 1, 0, 1000000 ) --颜色光环，分辩敌我
		else
			Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t筰 <color=yellow>%d, %d<color=0x9BFF9B> 畂箃 頲 Bao lng, 產ng quay v� <color=yellow>B秐 doanh",
											GetName(),X1,Y1))
			AddSkillState(461, 1, 0, 1000000 ) --颜色光环，分辩敌我
		end
		
		AddSkillState(656,30,0,100000) --降玩家的速度
	else									-- 对立阵营的火石烧毁
		local n_flint = CalcItemCount(3, 6, 1, 1763,-1);	-- 背包中的火石数量
		if (n_flint > 0) then
			ConsumeItem(-1,1,6,1,1763,-1);	-- 删除玩家一个火石
			ncount = 0;						-- 销货粮食车
			SetNpcParam(npcidx, 4, 0);
			delnpcsafe(npcidx);
			n_new_npcidx = sf_addgharry(ngharry_camp, n_gharry_x, n_gharry_y, 1);
			if (n_new_npcidx > 0) then
				AddNpcSkillState(n_new_npcidx, 705, 1,0, 10080)
				
				if (n_player_camp == 1) then
					Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T鑞g <color=yellow>%s<color=0x00FFFF> t筰 <color=yellow>%d, %d<color=0x00FFFF>  thi猽 h駓 1 Xe lng.",
												GetName(),X1,Y1));
				else
					Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim <color=yellow>%s<color=0x9BFF9B> t筰 <color=yellow>%d, %d<color=0x9BFF9B>  thi猽 h駓 1 Xe lng.",
												GetName(),X1,Y1));
				end
			end
			return 0;
		else
			Msg2Player("C莕 c� <color=yellow>H醓 th筩h<color> m韎 c� th� thi猽 h駓 Xe lng.");
		end
	end
	
	if (ncount <= 0)  then
		delnpcsafe(npcidx);
	end
end;


-- 死亡
function OnDeath( nNpcIndex )
	local State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	
	--如果是死于其它Npc则不统计排行
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end;
	
	bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK5, GetCurCamp()))-- 加积分 烧毁相当于杀一个大将
	
	BT_SortLadder();
	BT_BroadSelf();
end;
