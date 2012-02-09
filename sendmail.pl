#!/usr/bin/perl -w
## !/opt/local/bin/perl -w

# sends a mail
# USAGE : echo "toto" | sendmail.pl

use strict;
use Carp;

use LWP::Simple;
use MIME::Lite;

# my $url = "abc.org/?xyz=csv";
# my $file = "/Users/abc/Desktop/abc.csv";

# my $status = mirror($url,$file);

# die "Cannot retrieve $url" unless is_success($status);
if ( !$ARGV[0] ) {
    print "Il faut un message à envoyer par mail.\n";
    exit(1);
}

my $myhost = `hostname`;
chomp $myhost;
my @message = @ARGV;
my $message = join(" ", @message);

my $msg;
$msg = MIME::Lite->new(
    From    => 'apollolune@gmail.com',
    To      => 'xxxxx@gmail.com',
    Subject => "Task done on $myhost",
	Data     => $message,
);

# $msg->attach(
		# Type	 => 'Text',
		# Data     => "Essai d'envoi de mail d'un script Perl.",
# );
# $msg->attach(
		# Type	 => 'Application/Text',
		# Path     => "/Users/abc/Desktop/abc.csv"
# );

$msg->send;


__END__
