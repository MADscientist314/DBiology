#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's environment.
#BSUB -J stringtie              # job name
#BSUB -n 20                     # assigns 20 cores for execution
#BSUB -R "span[ptile=20]"       # assigns 20 cores per node
#BSUB -R "rusage[mem=2700]"     # reserves 2700MB memory per core
#BSUB -M 2700                   # sets to 2700MB per process enforceable memory limit.
#BSUB -W 24:00                  # sets to 24 hour the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808/DB_20180423/slow/stdout/stringtie_out.%J
#BSUB -e /scratch/user/jochum00/DBiology/DB1808/DB_20180423/slow/stderr/stringtie_err.%J

module load StringTie/1.3.3-GCCcore-6.3.0

################################################################################
# TODO Edit these variables as needed:
threads=20                       # make sure this is <= your BSUB -n value

# reference annotation_file can be GTF or GFF3 format
annotation_file='/scratch/group/digibio/Canis-lupus-familiaris/Canis_familiaris.CanFam3.1.92.gtf'
bam_file1="/scratch/user/jochum00/DBiology/DB1808_20180423.data/slow/zeus/zeus1_pe_aln.bam"
bam_file2="/scratch/user/jochum00/DBiology/DB1808_20180423.data/slow/zeus/zeus2_pe_aln.bam"
bam_file3="/scratch/user/jochum00/DBiology/DB1808_20180423.data/slow/zeus/zeus3_pe_aln.bam"
label1='zeus1'
label2='zeus2'
label3='zeus3'
out_gtf1="/scratch/user/jochum00/DBiology/DB1808_20180423.data/slow/zeus/${label1}_out.gtf"
out_gtf2="/scratch/user/jochum00/DBiology/DB1808_20180423.data/slow/zeus/${label2}_out.gtf"
out_gtf3="/scratch/user/jochum00/DBiology/DB1808_20180423.data/slow/zeus/${label3}_out.gtf"
################################################################################
#
stringtie $bam_file1 -G $annotation_file -l $label1 -o $out_gtf1 -p $threads
stringtie $bam_file2 -G $annotation_file -l $label2 -o $out_gtf2 -p $threads
stringtie $bam_file3 -G $annotation_file -l $label3 -o $out_gtf3 -p $threads

<<CITATION
    - Acknowledge TAMU HPRC: http://sc.tamu.edu/research/citation.php

    - StringTie:
        Pertea M, Kim D, Pertea GM, Leek JT, Salzberg SL Transcript-level expression
        analysis of RNA-seq experiments with HISAT, StringTie and Ballgown,
        Nature Protocols 11, 1650-1667 (2016), doi:10.1038/nprot.2016.095 
CITATION
