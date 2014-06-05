import os
import subprocess

work_dir = os.path.expanduser("~/ApplicatieCou11/")
input_files = os.listdir(work_dir)
print(input_files)

for f in input_files:
	if ".fa" not in f: #grab all fasta files
		print("Removing file "+f)
		input_files.remove(f)
		continue
	elif "tss" in f:
		print("Removing file "+f)
		input_files.remove(f)
		continue
	else:
		print("I kept file "+f)
		subdir = f.split(".fa")[0] #begin filename = naam subfolder, i.e. NC1_output
		command1 = "cd /sharing/students/meme_4.9.1/bin/"
		command2 = "./meme "+work_dir+f+" -oc "+work_dir+subdir+" -dna -mod zoops -minw 35 -maxw 45"
		print(command2)
		p = subprocess.call(command1+" ; pwd ; "+command2, shell=True) #runt bovenstaand commands in de shell
	# checkt tussendoor of ie in de goede map zit
