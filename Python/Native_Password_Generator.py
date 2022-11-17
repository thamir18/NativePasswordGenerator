"""
@Script: NativePasswordGenerator
@Author: Thamir Alshammari
@Note: any change to this script possiblty make it non-usable. You use it on your own risk.
"""

import random

password_type=""
group=""
password_length=0
password=""


print()
print("1- Numeric")
print("2- Alphabet")
print("3- Alphanumeric")
print("4- Complex")
print()

while (password_type != "1" and password_type != "2" and password_type != "3" and password_type != "4"):
	password_type = (input("Choose Password Combination (1-4): "))

while ( password_length <= 0 ):
	try:
		password_length = int(input("Choose Password Length: "))
	except ValueError:
		password_length = 0

 
if password_type == "1":
	group="0123456789"

if password_type == "2":
	group="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

if password_type == "3":
	group="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

if password_type == "4":
	group="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!&_%#$*@*+-^[]"


for x in range(password_length):
	r=random.randint(0, len(group) - 1)
	password = password + group[r:r+1]

print()
print("Password:")	
print(password)
print()
