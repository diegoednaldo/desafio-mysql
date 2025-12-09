USE db_cursos_online;


SELECT
    c.titulo AS Titulo_Curso,
    ROUND(AVG(av.nota), 2) AS Nota_Media,
    COUNT(av.id_avaliacao) AS Total_Avaliacoes
FROM
    cursos c
JOIN
    matriculas m ON c.id_curso = m.id_curso
JOIN
    avaliacoes av ON m.id_matricula = av.id_matricula
GROUP BY
    c.titulo
HAVING
    Total_Avaliacoes >= 2
ORDER BY
    Nota_Media DESC, Total_Avaliacoes DESC
LIMIT 3;



SELECT
    c.titulo AS Curso,
    m.titulo AS Modulo,
    a.titulo AS Aula,
    pa.status AS Status_Visualizacao,
    pa.data_conclusao
FROM
    alunos al
JOIN
    matriculas ma ON al.id_aluno = ma.id_aluno
JOIN
    cursos c ON ma.id_curso = c.id_curso
JOIN
    modulos m ON c.id_curso = m.id_curso
JOIN
    aulas a ON m.id_modulo = a.id_modulo
LEFT JOIN
    progresso_aluno pa ON pa.id_aluno = al.id_aluno AND pa.id_aula = a.id_aula
WHERE
    al.nome = 'Bruna Santos'
ORDER BY
    m.ordem, a.id_aula;



SELECT DISTINCT
    al.nome AS Nome_Aluno,
    al.email
FROM
    alunos al
JOIN
    matriculas m ON al.id_aluno = m.id_aluno
WHERE
    m.id_curso = 4
    AND al.id_aluno NOT IN (
        SELECT DISTINCT pa.id_aluno
        FROM progresso_aluno pa
        JOIN aulas a ON pa.id_aula = a.id_aula
        JOIN modulos mo ON a.id_modulo = mo.id_modulo
        WHERE mo.id_curso = 4
    );



SELECT
    a.nome AS Nome_Aluno,
    SUM(m.valor_liquido) AS Total_Gasto_Liquido,
    RANK() OVER (ORDER BY SUM(m.valor_liquido) DESC) AS Ranking_Gasto
FROM
    alunos a
JOIN
    matriculas m ON a.id_aluno = m.id_aluno
JOIN
    pagamentos p ON m.id_matricula = p.id_matricula
WHERE
    p.status_pagamento = 'PAGO'
GROUP BY
    a.nome
ORDER BY
    Ranking_Gasto;



SELECT
    cat.nome AS Categoria,
    COUNT(m.id_matricula) AS Total_Vendas,
    SUM(p.valor_total) AS Faturamento_Bruto
FROM
    categorias cat
JOIN
    cursos c ON cat.id_categoria = c.id_categoria
JOIN
    matriculas m ON c.id_curso = m.id_curso
JOIN
    pagamentos p ON m.id_matricula = p.id_matricula
WHERE
    p.status_pagamento = 'PAGO'
GROUP BY
    cat.nome
HAVING
    SUM(p.valor_total) > 100.00
ORDER BY
    Faturamento_Bruto DESC;



CREATE OR REPLACE VIEW v_desempenho_instrutor AS
SELECT
    i.nome AS Nome_Instrutor,
    COUNT(DISTINCT c.id_curso) AS Cursos_Ministrados,
    COUNT(m.id_matricula) AS Total_Vendas,
    SUM(m.valor_liquido) AS Receita_Liquida_Gerada,
    ROUND(AVG(av.nota), 2) AS Media_Avaliacoes
FROM
    instrutores i
JOIN
    cursos_instrutores ci ON i.id_instrutor = ci.id_instrutor
JOIN
    cursos c ON ci.id_curso = c.id_curso
LEFT JOIN
    matriculas m ON c.id_curso = m.id_curso
LEFT JOIN
    avaliacoes av ON m.id_matricula = av.id_matricula
WHERE
    m.status <> 'CANCELADO'
GROUP BY
    i.nome
ORDER BY
    Receita_Liquida_Gerada DESC;

SELECT * FROM v_desempenho_instrutor;



CREATE OR REPLACE VIEW v_taxa_conclusao_curso AS
SELECT
    c.titulo AS Curso,
    COUNT(m.id_matricula) AS Total_Matriculas,
    SUM(CASE WHEN m.status = 'CONCLUIDO' THEN 1 ELSE 0 END) AS Alunos_Concluidos,
    ROUND(
        (SUM(CASE WHEN m.status = 'CONCLUIDO' THEN 1 ELSE 0 END) / COUNT(m.id_matricula)) * 100, 
        2
    ) AS Taxa_Conclusao_Percentual
FROM
    cursos c
JOIN
    matriculas m ON c.id_curso = m.id_curso
GROUP BY
    c.titulo
ORDER BY
    Taxa_Conclusao_Percentual DESC;

SELECT * FROM v_taxa_conclusao_curso;



CREATE INDEX idx_pagamento_status ON pagamentos (status_pagamento);
