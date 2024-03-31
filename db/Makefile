rebuild: dev test schema seed

seed:
	rails db:seed:replant

migrate:
	rails db:migrate

schema:
	rails db:schema:dump

dev:
	psql -q bigrail_development < db.sql

test:
	psql -q bigrail_test < db.sql


.PHONY: dev test migrate schema db seed