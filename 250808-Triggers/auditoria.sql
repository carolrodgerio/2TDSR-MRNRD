CREATE TABLE tb_auditoria (
    id       NUMBER
        GENERATED ALWAYS AS IDENTITY,
    tabela   VARCHAR2(30),
    operacao VARCHAR2(30),
    data     DATE,
    usuario  VARCHAR2(30)
)

CREATE OR REPLACE TRIGGER trg_auditoria AFTER
    INSERT OR UPDATE OR DELETE ON pedido_novos
    FOR EACH ROW
DECLARE
    operacao     VARCHAR2(30);
    nome_usuario VARCHAR2(100);
BEGIN
 -- Determina a operação realizada (INSERT, UPDATE ou DELETE)
    IF inserting THEN
        operacao := 'INSERT';
    ELSIF updating THEN
        operacao := 'UPDATE';
    ELSIF deleting THEN
        operacao := 'DELETE';
    END IF;
 -- Obtém o nome de usuário da sessão atual
    nome_usuario := sys_context('USERENV', 'SESSION_USER');
 -- Registra a auditoria na tabela de auditoria
    INSERT INTO tb_auditoria (
        tabela,
        operacao,
        data,
        usuario
    ) VALUES ( 'PEDIDO_NOVOS',
               operacao,
               sysdate,
               nome_usuario );

END;

INSERT INTO pedido_novos (
    cod_pedido,
    cod_cliente
) VALUES ( 9876543,
           10 );
           
SELECT * FROM tb_auditoria;
