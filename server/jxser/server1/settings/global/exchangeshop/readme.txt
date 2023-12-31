\settings\global\exchangeshop\shop.txt
说明：商店配置表
配置要点：配置商店ID，配置指定商店出售哪些商品ID
ShopId：商店ID，从1开始，依次递增
Item1~Item20：商品ID（一个商店出售商品最多数量为20个，商品ID关联\settings\global\exchangeshop\goods.txt）

使用方法：
?gm ds Include("\\script\\global\\exchangeshop\\main_s.lua")
?gm ds tbExchangeShopServer:OpenExchangeShop(nShopId) --打开指定的商店

\settings\global\exchangeshop\goods.txt
说明：商品配置表
配置要点：配置商品ID，根据具体参数情况具体配置
ItemId：商品ID，从1开始，依次递增
ItemGenre：道具常用参数，参考magicscript.txt
ItemDetailType：道具常用参数，参考magicscript.txt
ParticularType：道具常用参数，参考magicscript.txt
Level：道具常用参数，参考magicscript.txt
nCount：该商品得到的数量
SaleBeginDate：出售开始日期，可不填写
SaleEndDate：出售结束日期，可不填写
ExpiredTime：有效期，单位分钟
tbCostId：配置消耗ID（消耗ID关联\settings\global\exchangeshop\cost.txt），可以使用英文字母逗号分隔多个消耗ID，意味着该商品需要多个消耗条件
nTaskid	nBitPos	nBitCount（三列由程序开发人员配置，记录购买信息）
nMaxGetNum：最多售卖的次数
nBind：是否绑定
szComment：商品文字说明

\settings\global\exchangeshop\cost.txt
说明：消耗配置表
CostId：消耗ID，从1开始，依次递增
ParamKey：固定填写 "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE, ITEM, CUSTOM"中的一个，代表消耗类型“货币， 物品代币，任务变量代币，magicscript物品，自定义类型”
ParamDetail：（根据ParamKey的填写，再具体细分ParamDetail，代表不同含义），
如果是 ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"的值，则 ParamDetail的值为以下中一种
和\swordonline\gameworld\include\GameDataDef.h定义的枚举值一致
CURRENCYTYPE_MONEY			= 1,	// 剑侠币
CURRENCYTYPE_FUYUAN			= 2,	// 福缘
CURRENCYTYPE_COIN			= 3,	// 铜钱
CURRENCYTYPE_SCORE			= 4,	// 积分
CURRENCYTYPE_GOLDCOIN		= 5,	// 金币
CURRENCYTYPE_SLIVER			= 6,	//银币（废弃）
CURRENCYTYPE_TICKET			= 7,	//票子（废弃）
CURRENCYTYPE_YUANBAO		= 8,	//元宝（废弃）
CURRENCYTYPE_GOLDCOIN_NEW	= 9,	// 新金币，以区分与台湾的货币
CURRENCYTYPE_CONTRIBUTION	= 10,	// 贡献度
CURRENCYTYPE_HONOUR			= 11,	// 联赛荣誉点数
CURRENCYTYPE_GOLDCOIN_SCORE = 12,	// 金币积分
CURRENCYTYPE_RESPECT		= 13,	// 威望
CURRENCYTYPE_REFINING		= 14,	// 精炼石
CURRENCYTYPE_ENERGY			= 15,	// 精力
CURRENCYTYPE_ARENA_CREDITS	= 16,	// 竞技场荣誉勋章
CURRENCYTYPE_ITEM_LONGLINGQI	= 17,	// 龙令旗	6,1,3056
CURRENCYTYPE_ITEM_LINLINGQI		= 18,	// 麟令旗 6,1,3057
CURRENCYTYPE_ITEM_GUILINGQI		= 19,	// 龟令旗	6,1,3059
CURRENCYTYPE_ITEM_FENGLINGQI	= 20,	// 凤令旗	6,1,3058
CURRENCYTYPE_ITEM_WUXINGQISHI	= 21,	// 五行奇石	6,1,2125
CURRENCYTYPE_ITEM_XINGXIALING	= 22,	// 行侠令	6,1,2566
CURRENCYTYPE_TASK_SJGX			= 23,	//小宋金功勋  任务变量ID = 3450
CURRENCYTYPE_TASK_GUTA		= 24, //古塔积分 任务变量ID = 4164
CURRENCYTYPE_XINGYU			= 25,	// 星玉 星玉道具特殊处理，原本应该是定义为代币的 6,1,4546
CURRENCYTYPE_TASK_DIANQUAN	= 26,	//锦绣点券 任务变量ID = 4200

Param1：
如果 ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"，则配置为具体消耗值
Param1 == 消耗值

如果 ParamKey == "ITEM", 
Param1 == Genre值，
Param2 == nDetail值，
Param3 == nParticular值
Param4 == nLevel值
Param5 == nCount值，消耗数量

如果ParamKey == "CUSTOM",则
Param1 == 消耗值
ParamDetail == 从1开始（自定义的值，区分每一个自定的消耗，不要重复）
而且需要在\script\global\exchangeshop\cost\costcustom.lua 注册获取函数__GetValue和消耗函数__CostValue，参考案例
tbCostCustom:RegisterCostCustmonNode(ParamDetailKey, ParamDetailKeyName, __GetValue, __CostValue)
Param6：预留，暂时无用

Comment：该次消耗单元的说明，用作提示

----------------------------------------------------------------------------------------------------------------------
File thi誸 l藀 shop m韎 theo c� ch� v藅 i v藅:
\settings\global\exchangeshop\shop.txt
Thuy誸 minh: Thi誸 l藀 Shop
觤 quan tr鋘g c馻 thi誸 l藀: thi誸 l藀 ID shop, thi誸 l藀 ID nh鱪g v藅 ph萴 ch� nh s� 頲 b竛 trong shop
ShopID: ID c馻 shop, b総 u l� 1, t╪g d莕
Item1~Item20 : ID v藅 ph萴 b竛 trong shop (m閠 shop ch� c� th� b竛 t鑙 產 20 v藅 ph萴, ID v藅 ph萴 li猲 quan � \settings\global\exchangeshop\goods.txt )

Phng ph竝 s� d鬾g:
?gm ds Include("\\script\\global\\exchangeshop\\main_s.lua")
?gm ds tbExchangeShopServer:OpenExchangeShop(nShopId)
-- M� shop ch� nh

\settings\global\exchangeshop\goods.txt
Thuy誸 minh: B秐g thi誸 l藀 v藅 ph萴 b竛 trong shop
觤 quan tr鋘g c馻 thi誸 l藀: Thi誸 l藀 ID v藅 ph萴 b竛, d鵤 theo t譶h h譶h c� th� m� thi誸 l藀
ItemID: ID v藅 ph萴, b総 u t� 1, t╪g d莕
ItemGenre: Tham s� v藅 ph萴 thng d飊g, tham kh秓 magicscript.txt
ItemDetailType: Tham s� v藅 ph萴 thng d飊g, tham kh秓 magicscript.txt
ParticularType: Tham s� v藅 ph萴 thng d飊g, tham kh秓 magicscript.txt
Level: Tham s� v藅 ph萴 thng d飊g, tham kh秓 magicscript.txt
nCount: S� lng t 頲 c馻 v藅 ph萴
SaleBeginDate: Ng祔 b総 u b竛, c� th� kh玭g 甶襫
SaleEndDate: Ng祔 k誸 th骳 b竛, c� th� kh玭g 甶襫
ExpiredTime: H筺 s� d鬾g, t輓h b籲g ph髏
tbCostId: Thi誸 l藀 ID n v� ti猽 hao (ID ti猽 hao li猲 quan \settings\global\exchangeshop\cost.txt), c� th� d飊g d蕌 ph葃  ng╪ c竎h nhi襲 ID n v� ti猽 hao, � l� mua v藅 ph萴 c莕 ti猽 hao nhi襲 lo筰 t礽 nguy猲)
nTaskid	nBitPos	nBitCount (3 c閠 n祔 do ngi dev thi誸 l藀, l璾 log th玭g tin s� lng mua)
nTaskid: ID 32bit c馻 nhi謒 v�, trc m総 ch� d飊g  d� ph遪g)
(4219, 4220, 4221, 4222, 4223, 4224, 4225, 4226, 4227, 4228)
nBitPos: V� tr� b総 u
nBitCount : S� lng
nMaxGetNum: S� lng t鑙 產 b竛 ra
nBind: C� kh鉧 hay kh玭g
szComment: Thuy誸 minh c馻 v藅 ph萴 頲 b竛
Ch� �: Kh玭g h� tr� c� ch� l祄 m韎 nhi謒 v� bi課 lng, n誹 c� nhu c莡, c莕 ph秈 l祄 m韎 th� c玭g nhi謒 v� bi課 lng

\settings\global\exchangeshop\cost.txt
Thuy誸 minh:  B秐g thi誸 l藀 ti猽 hao
CostID: ID ti猽 hao, t� 1, t╪g d莕
ParamKey: 襫 c� nh
Vi誸 1 trong s� nh鱪g c竔 (CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE, ITEM, CUSTOM), tng 鴑g v韎 lo筰 ti猽 hao (ti襫 t�, v藅 ph萴 ti襫 t�, nhi謒 v� bi課 lng ti襫 t�, v藅 ph萴 magicscript, lo筰 t� nh ngh躠)

ParamDetail: (D鵤 v祇 ParamKey, sau  ti誴 t鬰 ph﹏ chi ti誸 ParamDetail, s� mang � ngh躠 kh竎 nhau),
N誹 ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE", th� ParamDetail s� 甶襫 1 trong s� nh鱪g lo筰 sau
V� \swordonline\gameworld\include\GameDataDef.h   nh ngh躠 gi� tr� th鑞g nh蕋
CURRENCYTYPE_MONEY			= 1,	// ti襫 v筺
CURRENCYTYPE_FUYUAN			= 2,	// ph骳 duy猲
CURRENCYTYPE_COIN			= 3,	// ti襫 ng
CURRENCYTYPE_SCORE			= 4,	// t輈h 甶觤
CURRENCYTYPE_GOLDCOIN		= 5,	// ti襫 v祅g
CURRENCYTYPE_SLIVER			= 6,	// ng﹏ lng (ph� b�)
CURRENCYTYPE_TICKET			= 7,	// phi誹 (ph� b�)
CURRENCYTYPE_YUANBAO		= 8,	// nguy猲 b秓 (ph� b�)
CURRENCYTYPE_GOLDCOIN_NEW	= 9,	// ti襫 v祅g m韎,  ph﹏ bi謙 v韎 ti襫 t� c馻 Уi Loan
CURRENCYTYPE_CONTRIBUTION	= 10,	// ч c鑞g hi課
CURRENCYTYPE_HONOUR			= 11,	// 觤 vinh d� li猲 u
CURRENCYTYPE_GOLDCOIN_SCORE = 12,	//  ti襫 v祅g t輈h l騳
CURRENCYTYPE_RESPECT		= 13,	// danh v鋘g
CURRENCYTYPE_REFINING		= 14,	// tinh luy謓 th筩h
CURRENCYTYPE_ENERGY			= 15,	// tinh l鵦
CURRENCYTYPE_ARENA_CREDITS	= 16,	// hu﹏ chng vinh d� c秐h k� trng
CURRENCYTYPE_ITEM_LONGLINGQI	= 17,	// long l謓h k� 	6,1,3056
CURRENCYTYPE_ITEM_LINLINGQI		= 18,	// l﹏ l謓h k� 6,1,3057
CURRENCYTYPE_ITEM_GUILINGQI		= 19,	//  quy l謓h k�	6,1,3059
CURRENCYTYPE_ITEM_FENGLINGQI	= 20,	// ph鬾g l謓h k�	6,1,3058
CURRENCYTYPE_ITEM_WUXINGQISHI	= 21,	// ng� h祅h k� th筩h	6,1,2125
CURRENCYTYPE_ITEM_XINGXIALING	= 22,	// h祅h hi謕 l謓h	6,1,2566
CURRENCYTYPE_TASK_SJGX			= 23,	//ti觰 hu﹏ chng t鑞g kim    ID nhi謒 v� bi課 lng = 3450
CURRENCYTYPE_TASK_GUTA		= 24, //t輈h 甶觤 c� th竝    ID nhi謒 v� bi課 lng = 4164
CURRENCYTYPE_XINGYU			= 25,	// Tinh ng鋍  o c� tinh ng鋍 x� l� c bi謙, v鑞 d� 頲 nh ngh躠 l� ti襫 t�  6,1,4546
CURRENCYTYPE_TASK_DIANQUAN	= 26,	//C萴 t� 甶觤 quy觧    ID nhi謒 v� bi課 lng = 4200

N誹 ParamKey == "CURRENCY, CURRENCYITEM, CURRENCYTASKVALUE"  thi誸 l藀 v藅 ph萴 ti猽 hao c� th�
Param1 == gi� tr� ti猽 hao

N誹 ParamKey == "ITEM",
Param1 == gi� tr� Genre#
Param2 == gi� tr� nDetail#
Param3 == gi� tr� nParticular
Param4 == gi� tr� nLevel
Param5 == gi� tr� nCount#s� lng ti猽 hao

N誹 ParamKey == "CUSTOM"
Param1 == gi� tr� ti猽 hao
ParamDetail == b総  u t� 1 (gi� tr� t� nh ngh躠, chia t鮪g lo筰 ti猽 hao t� nh ngh躠 ra, kh玭g n猲 tr飊g l苝)
Ngo礽 ra, � \script\global\exchangeshop\cost\costcustom.lua c莕 ph秈 ng k� nh薾 tham s� __GetValue v� __CostValue,
tham kh秓 tbCostCustom:RegisterCostCustmonNode(ParamDetailKey, ParamDetailKeyName, __GetValue, __CostValue)
Param6#в d� ph遪g, t筸 th阨 kh玭g d飊g n
Comment: thuy誸 minh lo筰 ti襫 t� ti猽 hao, d飊g  hi觧 th� nh綾 nh�.

Tham kh秓 c竎h s� d鬾g shop bang h閕 - h� th鑞g bang h閕 m韎 t筰:
\script\activitysys\config\52\extend.lua
Include("\\script\\global\\exchangeshop\\main_s.lua")
function pActivity:OpenShop()
    ...
    tbExchangeShopServer:OpenExchangeShop(1)
    ...
end