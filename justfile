default:
  @just -l

build:
  docker-compose -f docker-compose.yml -f docker-compose.override.arm64.yml build --no-cache
