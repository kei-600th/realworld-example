# Docker Setup Commands

```
docker build -t realworld-django:pyenv .
docker run -d --name realworld-django -p 8000:8000 realworld-django:pyenv
docker logs -n 50 realworld-django
```
