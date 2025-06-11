default:
  @just -l

build-nginx:
  docker-compose -f docker-compose.yml -f docker-compose.override.arm64.yml build --no-cache nginx

build-django:
  docker-compose -f docker-compose.yml -f docker-compose.override.arm64.yml build --no-cache uwsgi

build: build-nginx build-django

tag-nginx:
  docker tag defectdojo/defectdojo-nginx ${DD_REPO}/nginx

tag-django:
  docker tag defectdojo/defectdojo-django ${DD_REPO}/django

tag: tag-nginx tag-django
