-- 昆仑 弟子 童夕颜 入门任务
-- by：Dan_Deng(2003-07-30)
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\dailogsys\\dailog.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta n t譵 玭g c� vi謈 kh竎", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end
function old_main()
	UTask_kl = GetTask(9)
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 1) then
			Talk(2,"Uworld31_get_Monkey","Ti觰 th�! Con Kim T� H莡 n祔 d� thng qu�! T苙g cho c� y!","T� gi�  c� ngi ch琲 v韎 ta r錳! Hihi! D� thng qu�! Ta mang cho cha ta xem!")
		else
			Talk(1,"","B総 kh� c� d� kh玭g?")
		end
	elseif (Uworld31 == 0) and (GetFaction() ~= "kunlun") and (GetLevel() >= 10) then		--入门任务
		Say("Ta t� b� n l韓 v蒼 ch璦 ra kh醝 C玭 L玭, cha ta n鉯 ngi b猲 ngo礽 r蕋 x蕌, kh玭g cho ta qua l筰 v韎 nh鱪g ngi ! Ta c� n n ch誸 頲! Nghe n鉯 r鮪g 'Kho竔 Ho箃' c� r蕋 nhi襲 kh�, n誹 c� 頲 1 con Kim t� h莡 ch琲 v韎 ta th� t鑤 bi誸 ch鮪g n祇! Ngi c� th� b総 cho ta 1 con kh玭g",2,"Kh玭g th祅h v蕁 !/enroll_get_yes","Ta c� th� kh玭g c� th阨 gian 甶 b総 kh� /enroll_get_no")
	elseif (Uworld31 >= 20) then
		Talk(1,"","Kim T� h莡 th鵦 l� d� thng! Ta r蕋 th輈h n�!")
	else
		Talk(1,"","Th� gi韎 b猲 ngo礽 nh� th� n祇 nh�?")
	end
end;

function Uworld31_get_Monkey()
	DelItem(8)
	Uworld31 = SetByte(GetTask(31),2,20)
	SetTask(31,Uworld31)
	Msg2Player("уng T辌h Nhan r蕋 th輈h nh薾 con Kim T� H莡 m� b筺  b総 頲. ")
	AddNote("уng T辌h Nhan r蕋 th輈h nh薾 con Kim T� H莡 m� b筺  b総 頲. ")
end

function enroll_get_yes()
	Talk(1,"","B総 1 con kh� c� g� l� kh�! Ta s� 甶 b総 y!")
	Uworld31 = SetByte(GetTask(31),2,10)
	SetTask(31,Uworld31)
	Msg2Player("Nh薾 nhi謒 v�: Gi髉 уng T辌h Nhan n Kho竔 Ho箃 l﹎ b総 1 con Kim T� H莡 ")
	AddNote("Nh薾 nhi謒 v�: Gi髉 уng T辌h Nhan n Kho竔 Ho箃 l﹎ b総 1 con Kim T� H莡 ")
end;

function enroll_get_no()
end;
