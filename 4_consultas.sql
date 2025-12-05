/* CONSULTAS E RECURSOS AVANÇADOS
   OBJETIVO: Demonstrar SELECTs, INDEX e VIEW
   para requisitos do desafio.
*/

USE db_cursos_online;

-- SELECT BÁSICO COM FILTRO E ORDENAÇÃO
-- Objetivo: Cursos de Programação (id_categoria = 1) abaixo de R$150, ordenados por preço (WHERE e ORDER BY).
SELECT
    id_curso,
    titulo,
    preco
FROM
    cursos
WHERE
    preco < 150
    AND id_categoria = 1
ORDER BY
    preco DESC;

-- FILTROS COMPLEXOS: NOT IN E LIKE
-- Objetivo: Cursos que NÃO são das categorias 1(Programação) e 5(Línguas) (NOT IN) E que tenham 'Design' no título (LIKE).
SELECT
    titulo,
    preco,
    carga_horaria_horas
FROM
    cursos
WHERE
    id_categoria NOT IN (1, 5)
    AND titulo LIKE '%Design%';

-- INNER JOIN (Listagem de Matrículas Efetivas)
-- Objetivo: Listar o nome dos alunos e os títulos dos cursos que ELES PAGARAM (Requisito 1 INNER JOIN).
SELECT
    a.nome AS Nome_Aluno,
    c.titulo AS Titulo_Curso,
    m.data_matricula
FROM
    alunos a
INNER JOIN
    matriculas m ON a.id_aluno = m.id_aluno
INNER JOIN
    cursos c ON m.id_curso = c.id_curso
ORDER BY
    Nome_Aluno;

-- LEFT JOIN (Relatório de Avaliações)
-- Objetivo: Mostrar TODOS os Instrutores e a média de avaliação de seus cursos (Requisito LEFT JOIN).
SELECT
    i.nome AS Nome_Instrutor,
    AVG(av.nota) AS Media_Avaliacoes
FROM
    instrutores i
LEFT JOIN
    cursos c ON i.id_instrutor = c.id_instrutor
LEFT JOIN
    matriculas m ON c.id_curso = m.id_curso
LEFT JOIN
    avaliacoes av ON m.id_matricula = av.id_matricula
GROUP BY
    i.nome
ORDER BY
    Media_Avaliacoes DESC;


-- GROUP BY + FUNÇÃO DE AGREGAÇÃO + HAVING
-- Objetivo: Contar matrículas por curso (COUNT) e mostrar APENAS os cursos com 2 ou mais matrículas (HAVING).
SELECT
    c.titulo AS Titulo_Curso,
    COUNT(m.id_matricula) AS Total_Matriculas
FROM
    cursos c
JOIN
    matriculas m ON c.id_curso = m.id_curso
GROUP BY
    c.titulo
HAVING
    Total_Matriculas >= 2;

-- Requisito: Criação de 1 INDEX em uma coluna de alta frequência de busca.
-- Escolha: email na tabela alunos (usado para login).
CREATE INDEX idx_aluno_email ON alunos (email);

/* Explicação do INDEX:
   1. Por que indexar 'email'?
      O campo 'email' é usado com frequência para login e recuperação de senha. Além
      disso, ele é "UNIQUE", o que acelera ainda mais a busca.
   2. Em qual consulta isso ajudaria?
      Ajudaria em qualquer consulta que filtre o acesso de um aluno pelo email,
      como:
*/
-- USO DO ÍNDICE:
/* SELECT id_aluno, nome
FROM alunos
WHERE email = 'rafael.costa@mail.com';
*/

-- Requisito: Criação de 1 VIEW que usa JOIN e Agregação para um relatório útil.
-- Objetivo: Faturamento total e número de vendas por instrutor.
CREATE OR REPLACE VIEW v_faturamento_por_instrutor AS
SELECT
    i.nome AS Nome_Instrutor,
    COUNT(m.id_matricula) AS Total_Vendas,
    SUM(m.valor_pago) AS Faturamento_Total
FROM
    instrutores i
LEFT JOIN
    cursos c ON i.id_instrutor = c.id_instrutor
LEFT JOIN
    matriculas m ON c.id_curso = m.id_curso
GROUP BY
    i.nome
ORDER BY
    Faturamento_Total DESC;

-- Visualização da VIEW criada.
SELECT * FROM v_faturamento_por_instrutor;
