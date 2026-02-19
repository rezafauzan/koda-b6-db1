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
        borrower_id INT,
        lender_id INT,
        bookshelf_id INT,
        borrowed_at TIMESTAMP,
        back_at TIMESTAMP,
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

ALTER TABLE "buku" ADD CONSTRAINT fk_kategori FOREIGN KEY (category_id) REFERENCES kategori(id)
ALTER TABLE "buku" ADD CONSTRAINT fk_peminjam FOREIGN KEY (borrower_id) REFERENCES peminjam(id)
ALTER TABLE "buku" ADD CONSTRAINT fk_petugas FOREIGN KEY (lender_id) REFERENCES petugas(id)
ALTER TABLE "buku" ADD CONSTRAINT fk_rak_buku FOREIGN KEY (bookshelf_id) REFERENCES rak_buku(id)