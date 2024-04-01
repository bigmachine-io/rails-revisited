# rails g scaffold customer first_name last_name email:uniq company address city state country postal_code phone fax  --no-migration --no-jbuilder

rails g scaffold album title artist:references price:decimal --no-migration  --no-jbuilder

rails g scaffold artist name:uniq --no-migration  --no-jbuilder

rails g scaffold employee first_name last_name email:uniq title reports_to:int birth_date:date hire_date:date address city state country postal_code phone fax  --no-migration --no-jbuilder

rails g scaffold genre name:uniq --no-migration  --no-jbuilder

rails g scaffold invoice customer:references invoice_date:date billing_address billing_city billing_state billing_country billing_postal_code total:decimal --no-migration  --no-jbuilder

rails g scaffold media_type name:uniq --no-migration  --no-jbuilder
rails g scaffold playlist name:uniq --no-migration  --no-jbuilder
rails g scaffold track name composer milliseconds:int bytes:int unit_price:decimal album:references media_type:references genre:references --no-migration  --no-jbuilder
