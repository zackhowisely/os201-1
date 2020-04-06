#!/usr/bin/env python3
"""
LogParse.py
==============================================================================
Author: Rafi Muhammad Daffa (skycruiser8)

INFO:
Processes MOODLE-based site's Forum module's log data to show the most
recent activity for users participating in that forum.

VERSION:
v0 (2020-04-06 10:30 UTC+7) - Initial Commit

This is free software :)
"""
import csv
import re

from datetime import datetime as dt

date_in_format = "%d/%m/%y, %H:%M"
date_out_format = "%Y-%m-%d-%H:%M"
reader = []
user_map = dict()

try:
    with open("log.csv", "r") as fo:
        reader = list(csv.reader(fo))

    reader.pop(0)

    for row in reader:
        # Convert date to desired format
        regex = re.compile("^[123][0-9]/.*?")
        if re.match(regex,row[0]) == None:
            row[0] = "0"+row[0]
        timestamp_obj = dt.strptime(row[0],date_in_format)
        timestamp = timestamp_obj.strftime(date_out_format)

        # Find student ID in name
        student_id = ""
        for name_particle in row[1].split(" "):
            if name_particle.isdigit() and len(name_particle) == 10:
                student_id = name_particle
                break
        else:
            continue # Presumably not a student (could be lecturer)
        
        # Map student ID to user ID and print the most recent activity
        # Assume date is sorted from most recent to least recent in CSV
        if student_id not in user_map:
            user_id = row[6].split(" ")[4].replace("'","")
            user_map[student_id] = [user_id, timestamp_obj]
            print(timestamp, student_id, user_id)

except FileNotFoundError:
    print("This program requires a log.csv file")

