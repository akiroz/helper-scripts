#!/bin/perl

use Cwd 'abs_path';
my $argc = $#ARGV + 1;
if($argc != 2) {
    print "usage: xmlgen.pl [path/to/folder] [duration(sec)]\n";
    exit;
}
print "load: $ARGV[0]\n";
opendir(DIR, $ARGV[0]) or die $!;
open(my $xml, '>', 'wallpaper.xml');
print $xml
"<background>\n".
"\t<starttime>\n".
"\t\t<year>2011</year>\n".
"\t\t<month>11</month>\n".
"\t\t<day>24</day>\n".
"\t\t<hour>7</hour>\n".
"\t\t<minute>00</minute>\n".
"\t\t<second>00</second>\n".
"\t</starttime>\n\n";

while(my $photo = readdir(DIR)) {
    my $path = abs_path($ARGV[0]);
    print $xml
    "\t<static>\n".
    "\t\t<duration>$ARGV[1]</duration>\n".
    "\t\t<file>$path/$photo</file>\n".
    "\t</static>\n";
}

print $xml '</background>';
closedir(dir);
close($xml);
exit 0;
