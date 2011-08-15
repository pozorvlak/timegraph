#!/usr/bin/perl

use Modern::Perl;
use Time::HiRes qw/gettimeofday tv_interval/;
use autodie;

my $command = shift @ARGV;
say "Argument\tTime";
for my $arg (@ARGV) {
    my $start = [gettimeofday()];
    open my $pipe, "-|", "$command $arg";
    my @lines = <$pipe>;
    my $duration = tv_interval($start);
    say "$arg\t$duration";
}
