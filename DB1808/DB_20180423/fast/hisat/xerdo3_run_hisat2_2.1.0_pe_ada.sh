#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's execution environment.
#BSUB -J hisat2                 # job name
#BSUB -n 20                     # assigns 20 cores for execution
#BSUB -R "span[ptile=20]"       # assigns 20 cores per node
#BSUB -R "rusage[mem=2700]"     # reserves 2700MB memory per core
#BSUB -M 2700                   # sets to 2,700MB (~2.7GB) per process enforceable memory limit. Total job memory = (M * n)
#BSUB -W 24:00                  # sets to 24 hours the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808/DB_20180423/fast/stdout/stdout.%J
#BSUB -e /scratch/user/jochum00/DBiology/DB1808/DB_20180423/fast/stderr/stderr.%J

module load HISAT2/2.1.0-intel-2017A-Python-2.7.12
module load SAMtools/1.6-GCCcore-6.3.0
module load StringTie/1.3.3-GCCcore-6.3.0
module load Cufflinks/2.2.1-intel-2015B
<<README
    - HISAT2 manual: http://ccb.jhu.edu/software/hisat2/manual.shtml
README

# This template script aligns paired end reads and sorts the output into a bam file

################################################################################
# TODO Edit these variables as needed:
threads=20                      # make sure this is <= your BSUB -n value

pe_1='/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/xerdo3concatR1.fastq'
pe_2='/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/xerdo3concatR2.fastq'

# you can use an already prefixed genome found at: /scratch/datasets/ucsc/genome_indexes/
genome_index_prefix='/scratch/group/digibio/Canis-lupus-familiaris/HISAT2_Index/Canis_familiaris.CanFam3.1.dna.toplevel.fa.SpliceSitesExonNames'

# read group information
id='C_familiaris'
library='pe'
platform='ILLUMINA'
sample='xerdo3'
output_bam="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/${sample}_pe_aln.bam"

################################################################################
# If you will be using cufflinks downstream, run hisat2 with the --dta-cufflinks option instead of --dta
hisat2 --dta -p $threads --rg-id "$id" --rg "LB:$library" --rg "SM:$sample" --rg "PL:$platform" -x $genome_index_prefix -q -1 $pe_1 -2 $pe_2 -S xerdo3.sam

samtools view -bS xerdo3.sam | samtools sort -m 2G -@ $threads - -T $sample -o $output_bam

rm xerdo3.sam
annotation_file='/scratch/group/digibio/Canis-lupus-familiaris/Canis_familiaris.CanFam3.1.92.gtf'
bam_file="/scratch/user/jochum00/DBiology/DB1808_20180423.data/fast/xerdo/${sample}_pe_aln.bam"

label='xerdo3'
out_gtf="${label}_out.gtf"

################################################################################
#
#stringtie $bam_file -G $annotation_file -l $label -o $out_gtf -p $threads
#gffread $out_gtf -E -o $out_gtf.gff3

<<CITATION
    - Acknowledge TAMU HPRC: https://hprc.tamu.edu/research/citations.html

    - HISAT2:
        Kim D, Langmead B and Salzberg SL. HISAT: a fast spliced aligner with low memory requirements.
        Nature Methods 12, 357–360 (2015). doi:10.1038/nmeth.3317
