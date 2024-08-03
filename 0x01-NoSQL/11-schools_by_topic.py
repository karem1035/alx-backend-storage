#!/usr/bin/env python3
"""returns the list of school having a specific topic"""


def schools_by_topic(mongo_collection, topic):
    """return the matcing topic"""
    documents = mongo_collection.find({"topics": topic})
    return list(documents)
