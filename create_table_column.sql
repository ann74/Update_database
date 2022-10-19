CREATE TABLE if not exists suppliers (
    id int primary key,
    company_name varchar(40),
    contact varchar(50),
    country varchar(15),
    region varchar(15),
    postal_code varchar(10),
    city varchar(15),
    address varchar(100),
    phone varchar(25),
    fax varchar(25),
    homepage varchar(100)
);

ALTER table products
    ADD  column supplier_id int;

ALTER TABLE products
    ADD CONSTRAINT fk_supplier_id FOREIGN KEY (supplier_id) REFERENCES suppliers;
