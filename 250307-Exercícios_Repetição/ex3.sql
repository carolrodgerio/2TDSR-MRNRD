DECLARE

 v_inicio NUMBER := 1; -- Início do intervalo
    v_fim NUMBER := 10; -- Fim do intervalo
    v_soma_impares NUMBER := 0; -- Variável para armazenar a soma dos números ímpares
    v_qtd_impares NUMBER := 0; -- Variável para contar a quantidade de números ímpares
    v_soma_pares NUMBER := 0; -- Variável para armazenar a soma dos números pares
    v_qtd_pares NUMBER := 0; -- Variável para contar a quantidade de números pares
    v_contador NUMBER; -- Variável de contador para percorrer o intervalo
    v_media_pares NUMBER; -- Variável para armazenar a média dos números pares

BEGIN
    -- Loop para percorrer o intervalo e calcular a soma dos ímpares e média dos pares
    FOR v_contador IN v_inicio..v_fim LOOP
        IF MOD(v_contador, 2) = 0 THEN -- Verifica se o número é par
            v_soma_pares := v_soma_pares + v_contador; -- Soma o valor ao total dos pares
            v_qtd_pares := v_qtd_pares + 1; -- Incrementa a quantidade de números pares
        ELSE
            v_soma_impares := v_soma_impares + v_contador; -- Soma o valor ao total dos ímpares
            v_qtd_impares := v_qtd_impares + 1; -- Incrementa a quantidade de números ímpares
        END IF;
    END LOOP;

    -- Calcular a média dos números pares
    IF v_qtd_pares <> 0 THEN
        v_media_pares := v_soma_pares / v_qtd_pares;
    ELSE
        v_media_pares := 0; -- Evita divisão por zero se não houver números pares
    END IF;

    -- Exibição dos resultados
    DBMS_OUTPUT.PUT_LINE('Soma dos números ímpares: ' || v_soma_impares);
    DBMS_OUTPUT.PUT_LINE('Média dos números pares: ' || v_media_pares);
END;
