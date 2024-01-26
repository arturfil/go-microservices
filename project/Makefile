FRONT_END_BINARY=frontEnd
BROKER_BINARY=brokerService
LOGGER_BINARY=loggerService
AUTH_BINARY=authService
MAIL_BINARY=mailService
LISTENER_BINARY=listenerService

up:
	@echo "Starting Docker images"
	docker-compose up -d --remove-orphans
	@echo "Docker images started!"

up.build: build.broker build.auth-app build.front build.logger build.mailer build.listener
	@echo "Stopping docker images if running"
	docker-compose down
	@echo "Building and starting docker images"
	docker-compose up --build -d --remove-orphans
	@echo "Docker images build and started!"

down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

build.broker:
	@echo "building broker binary..."
	cd ../broker_service/ && env GOOS=linux CGO_ENABLED=0 go build -o ${BROKER_BINARY} ../broker_service/cmd/api
	echo "Done!"

build.logger:
	@echo "building logger binary..."
	cd ../logger_service/ && env GOOS=linux CGO_ENABLED=0 go build -o ${LOGGER_BINARY} ../logger_service/cmd/api
	echo "Done!"

build.listener:
	@echo "building listener binary..."
	cd ../listener_service/ && env GOOS=linux CGO_ENABLED=0 go build -o ${LISTENER_BINARY} ../listener_service/.
	echo "Done!"

build.auth-app:
	@echo "building auth binary..."
	cd ../authentication_service/ && env GOOS=linux CGO_ENABLED=0 go build -o ${AUTH_BINARY} ../authentication_service/cmd/api
	echo "Done!"

build.mailer:
	@echo "building mailer service..."
	cd ../mail_service/ && env GOOS=linux CGO_ENABLED=0 go build -o ${MAIL_BINARY} ../mail_service/cmd/api
	echo "Done!"

build.front:
	@echo "Bulding front end binary"
	cd ../frontend && env CGO_ENABLED=0 go build -o ${FRONT_END_BINARY} ../frontend/cmd/web
	@echo "Done!"

start: down stop up.build up
	@echo "Starting fronttend"
	cd ../frontend && ./${FRONT_END_BINARY} &

stop:
	@echo "Stopping front end..."
	@-pkill -SIGTERM -f "./${FRONT_END_BINARY}"
	@echo "Stopped frontend!"

# proto.logs:
# 	cd ../logger_service/logs &
# 	protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative logs.proto
