/* INSERÇÃO E MANIPULAÇÃO DE DADOS
*/
USE db_cursos_online;

-- 1. CATEGORIAS
INSERT INTO categorias (nome, descricao) VALUES
('Programação', 'Cursos de desenvolvimento de software e linguagens.'),
('Marketing Digital', 'Estratégias para presença online, SEO e mídias sociais.'),
('Design Gráfico', 'Ferramentas e conceitos de identidade visual e layouts.'),
('Negócios', 'Gestão, finanças e empreendedorismo.'),
('Línguas', 'Aprenda novos idiomas como Inglês e Espanhol.'),
('Saúde e Bem-Estar', 'Cursos de nutrição, fitness e desenvolvimento pessoal.'),
('Ciência de Dados', 'Análise, visualização e modelos de Machine Learning.'),
('Comunicação', 'Oratória, escrita e apresentações eficazes.');

-- 2. INSTRUTORES
INSERT INTO instrutores (nome, email, bio, linkedin) VALUES
('Carlos Silva', 'carlos.silva@deal.com', 'Especialista em Backend e arquitetura de dados.', 'carlos-silva-dev'),
('Ana Paula Mendes', 'ana.mendes@deal.com', 'UX/UI Designer com foco em usabilidade.', 'ana-paula-designer'),
('João Ricardo', 'joao.ricardo@deal.com', 'Mestre em SEO e tráfego pago.', 'joao-ricardo-marketing'),
('Maria Oliveira', 'maria.oliver@deal.com', 'Coach e especialista em soft skills.', 'maria-oliveira-coach'),
('Fernando Lima', 'fernando.lima@deal.com', 'Desenvolvedor Full-Stack focado em Python e Django.', 'fernando-lima-dev' ),
('Patricia Ramos', 'patricia.ramos@deal.com', 'Especialista em Machine Learning e Big Data.', 'patricia-ramos-data'),
('Roberto Souza', 'roberto.souza@deal.com', 'Especialista em Vendas e Liderança.', 'roberto-souza-negocios'),
('Clara Luz', 'clara.luz@deal.com', 'Professora de Inglês com 10 anos de experiência.', 'clara-luz-english'),
('Marcos Junior', 'marcos.junior@deal.com', 'Especialista em Branding e identidade visual.', 'marcos-junior-design'),
('Sandra Reis', 'sandra.reis@deal.com', 'Nutricionista e coach de bem-estar.', 'sandra-reis-saude');

-- 3. ALUNOS
INSERT INTO alunos (nome, email, cpf) VALUES
('Bruna Santos', 'bruna.santos@mail.com', '11111111111'),
('Rafael Costa', 'rafael.costa@mail.com', '22222222222'),
('Camila Souza', 'camila.souza@mail.com', '33333333333'),
('Pedro Almeida', 'pedro.almeida@mail.com', '44444444444'),
('Juliana Melo', 'juliana.melo@mail.com', '55555555555'),
('Lucas Pereira', 'lucas.pereira@mail.com', '66666666666'),
('Mariana Lima', 'mariana.lima@mail.com', '77777777777'),
('Gustavo Neves', 'gustavo.neves@mail.com', '88888888888'),
('Aline Ferreira', 'aline.ferreira@mail.com', '99999999999'),
('Ricardo Pires', 'ricardo.pires@mail.com', '10101010101'),
('Sofia Gomes', 'sofia.gomes@mail.com', '12121212121'),
('Felipe Barros', 'felipe.barros@mail.com', '13131313131'),
('Helena Dias', 'helena.dias@mail.com', '14141414141'),
('Vitor Rocha', 'vitor.rocha@mail.com', '15151515151'),
('Larissa Pinho', 'larissa.pinho@mail.com', '16161616161');

-- 4. CURSOS (Sem id_instrutor)
INSERT INTO cursos (titulo, descricao, preco, carga_horaria_horas, id_categoria) VALUES
('SQL para Iniciantes', 'Aprenda consultas e manipulação de dados.', 49.90, 10, 1),
('Design de Landing Pages', 'Crie páginas de alta conversão.', 79.90, 15, 3),
('Estratégias de SEO 2024', 'Domine a otimização de busca.', 129.50, 20, 2),
('Python Web com Django', 'Desenvolvimento de APIs e aplicações web.', 199.90, 40, 1),
('Gestão de Projetos Ágeis', 'Scrum e Kanban na prática.', 99.00, 12, 4),
('Inglês Básico para Viagem', 'Frases e vocabulário essenciais.', 59.90, 8, 5),
('Introdução ao Power BI', 'Crie dashboards e relatórios interativos.', 149.90, 25, 7),
('Fundamentos de UX Design', 'Foco na experiência do usuário e prototipagem.', 89.90, 18, 3),
('Tráfego Pago com Google Ads', 'Criação e otimização de campanhas.', 179.00, 30, 2),
('Liderança e Gestão de Equipes', 'Técnicas para alta performance.', 119.90, 15, 4),
('Desenvolvimento iOS com Swift', 'Criação de aplicativos mobile.', 299.00, 50, 1),
('Espanhol Intermediário', 'Conversação e gramática avançada.', 69.90, 20, 5),
('Alimentação Saudável no Dia a Dia', 'Plano nutricional e receitas.', 49.90, 10, 6),
('Oratória e Apresentações', 'Como falar em público com confiança.', 89.00, 14, 8);

-- 5. CURSOS_INSTRUTORES (M:N)
INSERT INTO cursos_instrutores (id_curso, id_instrutor, principal) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 5, 1),
(5, 4, 1),
(6, 4, 1),
(7, 1, 1),
(8, 2, 1),
(9, 3, 1),
(10, 7, 1),
(11, 5, 1),
(12, 8, 1),
(13, 10, 1),
(14, 9, 1),
(10, 4, 0),
(11, 1, 0);

-- 6. MATRICULAS (Usando valor_liquido)
INSERT INTO matriculas (id_aluno, id_curso, valor_liquido, status) VALUES
(1, 1, 49.90, 'CONCLUIDO'),
(2, 4, 199.90, 'EM_ANDAMENTO'),
(3, 3, 129.50, 'CONCLUIDO'),
(4, 5, 99.00, 'EM_ANDAMENTO'),
(5, 2, 79.90, 'CONCLUIDO'),
(6, 1, 49.90, 'EM_ANDAMENTO'),
(1, 4, 199.90, 'EM_ANDAMENTO'),
(7, 6, 59.90, 'CONCLUIDO'),
(8, 7, 149.90, 'CONCLUIDO'),
(9, 3, 129.50, 'EM_ANDAMENTO'),
(10, 1, 49.90, 'CONCLUIDO'),
(11, 8, 89.90, 'EM_ANDAMENTO'),
(12, 9, 179.00, 'CONCLUIDO'),
(13, 10, 119.90, 'EM_ANDAMENTO'),
(14, 11, 299.00, 'EM_ANDAMENTO'),
(15, 12, 69.90, 'CONCLUIDO'),
(2, 7, 149.90, 'CONCLUIDO'),
(3, 2, 79.90, 'EM_ANDAMENTO'),
(4, 14, 89.00, 'CONCLUIDO'),
(5, 13, 49.90, 'CONCLUIDO'),
(6, 4, 199.90, 'EM_ANDAMENTO');

-- 7. PAGAMENTOS (Detalhes da transação)
INSERT INTO pagamentos (id_matricula, valor_total, metodo, status_pagamento) VALUES
(1, 49.90, 'PIX', 'PAGO'),
(2, 199.90, 'CARTAO', 'PAGO'),
(3, 129.50, 'BOLETO', 'PAGO'),
(4, 99.00, 'CARTAO', 'PAGO'),
(5, 79.90, 'PIX', 'PAGO'),
(6, 49.90, 'CARTAO', 'PAGO'),
(7, 199.90, 'CARTAO', 'PAGO'),
(8, 59.90, 'PIX', 'PAGO'),
(9, 149.90, 'CARTAO', 'PAGO'),
(10, 129.50, 'BOLETO', 'PENDENTE'),
(11, 49.90, 'PIX', 'PAGO'),
(12, 89.90, 'CARTAO', 'PAGO'),
(13, 179.00, 'PIX', 'PAGO'),
(14, 119.90, 'CARTAO', 'PAGO'),
(15, 299.00, 'CARTAO', 'RECUSADO'),
(16, 69.90, 'PIX', 'PAGO'),
(17, 149.90, 'CARTAO', 'PAGO'),
(18, 79.90, 'BOLETO', 'PAGO'),
(19, 89.00, 'PIX', 'PAGO'),
(20, 49.90, 'CARTAO', 'PAGO'),
(21, 199.90, 'PIX', 'PAGO');

-- 8. MODULOS
INSERT INTO modulos (titulo, ordem, id_curso) VALUES
('Introdução ao MySQL', 1, 1),
('Consultas Básicas', 2, 1),
('Configurando o Ambiente Django', 1, 4),
('Modelagem no Django', 2, 4),
('Métricas de SEO', 1, 3),
('Visualizações Iniciais', 1, 7),
('Prototipação Básica', 1, 8),
('Criação de Campanha', 1, 9),
('Fundamentos de Swift', 1, 11),
('Gramática Intermediária', 1, 12),
('Técnicas de Apresentação', 1, 14),
('Boas Práticas de Projeto', 3, 1);

-- 9. AULAS
INSERT INTO aulas (titulo, url_video, duracao_minutos, id_modulo) VALUES
( 'O que é um SGBD?', 'url_aula_1', 10, 1),
( 'SELECT, FROM e WHERE', 'url_aula_2', 15, 2),
( 'Criando a primeira View', 'url_aula_3', 12, 2),
( 'Instalação e Configuração', 'url_aula_4', 20, 3),
( 'Criando a Home Page', 'url_aula_5', 30, 4),
( 'Pesquisa de Palavras-Chave', 'url_aula_6', 18, 5),
( 'Conectando o Power BI', 'url_aula_7', 15, 6),
( 'Criação do primeiro Relatório', 'url_aula_8', 25, 6),
( 'Wireframes e Fluxo', 'url_aula_9', 20, 7),
( 'Tipos de Campanha (Search, Display)', 'url_aula_10', 18, 8),
( 'Configuração do Xcode', 'url_aula_11', 15, 9),
( 'Variáveis e Constantes em Swift', 'url_aula_12', 25, 9),
( 'Conjugação de verbos comuns', 'url_aula_13', 10, 10),
( 'Dominando o Microfone', 'url_aula_14', 22, 11),
( 'Backup e Restauração', 'url_aula_15', 15, 12),
( 'JOINs Avançados', 'url_aula_16', 20, 12);

-- 10. PROGRESSO_ALUNO
INSERT INTO progresso_aluno (id_aluno, id_aula, status, data_conclusao) VALUES
(1, 1, 'ASSISTIDO', NOW()),
(1, 2, 'ASSISTIDO', NOW()),
(1, 3, 'ASSISTIDO', NOW()),
(6, 1, 'ASSISTIDO', NOW()),
(6, 2, 'EM_ANDAMENTO', NULL),
(10, 1, 'ASSISTIDO', NOW()),
(10, 2, 'ASSISTIDO', NOW()),
(2, 4, 'EM_ANDAMENTO', NULL),
(2, 7, 'ASSISTIDO', NOW()),
(3, 6, 'ASSISTIDO', NOW()),
(8, 7, 'ASSISTIDO', NOW()),
(8, 8, 'ASSISTIDO', NOW()),
(5, 9, 'ASSISTIDO', NOW()),
(12, 10, 'ASSISTIDO', NOW()),
(14, 11, 'EM_ANDAMENTO', NULL),
(15, 13, 'ASSISTIDO', NOW()),
(4, 14, 'ASSISTIDO', NOW()),
(1, 4, 'NAO_INICIADO', NULL);

-- 11. AVALIACOES
INSERT INTO avaliacoes (id_matricula, nota, comentario) VALUES
(1, 5, 'Curso excelente, muito direto ao ponto!'),
(3, 4, 'Conteúdo muito bom, mas o áudio poderia ser melhor.'),
(5, 5, 'Melhor curso de Design que já fiz!'),
(6, 3, 'Esperava mais exemplos práticos de Join.'),
(7, 5, 'Python é incrível! Instrutor Fernando manda bem.'),
(8, 4, 'Ótimo para quem precisa de frases rápidas para viagem.'),
(10, 5, 'SQL muito bem explicado. Recomendo para iniciantes!'),
(12, 5, 'Conteúdo de alta qualidade. Designer Ana Paula é muito didática.'),
(13, 4, 'Achei o curso de Google Ads prático e com foco em resultados.'),
(15, 3, 'O curso de iOS é avançado, senti falta de uma introdução mais suave.'),
(16, 5, 'Maravilhoso! Ajudou muito na fluência.'),
(18, 4, 'Bom conteúdo, mas o valor de R$79,90 ficou um pouco alto.'),
(19, 5, 'O instrutor de Oratória é inspirador e muito claro na comunicação.');
