package Dist::Zilla::Stash::DUKGO;
BEGIN {
  $Dist::Zilla::Stash::DUKGO::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Stash::DUKGO::VERSION = '0.007';
}
# ABSTRACT: Stash for handling %DUKGO credentials

use Moose;
extends 'Dist::Zilla::Stash::PAUSE';

1;

__END__

=pod

=head1 NAME

Dist::Zilla::Stash::DUKGO - Stash for handling %DUKGO credentials

=head1 VERSION

version 0.007

=encoding utf8

=head1 SEE ALSO

L<Dist::Zilla::Stash::PAUSE>

=head1 SUPPORT

IRC

  Join #duckduckgo on irc.freenode.net. Highlight Getty for fast reaction :).

Repository

  http://github.com/duckduckgo/p5-dist-zilla-plugin-uploadtoduckpan
  Pull request and additional contributors are welcome

Issue Tracker

  http://github.com/duckduckgo/p5-dist-zilla-plugin-uploadtoduckpan/issues

=head1 AUTHOR

Torsten Raudssus <torsten@raudssus.de>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by DuckDuckGo, Inc. L<http://duckduckgo.com/>.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
