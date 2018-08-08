#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's execution environment.
#BSUB -J Velvet_se             # job name
#BSUB -n 10                     # assigns 10 cores for execution
#BSUB -R "span[ptile=10]"       # assigns 10 cores per node
#BSUB -R "rusage[mem=2500]"     # reserves 1000MB memory per core
#BSUB -M 2500                   # sets to 1000MB (~1GB) the per process enforceable memory limit.
#BSUB -W 2:00                   # sets to 2 hours the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808_20180413.data/stdout_%J
#BSUB -e /scratch/user/jochum00/DBiology/DB1808_20180413.data/stderr_%J

module load Velvet/1.2.10-ictce-7.1.2
velveth /scratch/user/jochum00/DBiology/DB1808_20180413.data/ 19 -fastq -short /scratch/user/jochum00/DBiology/DB1808_20180413.data/Phage_Pool_TruSeq_12_CTTGTA_R1.fastq;

velvetg /scratch/user/jochum00/DBiology/DB1808_20180413.data/
