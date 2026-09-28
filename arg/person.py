import argparse

parser = argparse.ArgumentParser()
parser .add_argument("name", help="your name")
parser .add_argument("--age", type=int, default=18, help="your age")
args = parser.parse_args()

print(f"name is {args.name}")
print(f"Age is {args.age}")
print(f"type of age is {type(args.age)}")
