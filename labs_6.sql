-- Создание таблицы contacts с полем id как первичным ключом и полем name для имени контакта
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY,  -- Поле id как первичный ключ
    name TEXT                -- Поле name для хранения имени контакта
);

-- Создание таблицы email, где поле contact_id является внешним ключом, ссылающимся на таблицу contacts
CREATE TABLE email (
    address TEXT,                 -- Поле для хранения адреса электронной почты
    contact_id INTEGER,           -- Поле для хранения id контакта
    FOREIGN KEY (contact_id) REFERENCES contacts(id)  -- Внешний ключ, ссылающийся на таблицу contacts
);

-- Создание таблицы phones, где поле contact_id является внешним ключом, ссылающимся на таблицу contacts
CREATE TABLE phones (
    number TEXT,                 -- Поле для хранения номера телефона
    contact_id INTEGER,          -- Поле для хранения id контакта
    FOREIGN KEY (contact_id) REFERENCES contacts(id)  -- Внешний ключ, ссылающийся на таблицу contacts
);