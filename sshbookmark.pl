#!/bin/perl

my $in = 0;
if(@ARGV == 1) {
    $in = $ARGV[0];
} else {
    print
    "1: login to foo\n" .
    "2: login to bar\n" .
    "h: <user>\@<fqdn>[:<port>]\n" .
    "Enter host or bookmark: ";
    chomp($in = <STDIN>);
}

if($in =~ /^[0-9]$/) {
    if($in == 1) {exec 'ssh user@foo.com -p 22001';}
    if($in == 2) {exec 'ssh user@bar.com -p 22002';}
    print "Invalid bookmark number.\n"; die;
}

print "[<local>:]<port>:<remote>:<port>\n".
"Enter tunnel: ";
chomp(my $tunnel = <STDIN>);

my ($host,$port) = split /:/, $in;
if($port !~ /[0-9]/) {$port = 22};

exec "ssh -f $host -p $port -L $tunnel -N";
