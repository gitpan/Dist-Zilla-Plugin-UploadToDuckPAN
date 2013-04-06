package Dist::Zilla::Plugin::UploadToDuckPAN;
BEGIN {
  $Dist::Zilla::Plugin::UploadToDuckPAN::AUTHORITY = 'cpan:GETTY';
}
{
  $Dist::Zilla::Plugin::UploadToDuckPAN::VERSION = '0.003';
}
# ABSTRACT: Dist::Zilla plugin to upload to https://duckpan.org/ via https://dukgo.com/

use Moose;
extends 'Dist::Zilla::Plugin::UploadToCPAN';

use Scalar::Util qw(weaken);

has '+credentials_stash' => (
	default => sub { '%DUKGO' }
);

has 'upload_uri' => (
	is => 'ro',
	isa => 'Str',
	default => sub { 'https://dukgo.com/duckpan/do/upload' }
);
sub has_upload_uri { 1 }

has '+username' => (
  default  => sub {
    my ($self) = @_;
    return $self->_credential('username')
        || $self->pause_cfg->{user}
        || $self->zilla->chrome->prompt_str("dukgo.com username: ");
  },
);
 
 
has '+password' => (
  default  => sub {
    my ($self) = @_;
    return $self->_credential('password')
        || $self->pause_cfg->{password}
        || $self->zilla->chrome->prompt_str('dukgo.com password: ', { noecho => 1 });
  },
);

has '+uploader' => (
  default => sub {
    my ($self) = @_;
 
    my $uploader = Dist::Zilla::Plugin::UploadToCPAN::_Uploader->new({
      user     => $self->username,
      password => $self->password,
      ($self->has_subdir
           ? (subdir => $self->subdir) : ()),
      ($self->has_upload_uri
           ? (upload_uri => $self->upload_uri) : ()),
      target => 'dukgo.com',
    });
 
    $uploader->{'Dist::Zilla'}{plugin} = $self;
    weaken $uploader->{'Dist::Zilla'}{plugin};
 
    return $uploader;
  }
);
 
1;


__END__
=pod

=head1 NAME

Dist::Zilla::Plugin::UploadToDuckPAN - Dist::Zilla plugin to upload to https://duckpan.org/ via https://dukgo.com/

=head1 VERSION

version 0.003

=head1 SYNOPSIS

In dist.ini:

  [UploadToDuckPAN]

In ~/.dzil/config:

  [%DUKGO]
  username = youruserondukgocom
  password = yourpasswordondukgo.com

=head1 DESCRIPTION

=encoding utf8

=head1 SEE ALSO

L<Dist::Zilla::Plugin::UploadToCPAN>

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

