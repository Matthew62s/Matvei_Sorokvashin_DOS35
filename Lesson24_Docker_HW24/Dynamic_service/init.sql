CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    text TEXT
);

INSERT INTO news(title, text)
VALUES
('Первая запись', 'Данные из PostgreSQL'),
('Вторая запись', 'Docker + PHP + Nginx'),
('Третья запись', 'Финальная архитектура готова');
