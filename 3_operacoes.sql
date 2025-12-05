USE db_cursos_online;

-- DEMONSTRAÇÃO DML: UPDATE
-- Requisito: Exemplo de UPDATE (Mudar o preço do curso de Python)
UPDATE cursos
SET preco = 219.90, carga_horaria_horas = 45
WHERE id_curso = 4;

-- 10. DEMONSTRAÇÃO DML: DELETE
-- Requisito: Exemplo de DELETE (Remover uma categoria vazia)
INSERT INTO categorias (nome, descricao) VALUES ('Gastronomia', 'Cursos de culinária e alimentos.');
DELETE FROM categorias
WHERE nome = 'Gastronomia';