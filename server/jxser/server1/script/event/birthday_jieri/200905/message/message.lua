-- 越南资料片生日活动
Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")
tbBirthday0905_msg_award =
{
	[1]	= {szName="B� Vng Thng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 2},
	[2]	= {szName="B� Vng Thng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[3]	= {szName="B� Vng Thng", tbProp={6, 1, 2071, 1, 0, 0}, nCount = 1},
	[4]	= {szName="Thi猲 T祅 o", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 1},
	[5]	= {szName="Thi猲 T祅 o", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 2},
	[6]	= {szName="Thi猲 T祅 o", tbProp={6, 1, 2072, 1, 0, 0}, nCount = 3},
	[7]	= {szName="H� Nh藅 Cung", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1 },
	[8]	= {szName="H� Nh藅 Cung", tbProp={6, 1, 2073, 1, 0, 0}, nCount = 1},
};
tbBirthday0905_msg_tskgoal =
{
	500, 6,100,100,1,1,2,100,
};

function birthday0905_settask_message(nIdx)
	if (nIdx == 0) then
		return
	end
	
	if (GetLevel() < 120) then
		Say("D辌h Quan: Чi hi謕 ch璦  甶襲 ki謓  nh薾 nhi謒 v� n祔", 0);
		return
	end
	
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	if (ntskid == 0) then
		if (ntskdate ~= ndate) then
			Say("D辌h Quan: Чi hi謕 h穣 c� g緉g vt qua th� th竎h n祔!", 0);
			SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, nIdx);
		else
			Say("D辌h Quan: Чi hi謕  ho祅 th祅h  s� lng nhi謒 v� trong ng祔 h玬 nay r錳. Ng祔 sau h穣 quay l筰 nh�.", 0);
		end
	else
		if (ntskid == nIdx) then
			Say("D辌h Quan: Чi hi謕  nh薾 nhi謒 v� n祔 r錳.", 0);
		else
			Say("D辌h quan: M閠 l莕 ch�  c� th� nh薾 頲 1 nhi謒 v� t輓 s�.", 0);
		end
	end
end

function birthday0905_gettask_message(nIdx)
	local ndate 	= tonumber(GetLocalDate("%y%m%d"));
	local ntskid 	= GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk);
	local ntskdate	= GetTask(tbBirthday0905.tbTask.tsk_msg_date+nIdx); 
	local ntskcount	= GetTask(tbBirthday0905.tbTask.tsk_msg_needcount);
	if (ntskid ~= nIdx) then
		Say("D辌h quan: Ngi v蒼 ch璦 nh薾 nhi謒 v� n祔.", 0);
		return
	end
	
	if (ntskcount < tbBirthday0905_msg_tskgoal[nIdx]) then
		Say("D辌h Quan: Ngi kh玭g  s鴆 m筺h v� l遪g tin  vt qua th� th竎h n祔 sao?", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 10) then
		Say("D辌h quan: в b秓 m s� an to祅 cho v藅 ph萴, xin m阨 h穣  h祅h trang th鮝 10 � tr鑞g.", 0);
		return
	end
	
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0);
	SetTask(tbBirthday0905.tbTask.tsk_msg_date + nIdx, ndate);
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("D辌h Quan: L祄 t鑤 l緈, y l� ph莕 thng x鴑g ng d祅h cho i hi謕!", 0);
	tbAwardTemplet:GiveAwardByList(tbBirthday0905_msg_award[nIdx], "Hoat dong SNVLTK_Phan thuong nhiem vu tin su")
end

function birthday0905_cancel_message()
	local ntsk 	= tbBirthday0905.tbTask.tsk_msg_curtsk;
	if (GetTask(tbBirthday0905.tbTask.tsk_msg_curtsk) == 0) then
		Say("D辌h quan: Hi謓 t筰 i hi謕 v蒼 ch璦 nh薾 nhi謒 v� m�!", 0);
		return
	end
	SetTask(tbBirthday0905.tbTask.tsk_msg_curtsk, 0)
	SetTask(tbBirthday0905.tbTask.tsk_msg_needcount, 0);
	Say("D辌h quan: Чi hi謕  h駓 b� th祅h c玭g nhi謒 v� hi謓 t筰!", 0);
end