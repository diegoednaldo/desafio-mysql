/* ESTRUTURA DO BANCO DE DADOS - COMPLETA (Sem Chaves de Unicidade Compostas)
   OBJETIVO: Criação das 11 tabelas, PKs simples, FKs e Constraints.
*/

DROP DATABASE IF EXISTS db_cursos_online;
CREATE DATABASE db_cursos_online;
USE db_cursos_online;


CREATE TABLE categorias (
    id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE,
    descricao TEXT
);

CREATE TABLE instrutores (
    id_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    bio TEXT,
    linkedin VARCHAR(150)
);

CREATE TABLE alunos (
    id_aluno INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    cpf VARCHAR(20) NOT NULL UNIQUE,
    data_cadastro DATETIME DEFAULT NOW(),
    ativo BOOLEAN DEFAULT 1
);

CREATE TABLE cursos (
    id_curso INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    carga_horaria_horas INT,
    ativo BOOLEAN DEFAULT 1,
    id_categoria INT,
    CONSTRAINT fk_curso_categoria FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria)
);

CREATE TABLE cursos_instrutores (
    id_curso_instrutor INT AUTO_INCREMENT PRIMARY KEY,
    id_curso INT NOT NULL,
    id_instrutor INT NOT NULL,
    principal BOOLEAN DEFAULT 0,
    CONSTRAINT fk_ci_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON DELETE CASCADE,
    CONSTRAINT fk_ci_instrutor FOREIGN KEY (id_instrutor) REFERENCES instrutores(id_instrutor)
);

CREATE TABLE modulos (
    id_modulo INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    ordem INT NOT NULL,
    id_curso INT,
    CONSTRAINT fk_modulo_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso) ON DELETE CASCADE
);

CREATE TABLE aulas (
    id_aula INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    url_video VARCHAR(255),
    duracao_minutos INT,
    id_modulo INT,
    CONSTRAINT fk_aula_modulo FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo) ON DELETE CASCADE
);

CREATE TABLE progresso_aluno (
    id_progresso INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT NOT NULL,
    id_aula INT NOT NULL,
    data_conclusao DATETIME,
    status ENUM('ASSISTIDO', 'EM_ANDAMENTO', 'NAO_INICIADO') DEFAULT 'NAO_INICIADO',
    CONSTRAINT fk_progresso_aluno FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    CONSTRAINT fk_progresso_aula FOREIGN KEY (id_aula) REFERENCES aulas(id_aula)
);

CREATE TABLE matriculas (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    data_matricula DATETIME DEFAULT NOW(),
    valor_liquido DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'CONCLUIDO',
    id_aluno INT,
    id_curso INT,
    CONSTRAINT fk_matricula_aluno FOREIGN KEY (id_aluno) REFERENCES alunos(id_aluno),
    CONSTRAINT fk_matricula_curso FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE pagamentos (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_matricula INT NOT NULL UNIQUE,
    valor_total DECIMAL(10, 2) NOT NULL,
    metodo VARCHAR(50) NOT NULL,
    status_pagamento VARCHAR(20) NOT NULL,
    data_pagamento DATETIME DEFAULT NOW(),
    CONSTRAINT fk_pagamento_matricula FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);

CREATE TABLE avaliacoes (
    id_avaliacao INT AUTO_INCREMENT PRIMARY KEY,
    nota INT NOT NULL CHECK (nota >= 1 AND nota <= 5),
    comentario TEXT,
    data_avaliacao DATETIME DEFAULT NOW(),
    id_matricula INT UNIQUE,
    CONSTRAINT fk_avaliacao_matricula FOREIGN KEY (id_matricula) REFERENCES matriculas(id_matricula)
);
