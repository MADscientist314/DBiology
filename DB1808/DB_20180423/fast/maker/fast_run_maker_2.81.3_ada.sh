#BSUB -L /bin/bash              # uses the bash login shell to initialize the job's execution environment.
#BSUB -J maker_run_czar1           # job name
#BSUB -n 40
#BSUB -R "span[ptile=20]"
#BSUB -R "rusage[mem=2700]"     # reserves 1000MB memory per core
#BSUB -M 2700                   # sets to 1000MB per process enforceable memory limit. Total memory = (M * n\)
#BSUB -W 96:00                  # sets to 24 hours the job's runtime wall-clock limit.
#BSUB -o /scratch/user/jochum00/DBiology/DB1808_20180423.data/maker.stdout.%J
#BSUB -e /scratch/user/jochum00/DBiology/DB1808_20180423.data/maker.stderr.%J

module load MAKER/2.31.8-intel-2015B-Perl-5.20.0

<<README
    - MAKER manual: http://weatherby.genetics.utah.edu/MAKER/wiki/index.php/Main_Page

    - MAKER usage: http://onlinelibrary.wiley.com/doi/10.1002/0471250953.bi0411s48/pdf

    - MAKER resources:
        http://www.yandell-lab.org/
        http://yandell-lab.org/software/maker.html
        http://gmod.org/wiki/MAKER_Tutorial
        https://groups.google.com/group/maker-devel?pli=1
README

<<PREREQUISITES
    - GeneMark-ES prerequisite:
        Download the 64_bit key from the following website and save it to your $HOME directory.
        Select the following: GeneMark-ES/ET v4.32  and  LINUX 64
        (you do not need to download the program just the 64_bit key file)
            http://topaz.gatech.edu/GeneMark/license_download.cgi

        Then gunzip the key file and rename it from gm_key_64 to .gm_key

    - Read the pdf at the Maker usage link above to learn about the required control files.

    - Copy the control files do the follwing prior to running your job script. 
        module load MAKER/2.31.8-intel-2015B-Perl-5.20.0
        cp $EBROOTMAKER/sample_ctl_files/* ./

    - Then edit the maker_opts.ctl and maker_bopts.ctl files as needed.

    - You will need to create a model file using either GeneMark-ES (eukaryotes) or GeneMarkS (prokaryotes) if 
        you want sequences for the modeled genes. Add your GeneMark .mod file at the maker_opts.ctl line: gmhmm= #GeneMark HMM file

    - For a list of augustus species see /software/easybuild/software/AUGUSTUS/3.1-intel-2015B/config/species/
PREREQUISITES

################################################################################
# TODO Edit the maker_opts.ctl file based on your requirements

################################################################################
# 
maker


<<CITATION
    - Acknowledge TAMU HPRC: https://hprc.tamu.edu/research/citations.html

    - MAKER:
        Brandi L. Cantarel, Ian Korf, Sofia M.C. Robb, Genis Parra, Eric Ross, Barry Moore, Carson Holt, Alejandro Sánchez Alvarado
        and Mark Yandell. MAKER: An easy-to-use annotation pipeline designed for emerging model organism genomes.
        Genome Res. 2008 Jan; 18(1): 188–196. doi:  10.1101/gr.6743907
CITATION
