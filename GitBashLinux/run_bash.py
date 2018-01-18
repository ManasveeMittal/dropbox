import subprocess
import sys

run_args = sys.argv
filename = run_args[0]
line_count = "wc -l "
bashCommand = line_count + filename

process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
output, error = process.communicate()

num_lines = int(output.split()[0])


print(str(num_lines//10))

random_n_lines = "shuf -n " + str(num_lines//10) + " " +filename + " > " +filename+'_shuf'
print(random_n_lines)

def run_bash(bashCommand):
	process = subprocess.Popen(bashCommand.split(), stdout=subprocess.PIPE)
	output, error = process.communicate()

	if error ==None:
		return output
	else:
		return error

# run_bash(bashCommand=random_n_lines)
x= "head -n " + str(num_lines//10) + " " +filename 
print(subprocess.Popen(x))