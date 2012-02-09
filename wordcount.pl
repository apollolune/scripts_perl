#!/usr/bin/perl
use strict;

my %count = ();
while (read(STDIN, $_, 4095) and $_ .= <STDIN>) {
    tr/A-Za-z/ /cs;
	++$count{$_} foreach split(' ', lc $_);
	}

	my @lines = ();
	my ($w, $c);
	push(@lines, sprintf("%7d\t%s\n", $c, $w)) while (($w, $c) =
	each(%count));
	print sort { $b cmp $a } @lines;

