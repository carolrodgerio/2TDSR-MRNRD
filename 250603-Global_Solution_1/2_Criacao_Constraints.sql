ALTER TABLE alerta ADD CONSTRAINT alerta_pk PRIMARY KEY ( id_alerta );

ALTER TABLE dispositivo ADD CONSTRAINT dispositivo_pk PRIMARY KEY ( id_dispositivo );

ALTER TABLE localizacao ADD CONSTRAINT localizacao_pk PRIMARY KEY ( id_localizacao );

ALTER TABLE login ADD CONSTRAINT login_pk PRIMARY KEY ( login );

ALTER TABLE relacionamento_sinal_disp ADD CONSTRAINT sinal_disp_pk PRIMARY KEY ( id_sinal,
                                                                                 id_dispositivo );

ALTER TABLE relacionamento_usuario_alerta ADD CONSTRAINT usuario_alerta_pk PRIMARY KEY ( id_usuario,
                                                                                         id_alerta );

ALTER TABLE sinal ADD CONSTRAINT sinal_pk PRIMARY KEY ( id_sinal,
                                                        id_localizacao );

ALTER TABLE solicitacao_ajuda ADD CONSTRAINT pedido_pk PRIMARY KEY ( id_solicitacao );

ALTER TABLE tipo_login ADD CONSTRAINT tipo_login_pk PRIMARY KEY ( id_tipo );

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE relacionamento_usuario_alerta
    ADD CONSTRAINT alerta_fk FOREIGN KEY ( id_alerta )
        REFERENCES alerta ( id_alerta );

ALTER TABLE alerta
    ADD CONSTRAINT alerta_sinal_fk
        FOREIGN KEY ( id_sinal,
                      id_localizacao )
            REFERENCES sinal ( id_sinal,
                               id_localizacao );

ALTER TABLE relacionamento_sinal_disp
    ADD CONSTRAINT dispositivo_fk FOREIGN KEY ( id_dispositivo )
        REFERENCES dispositivo ( id_dispositivo );

ALTER TABLE dispositivo
    ADD CONSTRAINT dispositivo_localizacao_fk FOREIGN KEY ( id_localizacao )
        REFERENCES localizacao ( id_localizacao );

ALTER TABLE dispositivo
    ADD CONSTRAINT dispositivo_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE localizacao
    ADD CONSTRAINT localizacao_dispositivo_fk FOREIGN KEY ( id_dispositivo )
        REFERENCES dispositivo ( id_dispositivo );

ALTER TABLE login
    ADD CONSTRAINT login_tipo_login_fk FOREIGN KEY ( id_tipo )
        REFERENCES tipo_login ( id_tipo );

ALTER TABLE login
    ADD CONSTRAINT login_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE sinal
    ADD CONSTRAINT sinal_localizacao_fk FOREIGN KEY ( id_localizacao )
        REFERENCES localizacao ( id_localizacao );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT solicitacao_ajuda_usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE relacionamento_usuario_alerta
    ADD CONSTRAINT usuario_fk FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );
        
ALTER TABLE alerta
    ADD CONSTRAINT chk_tipo_alerta
        CHECK ( tipo_alerta IN ( 'Climático', 'Emergência', 'Evacuação', 'Comunicado' ) );

ALTER TABLE alerta
    ADD CONSTRAINT chk_status_alerta
        CHECK ( status IN ( 'Emitido', 'Cancelado', 'Pendente' ) );

ALTER TABLE alerta
    ADD CONSTRAINT chk_nivel_alerta
        CHECK ( nivel IN ( 'Baixo', 'Médio', 'Alto', 'Crítico' ) );

ALTER TABLE dispositivo
    ADD CONSTRAINT chk_tipo_dispositivo
        CHECK ( tipo_dispositivo IN ( 'RUNA', 'Central', 'Sensor' ) );

ALTER TABLE dispositivo
    ADD CONSTRAINT chk_status_dispositivo
        CHECK ( status IN ( 'Ativo', 'Inativo', 'Manutenção' ) );

ALTER TABLE sinal
    ADD CONSTRAINT chk_tipo_sinal
        CHECK ( tipo_sinal IN ( 'Chuva', 'Vento', 'Temperatura', 'Enchente', 'Deslizamento',
                                'Terremoto' ) );

ALTER TABLE sinal
    ADD CONSTRAINT chk_unidade_sinal
        CHECK ( unidade IN ( 'mm', 'm/s', 'C', 'm', '%' ) );

ALTER TABLE sinal
    ADD CONSTRAINT chk_processamento CHECK ( processamento IN ( 'S', 'N' ) );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT chk_tipo_solicitacao
        CHECK ( tipo_solicitacao IN ( 'Resgate', 'Medicamento', 'Alimento', 'Abrigo', 'Outros' ) );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT chk_status_solicitacao
        CHECK ( status IN ( 'Aberto', 'Em Andamento', 'Fechado' ) );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT chk_nivel_solicitacao
        CHECK ( nivel IN ( 'Baixo', 'Médio', 'Alto', 'Crítico' ) );

ALTER TABLE tipo_login
    ADD CONSTRAINT chk_tipo_login_descricao CHECK ( descricao IN ( 'Usuário', 'ADM' ) );

ALTER TABLE usuario
    ADD CONSTRAINT chk_cpf_format
        CHECK ( cpf IS NULL
                OR REGEXP_LIKE ( cpf,
                                 '^\d{11}$' ) );

ALTER TABLE usuario
    ADD CONSTRAINT chk_telefone_format
        CHECK ( telefone IS NULL
                OR REGEXP_LIKE ( telefone,
                                 '^\d{10,11}$' ) );

ALTER TABLE usuario
    ADD CONSTRAINT chk_email_format
        CHECK ( email IS NULL
                OR REGEXP_LIKE ( email,
                                 '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$' ) );
