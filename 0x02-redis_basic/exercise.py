#!/usr/bin/env python3
import redis
import uuid
from typing import Union, Callable, Optional


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

    def get(self, key: str, fn: Optional[Callable[[any], any]] = None) -> any:
        '''recovering original type'''
        value = self._redis.get(key)
        if fn:
            value = fn(value)
        return value

    def get_str(self, key: str) -> str:
        ''' Convert a bstring back to string '''
        value = self._redis.get(key)
        return value.decode('utf-8')

    def get_int(self, key: str) -> int:
        ''' Conver a bnumber back to number '''
        value = self._redis.get(key)
        return int(value)
