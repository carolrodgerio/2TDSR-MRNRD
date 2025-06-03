ALTER TABLE usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( id_usuario );

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

ALTER TABLE usuario
    ADD CONSTRAINT chk_tipo_usuario
        CHECK ( tipo_usuario IN ( 'PF', 'Voluntário', 'Gestor' ) );

ALTER TABLE login ADD CONSTRAINT pk_login PRIMARY KEY ( login );

ALTER TABLE tipo_login ADD CONSTRAINT pk_tipo_login PRIMARY KEY ( id_tipo );

ALTER TABLE login
    ADD CONSTRAINT fk_login_usuario FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE login
    ADD CONSTRAINT fk_login_tipo FOREIGN KEY ( id_tipo )
        REFERENCES tipo_login ( id_tipo );

ALTER TABLE tipo_login
    ADD CONSTRAINT chk_descricao_tipo CHECK ( descricao IN ( 'Usuário', 'ADM' ) );

ALTER TABLE localizacao ADD CONSTRAINT pk_localizacao PRIMARY KEY ( id_localizacao );

ALTER TABLE dispositivo ADD CONSTRAINT pk_dispositivo PRIMARY KEY ( id_dispositivo );

ALTER TABLE dispositivo
    ADD CONSTRAINT fk_disp_usuario FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE dispositivo
    ADD CONSTRAINT fk_disp_localizacao FOREIGN KEY ( id_localizacao )
        REFERENCES localizacao ( id_localizacao );

ALTER TABLE dispositivo
    ADD CONSTRAINT chk_status_disp
        CHECK ( status IN ( 'Ativo', 'Inativo', 'Manutenção' ) );

ALTER TABLE dispositivo
    ADD CONSTRAINT chk_tipo_disp
        CHECK ( tipo_dispositivo IN ( 'RUNA', 'Central', 'Sensor' ) );

ALTER TABLE sinal ADD CONSTRAINT pk_sinal PRIMARY KEY ( id_sinal );

ALTER TABLE sinal
    ADD CONSTRAINT fk_sinal_localizacao FOREIGN KEY ( id_localizacao )
        REFERENCES localizacao ( id_localizacao );

ALTER TABLE sinal
    ADD CONSTRAINT chk_tipo_sinal
        CHECK ( tipo_sinal IN ( 'Chuva', 'Vento', 'Temperatura', 'Enchente', 'Deslizamento',
                                'Terremoto' ) );

ALTER TABLE sinal
    ADD CONSTRAINT chk_unidade_sinal
        CHECK ( unidade IN ( 'mm', 'm/s', 'C', 'm', '%' ) );

ALTER TABLE sinal
    ADD CONSTRAINT chk_processamento CHECK ( processamento IN ( 'S', 'N' ) );

ALTER TABLE alerta ADD CONSTRAINT pk_alerta PRIMARY KEY ( id_alerta );

ALTER TABLE alerta
    ADD CONSTRAINT fk_alerta_sinal FOREIGN KEY ( id_sinal )
        REFERENCES sinal ( id_sinal );

ALTER TABLE alerta
    ADD CONSTRAINT fk_alerta_localizacao FOREIGN KEY ( id_localizacao )
        REFERENCES localizacao ( id_localizacao );

ALTER TABLE alerta
    ADD CONSTRAINT chk_status_alerta
        CHECK ( status IN ( 'Emitido', 'Cancelado', 'Pendente' ) );

ALTER TABLE alerta
    ADD CONSTRAINT chk_nivel_alerta
        CHECK ( nivel IN ( 'Baixo', 'Médio', 'Alto', 'Crítico' ) );

ALTER TABLE alerta
    ADD CONSTRAINT chk_tipo_alerta
        CHECK ( tipo_alerta IN ( 'Climático', 'Emergência', 'Evacuação', 'Comunicado' ) );

ALTER TABLE relacionamento_sinal_disp ADD CONSTRAINT pk_sinal_disp PRIMARY KEY ( id_sinal,
                                                                                 id_dispositivo );

ALTER TABLE relacionamento_sinal_disp
    ADD CONSTRAINT fk_rel_sinal FOREIGN KEY ( id_sinal )
        REFERENCES sinal ( id_sinal );

ALTER TABLE relacionamento_sinal_disp
    ADD CONSTRAINT fk_rel_disp FOREIGN KEY ( id_dispositivo )
        REFERENCES dispositivo ( id_dispositivo );

ALTER TABLE relacionamento_usuario_alerta ADD CONSTRAINT pk_usuario_alerta PRIMARY KEY ( id_usuario,
                                                                                         id_alerta );

ALTER TABLE relacionamento_usuario_alerta
    ADD CONSTRAINT fk_usuario_alerta_usuario FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE relacionamento_usuario_alerta
    ADD CONSTRAINT fk_usuario_alerta_alerta FOREIGN KEY ( id_alerta )
        REFERENCES alerta ( id_alerta );

ALTER TABLE solicitacao_ajuda ADD CONSTRAINT pk_solicitacao PRIMARY KEY ( id_solicitacao );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT fk_solicitacao_usuario FOREIGN KEY ( id_usuario )
        REFERENCES usuario ( id_usuario );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT chk_tipo_solicitacao
        CHECK ( tipo_solicitacao IN ( 'Resgate', 'Medicamento', 'Alimento', 'Abrigo', 'Outros' ) );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT chk_status_solicitacao
        CHECK ( status IN ( 'Aberto', 'Em Andamento', 'Fechado' ) );

ALTER TABLE solicitacao_ajuda
    ADD CONSTRAINT chk_nivel_solicitacao
        CHECK ( nivel IN ( 'Baixo', 'Médio', 'Alto', 'Crítico' ) );
