#!c:/Perl/perl.exe -w

use warnings;
use strict;

exit unless @ARGV;

my $path = "C:\\Program Files\\7-Zip\\7z.exe"; # modify this accordingly
my $infile = (split /\./,$ARGV[0])[0];

system("\"$path\" a $infile".'-'.DataHora()." @ARGV");

sub DataHora{
# Criar layout de data
	my($dd,$mm,$yy,$day,$hh,$nn) = (localtime)[3,4,5,6,2,1];
	my $today =  join '', map sprintf("%02d", $_),($yy%100,$mm+1,$dd,);
	my $hr = join '', map sprintf("%02d", $_),($hh,$nn);

	# "Vasio" = Data e hora | "1" Apenas Data
	my $data = $_[0] ? $today:$today.'_'.$hr;
		
	my $datahora = $data;
	
	return ($datahora);
	}
