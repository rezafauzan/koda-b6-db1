-- DROP DATABASE IF EXISTS library;
-- CREATE DATABASE library;
DROP TABLE IF EXISTS pinjaman;
DROP TABLE IF EXISTS buku;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS publisher;
DROP TABLE IF EXISTS kategori;
DROP TABLE IF EXISTS rak_buku;
DROP TABLE IF EXISTS petugas;
DROP TABLE IF EXISTS peminjam;

CREATE TABLE author (
        id SERIAL PRIMARY KEY,
        author_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE publisher (
        id SERIAL PRIMARY KEY,
        publisher_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE buku (
        id SERIAL PRIMARY KEY,
        title VARCHAR(255),
        author_id INT REFERENCES author(id),
        publisher_id INT REFERENCES publisher(id),
        total_pages INT,
        category_id INT,
        bookshelf_id INT,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE kategori (
        id SERIAL PRIMARY KEY,
        category_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE rak_buku (
        id SERIAL PRIMARY KEY,
        shelf_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE petugas(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE peminjam(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        book_id INT,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE pinjaman (
        id SERIAL PRIMARY KEY,
        book_id INT REFERENCES buku(id),
        borrower_id INT REFERENCES peminjam(id),
        lender_id INT REFERENCES petugas(id),
        borrowed_at TIMESTAMP,
        back_at TIMESTAMP,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE "buku" ADD CONSTRAINT fk_kategori FOREIGN KEY (category_id) REFERENCES kategori(id);
ALTER TABLE "buku" ADD CONSTRAINT fk_rak_buku FOREIGN KEY (bookshelf_id) REFERENCES rak_buku(id);

INSERT INTO author (author_name) VALUES ('Andrea Hirata'), ('Tere Liye'), ('Dee Lestari'), ('Pramoedya Ananta Toer'), ('Habiburrahman El Shirazy'), ('Eka Kurniawan'), ('Pidi Baiq'), ('Okky Madasari'), ('Ayu Utami'), ('Raditya Dika');
INSERT INTO publisher (publisher_name) VALUES ('Gramedia Pustaka Utama'), ('Mizan'), ('Elex Media Komputindo'), ('Bentang Pustaka'), ('GagasMedia'), ('Republika Penerbit'), ('Andi Publisher'), ('Bukune'), ('Penerbit Erlangga'), ('Noura Books');
INSERT INTO kategori (category_name) VALUES ('Novel'), ('Komik'), ('Teknologi'), ('Sejarah'), ('Biografi'), ('Sains'), ('Pendidikan'), ('Agama'), ('Bisnis'), ('Fiksi');
INSERT INTO rak_buku (shelf_name) VALUES ('Rak A'), ('Rak B'), ('Rak D'), ('Rak E'), ('Rak F'), ('Rak G'), ('Rak H'), ('Rak I'), ('Rak J'), ('Rak L');
INSERT INTO petugas (name) VALUES ('Andi'), ('Budi'), ('Citra'), ('Dewi'), ('Eka'), ('Fajar'), ('Gita'), ('Hendra'), ('Indah'), ('Joko');
INSERT INTO peminjam (name, book_id) VALUES ('John', 1), ('Jihn', 2), ('Kerang', 3), ('Jambu', 4), ('Mouse', 5), ('Putri', 6), ('Lampu', 7), ('Mila', 8), ('Mali', 9), ('Lina', 10);

INSERT INTO buku (title, author_id, publisher_id, total_pages, category_id, bookshelf_id) 
VALUES
('Belajar Golang', 1, 10, 320, 3, 1),
('Dasar PostgreSQL', 2, 9, 280, 3, 2),
('Sejarah Dunia', 3, 8, 450, 4, 3),
('Biografi Tesla', 4, 7, 300, 5, 4),
('Fisika Dasar', 5, 6, 500, 6, 5),
('Matematika SMA', 6, 5, 420, 7, 6),
('Bisnis Startup', 7, 4, 350, 9, 7),
('Komik Naruto', 8, 3, 200, 2, 8),
('Novel Senja', 9, 2, 380, 1, 9),
('Agama Islam', 10, 1, 410, 8, 10);

SELECT title, author_id, publisher_id, total_pages, category_id, bookshelf_id, created_at, updated_at FROM buku