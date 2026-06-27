USE hotel_nebula;


INSERT INTO hospede (nome_hos, cpf_hos, email_hos, tell_hos, dtNasc_hos) VALUES
('Alexander Silva', '123.456.789-00', 'alexander@email.com', '(11) 99999-1111', '2000-05-15'),
('Beatriz Souza', '987.654.321-11', 'beatriz@email.com', '(11) 98888-2222', '1995-10-20');

INSERT INTO quarto (num_qua, tipo_qua, preco_qua) VALUES
(101, 'Single', 150.00),
(102, 'Double', 250.00),
(201, 'Suite Master', 500.00);

INSERT INTO funcionario (nome_func, cpf_func, cargo_func, salario_func, data_admissao) VALUES
('Carlos Oliveira', '444.555.666-77', 'Recepcionista', 2500.00, '2025-01-10'),
('Daniela Lima', '222.333.444-55', 'Gerente', 5000.00, '2024-06-01');

INSERT INTO reserva (fk_hos, fk_qua, dtCheckIn, dtCheckOut) VALUES
(1, 2, '2026-07-01', '2026-07-05'),
(2, 3, '2026-06-20', '2026-06-25');

INSERT INTO hospedagem (fk_res, fk_func_checkin, CheckInTrue, CheckOutTrue, valor_total) VALUES
(2, 1, '2026-06-20 14:00:00', '2026-06-25 11:00:00', 1250.00);

INSERT INTO pagamento (fk_hospedagem, valor_pag, forma_pag) VALUES
(1, 1250.00, 'Pix');

INSERT INTO avaliacao (fk_hospedagem, nota_ava, comentario) VALUES
(1, 5, 'Excelente atendimento do funcionário Carlos no check-in!');

