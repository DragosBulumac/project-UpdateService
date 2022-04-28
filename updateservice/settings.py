import functools

from pydantic import (BaseSettings,
                      Field)


class AppSettings(BaseSettings):
    host = Field("127.0.0.1")
    port = Field("8080")
    
    class Config:
        env_prefix = "update_service_"


@functools.lru_cache
def get_settings() -> dict:
    return AppSettings().dict()