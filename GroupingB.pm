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
		"2",						#[8]
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
		"null" 						#[1]
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
	
	#our @Bpool_1 = ("Looming1", "Looming2", "Inconvinient1"); #forshadowing - planning - executing - ground zero (floding)"WTC",
	#our @Bpool_2 = ("Wolverine1", "Terminator1", "Inconvinient1"); #abstract / diffuse / nuclear -> explicit in last source
	#jarhead, the host, WTC

#defining scene pools for this grouping		
 #terrorist_attacks -frightening, deadly, traumatizing 
  #+
	#/WTC -distant wtc skyline at sunrise, -skyline above highway
	our @Bpool_1 = ("WTC1", "WTC3"); 
  #++
	#/WTC - twin towers from below, -commuter gazing at wtc from a ferry
	our @Bpool_2 = ("WTC5", "WTC2");	
  #unique -
	#/
	#our @Bpool_unique_1 = ();
  
 #terrorist_organizations - threatening, adversarial, exploitable 
  #+
	#/the looming tower -9/11 perpetrators using a flight simlator, WTC - shadow of a 747 moving across a building
	our @Bpool_3 = ("Looming1", "WTC4");
  #++
	#/an inconvinient truth  -rising sealevel dramatically illustrated above ground zero, the looming tower -found footage of 9/11 perpetrator at checkin
	our @Bpool_4 =	("Inconvinient1", "Looming2",);
  #unique -
	#/
	#our @Bpool_unique_2 = ();
  #unique -
	#/
	#our @Bpool_unique_3 = ();
	
 #war_on_Terror - retaliatory, profitable, deadly
  #+
	#/the wolverine - distant view of b21 aproaching nagasaki bay
	our @Bpool_5 =	("Wolverine1");
  #++
	#/
	#our @Bpool_6 =	();
  #+++
	#/...
	#our @Bpool_7 =	();

 #islamophobia - racist, divisive, dangerous
  #+
  	#/dogman -opening scene, godzilla -lurking behind a hill menacingly
	our @Bpool_8 =	("Dogman1", "Godzilla2");
  #++	
  	#/
	#our @Bpool_9 =	();
  #+++
	#/...
	#our @Bpool_10 =	();
	
 #terror_related_rhetoric - intimidating, frgihtening, exploitable
  #+
  	#/the looming tower -9/11 perpetrators using a flight simlator, an inconvinient truth  -rising sealevel dramatically illustrated above ground zero, the looming tower -found footage of 9/11 perpetrator at checkin
	our @Bpool_11 =	("Looming1","Inconvinient1","Looming2");
  #++	
  	#/
	#our @Bpool_12 =	();
  #+++
	#/...
	#our @Bpool_13 =	();

 #context
	#/
	#our @Bpool_14 =	(); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, -facade room, -closing scene.
	our @Bpool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Bpool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #requiem for a dream
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Bpool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
 #greenroom
	#/green room -discovery of murder, -neonazi redlaces gathering, -redlaces at the door, -mangled hand
	our @Bpool_movie4 =	("Greenroom1", "Greenroom2", "Greenroom3", "Greenroom4");
 #tere will blood
	#/there will be blood -plainview enjoying the sea, -empty bowling alley at plainviews estate, - finished in the bowling alley
	our @Bpool_movie5 =	("There_Will_Be_Blood1", "There_Will_Be_Blood2", "There_Will_Be_Blood3");
 #world trade center
	#/WTC -distant wtc skyline at sunrise, -commuter gazing at wtc from a ferry, -skyline above highway, shadow of plane moving across a building, - twin towers from below
	our @Bpool_movie6 = ("WTC1","WTC2","WTC3","WTC4","WTC5");
#

	

sub create_groupingB {
	#
	@terrorist_attacks = (
	##	cluster								object					rating	+ scenearray				++ scenearray	
		["international_terrorism",			"terrorist_attacks",	"1", 	$Bpool_1 [$Brand_two],		$Bpool_2 [$Brand_two]],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" 9 11 ",				"$Bword[3]",	"${$Bsig_ref}[7]",	"${$Bfunc_ref}[1]",	"${$Bstat_ref}[5]",		"$Btime[0]",	"null"],
		[" september 11th ", 	"$Bword[3]",	"${$Bsig_ref}[7]",	"${$Bfunc_ref}[1]",	"${$Bstat_ref}[5]",		"$Btime[0]",	"null"],
		[" world trade center ","$Bword[1]",	"${$Bsig_ref}[1]",	"${$Bfunc_ref}[3]",	"${$Bstat_ref}[8]",		"$Btime[0]",	"null"],
		#["  ",					"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",	"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	#
	@terrorist_organizations = (
	##	cluster								object						rating	+ scenearray				++ scenearray	
		["international_terrorism",			"terrorist organizations",	"1", 	$Bpool_3 [$Brand_two],		$Bpool_4 [$Brand_two]],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
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
	@war_on_Terror = (
	##	cluster								object				rating	+ scenearray	++ scenearray	
		["international_terrorism",			"war_on_Terror",	"1", 	$Bpool_5 [0],	"null"],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" drone ",				"$Bword[5]",	"${$Bsig_ref}[8]",	"${$Bfunc_ref}[7]",	"${$Bstat_ref}[9]",		"$Btime[0]",	"null"],
		[" drones ",			"$Bword[6]",	"${$Bsig_ref}[8]",	"${$Bfunc_ref}[7]",	"${$Bstat_ref}[9]",		"$Btime[0]",	"null"],
	);
	#
	@islamophobia = (
	##	cluster								object			rating	+ scenearray			++ scenearray	
		["context and islamophobia",		"islamophobia",	"1", 	$Bpool_8 [$Brand_two], "null"],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" middle east ",		"$Bword[3]",	"${$Bsig_ref}[4]",	"${$Bfunc_ref}[0]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
		[" middle easterner ",	"$Bword[3]",	"${$Bsig_ref}[5]",	"${$Bfunc_ref}[2]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
		[" middle easterners ",	"$Bword[4]",	"${$Bsig_ref}[5]",	"${$Bfunc_ref}[2]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
		[" radical islam ",		"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[0]",	"${$Bstat_ref}[12]",	"$Btime[0]",	"null"],
	#Muslim
	);
	#
	@terror_related_rhetoric = (
	##	cluster								object						rating		+ scenearray				++ scenearray	
		["context and islamophobia",		"terror_related_rhetoric",	"1", 		$Bpool_11 [$Brand_three],	"null"],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" extremist ",			"$Bword[3]",	"${$Bsig_ref}[2]",	"${$Bfunc_ref}[4]",	"${$Bstat_ref}[12]",	"$Btime[1]",	"null"],
		[" extremists ", 		"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[12]",	"$Btime[1]",	"null"],
		[" terror ",			"$Bword[3]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
		[" terrorism ",			"$Bword[3]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
		[" terrorist ",			"$Bword[3]",	"${$Bsig_ref}[2]",	"${$Bfunc_ref}[4]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
		[" terrorists ",		"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[8]",	"${$Bstat_ref}[10]",	"$Btime[1]",	"null"],
		[" jihad ",				"$Bword[4]",	"${$Bsig_ref}[6]",	"${$Bfunc_ref}[6]",	"${$Bstat_ref}[12]",	"$Btime[1]",	"null"],
	);
	#
	@context = (
	##	cluster								object					rating		+ scenearray				++ scenearray	
		["context and islamophobia",		"context",				"2", 		$Bpool_8 [$Brand_two],	"null"],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" bombing ",			"$Bword[3]",	"${$Bsig_ref}[9]",	"${$Bfunc_ref}[1]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
		[" islamic ",			"$Bword[2]",	"${$Bsig_ref}[10]",	"${$Bfunc_ref}[2]",	"${$Bstat_ref}[0]",		"$Btime[0]",	"null"],
	);
	#
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

#create_groupingBo;
1;
END
