function onThink(interval, lastExecution)
    local cor = RED
    local mensagens = {"voce sabia que pode vender seu Premium dentro do jogo? basta digitar !vendervip e transforme 1 dia de vip em VIP document e faça o que quiser com ele! Voce so pode usar !vendervip se tiver mais de 1 dia de premium."} 
  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end