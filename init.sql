

CREATE TABLE IF NOT EXISTS clientes (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100),
    limite INTEGER,
    saldo INTEGER,
    versao INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS transacoes (
    id SERIAL PRIMARY KEY,
    cliente_id INT,
    valor INTEGER,
    tipo CHAR,
    descricao VARCHAR(10),
    realizada_em TIMESTAMPTZ,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

INSERT INTO clientes (nome, limite, saldo, versao) VALUES
('Cliente 1', 100000, 0, 0),
('Cliente 2', 80000, 0, 0),
('Cliente 3', 1000000, 0, 0),
('Cliente 4', 10000000, 0, 0),
('Cliente 5', 500000, 0, 0)
ON CONFLICT (id) DO NOTHING;


