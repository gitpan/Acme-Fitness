package Acme::Fitness;

use strict;
use Carp;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw(
	
);
$VERSION = '0.02';


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.
 
 
sub new {
   my ($class,$args) = @_;
   my  $self = { DEBUG => 1,
                 gender => "unknown",
	         weight => 0,
                 height => 0,
 		 system => "metric",
              };
  bless $self, $class;
  if ($args) {
    $self->init($args);   # Init different values
  }
  return $self;
}

sub init {
  my ($self,$args) = @_;
  foreach my $key (%$args) {
      $self->{$key} = $args->{$key};
  }
}

sub clone {
   croak("You shouldn't clone humans");
}

sub weight {
  if($_[1]) {
    return ($_[0]->{weight} = $_[1]);
  } else {
    $_[0]->{weight};
  }
}

sub height {
  if($_[1]) {
    return ($_[0]->{height} = $_[1]);
  } else {
    $_[0]->{height};
  }
}

sub gender {
   my $self = shift;
   my $gender = shift;
   if($gender) {
     $self->{gender} = $gender;
   } else {
     return $self->{gender};
   }
}

sub system {
  my $self = shift;
  my $system = shift;
}

sub bmi {
   my $self = shift;
   if($self->{system} eq "metric") {
      my $bmi = $self->{weight} / ($self->{height}*$self->{height});
      return sprintf("%.1f",$bmi);
   } else {
    croak("System: " . $self->{system} . " not supported");
  }
}

sub max_wat_test {
  croak("Not implemented");
}

1;
__END__

=head1 NAME

Acme::Fitness - Perl extension for calculating fitness results 

=head1 SYNOPSIS

  use Acme::Fitness;

  my $fit4fight = new Acme::Fitness( { system => "metric" } );
  $fit4fight->weight(75);
  $fit4fight->hight(180);
  $fit4fight->gender("male");
  printf("Your BMI is %.2d \n",$fit4fight->bmi());

=head1 DESCRIPTION

=head2 BMI (Body Mass Index) (see [1])

BMI = weight (kg) / height (m) x height (m)

BMI = weight (Lbs) * 704 / height (In.) x height (In.)

The BMI divide people into four groups:
1. Underweight ( < 18,5)
2. Normal ( 18,5 - 24,9)
3. Overweight (25,0 - 29,9)
4. Obesity (> 30)

=head2 The "Wmax"-test (see [2]) UNIMPLEMENTED


=cut

# TODO: Translate

#The test is developed by Lars Bo Andersen 
# Testen er udviklet af Lars Bo Andersen fra Institut for Idr?t pa* K?benhavns Institut. Formlen, der ligger til grund for testen, er fundet ved regressionsanalyse pa* testresultater fra over 500 fors?gspersoner (ba*de m?nd og kvinder).

# Testen baserer sig pa*, at en belastning der skal holdes i 2 minutter (og som laves efter andre lavere 2 minutters intervaller) prim?rt er afh?ngig af aerob energifrig?relse. Da nyttevirkningen ved k?rsel pa* kondicykel er ret ens for forskellige personer, kan man regne med, at folk der tr?der det samme antal watt ved en sa*dan test ogsa* har den samme iltoptagelse.

# Formlen bag testen: VO2max = 0,16 + (0,0117 x MPO) (w)

# VO2max er den maksimale iltoptagelse i liter pr. minut.
# MPO er det maksimale power output (antal watt)(der tages h?jde for hvor mange sekunder man holdt sit max).


=head1 AUTHOR

Lars G. T. Jørgensen <larsj@diku.dk>

=head1 SEE ALSO

[1] http://www.fitness-usa.com/BMI.htm

[2] Scand J Med Sci Sports 1995 Jun;5(3):143-6

=head1 TODO

Add support for imperal measures.

=cut
