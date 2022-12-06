function meta_vip_bonus(oyuncu,kazanc)
    if not oyuncu then return end
    if not kazanc then return end
    local hesap = getAccountName ( getPlayerAccount ( oyuncu ) ) 
    for k,v in ipairs(vipler) do 
        if isObjectInACLGroup ("user."..hesap, aclGetGroup ( vipler[k][1]) ) then
            if kazanc >= vipler[k][2] then 
                local sonuc = kazanc * vipler[k][3]
                givePlayerMoney(oyuncu,sonuc)
                setTimer(function(oyuncu,para,yetki)
                   outputChatBox(yetki.." olduğunuz için "..math.floor(para).." miktarında bonus para aldınız.",oyuncu,0,255,0,false) 
                end,1500,1,oyuncu,sonuc,vipler[k][1])
                break
            end
        end
    end
end
addEvent("bonus_ver_meta",true)
addEventHandler("bonus_ver_meta",root,meta_vip_bonus)

