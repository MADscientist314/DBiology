#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's environment.
#BSUB -J stringtie              # job name
#BSUB -n 20                     # assigns 20 cores for execution
#BSUB -R "span[ptile=20]"       # assigns 20 cores per node
#BSUB -R "rusage[mem=2700]"     # reserves 2700MB memory per core
#BSUB -M 2700                   # sets to 2700MB per process enforceable memory limit.
#BSUB -W 24:00                  # sets to 24 hour the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808/DB_20180423/fast/stdout/stringtie_out.%J
#BSUB -e /scratch/user/jochum00/DBiology/DB1808/DB_20180423/fast/stderr/stringtie_err.%J              

module load StringTie/1.3.3-GCCcore-6.3.0

<<README
README

################################################################################
# TODO Edit these variables as needed:
threads=20                       # make sure this is <= your BSUB -n value

# reference annotation_file can be GTF or GFF3 format
annotation_file='/scratch/group/digibio/Canis-lupus-familiaris/Canis_familiaris.CanFam3.1.92.gff3'
gtf_file1="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/czar/czar1_out.gtf"
gtf_file2="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/czar/czar2_out.gtf"
gtf_file3="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/czar/czar3_out.gtf"
gtf_file4="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xadius/xadius1_out.gtf"
gtf_file5="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xadius/xadius2_out.gtf"
gtf_file6="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xadius/xadius3_out.gtf"
gtf_file7="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/xerdo1_out.gtf"
gtf_file8="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/xerdo2_out.gtf"
gtf_file9="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/xerdo3_out.gtf"
label='fast'
out_gtf="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/${label}_out.gtf"

################################################################################
#
stringtie --merge $gtf_file1 $gtf_file2 $gtf_file3 $gtf_file4 $gtf_file5 $gtf_file6 $gtf_file7 $gtf_file8 $gtf_file9 -G $annotation_file -l $label -o $out_gtf -p $threads 

<<EOF
EOF
