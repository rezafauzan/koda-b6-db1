# Entity Relationship Diagram : Library ERD
Creating ERD and implement it to postgreSQL database

## Result Screenshoot
![Table Relation](assets/img/screenshoot.png)

## Data Screenshoot
![Data](assets/img/screenshoot_data.png)

## How to run it 
- Download base.sql run it with postgresql query terminal

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

    author{
        int id PK
        string author_name
        datetime created_at
        datetime updated_at
    }

    publisher{
        int id PK
        string publisher_name
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

    pinjaman{
        int id PK
        int book_id FK
        int borrower_id FK
        int lender_id FK
        datetime borrowed_at
        datetime back_at
        datetime created_at
        datetime updated_at
    }

    buku ||--|| kategori : has
    buku one or more to only one author : has
    buku one or more to only one publisher : has
    rak_buku only one to zero or many buku : has
    pinjaman only one to only one buku : has
    pinjaman only one to only one peminjam : has
    pinjaman only one to only one petugas : has
```