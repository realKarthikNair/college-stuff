### 1. Write a program to print the following pattern using a loop.
###     1
###    212
###   32123
###  4321234
### 543212345
```python


def pattern(n):
    for i in range(1,n+1):
        print(" "*(n-i), end="")
        for j in range(i,0,-1):
            print(j, end="")
        for k in range(2, i+1):
            print(k, end="")
        print()

pattern(5)


```

### 2. Write a program to check if two strings are balanced. 
### For example, strings s1 and s2 are balanced if all the characters in the s1 are present in s2. 
### The character’s position doesn’t matter.
```python

# Cool but not memory efficient for large strings
# def balanced(s1, s2):
#     return [False if i not in s2 else True for i in s1].count(False)==0

# again not memory efficient if strings are big
# def balanced(s1, s2):
#     return set(s1).issubset(set(s2))

def balanced(s1, s2):
    for i in s1:
        if i not in s2:
            return False
    return True

if __name__=="__main__":
    print(balanced("abc", "cba"))
    print(balanced("abc","asb"))
```

### 3. Write a Python program to replace the last element in a list with another list.
### Sample data : [1, 3, 5, 7, 9, 10], [2, 4, 6, 8]
### Expected Output: [1, 3, 5, 7, 9, 2, 4, 6, 8]
```python

def replace_last_element_with_another_list(l1, l2):
    l1[-1:]=l2
    return l1

l1 = [1, 3, 5, 7, 9, 10]
l2 = [2, 4, 6, 8]

print(replace_last_element_with_another_list(l1, l2))


```

### 4. Write a program to sort a tuple of tuples by 2nd item.
### Sample:
### ((‘r’,3),(‘t’,1),(‘e’,2),(‘y’,9))
### Expected Output: ((‘t’,1),(‘e’,2),(‘r’,3),(‘y’,9))
```python

def sort_tuple_of_tuples_by_second_item(t):
    s=sorted([i[1] for i in t])
    s_t=()
    for i in s:
        for j in t:
            if j[1]==i:
                s_t+=(j),
    return s_t


print(sort_tuple_of_tuples_by_second_item((('r',3),('t',1),('e',2),('y',9))))


# Different method

# def sort_tuple_of_tuples_by_second_item(t):
#     t=sorted(t, key=lambda x:x[1])
#     return t

# print(sort_tuple_of_tuples_by_second_item((('r',3),('t',1),('e',2),('y',9))))
```

### 5. Write a Python program to convert a given list of tuples to a list of lists.
### Original list of tuples: [(1, 2), (2, 3), (3, 4)]
### Convert the said list of tuples to a list of lists: [[1, 2], [2, 3], [3, 4]]
```python

def list_of_tuples_to_list_of_lists(tuples):
    return [list(t) for t in tuples]

print(list_of_tuples_to_list_of_lists([(1, 2), (2, 3), (3, 4)]))
```

### 6.  Write a Python program to convert a binary number to decimal number using math module.
```python

import math

def binary_to_decimal(binary):
    n=len(binary)
    dec=0
    for i in binary:
        dec+=int(i)*math.pow(2,n-1)
        n-=1    
    return dec

print(binary_to_decimal("1000101"))


```

### 7. Write a program to generate 100 unique random lottery tickets
###  (each lottery number must be 10 digits long) and 
### pick two lucky tickets from it as a winner.
###  Use random module.
```python

import random

def lottery_generator(n):
    tickets=[]
    while len(tickets)!=n:
        ticket=random.randint(1000000000,9999999999)
        if ticket not in tickets:
            tickets.append(ticket)
        
    return tickets

def lucky_tickets(tickets, n):
    lucky_tickets=[]
    while len(lucky_tickets)!=n:
        lucky_ticket=random.choice(tickets)
        if lucky_ticket not in lucky_tickets:
            lucky_tickets.append(lucky_ticket)
    return lucky_tickets

tickets=lottery_generator(100)
print(f"Lucky tickets are {lucky_tickets(tickets,2)}") 

```

### 8. Write a function cubesum() that accepts an integer and returns 
### the sum of the cubes of individual digits of that number. 
### Use this function to make functions PrintArmstrong() and isArmstrong()
###  to print Armstrong numbers and to find whether is an Armstrong number.
```python

def cubesum(n):
    sum = 0
    while n>0:
        sum+=(n%10)**3
        n=n//10
    return sum

def isArmstrong(n):
    return n if n==cubesum(n) else False

def PrintArmstrong(n):
    if isArmstrong(n):
        print(f"{n} is an Armstrong number")
    else:
        print(f"{n} is not an Armstrong number")

if __name__ == "__main__":
    PrintArmstrong(153)
    PrintArmstrong(154)
        
            
```

### 9. Create a 5X2 integer array from a range between 100 to 200 
### such that the difference between each element is 10. Use NumPy.
```python


import numpy as np

def array_generator(range, n, r, c):
    return np.arange(range[0],range[1],n).reshape(r, c)

print(array_generator([100,200],10,5,2))
```

### 10. Write a Python program to display a bar chart and
###  pie chart of the popularity of programming Languages using matplotlib.
```python

import matplotlib.pyplot as plt

def bar_chart(data):
    plt.bar(data.keys(),data.values(),color="green")
    plt.xlabel("Languages")
    plt.ylabel("Popularity")
    plt.title("Popularity of programming languages")
    plt.show()

def pie_chart(data):
    plt.pie(data.values(),labels=data.keys(),autopct="%1.1f%%")
    plt.title("Popularity of programming languages")
    plt.show()

data={'Python': 22.2, 'Java': 17.6, 'PHP': 8.8, 'JavaScript': 8, 'C#': 7.7, 'C++': 6.7}
bar_chart(data)
pie_chart(data)    
```

### 11. Write a program to count the number of upper-case alphabets present in a text file “PYTHON.TXT”
### 
```python
import os

def countUpperCase(file):
    count = 0
    for line in file:
        for char in line:
            if char.isupper():
                count += 1
    return count

file = open(os.path.join("files", "PYTHON.TXT"), "r")

print(countUpperCase(file))
```

### 12. Create a dictionary whose keys are month names and whose values are the number of days 
### in the corresponding months. 
###         a. Ask the user to enter a month name and use the dictionary to tell them how many 
###               days are in the month.
###         b. Print out all keys in the alphabetical order
###         c. Print out all the months with 31 days
###         d. Print out the key value pairs sorted by number of days in each month
###         
```python

months={"January":31,"February":28,"March":31,"April":30,"May":31,"June":30,"July":31,"August":31,"September":30,"October":31,"November":30,"December":31}

# a
month=input("Enter a month name: ")
print(months[month])

# b
print(sorted(months.keys()))

# c 
print([i for i in months if months[i]==31])

# d
print(sorted(months.items(), key=lambda x:x[1]))
```

### 13. Write a program to know the cursor position and print the text according to specifications 
### given below: 
### ● Print the initial position 
### ● Move the cursor to 4th position 
### ● Display next 5 characters 
### ● Move the cursor to the next 10 characters 
### ● Print the current cursor position 
### ● Print next 10 characters from the current cursor position
```python

import os

file=open(os.path.join("files","demo.txt"),"rb")

print(f"Initial position: {file.tell()}")

file.seek(4)
print(f"Next 5 chars from 4th position: {file.read(5)}")

file.seek(10,1)
print(f"Current cursor position: {file.tell()}")

print(f"Next 10 chars from current cursor position: {file.read(10)}")
```

### 14.     14. Create a binary file with roll number, name and marks. 
### Input a roll number and perform the following operations:
###     • update the marks. 
###     • Delete the record 
###     • Display the record 
###     • Append the record 
###     • Search the record
```python

import os, pickle

def writerec(rno,name,marks):
     f=open(os.path.join("files", "students.data"),'ab')
     srec={"rno":rno,"name":name,"marks":marks}
     pickle.dump(srec,f)
def readrec():
     f=open(os.path.join("files", "students.data"),'rb')
     print("Display Student Details")
     r=int(input("Enter roll no whose record is to be displayed: "))
     print("Roll No",'','Name','\t','Marks',end='')
     print()
     while True:
          try:
               rec=pickle.load(f)
               if rec['rno']==r:
                    print('',rec['rno'],'\t',rec['name'],'\t',rec['marks'])
          except:
               break
def Input():
     n=int(input("How many records do you want to enter?"))
     for i in range(n):
          rno=int(input("Enter roll no: "))
          name=input("Enter name: ")
          marks=int(input("Enter marks: "))
          writerec(rno,name,marks)
def searchrec(rno):
     f=open(os.path.join("files", "students.data"),'rb')
     while True:
          try:
               rec=pickle.load(f)
               if rec['rno']==rno:
                    print("Roll no: ",rec['rno'])
                    print("Name: ",rec['name'])
                    print("Marks: ",rec['marks'])
                    break
          except EOFError:
               print("Record not found \nTry again ")
               break
def update():
     f=open(os.path.join("files", "students.data"),'rb+')
     rno=int(input("Enter roll no whose marks you want to update: "))
     try:
          while True:
               pos=f.tell()
               rec=pickle.load(f)
               if rec['rno']==rno:
                    um=int(input("Enter updated marks: "))
                    rec['marks']=um
                    f.seek(pos)
                    pickle.dump(rec,f)
     except EOFError:
          f.close()
def delete():
     f=open('Student.dat','rb')
     l=[]
     while True:
          try:
               rec=pickle.load(f)
               l.append(rec)
          except EOFError:
               break
     f.close()
     rn=int(input("Enter roll no to delete record: "))
     f=open('Student.dat','wb')
     for i in l:
          if i['rno']==rn:
               continue
          pickle.dump(x,f)
     f.close()
while True:
     print("1. Update marks \n2. Delete record\n3.Display record\n4.Append record\n5.Search record\n6.Exit")
     ch=int(input("Enter choice: "))
     if ch==1:
          update()
     elif ch==2:
          delete()
     elif ch==3:
          readrec()
     elif ch==4:
          Input()
     elif ch==5:
          r=int(input("Enter roll no to be searched: "))
          searchrec(r)
     else:
          exit 
          
     
          
    
```

### 15. Write a program to Create a CSV file by entering user-id and password, read and search 
### the password for given user id.
### 
```python


import csv

# create a new CSV file with a user-id and password
def create_csv(user_id, password):
    with open('user_data.csv', 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(['user_id', 'password'])
        csvwriter.writerow([user_id, password])

# read the CSV file and search for a password for a given user-id
def search_password(user_id):
    with open('user_data.csv', 'r') as csvfile:
        csvreader = csv.reader(csvfile)
        # skip the header row
        next(csvreader)
        for row in csvreader:
            if row[0] == user_id:
                return row[1]
        return None

# example usage
user_id = input("Enter user id: ")
password = input("Enter password: ")
create_csv(user_id, password)
user_id = input("Enter user id to search ")
search_result = search_password(user_id)
if search_result:
    print("Password for user id", user_id, "is", search_result)
else:
    print("User id not found.")


```

