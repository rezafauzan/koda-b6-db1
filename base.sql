DROP DATABASE IF EXISTS library;
CREATE DATABASE library;

DROP TABLE IF EXISTS buku;
CREATE TABLE buku (
        id SERIAL PRIMARY KEY,
        title VARCHAR(255),
        author VARCHAR(255),
        publisher VARCHAR(255),
        total_pages INT,
        category_id INT,
        bookshelf_id INT,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);


DROP TABLE IF EXISTS kategori;
CREATE TABLE kategori (
        id SERIAL PRIMARY KEY,
        category_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS rak_buku;
CREATE TABLE rak_buku (
        id SERIAL PRIMARY KEY,
        shelf_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS petugas;
CREATE TABLE petugas(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS peminjam;
CREATE TABLE peminjam(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        book_id INT,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

DROP TABLE IF EXISTS pinjaman;
CREATE TABLE pinjaman (
        id SERIAL PRIMARY KEY,
        book_id FOREIGN KEY REFERENCES buku(id),
        borrower_id FOREIGN KEY REFERENCES peminjam(id),
        lender_id FOREIGN KEY REFERENCES petugas(id),
        borrowed_at TIMESTAMP,
        back_at TIMESTAMP,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP DEFAULT NOW()
);

ALTER TABLE "buku" ADD CONSTRAINT fk_kategori FOREIGN KEY (category_id) REFERENCES kategori(id);
ALTER TABLE "buku" ADD CONSTRAINT fk_peminjam FOREIGN KEY (borrower_id) REFERENCES peminjam(id);
ALTER TABLE "buku" ADD CONSTRAINT fk_petugas FOREIGN KEY (lender_id) REFERENCES petugas(id);
ALTER TABLE "buku" ADD CONSTRAINT fk_rak_buku FOREIGN KEY (bookshelf_id) REFERENCES rak_buku(id);

INSERT INTO kategori (category_name) VALUES ('Novel'), ('Komik'), ('Teknologi'), ('Sejarah'), ('Biografi'), ('Sains'), ('Pendidikan'), ('Agama'), ('Bisnis'), ('Fiksi');
INSERT INTO rak_buku (shelf_name) VALUES ('Rak A'), ('Rak B'), ('Rak D'), ('Rak E'), ('Rak F'), ('Rak G'), ('Rak H'), ('Rak I'), ('Rak J'), ('Rak L');
INSERT INTO petugas (name) VALUES ('Andi'), ('Budi'), ('Citra'), ('Dewi'), ('Eka'), ('Fajar'), ('Gita'), ('Hendra'), ('Indah'), ('Joko');
INSERT INTO peminjam (name, book_id) VALUES ('John', 1), ('Jihn', 2), ('Kerang', 3), ('Jambu', 4), ('Mouse', 5), ('Putri', 6), ('Lampu', 7), ('Mila', 8), ('Mali', 9), ('Lina', 10);

INSERT INTO buku (title, author, publisher, total_pages,category_id, borrower_id, lender_id, bookshelf_id,borrowed_at, back_at) 
VALUES
('Belajar Golang', 'Reza Fauzan', 'Informatika', 320, 3, 1, 1, 1, NOW(), NOW()),
('Dasar PostgreSQL', 'Andi Wijaya', 'Gramedia', 280, 3, 2, 2, 2, NOW(), NOW()),
('Sejarah Dunia', 'Budi Santoso', 'Erlangga', 450, 4, 3, 3, 3, NOW(), NOW()),
('Biografi Tesla', 'Nikola Bio', 'Bentang', 300, 5, 4, 4, 4, NOW(), NOW()),
('Fisika Dasar', 'Isaac Newton', 'Andi', 500, 6, 5, 5, 5, NOW(), NOW()),
('Matematika SMA', 'Pak Dengklek', 'Erlangga', 420, 7, 6, 6, 6, NOW(), NOW()),
('Bisnis Startup', 'Nadiem Makarim', 'Kompas', 350, 9, 7, 7, 7, NOW(), NOW()),
('Komik Naruto', 'Masashi Kishimoto', 'Elex Media', 200, 2, 8, 8, 8, NOW(), NOW()),
('Novel Senja', 'Tere Liye', 'Republika', 380, 1, 9, 9, 9, NOW(), NOW()),
('Agama Islam', 'Buya Hamka', 'Gema Insani', 410, 8, 10, 10, 10, NOW(), NOW());

SELECT title, author, publisher, total_pages,category_id, borrower_id, lender_id, bookshelf_id,borrowed_at, back_at FROM buku