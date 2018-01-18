# import urllib.request
# def read_text():
# 	quotes = open("/home/triloq/manasvee/movie_quotes.txt")
# 	contents =quotes.read()
# 	#print(contents)
# 	quotes.close()
# 	check_profanity(contents)

# def check_profanity(text_to_check):
# 	connection = urllib.request.urlopen("http://www.wdylike.appspot.com/?q="+text_to_check)
# 	output = connection.read()
# 	#connection.close()
# 	print(output)
# 	connection.close()
# read_text()

import urllib.request

wp = urllib.request.urlopen("http://www.wdylike.appspot.com/?q=shit+ass")
pw = wp.read()
print(pw)