#!/usr/bin/env python3
"""
Module for updating topics in school documents in a MongoDB collection.
"""


def update_topics(mongo_collection, name, topics):
    """
    Update all school documents with name = name in mongo_collection with topics = topics.

    Args:
        mongo_collection(MongoClient): The MongoDB collection to update.
        name(str): The name of the school.
        topics(list): The new topics for the school.

    Returns:
        None.
    """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
