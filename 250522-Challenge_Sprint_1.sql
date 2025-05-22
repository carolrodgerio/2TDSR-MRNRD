/**

CHALLENGE MOTTU - Sprint 1

INTEGRANTES:
Carolina Estevam Rodgerio - RM 554975
Enrico Andrade D'Amico - RM 557706
Lucas Thalles dos Santos - RM 558886

-- // --

DESCRIÇÃO DO PROJETO

O banco de dados apresentado a seguir modela um sistema para gestão de locação
de motos da Mottu, incluindo informações sobre os modelos das motos, clientes
(locatários), pátios onde as motos ficam armazenadas, contratos de locação e
status das operações, além de elementos auxiliares, como endereços e dispositivos
RFID para monitoramento IoT das motocicletas.

ENTIDADES E SUAS TABELAS PRINCIPAIS

Modelo | Armazena os tipos de modelos das motos, identificados por id_modelo.
Cada modelo tem um nome limitado a 20 caracteres.
Serve para categorizar as motos os modelos oferecidos pela Mottu.

Status | Tabela para controlar status de contratos, clientes, motos e datas.
Exemplo de status: Ativo, Inativo, Pendente, Cancelado, Finalizado.
Possui um relacionamento cíclico com a tabela data (explicado mais abaixo).

Endereço | Armazena os endereços, tanto dos locatários quanto dos pátios.
Inclui tipo de logradouro, nome do logradouro, número, complemento e CEP.
Relaciona-se com a tabela locatario e com a tabela patio para atender à 3FN.

Pátio | Armazena informações dos locais onde as motos ficam armazenadas.
Cada pátio tem um endereço.
Relaciona pátios com seus endereços para localização.

Locatário | Registra os clientes da Mottu.
Guarda dados pessoais, CPF e seu endereço.
Possui um status para identificar sua situação atual (ativo, inativo, etc).

Moto | Registra as motos do sistema, com dados como placa, chassi, número do motor.
Está associada a um modelo, a um pátio e a um status.
Permite saber onde a moto está e em que status se encontra.

RFID | Armazena as informações dos dispositivos IoT que acompanham as motos.
Relaciona cada RFID a uma moto específica.
Permite rastreamento e monitoramento.

Contrato | Registra os contratos de locação.
Relaciona motos, locatários, status e datas.
Possibilita o controle dos contratos vigentes, finalizados ou cancelados.

Data | Armazena informações de datas-chave para contratos, como início e fim.
Relaciona cada data a um contrato e a um status.
Serve para histórico temporal da locação.

RELACIONAMENTOS

Cada moto tem um modelo, um status e um pátio, garantindo a rastreabilidade da
moto no sistema.

Cada contrato vincula uma moto e um locatário, além de estar associado a um
status (exemplo: ativo ou cancelado) e às datas de início e fim contratual.

O locatário tem um endereço e um status, permitindo gerenciar clientes ativos ou
suspensos.

O pátio tem um endereço, garantindo a localização física dos veículos.

A tabela status é utilizada para padronizar o estado das diversas entidades
(motos, contratos, locatários, datas), o que evita redundância e facilita a
manutenção do status dos registros.

A relação circular entre status e data (status contém referência a data e data
contém referência a status) modela uma lógica de transições de status ao longo do
tempo, permitindo armazenar o histórico detalhado das mudanças.

Alguns campos, como moto.placa, não são obrigatórios, para atender situações
extraordinárias, como motos danificadas ou em fase de emplacamento.

Já campos como id_modelo ou id_patio são obrigatórios para garantir integridade
referencial.

CONSIDERAÇÕES FINAIS

O modelo proposto atende às necessidades típicas de um sistema de locação de
veículos, como a Mottu, onde há o objetivo tanto de rastrear as motos e armazenar
suas informações, quanto de poder acompanhar seus status e localizações em tempo
real.

**/

-- CRIAÇÃO DAS TABELAS

CREATE TABLE modelo (
    id_modelo   NUMBER(10) NOT NULL,
    nome_modelo VARCHAR2(20 CHAR) NOT NULL,
    CONSTRAINT modelo_pk PRIMARY KEY ( id_modelo )
);

CREATE TABLE status (
    id_status    NUMBER(10) NOT NULL,
    status       VARCHAR2(10 CHAR) NOT NULL,
    data_id_data NUMBER,
    CONSTRAINT status_pk PRIMARY KEY ( id_status )
);

CREATE TABLE endereco (
    id_endereco        NUMBER(10) NOT NULL,
    tipo_logradouro    VARCHAR2(10) NOT NULL,
    logradouro         VARCHAR2(30) NOT NULL,
    numero             NUMBER(5) NOT NULL,
    complemento        VARCHAR2(10),
    cep                VARCHAR2(10) NOT NULL,
    locatario_id_locat NUMBER,
    CONSTRAINT endereco_pk PRIMARY KEY ( id_endereco )
);

CREATE TABLE patio (
    id_patio             NUMBER(10) NOT NULL,
    nome_patio           VARCHAR2(30) NOT NULL,
    endereco_id_endereco NUMBER NOT NULL,
    CONSTRAINT patio_pk PRIMARY KEY ( id_patio )
);

CREATE TABLE locatario (
    id_locat             NUMBER(10) NOT NULL,
    nome_completo        VARCHAR2(50) NOT NULL,
    cpf                  VARCHAR2(11) NOT NULL,
    endereco_id_endereco NUMBER NOT NULL,
    status_id_status     NUMBER NOT NULL,
    CONSTRAINT locatario_pk PRIMARY KEY ( id_locat )
);

CREATE TABLE moto (
    id_moto          NUMBER(10) NOT NULL,
    placa            VARCHAR2(7),
    chassi           VARCHAR2(17),
    num_motor        NUMBER(20),
    modelo_id_modelo NUMBER(10) NOT NULL,
    patio_id_patio   NUMBER(10) NOT NULL,
    status_id_status NUMBER(10) NOT NULL,
    CONSTRAINT moto_pk PRIMARY KEY ( id_moto )
);

CREATE TABLE rfid (
    id_rfid      NUMBER(10) NOT NULL,
    sinal        VARCHAR2(15) NOT NULL,
    moto_id_moto NUMBER(10),
    CONSTRAINT rfid_pk PRIMARY KEY ( id_rfid )
);

CREATE TABLE contrato (
    id_contrato        NUMBER(10) NOT NULL,
    num_contrato       VARCHAR2(10) NOT NULL,
    moto_id_moto       NUMBER(10) NOT NULL,
    data_id_data       NUMBER NOT NULL,
    locatario_id_locat NUMBER(10) NOT NULL,
    status_id_status   NUMBER(10) NOT NULL,
    CONSTRAINT contrato_pk PRIMARY KEY ( id_contrato )
);

CREATE TABLE data (
    id_data              NUMBER(10) NOT NULL,
    dt_inicio            DATE NOT NULL,
    dt_fim               DATE,
    contrato_id_contrato NUMBER NOT NULL,
    status_id_status     NUMBER NOT NULL,
    CONSTRAINT data_pk PRIMARY KEY ( id_data )
);

-- CRIAÇÃO DAS FKs

ALTER TABLE patio
    ADD CONSTRAINT patio_endereco_fk FOREIGN KEY ( endereco_id_endereco )
        REFERENCES endereco ( id_endereco );

ALTER TABLE endereco
    ADD CONSTRAINT endereco_locatario_fk FOREIGN KEY ( locatario_id_locat )
        REFERENCES locatario ( id_locat );

ALTER TABLE locatario
    ADD CONSTRAINT locatario_status_fk FOREIGN KEY ( status_id_status )
        REFERENCES status ( id_status );

ALTER TABLE locatario
    ADD CONSTRAINT locatario_endereco_fk FOREIGN KEY ( endereco_id_endereco )
        REFERENCES endereco ( id_endereco );

ALTER TABLE moto
    ADD CONSTRAINT moto_modelo_fk FOREIGN KEY ( modelo_id_modelo )
        REFERENCES modelo ( id_modelo );

ALTER TABLE moto
    ADD CONSTRAINT moto_patio_fk FOREIGN KEY ( patio_id_patio )
        REFERENCES patio ( id_patio );

ALTER TABLE moto
    ADD CONSTRAINT moto_status_fk FOREIGN KEY ( status_id_status )
        REFERENCES status ( id_status );

ALTER TABLE rfid
    ADD CONSTRAINT rfid_moto_fk FOREIGN KEY ( moto_id_moto )
        REFERENCES moto ( id_moto );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_moto_fk FOREIGN KEY ( moto_id_moto )
        REFERENCES moto ( id_moto );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_locatario_fk FOREIGN KEY ( locatario_id_locat )
        REFERENCES locatario ( id_locat );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_status_fk FOREIGN KEY ( status_id_status )
        REFERENCES status ( id_status );

ALTER TABLE data
    ADD CONSTRAINT data_contrato_fk FOREIGN KEY ( contrato_id_contrato )
        REFERENCES contrato ( id_contrato );

ALTER TABLE data
    ADD CONSTRAINT data_status_fk FOREIGN KEY ( status_id_status )
        REFERENCES status ( id_status );

ALTER TABLE status
    ADD CONSTRAINT status_data_fk FOREIGN KEY ( data_id_data )
        REFERENCES data ( id_data );

-- INSERTS

INSERT INTO modelo VALUES ( 1,
                            'Mottu Sport' );

INSERT INTO modelo VALUES ( 2,
                            'Mottu E' );

INSERT INTO modelo VALUES ( 3,
                            'Mottu Pop' );

INSERT INTO modelo VALUES ( 4,
                            'Mottu Pop' );

INSERT INTO modelo VALUES ( 5,
                            'Mottu Sport' );

INSERT INTO status VALUES ( 1,
                            'Ativo',
                            NULL );

INSERT INTO status VALUES ( 2,
                            'Inativo',
                            NULL );

INSERT INTO status VALUES ( 3,
                            'Pendente',
                            NULL );

INSERT INTO status VALUES ( 4,
                            'Cancelado',
                            NULL );

INSERT INTO status VALUES ( 5,
                            'Finalizado',
                            NULL );

INSERT INTO endereco VALUES ( 1,
                              'Rua',
                              'Avenida Brasil',
                              100,
                              NULL,
                              '00000-000',
                              NULL );

INSERT INTO endereco VALUES ( 2,
                              'Av',
                              'Paulista',
                              2000,
                              NULL,
                              '11111-111',
                              NULL );

INSERT INTO endereco VALUES ( 3,
                              'Rua',
                              'Oscar Freire',
                              300,
                              NULL,
                              '22222-222',
                              NULL );

INSERT INTO endereco VALUES ( 4,
                              'Av',
                              'Faria Lima',
                              4000,
                              NULL,
                              '33333-333',
                              NULL );

INSERT INTO endereco VALUES ( 5,
                              'Rua',
                              'Augusta',
                              500,
                              NULL,
                              '44444-444',
                              NULL );

INSERT INTO patio VALUES ( 1,
                           'Pátio Centro',
                           1 );

INSERT INTO patio VALUES ( 2,
                           'Pátio Norte',
                           2 );

INSERT INTO patio VALUES ( 3,
                           'Pátio Sul',
                           3 );

INSERT INTO patio VALUES ( 4,
                           'Pátio Leste',
                           4 );

INSERT INTO patio VALUES ( 5,
                           'Pátio Oeste',
                           5 );

INSERT INTO locatario VALUES ( 1,
                               'Carlos Silva',
                               '12345678901',
                               1,
                               1 );

INSERT INTO locatario VALUES ( 2,
                               'Ana Costa',
                               '23456789012',
                               2,
                               1 );

INSERT INTO locatario VALUES ( 3,
                               'Bruno Lima',
                               '34567890123',
                               3,
                               2 );

INSERT INTO locatario VALUES ( 4,
                               'Fernanda Souza',
                               '45678901234',
                               4,
                               1 );

INSERT INTO locatario VALUES ( 5,
                               'Mariana Alves',
                               '56789012345',
                               5,
                               3 );

UPDATE endereco
SET
    locatario_id_locat = 1
WHERE
    id_endereco = 1;

UPDATE endereco
SET
    locatario_id_locat = 2
WHERE
    id_endereco = 2;

UPDATE endereco
SET
    locatario_id_locat = 3
WHERE
    id_endereco = 3;

UPDATE endereco
SET
    locatario_id_locat = 4
WHERE
    id_endereco = 4;

UPDATE endereco
SET
    locatario_id_locat = 5
WHERE
    id_endereco = 5;

INSERT INTO moto VALUES ( 1,
                          'AAA1A11',
                          'CHASSI12345678901',
                          10001,
                          1,
                          1,
                          1 );

INSERT INTO moto VALUES ( 2,
                          'BBB2B22',
                          'CHASSI22345678902',
                          10002,
                          2,
                          2,
                          1 );

INSERT INTO moto VALUES ( 3,
                          'CCC3C33',
                          'CHASSI32345678903',
                          10003,
                          3,
                          3,
                          1 );

INSERT INTO moto VALUES ( 4,
                          'DDD4D44',
                          'CHASSI42345678904',
                          10004,
                          1,
                          4,
                          2 );

INSERT INTO moto VALUES ( 5,
                          'EEE5E55',
                          'CHASSI52345678905',
                          10005,
                          2,
                          5,
                          3 );

INSERT INTO rfid VALUES ( 1,
                          'SINAL001',
                          1 );

INSERT INTO rfid VALUES ( 2,
                          'SINAL002',
                          2 );

INSERT INTO rfid VALUES ( 3,
                          'SINAL003',
                          3 );

INSERT INTO rfid VALUES ( 4,
                          'SINAL004',
                          4 );

INSERT INTO rfid VALUES ( 5,
                          'SINAL005',
                          5 );

INSERT INTO contrato VALUES ( 1,
                              'C0001',
                              1,
                              1,
                              1,
                              1 );

INSERT INTO contrato VALUES ( 2,
                              'C0002',
                              2,
                              2,
                              2,
                              1 );

INSERT INTO contrato VALUES ( 3,
                              'C0003',
                              3,
                              3,
                              3,
                              1 );

INSERT INTO contrato VALUES ( 4,
                              'C0004',
                              4,
                              4,
                              4,
                              2 );

INSERT INTO contrato VALUES ( 5,
                              'C0005',
                              5,
                              5,
                              5,
                              3 );

INSERT INTO data VALUES ( 1,
                          DATE '2025-01-01',
                          DATE '2025-01-10',
                          1,
                          1 );

INSERT INTO data VALUES ( 2,
                          DATE '2025-02-01',
                          DATE '2025-02-15',
                          2,
                          1 );

INSERT INTO data VALUES ( 3,
                          DATE '2025-03-01',
                          NULL,
                          3,
                          2 );

INSERT INTO data VALUES ( 4,
                          DATE '2025-04-01',
                          DATE '2025-04-20',
                          4,
                          2 );

INSERT INTO data VALUES ( 5,
                          DATE '2025-05-01',
                          NULL,
                          5,
                          3 );

-- BLOCO ANÔNIMO 1 | Relatório de motos, modelos e pátios

SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('RELATÓRIO DE MOTOS, MODELOS E PÁTIOS');
    dbms_output.put_line('--//--//--//--');
    FOR r IN (
        SELECT
            mo.nome_modelo,
            p.nome_patio,
            COUNT(m.id_moto) AS qtd_motos
        FROM
                 moto m
            JOIN modelo mo ON m.modelo_id_modelo = mo.id_modelo
            JOIN patio  p ON m.patio_id_patio = p.id_patio
        GROUP BY
            mo.nome_modelo,
            p.nome_patio
        ORDER BY
            mo.nome_modelo,
            p.nome_patio
    ) LOOP
        dbms_output.put_line('Modelo: '
                             || r.nome_modelo
                             || ' | Pátio: '
                             || r.nome_patio
                             || ' | Quantidade de Motos: '
                             || r.qtd_motos);
    END LOOP;

END;
/

-- BLOCO ANÔNIMO 2 | Relatório de contratos, locatários e status

SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('RELATÓRIO DE CONTRATOS POR LOCATÁRIO');
    dbms_output.put_line('--//--//--//--');
    FOR r IN (
        SELECT
            s.status,
            l.nome_completo,
            COUNT(c.id_contrato) AS qtd_contratos
        FROM
                 contrato c
            JOIN status    s ON c.status_id_status = s.id_status
            JOIN locatario l ON c.locatario_id_locat = l.id_locat
        GROUP BY
            s.status,
            l.nome_completo
        ORDER BY
            s.status,
            l.nome_completo
    ) LOOP
        dbms_output.put_line('Status: '
                             || r.status
                             || ' | Locatário: '
                             || r.nome_completo
                             || ' | Quantidade de Contratos: '
                             || r.qtd_contratos);
    END LOOP;

END;
/

-- BLOCO DE LEITURA

SET SERVEROUTPUT ON;

BEGIN
    dbms_output.put_line('ID do Contrato | Contrato Anterior | Contrato Atual | Próximo Contrato');
    dbms_output.put_line('-----------------------------------------------------------------------');
    FOR r IN (
        SELECT
            id_contrato,
            nvl(LAG(num_contrato)
                OVER(
                ORDER BY
                    id_contrato
                ),
                'Vazio') AS contrato_anterior,
            num_contrato AS contrato_atual,
            nvl(LEAD(num_contrato)
                OVER(
                ORDER BY
                    id_contrato
                ),
                'Vazio') AS contrato_proximo
        FROM
            contrato
        ORDER BY
            id_contrato
    ) LOOP
        dbms_output.put_line(r.id_contrato
                             || '           | '
                             || r.contrato_anterior
                             || '              | '
                             || r.contrato_atual
                             || '            | '
                             || r.contrato_proximo);
    END LOOP;

END;
/
