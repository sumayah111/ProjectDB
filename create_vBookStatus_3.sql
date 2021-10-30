create view vBookStatus as
    select ISSN, authors, status
    from books
    where status='Available'
