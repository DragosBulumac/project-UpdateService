from fastapi import FastAPI

from .apis import hello_api


def _register_api_handlers(app: FastAPI) -> FastAPI:
    app.include_router(hello_api.router)
    return app


def create_app() -> FastAPI:
    """Create and return FastAPI application."""
    app = FastAPI()
    app = _register_api_handlers(app)
    return app


app = create_app()