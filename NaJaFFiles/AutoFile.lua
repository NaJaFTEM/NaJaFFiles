local function AutoFile(msg)
local text = msg.content_.text_
if Sudo(msg) then
if text == 'تفعيل النسخه التلقائيه' or text == 'تفعيل جلب نسخه الكروبات' or text == 'تفعيل عمل نسخه للمجموعات' then   
Dev_Ali(msg.chat_id_,msg.id_, 1, "⌁︙تم تفعيل جلب نسخة الكروبات التلقائيه\n⌁︙سيتم ارسال نسخه تلقائيه للكروبات كل يوم الى خاص المطور الاساسي", 1, 'md')
DevAli:del(NaJaF.."Ali:Lock:AutoFile")
end
if text == 'تعطيل النسخه التلقائيه' or text == 'تعطيل جلب نسخه الكروبات' or text == 'تعطيل عمل نسخه للمجموعات' then  
Dev_Ali(msg.chat_id_,msg.id_, 1, "⌁︙تم تعطيل جلب نسخة الكروبات التلقائيه", 1, 'md')
DevAli:set(NaJaF.."Ali:Lock:AutoFile",true) 
end 
end

if (text and not DevAli:get(NaJaF.."Ali:Lock:AutoFile")) then
Time = DevAli:get(NaJaF.."Ali:AutoFile:Time")
if Time then 
if Time ~= os.date("%x") then 
local list = DevAli:smembers(NaJaF..'Ali:Groups') 
local BotName = (DevAli:get(NaJaF.."Ali:NameBot") or 'بروكس')
local GetJson = '{"BotId": '..NaJaF..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevAli:get(NaJaF.."Ali:Groups:Links"..v)
Welcomes = DevAli:get(NaJaF..'Ali:Groups:Welcomes'..v) or ''
AliConstructors = DevAli:smembers(NaJaF..'Ali:AliConstructor:'..v)
BasicConstructors = DevAli:smembers(NaJaF..'Ali:BasicConstructor:'..v)
Constructors = DevAli:smembers(NaJaF..'Ali:Constructor:'..v)
Managers = DevAli:smembers(NaJaF..'Ali:Managers:'..v)
Admis = DevAli:smembers(NaJaF..'Ali:Admins:'..v)
Vips = DevAli:smembers(NaJaF..'Ali:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #AliConstructors ~= 0 then
GetJson = GetJson..'"AliConstructors":['
for k,v in pairs(AliConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..NaJaF..'.json', "w")
File:write(GetJson)
File:close()
local ALLII = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. ALLII .. '" -F "chat_id='..DevId..'" -F "document=@'..NaJaF..'.json' .. '" -F "caption=⌁︙نسخه تلقائيه تحتوي على ↫ '..#list..' مجموعه"'
io.popen(curl)
io.popen('fm -fr '..NaJaF..'.json')
DevAli:set(NaJaF.."Ali:AutoFile:Time",os.date("%x"))
end
else 
DevAli:set(NaJaF.."Ali:AutoFile:Time",os.date("%x"))
end
end

end
return {
NaJaF = AutoFile
}