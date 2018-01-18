# The current working directory is a property that Python holds in memory at all time

import os
print(os.getcwd())
os.chdir('/home/manavee/Dropbox/') #used a Linux-style pathname  even on windowss
print(os.getcwd())

# os.path 
# contains functions for manipulating filenames and directory names
import os
# The os.path.join() function constructs a pathname out of one or more partial pathnames. In this case, it simply concatenates strings
#Calling the os.path.join() function will add an extra slash to the pathname before joining it to the filename
#caution:If we use "/", it tells Python that we're using absolute path, and it overrides the path before it
print(os.path.join('/test/', 'myfile'))
# The os.path.expanduser() function will expand a pathname that uses ~ to represent the current user's home directory
# The returned path does not have a trailing slash
print(os.path.expanduser('~'))
# Combining these techniques, we can easily construct pathnames for directories and files in the user's home directory
print(os.path.join(os.path.expanduser('~'),'dir', 'subdir', 'k.py'))

pathname = "/Users/K/dir/subdir/k.py"
# os.path also contains functions to split full pathnames, directory names, and filenames into their constituent parts
print(os.path.split(pathname))
(dirname, filename) = os.path.split(pathname)
print(dirname)
print(pathname)
print(filename)
#os.path also contains the os.path.splitext() function, which splits a filename and returns a tuple containing the filename and the file extension
(shortname, extension) = os.path.splitext(filename)
print(shortname)
print(extension)

# GLOB.GLOB()
import glob
os.chdir('/home/manavee/Dropbox/Python/')
# easy way to get the contents of a directory programmatically
print(glob.glob('*.py'))

#File METADATA
# Python provides a single API to access this metadata
# file creation date, last-modified date, file size, and so on
import os
print(os.getcwd())
os.chdir('/home/manavee/Dropbox/Python/')
print(os.getcwd())
#Calling the os.stat() function returns an object that contains several different types of metadata about the file
metadata = os.stat('try.py')
# st_mtime is the modification time, but it's in a format that isn't terribly useful since Epoch
print(metadata.st_mtime)
# The time module is part of the Python standard library. It contains functions to convert between different time representations, format time values into strings, and fiddle with timezones
import time
# The time.localtime() function converts a time value from seconds-since-the-Epoch (from the st_mtime property returned from the os.stat() function) into a more useful structure of year, month, day, hour, minute, second, and so on
print(time.localtime(metadata.st_mtime))
# The os.stat() function also returns the size of a file, in the st_size property
print(metadata.st_size)


