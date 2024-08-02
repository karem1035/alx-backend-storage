#!/usr/bin/env python3
"""
Module for updating topics in school documents in a MongoDB collection.
"""


def update_topics(mongo_collection, name, topics):
    """
    Update all school documents with name = name in mongo_collection with topics = topics.
    """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
