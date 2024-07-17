#!/usr/bin/env python3
""" inserting module """


def insert_school(mongo_collection, **kwargs):
    """Inserts a new document in a collection based on kwargs."""
    n_doc = mongo_collection.insert_one(kwargs)

    return n_doc.inserted_id
