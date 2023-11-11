-- 钱庄功能.lua		卖红包的标准文件
-- By Dan_Deng(2003-12-31)
-- Update: Dan_Deng(2004-01-06) 将银票功能移出到临安钱庄独有

function main_proc()
	if (GetSex() == 0) then
		Say("ng r錳! Thi誹 hi謕 c莕 g�?",2,"� y c� bao l� x� kh玭g? /buy_sele","Nh﹏ ti謓 gh� qua th玦/no")
	else
		Say("ng r錳! N� hi謕 c莕 g�?",2,"� y c� bao l� x� kh玭g? /buy_sele","Nh﹏ ti謓 gh� qua th玦/no")
	end
end
------------ 买红包 ---------------------
function buy_sele()
	--Say("钱庄老板：我这里的红包富丽臃荣，礼重情更重，最是送礼上品，小红包10000两，大红包100000两，以及<color=green>如意红包和贺岁红包。\n如意红包<color>是由客倌您自己决定包多少钱的红包。\n<color=green>贺岁红包<color>是可以包<color=yellow>铜钱<color>的红包，当然红包中铜钱数量还是由您定。",5,"要个小红包吧/buy1","来个大红包/buy2","要如意红包/ruyi_hongbao","要贺岁红包/hesui_hongbao","不要了/no")
	Say("Ti觰 H錸g bao 10000 lng, Чi H錸g Bao 100000 lng. Kh竎h quan mu鑞 lo筰 n祇?",3,"Mu鑞 1 bao l� x� nh�. /buy1","Mu鑞 1 bao l� x� l韓. /buy2","Kh玭g c莕 u. /no")
end

function buy1()
	if (GetCash() >= 10000) then
		Pay(10000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","Ti觰 H錸g Bao 1 c竔!  Xin nh薾 l蕐! ")
	else
		Talk(1,"","Kh竎h quan h譶h nh� ch璦  ti襫.")
	end
end

function buy2()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","Чi H錸g Bao 1 c竔!  Xin nh薾 l蕐! ")
	else
		Talk(1,"","Kh竎h quan h譶h nh� ch璦  ti襫.")
	end
end

function no()
end

function hesui_hongbao()	--自定义铜钱
	AskClientForNumber("Package_Hesui", 1, 100, "Xin nh藀 v祇 s� lng Ti襫 ng:");
end
function Package_Hesui(nMoney)
	if (CalcEquiproomItemCount(4, 417, 1, 1) < nMoney) then
		Talk(1,"","Kh竎h quan kh玭g  "..nMoney.." ti襫 уng")
	else
		ConsumeEquiproomItem(nMoney, 4, 417, 1, -1)
		local nItem = AddItem(6,1,1052,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		SyncItem(nItem)
		Talk(1,"","M阨 kh竎h quan nh薾1 bao m鮪g th�!")
	end
end


function ruyi_hongbao()		--自定义金钱
	AskClientForNumber("Package_Ruyi", 1, 10000000, "Xin nh藀 s� ti襫 v祇 bao l� x�:");
end
function Package_Ruyi(nMoney)
	if (GetCash() < nMoney) then
		Talk(1,"","Kh竎h quan b筺 h譶h nh� kh玭g "..nMoney.." lng.")
	else
		Pay(nMoney)
		local nItem = AddItem(6,1,1051,1,0,0,0)
		SetSpecItemParam(nItem, 1, nMoney)
		local nM1 = floor(nMoney / 1000000)
		local nM2 = floor(mod(nMoney, 1000000) / 1000)
		local nM3 = mod(nMoney, 1000)
		SetSpecItemParam(nItem, 2, nM1)
		SetSpecItemParam(nItem, 3, nM2)
		SetSpecItemParam(nItem, 4, nM3)
		SyncItem(nItem)
		Talk(1,"","M阨 nh薾 bao l� x� Nh� �!")
	end
end