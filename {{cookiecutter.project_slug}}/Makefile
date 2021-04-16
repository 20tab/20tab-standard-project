self_documenting:
	@echo "[Help] Makefile list commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

c = {{cookiecutter.project_slug}}_backend
p = shell
django:  ## Exec django command 
	docker exec -it $(c) python manage.py $(p)

pull:  ## Pull develop on orchestrator, frontend and backend 
	git checkout develop && git pull && \
	cd backend && git checkout develop && git pull && \{% if cookiecutter.which_frontend in ["React", "React (TypeScript)"] %}
	cd ../frontend && git checkout develop && git pull && \{% endif %}
	cd ..

s =
rebuild:  ## Rebuild container
	docker-compose stop $(s) && docker-compose rm -f $(s) && docker-compose up -d --build $(s)
