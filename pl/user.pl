#!c:/Perl/bin/perl.exe -w

use strict;
use warnings; 

exit unless @ARGV;

# Put the file name in a string variable
# so we can use it both to open the file
# and to refer to in an error message
# if needed.
my $file = "user.txt";


# Use the open() function to create the file.
unless(open FILE, '>'.$file) {
	# Die with error message 
	# if we can't open it.
	die "nUnable to create $file";
}

# Write some text to the file.
#print FILE "Hello there\n";
#print FILE "How are you?\n";

print FILE $ARGV[0];

# close the file.
close FILE;