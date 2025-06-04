-- inserção

CREATE OR REPLACE PROCEDURE inserir_solicitacao (
    p_id_solicitacao   NUMBER,
    p_tipo_solicitacao VARCHAR2,
    p_conteudo         CLOB,
    p_data_hora        TIMESTAMP,
    p_status           VARCHAR2,
    p_nivel            VARCHAR2,
    p_id_usuario       NUMBER
) AS
BEGIN
    INSERT INTO solicitacao_ajuda VALUES ( p_id_solicitacao,
                                           p_tipo_solicitacao,
                                           p_conteudo,
                                           p_data_hora,
                                           p_status,
                                           p_nivel,
                                           p_id_usuario );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_solicitacao (
    p_id_solicitacao NUMBER,
    p_status         VARCHAR2
) AS
BEGIN
    UPDATE solicitacao_ajuda
    SET
        status = p_status
    WHERE
        id_solicitacao = p_id_solicitacao;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_solicitacao (
    p_id_solicitacao NUMBER
) AS
BEGIN
    DELETE FROM solicitacao_ajuda
    WHERE
        id_solicitacao = p_id_solicitacao;

END;

-- execução

BEGIN
    inserir_solicitacao(1, 'Resgate', 'Estou preso em  meio a um incêndio', systimestamp, 'Aberto',
                        'Alto', 1);
    inserir_solicitacao(2, 'Saúde', 'Sou PcD e preciso de um medicamento para meu tratamento', systimestamp, 'Aberto',
                        'Médio', 2);
    inserir_solicitacao(3, 'Alimento', 'Moro na rua e preciso de alimento', systimestamp, 'Fechado',
                        'Médio', 3);
    inserir_solicitacao(4, 'Abrigo', 'Fui despejado e preciso de abrigo', systimestamp, 'Fechado',
                        'Baixo', 4);
    inserir_solicitacao(5, 'Outros', 'Alarme disparado sem motivo', systimestamp, 'Pendente',
                        'Baixo', 5);
END;
