import argparse

parser = argparse.ArgumentParser()
parser.add_argument("name")
arge = parser.parse_args()
print("hello", arge.name)
