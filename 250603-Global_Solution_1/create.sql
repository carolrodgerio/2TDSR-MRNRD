CREATE TABLE alerta (
    id_alerta      NUMBER(10) NOT NULL,
    tipo_alerta    VARCHAR2(10 CHAR) NOT NULL,
    conteudo       CLOB,
    data_hora      TIMESTAMP(0) NOT NULL,
    status         VARCHAR2(10 CHAR) NOT NULL,
    nivel          VARCHAR2(5 CHAR) NOT NULL,
    id_sinal       NUMBER(10) NOT NULL,
    id_localizacao NUMBER(10) NOT NULL
);

CREATE TABLE dispositivo (
    id_dispositivo   NUMBER(10) NOT NULL,
    tipo_dispositivo VARCHAR2(10 CHAR) NOT NULL,
    status           VARCHAR2(10) NOT NULL,
    id_localizacao   NUMBER(10) NOT NULL,
    id_usuario       NUMBER(10) NOT NULL
);

CREATE TABLE localizacao (
    id_localizacao NUMBER(10) NOT NULL,
    latitude       NUMBER(2, 2) NOT NULL,
    longitude      NUMBER(2, 2) NOT NULL,
    descricao      VARCHAR2(100 CHAR),
    id_dispositivo NUMBER(10) NOT NULL
);

CREATE TABLE login (
    login      VARCHAR2(15 CHAR) NOT NULL,
    senha      VARCHAR2(100 CHAR) NOT NULL,
    id_usuario NUMBER(10) NOT NULL,
    id_tipo    NUMBER(10) NOT NULL
);

CREATE TABLE relacionamento_sinal_disp (
    id_sinal       NUMBER(10) NOT NULL,
    id_dispositivo NUMBER(10) NOT NULL
);

CREATE TABLE relacionamento_usuario_alerta (
    id_usuario NUMBER(10) NOT NULL,
    id_alerta  NUMBER(10) NOT NULL
);

CREATE TABLE sinal (
    id_sinal       NUMBER(10) NOT NULL,
    tipo_sinal     VARCHAR2(10 CHAR) NOT NULL,
    valor          NUMBER(5),
    unidade        VARCHAR2(5 CHAR),
    data_hora      TIMESTAMP(0) NOT NULL,
    processamento  CHAR(1) NOT NULL,
    id_localizacao NUMBER(10) NOT NULL
);

CREATE TABLE solicitacao_ajuda (
    id_solicitacao   NUMBER(10) NOT NULL,
    tipo_solicitacao VARCHAR2(10 CHAR) NOT NULL,
    conteudo         CLOB,
    data_hora        TIMESTAMP(0) NOT NULL,
    status           VARCHAR2(10 CHAR) NOT NULL,
    nivel            VARCHAR2(5 CHAR) NOT NULL,
    id_usuario       NUMBER(10)
);

CREATE TABLE tipo_login (
    id_tipo   NUMBER(10) NOT NULL,
    descricao VARCHAR2(100) NOT NULL,
    login     VARCHAR2(15 CHAR) NOT NULL
);

CREATE TABLE usuario (
    id_usuario   NUMBER(10) NOT NULL,
    nome         VARCHAR2(50 CHAR) NOT NULL,
    cpf          VARCHAR2(11 CHAR),
    telefone     VARCHAR2(11 CHAR),
    email        VARCHAR2(30 CHAR),
    tipo_usuario VARCHAR2(10 CHAR) NOT NULL
);
