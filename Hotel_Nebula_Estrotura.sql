CREATE DATABASE IF NOT EXISTS hotel_nebula;
USE hotel_nebula;

CREATE TABLE hospede (
    id_hos          INT AUTO_INCREMENT PRIMARY KEY,
    nome_hos        VARCHAR(100)    NOT NULL,
    cpf_hos         VARCHAR(14)     UNIQUE NOT NULL,
    email_hos       VARCHAR(100)    UNIQUE NOT NULL,
    tell_hos        VARCHAR(20),
    dtNasc_hos      DATE
);

CREATE TABLE quarto (
    id_quarto       INT AUTO_INCREMENT PRIMARY KEY,
    num_qua         INT UNIQUE      NOT NULL,
    tipo_qua        VARCHAR(50)     NOT NULL,
    preco_qua       DECIMAL(10, 2)  NOT NULL,
    status_qua      VARCHAR(30)     DEFAULT 'Disponível'
);

CREATE TABLE funcionario (
    id_func         INT AUTO_INCREMENT PRIMARY KEY,
    nome_func       VARCHAR(100)    NOT NULL,
    cpf_func        VARCHAR(14)     UNIQUE NOT NULL,
    cargo_func      VARCHAR(50)     NOT NULL,
    salario_func    DECIMAL(10, 2)  NOT NULL,
    data_admissao   DATE            NOT NULL
);

CREATE TABLE reserva (
    id_res          INT AUTO_INCREMENT PRIMARY KEY,
    fk_hos          INT,
    fk_qua          INT,
    dt_res          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    dtCheckIn       DATE            NOT NULL,
    dtCheckOut      DATE            NOT NULL,
    status_res      VARCHAR(30)     DEFAULT 'Confirmada',
    FOREIGN KEY (fk_hos)            REFERENCES hospede(id_hos),
    FOREIGN KEY (fk_qua)            REFERENCES quarto(id_quarto)
);

CREATE TABLE hospedagem (
    id_hospedagem   INT AUTO_INCREMENT PRIMARY KEY,
    fk_res          INT,
    fk_func_checkin INT,
    CheckInTrue     TIMESTAMP       NOT NULL,
    CheckOutTrue    TIMESTAMP,
    valor_total     DECIMAL(10, 2)  DEFAULT 0.00,
    FOREIGN KEY (fk_res)            REFERENCES reserva(id_res),
    FOREIGN KEY (fk_func_checkin)   REFERENCES funcionario(id_func)
);

CREATE TABLE pagamento (
    id_pag          INT AUTO_INCREMENT PRIMARY KEY,
    fk_hospedagem   INT,
    dt_pag          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP,
    valor_pag       DECIMAL(10, 2)  NOT NULL,
    forma_pag       VARCHAR(50)     NOT NULL,
    FOREIGN KEY (fk_hospedagem)     REFERENCES hospedagem(id_hospedagem)
);

CREATE TABLE avaliacao (
    id_ava          INT AUTO_INCREMENT PRIMARY KEY,
    fk_hospedagem   INT,
    nota_ava        INT             CHECK (nota_ava >= 1 AND nota_ava <= 5),
    comentario      TEXT,
    dt_ava          TIMESTAMP       DEFAULT CURRENT_TIMESTAMP, 
    FOREIGN KEY (fk_hospedagem)     REFERENCES hospedagem(id_hospedagem)
);


