# -*- coding: utf-8 -*-
"""script.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/10LQ6hld_yl7LEQHF6HtJspqirD_XXBDp
"""

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 1.py
# print("Printing current and previous number and their sum in a range(10)")
# previous_num = 0
# for i in range(1, 11):
#     x_sum = previous_num + i
#     print("Current Number", i, "Previous Number ", previous_num, " Sum: ", previous_num + i)
#     previous_num = i

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 2.py
# arr = list()
# print(end="Enter the Size: ")
# Size = int(input())
# print("Enter Elements: ")
# for i in range(Size):
#   arr.insert(i, input())
# 
# print(end="\n\nElements at Even Position (Index): ")
# for i in range(Size):
#   if i%2==0:
#     print(end=str(arr[i])+ " ")
# print()

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 3.py
# nums = []
# print("Enter the Numbers :")
# for i in range(5):
#     nums.insert(i, int(input()))
# print("number divisible by 5")
# for num in nums:
#       if num % 5 == 0:
#            print(num)

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 4.py
# n=int(input("Enter the number:"))
# temp=n
# rev=0
# while(n>0):
#     dig=n%10
#     rev=rev*10+dig
#     n=n//10
# if(temp==rev):
#     print("The number is a palindrome!")
# else:
#     print("The number isn't a palindrome!")

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 5.py
# from numpy import array
# a=array([1,2,3,4,5,6]) # evens from here
# b=array([7,8,9,10,11,12]) # odds from here
# 
# c = [*a[a%2 == 0], *b[b%2 != 0]]
# print(c)

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 6.py
# n = int(input('enter the number here :'))
# while(n != 0):
#   p = n%10
#   n = n//10
#   print(p , end = '')

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 7.py
# for i in range(1,11):
#     print("\n\nMULTIPLICATION TABLE FOR %d\n" %(i))
#     for j in range(1,11):
#         print("%-5d X %5d = %5d" % (i, j, i*j))

# Commented out IPython magic to ensure Python compatibility.
# %%writefile 8.py
# rows = int(input("Enter number of rows: "))
# 
# for i in range(rows, 0, -1):
#     for j in range(0, i):
#         print("* ", end=" ")
#     
#     print("\n")