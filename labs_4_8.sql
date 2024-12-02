-- Создание таблицы authors (авторы)
CREATE TABLE IF NOT EXISTS authors (
    id INTEGER PRIMARY KEY,      -- Поле id как первичный ключ
    name TEXT NOT NULL            -- Имя автора
);

-- Создание таблицы books (книги)
CREATE TABLE IF NOT EXISTS books (
    id INTEGER PRIMARY KEY,      -- Поле id как первичный ключ
    title TEXT NOT NULL,         -- Название книги
    author_id INTEGER,           -- Внешний ключ, ссылающийся на автора
    FOREIGN KEY (author_id) REFERENCES authors(id)  -- Связь с таблицей authors
);

-- Запрос для объединения таблиц authors и books
-- Этот запрос выводит имя автора и название книги
SELECT 
    a.name AS AuthorName,         -- Имя автора
    b.title AS BookTitle          -- Название книги
FROM authors a
-- Объединяем с таблицей books по внешнему ключу author_id
JOIN books b ON a.id = b.author_id;
