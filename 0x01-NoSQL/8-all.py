#!/usr/bin/env python3
"""pyMongo module."""


def list_all(mongo_collection):
    """
    List all items of a MongoDB collection.

    :param mongo_collection: MongoDB collection to list items from.
    :return: A cursor object containing all items in the collection.
    """

    return mongo_collection.find()
