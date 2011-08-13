use IO::Handle;
autoflush STDERR,1;

# Alternative via special variable $|
# select STDERR;
# $| = 1;
# select STDOUT;

for (1..10) {
     $counter += 23;
     $counter %= 17;
     printf STDERR "The value is %2d\r",$counter;
     sleep 1;
     }
print STDERR "\n";

__END__

=head1

To keep the user of a long-running Perl program up to
date on its progress, you might like to display an
updated status every few seconds.

As a first attempt, most of us do this by putting a
print statement in our code; it works OK, but it
leaves a whole trail of old status lines down the
screen as the program runs - there's got to be a
better way!

1. Replace the \n with \r to overwrite reports

2. Output to STDERR so that any redirected output
goes to file but the status report remains on the
screen

3. Set up the output channel to autoflush so that
statuses don't get held in the buffer

4. Ensure that all printed status lines are the
same length so that droppings aren't left

=cut

