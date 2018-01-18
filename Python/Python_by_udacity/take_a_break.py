import webbrowser
import time

num_breaks = 3
break_count =0
print("This program started on"+time.ctime())
while (break_count < num_breaks):
	time.sleep(7200)
	webbrowser.open("https://www.youtube.com/watch?v=2vjPBrBU-TM")
	break_count+=1