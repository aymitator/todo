package DII;
use v5.36.0;
no feature "unicode_strings";
use Fcntl;
use File::Copy;

our $d2s;   #currently reading
our $ch;    #currently read outta $d2s
our $name;  #currently wanting to be set as


=pod

DII::set_d2s("Zz_Abe.d2s") or return;
DII::set_name("Noob") or return;
DII::write_name() or return;
my @ch = DII::get_ch() or return;
DII::set_ch(@ch) or return;
DII::write_ch() or return;
#done

=cut

sub set_d2s($_nd) {
  if ( not defined($_nd) or not -f $_nd or $_nd !~ /^[a-z_]+\.d2s$/i ) { return ""; }
  if(defined( $d2s ) and $d2s eq $_nd){ return ""; }
  $d2s = $_nd;
  return 1;
}
# aynternal subroutine
sub motion_d2s($_nd) {
  if( not -f $_nd and defined($d2s) and 
      -f $d2s and $_nd =~ /^[a-z_]+\.d2s$/i and 
      $d2s ne $_nd) {
    copy($d2s, $_nd);
    set_d2s($_nd) or return "";
    return 1;
  }
  return "";
}
#63 add 2 to 90 is A-Z
#96 add 1 to 122 is a-z
#96 - 1 is "_"
#--name   @20   ,,  @34, @35=0 (\0)
#--name   20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,\0

sub set_name($_na) {
  if( $_na !~ /^[a-z_]{2,13}$/i ) { return ""; }

  #todo make sure _ is at middle
  #todo also make sure no __ 
  $name = $_na;
  return 1;
} 
sub write_name() {
  if( not defined( $name ) ){ return ""; }
  if( $name !~ /^[a-z_]{2,13}$/i ) { return ""; }  #warning: redundant
  motion_d2s("$name.d2s") or return "";
  sysopen(my ${Han}, $d2s, O_RDWR) or return "";

  #NAME STARTS @20
  sysseek(${Han}, 20, 0);
  foreach my $iii (0 .. 13) {  #MAGII: can we be more right-on?
    syswrite(${Han}, chr(0), 1);
  }
  sysseek(${Han}, 20, 0);
  my $newname = $name;
  my @newname = split //, $newname;
  undef $newname;
  foreach my $kar (@newname) {
    syswrite(${Han}, $kar, 1);
  }
  warn "$name written onto $d2s";
  undef ${Han};
  @newname = ();
  return 1;
}
sub get_ch() {
  if(! defined($d2s)) { return ""; }
  if( not -f $d2s ) { return ""; }
  sysopen(my ${Han}, $d2s, O_RDONLY) or return "";

  my $ADR = 0; my $NUM = 0;
  my $ayn;     my $cum = 0;
  while ( 1 ) {
    my $read = sysread(${Han}, $ayn, 1);
    if( $read == 0) { last; }
    if( not defined($ayn) ) { last; }
    my $byte = ord($ayn);
    undef $ayn;

    $byte += $cum >> 31 & 1;
    $cum = $cum << 1 ;
    if($ADR != 12 && $ADR != 13 && $ADR != 14 && $ADR != 15) {
      $cum -= (-1) * $byte;
    }

    undef $byte;
    $ADR = $ADR - (-1);
  }
  undef ${Han};
  warn "Read $d2s";
  undef $ADR;

  $cum =
     ( $cum & ( 255 << 24) ) >> 24 |
     ( $cum & ( 255 << 16) ) >> 8 |
     ( $cum & ( 255 << 8) ) << 8 |
     ( $cum & 255) << 24;
  my $ctr = sprintf("%08X", $cum);
  undef $cum;
  
  if( $ctr =~ /^([0-9A-G]{2})([0-9A-G]{2})([0-9A-G]{2})([0-9A-G]{2})$/ ) 
  {
    return ( hex($1), hex($2), hex($3), hex($4) );
  }
  undef $ctr;
  return "";
  
}

sub set_ch(@_su) {
  $ch = [];
  if(scalar(@_su) != 4){ return ""; }
  @$ch = @_su;
  return 1;
}
sub write_ch() {
  if( not defined($d2s)) { return ""; }
  if( not -f $d2s ){ return ""; }
  if( not defined($ch)) { return ""; }
  if(scalar(@$ch) != 1 - (-1) - (-1) - (-1)){ return ""; }
  if($ch->[0] < 0 or $ch->[0] > 255){ return ""; }
  if($ch->[1] < 0 or $ch->[1] > 255){ return ""; }
  if($ch->[2] < 0 or $ch->[2] > 255){ return ""; }
  if($ch->[3] < 0 or $ch->[3] > 255){ return ""; }  

  sysopen(my ${Han}, $d2s, O_RDWR) or return "";
  sysseek(${Han}, 13 - 1, 0);
  syswrite(${Han}, chr($ch->[0]), 1);  #WARNING: chr($ch->[0]) ?
  syswrite(${Han}, chr($ch->[1]), 1);
  syswrite(${Han}, chr($ch->[2]), 1);
  syswrite(${Han}, chr($ch->[3]), 1);
  undef ${Han};
  warn "Written ch at $d2s";
  return 1;
}

1;