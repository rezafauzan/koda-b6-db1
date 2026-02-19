CREATE DATABASE library;

CREATE TABLE buku (
        id SERIAL PRIMARY KEY,
        title VARCHAR(255),
        author VARCHAR(255),
        publisher VARCHAR(255),
        total_pages INT,
        category_id INT,
        borrower_id INT,
        lender_id INT,
        borrowed_at TIMESTAMP,
        back_at TIMESTAMP,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP
);
CREATE TABLE kategori (
        id SERIAL PRIMARY KEY,
        category_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP
);
CREATE TABLE rak_buku (
        id VARCHAR(255) PRIMARY KEY,
        shelf_name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP
);
CREATE TABLE petugas(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP
);
CREATE TABLE peminjam(
        id SERIAL PRIMARY KEY,
        name VARCHAR(255),
        book_id INT,
        created_at TIMESTAMP DEFAULT NOW(),
        updated_at TIMESTAMP
);