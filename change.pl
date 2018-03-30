#!usr/bin/perl -w
use strict;
###############################################
#-本脚本用于对FASTA数据集进行格式转换。-#
#SYNTAX:   change.pl <FASTA file>			 #
#EXAMPLE: perl change.pl reads23.fa 		 #
###############################################
my @a;

#print "$ARGV[0]";
#文件读入，逐行读入，边读边处理
open(INA,"<$ARGV[0]")||die "cannot open the contig file:$!\n";
open(OUT,">B1.fa")||die"cannot write to the file:$!\n";

#@a=<INA>;
#print $a[1];
undef $/;
$/= ">";#重新定义换行符，以“<”作为新的换行符；
#@a=<INA>;
#print $a[1];

while(<INA>){
   next unless (my ($id,$seq) = /(.*?)\n(.*)/s);
   $seq =~ s/[\d\s>]//g;#remove digits, spaces, line breaks,..
    #print "$id\n";
   print OUT ">$id\r\n";
   print OUT "$seq\r\n";
   
}


close INA;
close OUT;


