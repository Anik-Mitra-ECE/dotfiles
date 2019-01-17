#!/usr/bin/env python3
# -*- coding: utf-8 -*-
import os
import matplotlib.pyplot as plt
import datetime as dt

directory_in_str = str("/home/xollad/Dropbox/linux_stuff/laptop_time/log/")
# directory = os.fsencode(directory_in_str)
directory = directory_in_str

times = list()
dates = list()
days =list()
dateTime = list()

# get current month and year number
today = dt.datetime.today()
month_num = today.month
month_name = str( today.strftime("%B") )
year_num = str( today.year )
axix_label_x = month_name + "," + year_num
today_date_num=str(today.day)
print("%s,%s" %(today_date_num,axix_label_x))

# Read contents of files into
for root, dirs, filenames in os.walk(directory):
    for f in filenames:
        dates.append(f)
        fullpath = os.path.join(directory, f)
        with open(fullpath) as f:
            times.append(int(f.read()))


# reverse the list to make today stays as the last element
times.reverse()
dates.reverse()
maxY = max(times) + 50

# extract only day from the date
for date in dates:
    date=str(date)
    dateTime.append(dt.datetime.strptime(date, "%d-%m-%y").date())
    day,mon,year=date.split("-");
    days.append(int(day))



hours=times[-1]/60
mins=times[-1]%60
# print(times)
# print(days)
print("Today used %d hours and %d minutes " %(hours, mins))


#plot
barlist= plt.bar(days, times, align='center', alpha=0.5)
barlist[-1].set_color('g')
plt.xlabel('dates')
plt.ylabel('minutes')
plt.axis([1,31,0,maxY])
plt.title("Today used %d hours and %d minutes " %(hours, mins), fontweight='bold')
# plt.plot(dateTime, times)
plt.show()
