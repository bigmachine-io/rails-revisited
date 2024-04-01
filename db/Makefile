rebuild: dev change schema migrate

migrate:
	rails db:migrate

schema:
	rails db:schema:dump

dev:
	psql -q railz_development < db.sql

change:
	psql -q railz_development < change.sql


.PHONY: dev change migrate schema db