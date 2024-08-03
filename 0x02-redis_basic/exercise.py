#!/usr/bin/env python3
import redis
import uuid
from typing import Union


class Cache:
    ''' Class Cashe '''

    def __init__(self) -> None:
        ''' initialize the cashe '''
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        ''' Store the data with a key'''
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
