
package DIITOOL;
use v5.36.0;
no feature "unicode_strings";
require DII;
sub SLE($_SE) {
  sleep($_SE);
}


sub DIITOOL() { #edom -MDIITOOL -E "DIITOOL::DIITOOL() and say 'did';"

chdir "C:\\Users\\DeehDeh\\Saved Games\\Diablo II" or return "";
opendir(my ${DHI}, ".") or return "";
my @DRR = readdir(${DHI});
closedir(${DHI});
undef ${DHI};
my $last_mod = 0;
my $diic;
foreach my $DRR(@DRR) {
  if($DRR eq ".." or $DRR eq "."){ next; }
  if($DRR =~ /\.(key|ma0|map|ma1)$/){ next; }
  if($DRR =~ /\.d2s$/) {
    my @STA = stat($DRR);
    if( not @STA ){ return ""; }
    if($STA[9] > $last_mod) {
      $diic = $DRR;
      $last_mod = $STA[9];
    }
    next;
  } return "";
}
@DRR = ();
if(not defined($diic)){ return ""; }
undef $last_mod;
if( not -f $diic ){ return ""; }
say "rename $diic to:";
my $AYN = <STDIN>;
chomp $AYN;
if( $AYN !~ /^[a-z_]{2,13}$/i ) { return ""; }
if( $AYN =~ /(done|exit|quit)/i ) { return "" ; }
say "set_d2s";
DII::set_d2s($diic) or return "";
undef $diic;

say "set_name";
DII::set_name($AYN) or return "";
undef $AYN;

#say "write_name";
DII::write_name() or return "";      #MAGI: when needed, CAUTION: writes

say "resting iii seconds";SLE(3);  ####testing
say "get_ch";
my @ch = DII::get_ch() or return "";  #CAUTION: reads


say "set_ch";
DII::set_ch(@ch) or return "";

say "write_ch";
DII::write_ch() or return "";  #CAUTION: writes

return 1;

}



1;
