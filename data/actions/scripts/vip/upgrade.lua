local gain = {
gainArmor='&p+1',loseArmor='&p-1',
gainShield='&s+1',loseShield='&s-1',
gainAttack='&a+1',loseAttack='&a-1',
gainDefense='&d+1',loseDefense='&d-1',
chance='40/((#*(1/(@/1)))*(@/1))',
maxlvl = 7,
reqvoc = {20, 21},
blocked_ids = {8881}
}

if not setItemName then
        function setItemName(uid,name)
         return doItemSetAttribute(uid,'name',name)
        end        
        function setItemArmor(uid,name)
         return doItemSetAttribute(uid,'armor',name)
        end
        function setItemDefense(uid,name)
         return doItemSetAttribute(uid,'defense',name)
        end
        function setItemAttack(uid,name)
         return doItemSetAttribute(uid,'attack',name)
        end
        function getItemAttack(uid)
           return getItemAttribute(uid,'attack')
        end
        function getItemDefense(uid)
           return getItemAttribute(uid,'defense')
        end
        function getItemArmor(uid)
           if type(uid) == 'number' then
                  return getItemAttribute(uid,'armor')
           else
                  return getItemInfo(uid.itemid).armor
           end
     end
end
function isArmor(uid)
         if (getItemArmor(uid) and getItemArmor(uid) ~= 0 and not getItemInfo(uid.itemid,'attack') and not getItemInfo(uid.itemid,'defense') and getItemWeaponType(uid.uid) == 0) then           
            return true
         end
         return false
end
function isWeapon(uid)
         uid = uid or 0
         local f = getItemWeaponType(uid)
         if f == 1 or f == 2 or f == 3 then
             return TRUE
         end
         return FALSE
end
function isShield(uid)
         uid = uid or 0
         if getItemWeaponType(uid) == 4 then
             return TRUE
         end
         return FALSE
end

function getWeaponLevel(uid)
   uid = uid or 0
   local name = getItemName(uid)
   local lvl = string.match(name,'+(%d)')
   return tonumber(lvl) or 0
end
function doTransform(s,i)
    local c = string.gsub(s,'@',gain.maxlvl)
    local c = string.gsub(c,'&a',getItemAttack(i.uid) or getItemInfo(i.itemid).attack)
    local c = string.gsub(c,'&d',getItemDefense(i.uid) or getItemInfo(i.itemid).defense)
    local c = string.gsub(c,'&s',getItemDefense(i.uid) or getItemInfo(i.itemid).defense)
    local c = string.gsub(c,'&p',getItemArmor(i.uid) or getItemInfo(i.itemid).armor)
    local c = string.gsub(c,'#',getWeaponLevel(i.uid))
    local q,err = loadstring('return '..c)
    assert(q,err)
    return assert(q())
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
         toPosition.stackpos = 255
         if isInArray(gain.blocked_ids, itemEx.itemid) == TRUE
          or getItemWeaponType(itemEx.uid) > 4
           or (getItemWeaponType(itemEx.uid) == 0
            and isArmor(itemEx) == FALSE)
             or itemEx.itemid == 0 then
               doPlayerSendTextMessage(cid, 24,"Esse item nao pode ser refinado.")
                return TRUE
         end
         if isCreature(itemEx.uid) == TRUE then
            return FALSE
         end
        local level = getWeaponLevel(itemEx.uid)
        local chance = doTransform(gain.chance,itemEx)
        if chance >= math.random(0,100) or item.actionid >= 1000 or (item.actionid == 500 and math.random(0,100) <= 25) then
           if level+1 > gain.maxlvl then
              doSendMagicEffect(toPosition, 2)
              return doPlayerSendTextMessage(cid, 24,"Seu item esta no nivel maximo, nao podera refinalo.")
           else
              setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level+1))
              doPlayerSendTextMessage(cid, 24,"Seu item foi refinado para +"..(level+1)..".")
              doSendMagicEffect(toPosition, 26)             
              if isArmor(itemEx) == TRUE then
                 local get = doTransform(gain.gainArmor,itemEx)
                 setItemArmor(itemEx.uid,get)            
              elseif isWeapon(itemEx.uid) == TRUE then
                  setItemAttack(itemEx.uid, doTransform(gain.gainAttack,itemEx))
                  setItemDefense(itemEx.uid, doTransform(gain.gainDefense,itemEx))
              elseif isShield(itemEx.uid) == TRUE then
                  setItemDefense(itemEx.uid, doTransform(gain.gainShield,itemEx))
              end
           end
        else

           if level == 0 then
               doPlayerSendTextMessage(cid, 24,"Sem efeito.")
               doSendMagicEffect(toPosition, 2)
           elseif level == gain.maxlvl then
                  doSendMagicEffect(toPosition, 2)
                  return doPlayerSendTextMessage(cid, 24,"Seu item esta no nivel maximo, nao podera refinalot.")
           elseif level > 0 then
               if level == 1 then
                   setItemName(itemEx.uid, getItemNameById(itemEx.itemid))
                   doPlayerSendTextMessage(cid, 24,"Seu item voltou ao normal.")
               else
                   setItemName(itemEx.uid, getItemNameById(itemEx.itemid)..' +'..(level-1))
                   doPlayerSendTextMessage(cid, 24,"Seu item voltou para +"..(level-1)..".")
               end
              if isArmor(itemEx) == TRUE then
                 setItemArmor(itemEx.uid,doTransform(gain.loseArmor  ,itemEx))        
              elseif isWeapon(itemEx.uid) == TRUE then
                  setItemAttack(itemEx.uid, doTransform(gain.loseAttack,itemEx))
                  setItemDefense(itemEx.uid, doTransform(gain.loseDefense,itemEx))
              elseif isShield(itemEx.uid) == TRUE then
                  setItemDefense(itemEx.uid, doTransform(gain.loseShield,itemEx))                                                                              
               end
           end
           doSendMagicEffect(toPosition, 9)
        end
     doRemoveItem(item.uid,1)
     return TRUE
end 