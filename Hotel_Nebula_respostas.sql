USE hotel_nebula;

-- 1. QUARTOS DISPONÍVEIS NUM PERÍODO (Exemplo: de 2026-07-01 até 2026-07-05)
-- Busca quartos que não têm nenhuma reserva confirmada batendo com essas duas datas
SELECT * FROM quarto 
WHERE id_quarto NOT IN (
    SELECT fk_qua FROM reserva 
    WHERE status_res = 'Confirmada'
    AND NOT (dtCheckOut <= '2026-07-01' OR dtCheckIn >= '2026-07-05')
);


-- 2. HÓSPEDES QUE MAIS FIZERAM RESERVAS
-- Conta quantas reservas cada hóspede tem e mostra do maior para o menor
SELECT h.nome_hos, COUNT(r.id_res) AS total_reservas 
FROM hospede h
LEFT JOIN reserva r ON h.id_hos = r.fk_hos
GROUP BY h.id_hos, h.nome_hos
ORDER BY total_reservas DESC;


-- 3. FATURAMENTO POR MÊS
-- Agrupa os pagamentos pelo ano/mês e soma os valores recebidos
SELECT 
    DATE_FORMAT(dt_pag, '%Y-%m') AS mes, 
    SUM(valor_pag) AS faturamento_total
FROM pagamento
GROUP BY mes
ORDER BY mes;


-- 4. QUARTOS COM AS MELHORES AVALIAÇÕES
-- Faz a média das notas das avaliações de cada quarto usando os relacionamentos (JOINs)
SELECT q.num_qua, q.tipo_qua, ROUND(AVG(a.nota_ava), 2) AS media_nota
FROM avaliacao a
JOIN hospedagem h ON a.fk_hospedagem = h.id_hospedagem
JOIN reserva r ON h.fk_res = r.id_res
JOIN quarto q ON r.fk_qua = q.id_quarto
GROUP BY q.id_quarto, q.num_qua, q.tipo_qua
ORDER BY media_nota DESC;


-- 5. RESERVAS CANCELADAS
-- Filtra apenas as reservas que mudaram o status para 'Cancelada'
SELECT id_res, fk_hos, dtCheckIn, status_res 
FROM reserva 
WHERE status_res = 'Cancelada';


-- 6. QUANTAS HOSPEDAGENS CADA PROFISSIONAL ATENDEU
-- Conta quantos check-ins estão registrados no ID de cada funcionário
SELECT f.nome_func, COUNT(h.id_hospedagem) AS check_ins_feitos
FROM funcionario f
LEFT JOIN hospedagem h ON f.id_func = h.fk_func_checkin
GROUP BY f.id_func, f.nome_func
ORDER BY check_ins_feitos DESC;