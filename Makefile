init:
	docker compose build
	docke compose run --rm backend rails db:create

start:
	docker compose up -d

stop:
	docker compose down

bundle_install:
	docker compose exec backend bundle install

rubocop_auto_correct:
	docker compose exec backend bundle exec rubocop -a

rubocop_gen_todo:
	docker compose exec backend bundle exec rubocop --auto-gen-config --exclude-limit 99999 --no-offense-counts --no-auto-gen-timestamp
