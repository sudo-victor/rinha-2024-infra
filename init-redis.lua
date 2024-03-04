local clientes = {
  { id = "1", nome = "Cliente 1", limite = "100000", saldo = "0", versao = "0" },
  { id = "2", nome = "Cliente 2", limite = "80000", saldo = "0", versao = "0" },
  { id = "3", nome = "Cliente 3", limite = "1000000", saldo = "0", versao = "0" },
  { id = "4", nome = "Cliente 4", limite = "10000000", saldo = "0", versao = "0" },
  { id = "5", nome = "Cliente 5", limite = "500000", saldo = "0", versao = "0" }
}

for _, cliente in ipairs(clientes) do
  local exists = redis.call('exists', 'cliente:' .. cliente.id)
  if exists == 0 then
      redis.call('hmset', 'cliente:' .. cliente.id,
          'nome', cliente.nome,
          'limite', cliente.limite,
          'saldo', cliente.saldo,
          'versao', cliente.versao)
  end
end
