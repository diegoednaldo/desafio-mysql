USE db_cursos_online;

SELECT * FROM cursos;

-- Requisito: Exemplo de UPDATE (Mudar o preço do curso de Python)
UPDATE cursos
SET preco = 219.90, carga_horaria_horas = 45
WHERE id_curso = 4;
SELECT * FROM cursos;

INSERT INTO categorias (nome, descricao) VALUES ('Gastronomia', 'Cursos de culinária e alimentos.');
SELECT * FROM categorias;

-- Requisito: Exemplo de DELETE (Remover uma categoria vazia)
DELETE FROM categorias
WHERE nome = 'Gastronomia';
SELECT * FROM categorias;
