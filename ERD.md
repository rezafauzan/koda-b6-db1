# Entity Relationship Diagram : Library ERD
```mermaid
---
    title: Library ERD
---
    erDiagram

    BOOK {
        string id PK
        string title
        string author
        string publisher
        int pages
        string category_id FK
        string borrower_id FK
        datetime created_at
        datetime updated_at
    }

    BOOK_CATEGORY {
        string id PK
        string category_name
        datetime created_at
        datetime updated_at
    }

    BOOK_SHELF {
        string id PK
        string category_name
        datetime created_at
        datetime updated_at
    }

    STAFF{
        string id PK
        string name
        datetime created_at
        datetime updated_at
    }
    
    MEMBER{
        string id PK
        string name
        datetime created_at
        datetime updated_at
    }
```