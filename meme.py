import os
import subprocess

work_dir = os.path.expanduser("~/ApplicatieCou11/meme/")
input_files = os.listdir(work_dir)

for f in input_files:
	if ".fa" not in f or "tss" in f: #grab all fasta files that were not an input file earlier on
		input_files.remove(f)
	os.chdir("/sharing/students/MEME/bin")
	subdir = f.split(".fa")[0] #begin filename = naam subfolder, i.e. NC1_output
	command = "meme "+work_dir+f+" -oc "+work_dir+subdir+" -dna -mod zoops -minw 35 -maxw 45"
	p = subprocess.call(command, shell=TRUE) #runt bovenstaand command in de shell
