import os
import subprocess

work_dir = os.path.expanduser("~/ApplicatieCou11/")
input_files = os.listdir(work_dir)
print(input_files)
new_files = []

for f in input_files:
	if f.endswith(".fa") and "tss" not in f: #grab all fasta files
		new_files.append(f)
		print("Added to list "+f)

for fi in new_files:
		print("I kept file "+fi)
		subdir = fi.split(".fa")[0] #begin filename = naam subfolder, i.e. NC1_output
		command1 = "cd /sharing/students/meme_4.9.1/bin/"
		command2 = "./meme "+work_dir+fi+" -oc "+work_dir+subdir+" -dna -mod zoops -minw 35 -maxw 45"
		print(command2)
		p = subprocess.call(command1+" ; pwd ; "+command2, shell=True) #runt bovenstaand commands in de shell
	# checkt tussendoor of ie in de goede map zit
