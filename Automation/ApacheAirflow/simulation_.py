import sys
from numpy.random import choice
import random
from threading import Thread 
import threading
import time
from datetime import datetime
from multiprocessing import Process

# from function_defination import *


print(datetime.now())
print('w1')


# user_month_tx_fname = "/home/triloq/airflow/dags/table_d1_dsnonprogress"
#month^tx^prvbility
#month_tx_prob_fname = sys.argv[2]
#month_tx_prob_fname = "/var/lib/HPCCSystems/mydropzone/month_tx_prob"
# month_tx_prob_fname = "/home/triloq/airflow/dags/table_d2_dsnonprogress"

#num_user_required = sys.argv[4]
# num_user_required = 75000

#output_fname = sys.argv[5]
# output_fname = "/home/triloq/Documents/non_progress"

#for threading number of chunks,output_dir and output file name prefix
# split_chunks = 1
# split_op_dir = "/home/triloq/Documents/"
# prefix_fname = "user_month_tx_"

# def func1(**kwargs):
def Simulation(user_month_tx_fname,month_tx_prob_fname,output_fname,split_op_dir,num_user_required,split_chunks,prefix_fname):

	month_tx_dict = make_month_tx_dict(month_tx_prob_fname)

	command = "awk -F '|' '{print $1}' " + user_month_tx_fname +"|sort |uniq |wc -l"
	status, out, err =  run_shell_command(command) 
#print out
#print command
	if status == 0:
		users_ratio = num_user_required / int(out)
	else:
		print(err)

########
	command = "wc -l " + user_month_tx_fname
	status, out, err =  run_shell_command(command) 
#print out
#print command
	if status == 0:
		num_lines = int(out.split(' ')[0]) / split_chunks
	else:
		print(err)
##############


	split_shell_command = "split -l " + str(num_lines) + " -d " + user_month_tx_fname + " " + split_op_dir + prefix_fname
	status, output, err = run_shell_command(split_shell_command)

	if status != 0:
		print(err)
		sys.exit()

#print users_ratio
#sys.exit()
	print(datetime.now())
#without_threading_data_generation(users_ratio, month_tx_dict, user_month_tx_fname, output_fname)

	processes = []
	for c in range(split_chunks):
		input_file_name = split_op_dir + prefix_fname + "0" + str(c)
		print(input_file_name)
		output_file_name = input_file_name  + "op"
		print(output_file_name)
	
		try:
			p = Process(target=thread_output_generation, args=(users_ratio, month_tx_dict, input_file_name, output_file_name,))
			processes.append(p)
		

		except:
			print("Error: unable to start thread")


	for p in processes:p.start()

	for p in processes:p.join()

	print(datetime.now())
	return 1


user_month_tx_fname='/home/triloq/airflow/dags/table_d1_dsnonprogress'
month_tx_prob_fname = "/home/triloq/airflow/dags/table_d2_dsnonprogress"
num_user_required = 75000
split_chunks = 1
split_op_dir = "/home/triloq/Documents/"
prefix_fname = "user_month_tx_"
# user_month_tx_fname
# month_tx_prob_fname
output_fname='/home/triloq/Simulation_dir/non_progressive/'
# split_op_dir
# num_user_required
# split_chunks
# prefix_fname
Simulation(user_month_tx_fname,month_tx_prob_fname,output_fname,split_op_dir,num_user_required,split_chunks,prefix_fname)
print('w')