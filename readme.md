# Entity Relationship Diagram : Library ERD
```mermaid
---
title: Library ERD
---
erDiagram

    buku {
        INT id PK
        string title
        string author
        string publisher
        int total_pages
        int category_id FK
        int borrower_id FK
        int lender_id FK
        int bookshelf_id FK
        datetime borrowed_at
        datetime back_at
        datetime created_at
        datetime updated_at
    }

    kategori {
        INT id PK
        string category_name
        datetime created_at
        datetime updated_at
    }

    rak_buku {
        INT id PK
        string shelf_name
        datetime created_at
        datetime updated_at
    }

    petugas{
        INT id PK
        string name
        datetime created_at
        datetime updated_at
    }
    
    peminjam{
        INT id PK
        string name
        int book_id FK
        datetime created_at
        datetime updated_at
    }

    buku ||--|| kategori : has
    rak_buku only one to zero or many buku : has
    buku only one to only one peminjam : borrow
    buku only one to only one petugas : lend
```