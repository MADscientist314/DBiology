#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's execution environment.
#BSUB -J velvet_se_m            # job name
#BSUB -n 20                     # assigns 20 cores for execution
#BSUB -R "span[ptile=20]"       # assigns 20 cores per node
#BSUB -R "rusage[mem=2500]"     # reserves 2500MB memory per core
#BSUB -M 2500                   # sets to 2500MB (~1GB) the per process enforceable memory limit.
#BSUB -W 24:00                   # sets to 24 hours the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808_20180413.data/stdout_%J
#BSUB -e /scratch/user/jochum00/DBiology/DB1808_20180413.data/stderr_%J

module load Velvet/1.2.10-ictce-7.1.2

for i in {19..53..2};do velveth /scratch/user/jochum00/DBiology/DB1808_20180413.data/out_"$i" $i -fastq -short /scratch/user/jochum00/DBiology/DB1808_20180413.data/Phage_Pool_TruSeq_12_CTTGTA_R1.fastq;

			velvetg /scratch/user/jochum00/DBiology/DB1808_20180413.data/"$i"
done
			
