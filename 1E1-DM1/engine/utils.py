import csv
import os

PREFIX = "./1E1-DM1/tables/"

os.makedirs(PREFIX, exist_ok=True)

def init(csv_file):
    path = os.path.join(PREFIX, csv_file)
    with open(path, "w", newline="", encoding="utf-8") as f:
        pass

def add(x, y, val, csv_file):
    path = os.path.join(PREFIX, csv_file)
    if os.path.exists(path):
        with open(path, "r", newline="", encoding="utf-8") as f:
            table = list(csv.reader(f))
    else:
        table = []

    while len(table) <= y:
        table.append([])

    while len(table[y]) <= x:
        table[y].append("")

    val = str(val)
    if y == 0:
        table[y][x] = '$' + val + '$'
    else:
        table[y][x] = val

    with open(path, "w", newline="", encoding="utf-8") as f:
        writer = csv.writer(f)
        writer.writerows(table)