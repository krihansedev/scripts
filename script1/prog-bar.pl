#!/usr/bin/perl -w

$| = 1;

my $steps = 50;
my $columns = &getTerminalSize()->[1];

for (my $i=1; $i<=$steps; $i++) {
    my $percent = ($i/$steps*100);
    my $pbwidth = $columns-10;
    my $numhashes = ($i/$steps*$pbwidth);
    printf("\r% -${pbwidth}s% 10s", '#' x $numhashes, "[ " . $percent . "% ]");
    sleep 1;
}

sub getTerminalSize {
    use Term::ReadKey;
    my ($w, $h) = GetTerminalSize(STDOUT);
    if (!defined $w || !defined $h) {
        die "Cannot determine terminal size!";
    }
    return [$h, $w];
}
