docker build --build-arg DB_DATABASE=covid_most_development \
	     --build-arg DB_USERNAME=postgres \
	     --build-arg DB_PASSWORD=postgres_local \
	     --build-arg DB_HOST='host.docker.internal' \
	     -f .docker/production/Dockerfile --target app -t ideacrew/covid_most_app:$1 .
docker build --build-arg DB_DATABASE=covid_most_development \
             --build-arg DB_USERNAME=postgres \
             --build-arg DB_PASSWORD=postgres_local \
             --build-arg DB_HOST='host.docker.internal' \
	     -f .docker/production/Dockerfile --target web -t ideacrew/covid_most_web:$1 .
