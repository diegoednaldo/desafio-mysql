/* INSERÇÃO E MANIPULAÇÃO DE DADOS
   OBJETIVO: Popular as 8 tabelas e demonstrar comandos DML (UPDATE e DELETE).
*/

USE db_cursos_online;

INSERT INTO categorias (nome, descricao) VALUES
('Programação', 'Cursos de desenvolvimento de software e linguagens.'),
('Marketing Digital', 'Estratégias para presença online, SEO e mídias sociais.'),
('Design Gráfico', 'Ferramentas e conceitos de identidade visual e layouts.'),
('Negócios', 'Gestão, finanças e empreendedorismo.'),
('Línguas', 'Aprenda novos idiomas como Inglês e Espanhol.'),
('Saúde e Bem-Estar', 'Cursos de nutrição, fitness e desenvolvimento pessoal.');

INSERT INTO instrutores (nome, email, bio, linkedin) VALUES
('Carlos Silva', 'carlos.silva@deal.com', 'Especialista em Backend e arquitetura de dados.', 'carlos-silva-dev'),
('Ana Paula Mendes', 'ana.mendes@deal.com', 'UX/UI Designer com foco em usabilidade.', 'ana-paula-designer'),
('João Ricardo', 'joao.ricardo@deal.com', 'Mestre em SEO e tráfego pago.', 'joao-ricardo-marketing'),
('Maria Oliveira', 'maria.oliver@deal.com', 'Coach e especialista em soft skills.', 'maria-oliveira-coach'),
('Fernando Lima', 'fernando.lima@deal.com', 'Desenvolvedor Full-Stack focado em Python e Django.', 'fernando-lima-dev' );

INSERT INTO alunos (nome, email, cpf) VALUES
('Bruna Santos', 'bruna.santos@mail.com', '11111111111'),
('Rafael Costa', 'rafael.costa@mail.com', '22222222222'),
('Camila Souza', 'camila.souza@mail.com', '33333333333'),
('Pedro Almeida', 'pedro.almeida@mail.com', '44444444444'),
('Juliana Melo', 'juliana.melo@mail.com', '55555555555'),
('Lucas Pereira', 'lucas.pereira@mail.com', '66666666666');

INSERT INTO cursos (titulo, descricao, preco, carga_horaria_horas, id_instrutor, id_categoria) VALUES
('SQL para Iniciantes', 'Aprenda consultas e manipulação de dados.', 49.90, 10, 1, 1),
('Design de Landing Pages', 'Crie páginas de alta conversão.', 79.90, 15, 2, 3),
('Estratégias de SEO 2024', 'Domine a otimização de busca.', 129.50, 20, 3, 2),
('Python Web com Django', 'Desenvolvimento de APIs e aplicações web.', 199.90, 40, 5, 1),
('Gestão de Projetos Ágeis', 'Scrum e Kanban na prática.', 99.00, 12, 4, 4),
('Inglês Básico para Viagem', 'Frases e vocabulário essenciais.', 59.90, 8, 4, 5);

INSERT INTO matriculas (id_aluno, id_curso, valor_pago, status) VALUES
(1, 1, 49.90, 'CONCLUIDO'),
(2, 4, 199.90, 'EM_ANDAMENTO'),
(3, 3, 129.50, 'CONCLUIDO'),
(4, 5, 99.00, 'EM_ANDAMENTO'),
(5, 2, 79.90, 'CONCLUIDO'),
(6, 1, 49.90, 'EM_ANDAMENTO'),
(1, 4, 199.90, 'EM_ANDAMENTO'); -- Bruna em Python

INSERT INTO modulos (titulo, ordem, id_curso) VALUES
('Introdução ao MySQL', 1, 1),
('Consultas Básicas', 2, 1),
('Configurando o Ambiente Django', 1, 4),
('Modelagem no Django', 2, 4),
('Métricas de SEO', 1, 3);

INSERT INTO aulas (titulo, url_video, duracao_minutos, id_modulo) VALUES
('O que é um SGBD?', 'url_aula_1', 10, 1),
('SELECT, FROM e WHERE', 'url_aula_2', 15, 2),
('Criando a primeira View', 'url_aula_3', 12, 2),
('Instalação e Configuração', 'url_aula_4', 20, 3),
('Criando a Home Page', 'url_aula_5', 30, 4),
('Pesquisa de Palavras-Chave', 'url_aula_6', 18, 5);

INSERT INTO avaliacoes (id_matricula, nota, comentario) VALUES
(1, 5, 'Curso excelente, muito direto ao ponto!'),
(3, 4, 'Conteúdo muito bom, mas o áudio poderia ser melhor.'),
(5, 5, 'Melhor curso de Design que já fiz!'),
(6, 3, 'Esperava mais exemplos práticos de Join.'),
(7, 5, 'Python é incrível! Instrutor Fernando manda bem.');
