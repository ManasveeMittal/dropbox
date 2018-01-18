import subprocess
import sys
from numpy.random import choice
import random
import thread



#run shell command
def run_shell_command(command):
    proc = subprocess.Popen(command, shell = True, stdout = subprocess.PIPE, stderr = subprocess.PIPE)
    out, err = proc.communicate()
    return proc.returncode, out.strip(), err.strip()

 
#multiprocessing for data generation
def thread_output_generation(users_ratio, month_tx_dict, input_file_name, output_file_name,):
	try:
		f_d1 = open(input_file_name, 'r')
		f_out = open(output_file_name, 'w')
		#print month_tx_prob_dict
			
		for line in f_d1:
			line = line.strip().split('|')
			uid = line[0]
			month = line[1]
			tx_count = int(line[2])
			#make uid length equal
			if len(uid) < 8:
				zero_append = 8 - len(uid)
				uid = '0'* zero_append + uid
			
			
			for i in range(users_ratio):
				li = []
				for j in range(tx_count): 
					#choice function is used for generate tx according to their probabilityy
					#print month_tx_prob_dict[month]['tx'], month_tx_prob_dict[month]['prob']
					tx = choice(month_tx_dict[month]['tx'], p=month_tx_dict[month]['prob'])
					write_str = uid + str(i) + "|" + month + "|" + str(tx) + "\n"
					li.append(write_str) 
				
			li = list(li)
			f_out.write(''.join(li))
		

		f_d1.close()
		f_out.close() 

	except Exception as e:
		print e


#make a dictionary of  {month-tx : probability} by using month_tx_prob_fname
def make_month_tx_dict(input_file_name):
	month_tx_prob_dict = {}
	f_d2 = open(input_file_name, "r")
	for line in f_d2:
		line = line.strip().split('|')
		key = line[0] 
		#print line
		try:
			month_tx_prob_dict[key]['tx'].append(line[1])
			month_tx_prob_dict[key]['prob'].append(float(line[2]))
		except:
			#print line
			month_tx_prob_dict[key] = {}
			month_tx_prob_dict[key]['tx'] = [line[1]]
			#print line
			month_tx_prob_dict[key]['prob'] = [float(line[2])]
			#print month_tx_prob_dict
	f_d2.close()
	#print month_tx_prob_dict
	return month_tx_prob_dict


#without threading generating data 
def without_threading_data_generation(users_ratio, month_tx_dict, input_file_name, output_file_name):
	#print input_file_name
	#print output_file_name
	c = 0 
	f_d1 = open(input_file_name, 'r')
	f_out = open(output_file_name, 'w')
	write_str = ''
	for line in f_d1:
		if c >100:
			c = 0
			f_out.write(write_str)
			write_str = ''

		#print line
		line = line.strip().split('|')
		uid = line[0]
		month = line[1]
		tx_count = int(line[2])
		if len(uid) < 8:
			zero_append = 8 - len(uid)
			uid = '0'* zero_append + uid
		#print uid, month, tx_count, users_ratio
		for i in range(users_ratio):
			for j in range(tx_count): 
				#choice function is used for generate tx according to their probabilityy
				month_tx_dict[month]['tx'], month_tx_dict[month]['prob']
				tx = choice(month_tx_dict[month]['tx'], p=month_tx_dict[month]['prob'])
				write_str = write_str + uid + "-" + str(i) + "^" + month + "^" + str(tx) + "\n"
				#f_out.write(write_str)
		c = c+1
	f_d1.close()
	f_out.close()