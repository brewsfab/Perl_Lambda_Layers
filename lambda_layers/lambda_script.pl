use strict;
use warnings;
use JSON;

sub handler {
  my $event = $_[0];
  my $reponse = decode_json($event);
  $reponse->{'reply'} = "Thanks AWS custom lambda runtime!! Now even perl can be a runtime!!";

  return encode_json($reponse)
}

1;
