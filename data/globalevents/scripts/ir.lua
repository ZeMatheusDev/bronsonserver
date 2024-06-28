function onThink(interval, lastExecution)
    local cor = RED
    local mensagens = {"voce sabe que pode utilizar /ir para ir em hunts? digite /ir e veja quais locais voce pode ir, por exemplo: /ir dragon1."} 
  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end