-- changes to existing schema go in here.

alter table albums
add price numeric(10,2) not null default 0;

alter table albums
drop sku;