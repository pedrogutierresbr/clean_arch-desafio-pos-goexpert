## ---------- MIGRATIONS
.PHONY: createmigration
createmigration:
	migrate create -ext=sql -dir=internal/infra/database/migrations -seq init

.PHONY: migrate
migrate:
	migrate -path=internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose up
	
.PHONY: migratedown	
migratedown:
	migrate -path=internal/infra/database/migrations -database "mysql://root:root@tcp(localhost:3306)/orders" -verbose down



## ---------- MAIN
.PHONY: up
up:
	docker-compose up -d

.PHONY: down
down:
	docker-compose down

.PHONY: serve
serve: ## Run the rest-api, grpc and graphql servers
	cd cmd/ordersystem && go run main.go wire_gen.go
	cd -