function onThink(interval, lastExecution)
    local cor = RED
    local mensagens = {"fale !comandos e veja todos comandos que voce pode utilizar, e fale !duvidas para tirar quaisquer duvidas que tenha."} 
  doBroadcastMessage(mensagens[math.random(1,table.maxn(mensagens))], cor)
return TRUE
end