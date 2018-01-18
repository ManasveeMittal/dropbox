#--------PSEUDO CODE________//

#define directory(s) name and path
#define selection criteria for files
#point to the directory(s)
#specify renaming criteria
#enclose file names into a list
#specify replacemnt criteria into a function
#loop over the file names
#execution the name changes
#again add the changes into a list and sort list
#zip a dictionary of new file name to old file

#forgot backup creation

# from os import listdir
# from string import translate
import string
import os

def rename_files():
	file_list = os.listdir(r"/home/triloq/manasvee/prank/")
	print(file_list)
	saved_path = os.getcwd()
	os.chdir((r"/home/triloq/manasvee/prank")
	
    for f in file_list:
		os.rename(file, file.translate("1234567890"))

	os.chdir(saved_path)
		

rename_files()
