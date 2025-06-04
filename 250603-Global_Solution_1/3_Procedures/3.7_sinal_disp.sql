-- inserção

CREATE OR REPLACE PROCEDURE inserir_rel_sinal_disp (
    p_id_sinal       NUMBER,
    p_id_dispositivo NUMBER
) AS
BEGIN
    INSERT INTO relacionamento_sinal_disp VALUES ( p_id_sinal,
                                                   p_id_dispositivo );

END;

-- atualização

CREATE OR REPLACE PROCEDURE atualizar_rel_sinal_disp (
    p_id_sinal              NUMBER,
    p_id_dispositivo_antigo NUMBER,
    p_id_dispositivo_novo   NUMBER
) AS
BEGIN
    UPDATE relacionamento_sinal_disp
    SET
        id_dispositivo = p_id_dispositivo_novo
    WHERE
            id_sinal = p_id_sinal
        AND id_dispositivo = p_id_dispositivo_antigo;

END;

-- exclusão

CREATE OR REPLACE PROCEDURE excluir_rel_sinal_disp (
    p_id_sinal       NUMBER,
    p_id_dispositivo NUMBER
) AS
BEGIN
    DELETE FROM relacionamento_sinal_disp
    WHERE
            id_sinal = p_id_sinal
        AND id_dispositivo = p_id_dispositivo;

END;

-- execução

BEGIN
    inserir_rel_sinal_disp(1, 1);
    inserir_rel_sinal_disp(2, 2);
    inserir_rel_sinal_disp(3, 3);
    inserir_rel_sinal_disp(4, 4);
    inserir_rel_sinal_disp(5, 5);
END;
