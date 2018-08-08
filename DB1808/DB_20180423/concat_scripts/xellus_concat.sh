#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's execution environment.
#BSUB -J concat2                 # job name
#BSUB -n 20                     # assigns 20 cores for execution
#BSUB -R "span[ptile=20]"       # assigns 20 cores per node
#BSUB -R "rusage[mem=2700]"     # reserves 2700MB memory per core
#BSUB -M 2700                   # sets to 2,700MB (~2.7GB) per process enforceable memory limit. Total job memory = (M \* n)
#BSUB -W 24:00                  # sets to 24 hours the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808_20180423.data/stdout.%J             t to stdout.jobid
#BSUB -e /scratch/user/jochum00/DBiology/DB1808_20180423.data/stderr.%J     # directs the job's standard error to stderr.jobid



cat /scratch/group/digibio/Canis-lupus-familiaris.FinalProject.data/slow/xellus1_lane*.groomer.cutadapt.q30.artifacts.b15e1.l35.R1.fastq > /scratch/user/jochum00/DBiology/DB1808_20180423.data/xellus1concatR1.fastq

cat /scratch/group/digibio/Canis-lupus-familiaris.FinalProject.data/slow/xellus1_lane*.groomer.cutadapt.q30.artifacts.b15e1.l35.R2.fastq > /scratch/user/jochum00/DBiology/DB1808_20180423.data/xellus1concatR2.fastq

cat /scratch/group/digibio/Canis-lupus-familiaris.FinalProject.data/slow/xellus2_lane*.groomer.cutadapt.q30.artifacts.b15e1.l35.R1.fastq > /scratch/user/jochum00/DBiology/DB1808_20180423.data/xellus2concatR1.fastq

cat /scratch/group/digibio/Canis-lupus-familiaris.FinalProject.data/slow/xellus2_lane*.groomer.cutadapt.q30.artifacts.b15e1.l35.R2.fastq > /scratch/user/jochum00/DBiology/DB1808_20180423.data/xellus2concatR2.fastq

cat /scratch/group/digibio/Canis-lupus-familiaris.FinalProject.data/slow/xellus3_lane*.groomer.cutadapt.q30.artifacts.b15e1.l35.R1.fastq > /scratch/user/jochum00/DBiology/DB1808_20180423.data/xellus3concatR1.fastq

cat /scratch/group/digibio/Canis-lupus-familiaris.FinalProject.data/slow/xellus3_lane*.groomer.cutadapt.q30.artifacts.b15e1.l35.R2.fastq > /scratch/user/jochum00/DBiology/DB1808_20180423.data/xellus3concatR2.fastq

<<EOF
README
    - HISAT2 manual: http://ccb.jhu.edu/software/hisat2/manual.shtml
README

EOF