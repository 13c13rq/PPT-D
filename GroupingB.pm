package GroupingB;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingBv create_groupingBo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping B #
##############	

	our @Bword =	(
		"null",						#[0]
		"name", 					#[1]
		"adjective", 				#[2]
		"abstract noun",			#[3]
		"plural abstract noun",		#[4]
		"concrete noun",			#[5]
		"plural concrete noun",		#[6]
		"slogan"					#[7]
	);

	our @Bsig =	(
		"null",						#[0]
		"building",					#[1]
		"person",					#[2]
		"organization",				#[3]
		"region",					#[4]
		"regional ethnicity",		#[5]
		"abstract menace",			#[6]
		"date",						#[7]
		"military weapon",			#[8]
		"act of violence",			#[9]
		"religion",					#[10]
	);

	our @Bsigval=(	
		"0",						#[0]
		"1",						#[1]
		"1",						#[2]
		"1",						#[3]
		"1",						#[4]
		"1",						#[5]
		"2",						#[6]
		"2",						#[7]
		"2",						#[8]
		"2",						#[9]
		"2",						#[10]
	);

	our @Bfunc =	(
		"null",						#[0]
		"traumatic event",			#[1]
		"generalized attribution",	#[2]
		"ground zero",				#[3]
		"dangerous individual",		#[4]
		"xenophobic generalization",#[5]
		"external threat",			#[6]
		"autonomous weapon system",	#[7]
		"dangerous individuals",	#[8]
	);
	our @Bfuncval= (		
		"0",						#[0]
		"3",						#[1]
		"1",						#[2]
		"3",						#[3]
		"2",						#[4]
		"2",						#[5]
		"3",						#[6]
		"3",						#[7]
		"2",							#[8]
	);	
	our @Bstat =	(
		"null",						#[0]
		"unstable",					#[1]
		"threatening",				#[2]
		"threatened",				#[3]
		"racist generalization",	#[4]
		"traumatic",				#[5]
		"deceased",					#[6]
		"allied", 					#[7]
		"destroyed",				#[8]
		"deadly",					#[9]
		"terrifying",				#[10]
		"defeated",					#[11]
		"frightening",				#[12]
	);
	our @Bstatval=(
		"0",						#[0] 
		"2",						#[1]
		"2",						#[2]
		"2",						#[3]
		"1",						#[4]
		"1",						#[5]
		"0",						#[6]
		"1", 						#[7]
		"2",						#[8]
		"2",						#[9]
		"3",						#[10]
		"0",						#[11]
		"3",						#[12]
	);
	our @Btime =	(
		"null", 					#[0]			
		"null" 					#[1]
	);	


# predefining necessary variables
	our $Bsig_ref 	= undef;
	our $Bfunc_ref	= undef;
	our $Bstat_ref	= undef;
	
	our @terrorist_attacks		= undef;
	our @terrorist_organizations= undef;
	our @war_on_Terror			= undef;
	our @islamophobia			= undef;
	our @terror_related_rhetoric= undef;	
	our @context				= undef;	

	our $Brand_four = int(rand(4));
	our $Brand_three = int(rand(3));
	our $Brand_two 	= int(rand(2));
	our $Bone		= 1;
	
	our @Bpool_1 = ("Looming1", "Looming2", "Inconvinient1"); #forshadowing - planning - executing - ground zero (floding)"WTC",
	our @Bpool_2 = ("Wolverine1", "Terminator1", "Inconvinient1"); #abstract / diffuse / nuclear -> explicit in last source

sub create_groupingB {

# international terrorism #
	# 0 match		1 Bwordtype	 2 signification	3 function			4 status			5 Btimeperiod
	# September 11 trauma & other terroist attacs
	@terrorist_attacks = (
	["international_terrorism","terrorist_attacks","1", $Bpool_1 [$Brand_three],	"null"],
	[" 9 11 ",				"$Bword[3]",	"${$Bsig_ref}[7]",	"${$Bfunc_ref}[1]",	"${$Bstat_ref}[5]",		"$Btime[0]",	"null"],
	[" september 11th ", 	"$Bword[3]",	"${$Bsig_ref}[7]",	"${$Bfunc_ref}[1]",	"${$Bstat_ref}[5]",		"$Btime[0]",	"null"],
	[" world trade center ","$Bword[1]",	"${$Bsig_ref}[1]",	"${$Bfunc_ref}[3]",	"${$Bstat_ref}[8]",		"$Btime[0]",	"null"],
	#["  ",					"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",	"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	
	# terrorist organizations
	@terrorist_organizations = (
	["international_terrorism","terrorist organizations","1", $Bpool_1 [$Brand_three],	"null"],
	[" al qaeda ",			"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"$Btime[1]",	"null"],
	[" al qa ida ",			"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"$Btime[1]",	"null"],
	[" al shabaab ",		"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"$Btime[1]",	"null"],
	[" isis ",				"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"01:2017:03:2019",	"null"],
	[" isis ",				"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[11]",	"04:2019:01:2021",	"null"],
	[" isil ",				"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"01:2017:03:2019",	"null"],
	[" isil ",				"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[11]",	"04:2019:01:2021",	"null"],
	[" islamic state ",		"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"01:2017:03:2019",	"null"],
	[" islamic state ",		"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[11]",	"04:2019:01:2021",	"null"],
	[" taliban ",			"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[2]",		"$Btime[1]",	"null"],
	[" baghdadi ",			"$Bword[1]",	"${$Bsig_ref}[2]",	"${$Bfunc_ref}[4]",	"${$Bstat_ref}[2]",		"01:2017:10:2019",	"null"],
	[" baghdadi ",			"$Bword[1]",	"${$Bsig_ref}[2]",	"${$Bfunc_ref}[4]",	"${$Bstat_ref}[6]",		"11:2019:01:2021",	"null"],
	[" the caliphate ",		"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[3]",	"${$Bstat_ref}[2]",		"01:2017:04:2019",	"null"],
	[" the caliphate ",		"$Bword[1]",	"${$Bsig_ref}[3]",	"${$Bfunc_ref}[0]",	"${$Bstat_ref}[11]",	"04:2019:01:2021",	"null"],
	);
	#
	
	# Government reponse to terror
	@war_on_Terror = (
	["international_terrorism","war_on_Terror","1", $Bpool_2 [0],	"null"],
	[" drone ",				"$Bword[5]",	"${$Bsig_ref}[8]",	"${$Bfunc_ref}[7]",	"${$Bstat_ref}[9]",		"$Btime[0]",	"null"],
	[" drones ",			"$Bword[6]",	"${$Bsig_ref}[8]",	"${$Bfunc_ref}[7]",	"${$Bstat_ref}[9]",		"$Btime[0]",	"null"],
	);
	#
	##
	
#context and islamophobia
	@islamophobia = (
	["context and islamophobia","islamophobia","1", $Bpool_1 [$Brand_three], "null"],
	[" middle east ",		"$Bword[3]",	"${$Bsig_ref}[4]",	"${$Bfunc_ref}[0]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
	[" middle easterner ",	"$Bword[3]",	"${$Bsig_ref}[5]",	"${$Bfunc_ref}[2]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
	[" middle easterners ",	"$Bword[4]",	"${$Bsig_ref}[5]",	"${$Bfunc_ref}[2]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
	[" radical islam ",		"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[0]",	"${$Bstat_ref}[12]",	"$Btime[0]",	"null"],
	#Muslim
	);
	
	@terror_related_rhetoric = (
	["context and islamophobia","terror_related_rhetoric","1", $Bpool_1 [$Brand_three],	"null"],
	[" extremist ",			"$Bword[3]",	"${$Bsig_ref}[2]",	"${$Bfunc_ref}[4]",	"${$Bstat_ref}[12]",	"$Btime[1]",	"null"],
	[" extremists ", 		"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[12]",	"$Btime[1]",	"null"],
	[" terror ",			"$Bword[3]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
	[" terrorism ",			"$Bword[3]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
	[" terrorist ",			"$Bword[3]",	"${$Bsig_ref}[2]",	"${$Bfunc_ref}[4]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
	[" terrorists ",		"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[8]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
	[" jihad ",				"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[12]",	"$Btime[1]",	"null"],
	);
	
	@context = (
	["context and islamophobia","context","2", $Bpool_1 [$Brand_three],	"null"],
	[" bombing ",			"$Bword[3]",	"${$Bsig_ref}[9]",	"${$Bfunc_ref}[1]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
	[" islamic ",			"$Bword[2]",	"${$Bsig_ref}[10]",	"${$Bfunc_ref}[2]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
	);
	#
	##
};
sub create_groupingBv{
	
	$Bsig_ref 	= \@Bsigval;
	$Bfunc_ref	= \@Bfuncval;
	$Bstat_ref	= \@Bstatval;
	
	create_groupingB;
	
	our $terrorist_attacks_val_ref  		= \@terrorist_attacks;
	our $terrorist_organizations_val_ref  	= \@terrorist_organizations;
	our $war_on_Terror_val_ref  			= \@war_on_Terror;
	our $islamophobia_val_ref 			 	= \@islamophobia;
	our $terror_related_rhetoric_val_ref  	= \@terror_related_rhetoric;	
	our $context_val_ref  					= \@context;	
	
	our @valuesB = ($terrorist_attacks_val_ref, $terrorist_organizations_val_ref, $war_on_Terror_val_ref, $islamophobia_val_ref, $terror_related_rhetoric_val_ref, $context_val_ref);
};
sub create_groupingBo{
	$Bsig_ref 	= \@Bsig;
	$Bfunc_ref	= \@Bfunc;
	$Bstat_ref	= \@Bstat;
	
	create_groupingB;
	
	our $terrorist_attacks_ref  			= \@terrorist_attacks;
	our $terrorist_organizations_ref  		= \@terrorist_organizations;
	our $war_on_Terror_ref  				= \@war_on_Terror;
	our $islamophobia_ref 			 		= \@islamophobia;
	our $terror_related_rhetoric_ref  		= \@terror_related_rhetoric;	
	our $context_ref  						= \@context;	
	
	our @objectsB = ($terrorist_attacks_ref, $terrorist_organizations_ref, $war_on_Terror_ref, $islamophobia_ref, $terror_related_rhetoric_ref, $context_ref);
	#print Dumper @objectsB;
};

#test
#create_groupingBo;

1;
END
