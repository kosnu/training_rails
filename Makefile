init:
	docker compose build
	docker compose run --rm backend rails db:create

start:
	docker compose up -d

stop:
	docker compose down

bundle_install:
	docker compose exec backend bundle install

rubocop_auto_correct:
	docker compose exec backend bundle exec rubocop -A

rubocop_gen_todo:
	docker compose exec backend bundle exec rubocop --auto-gen-config --exclude-limit 99999 --no-offense-counts --no-auto-gen-timestamp
