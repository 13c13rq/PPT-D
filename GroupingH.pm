package GroupingH;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingHv create_groupingHo ); 
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping H #
##############	

	our @Hword =	(
		"null",						#[0]
		"name", 					#[1]
		"adjective", 				#[2]
		"abstract noun",			#[3]
		"plural abstract noun",		#[4]
		"concrete noun",			#[5]
		"plural concrete noun",		#[6]
		"slogan",					#[7]
		"verb/action",				#[8]
		"description"				#[9]
	);
	
	our @Hsig =	(
		"null",						#[0]
		"city",						#[1]
		"person",					#[2]
		"building",					#[3]
		"relationship",				#[4]
		"political paradigm shift",	#[5]
	);
	
	our @Hsigval=(	
		"0",						#[0]
		"1",						#[1]
		"1",						#[2]
		"1",						#[3]
		"2",						#[4]
		"3",						#[5]

	);
	
	our @Hfunc =	(
		"null",						#[0]
		"elected leader",			#[1]
		"dictator",					#[2]
		"populist politician",		#[3]
		"family member",			#[4]
		"liked individual",			#[5]
		"uk leaves eu",				#[6]
		"crime scene",				#[7]
	);
	
	our @Hfuncval= (		
		"0",						#[0]
		"2",						#[1]
		"3",						#[2]
		"3",						#[3]
		"3",						#[4]
		"2",						#[5]
		"3",						#[6]
		"3",						#[7]
	);	
	
	our @Hstat =	(
		"null",						#[0]
		"threatening",				#[1]
		"threatened",				#[2]
		"atrocious",				#[3]
		"brexit pm",				#[4]
		"controversial individual", #[5]
		"dangerous",				#[6]
		"corrupt",					#[7]
		"problematic",				#[8]
	);
	
	our @Hstatval=(
		0,							#[0] 
		3,							#[1]
		3,							#[2]
		3,							#[3]
		3,							#[4]
		3,							#[5]
		3,							#[6]
		3, 							#[7]
		3,							#[8]
		2,							#[9]
	);
	
	our @Htime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"03:2020:01:2021",			#[2] # covid crash and post crash period
		"01:2017:03:2020"			#[3] # pre covid crash
	);	
	
	
# predefining necessary variables
	our $Hsig_ref 			= undef;
	our $Hfunc_ref			= undef;
	our $Hstat_ref			= undef;
	
	our @atrocity		= undef;
	our @populist_leaders	= undef;
	our @populists			= undef;
	our @uk					= undef;
	our @dictators			= undef;
	our @Hcontext			= undef;	
	
	our $Hrand_four 		= int(rand(4));
	our $Hrand_three 		= int(rand(3));
	our $Hrand_two 			= int(rand(2));

	our @Hpool_1 = ("Dogman1", "Dogman2", "Dogman3"); #/dog opening - ?? - beach burial
	our @Hpool_2 = ("Godzilla1", "Shin1", "Godzilla2"); #/godzilla suspense scenes
	our @Hpool_3 = ("Shin2", "Host1"); #/american abominations in full view
	our @Hpool_4 = ("Castle_Rock1", "Clemency1", "Out1"); #/execution theartres
	our @Hpool_5 = ("Stepford1", "Stepford2", "Stepford3"); #/opening scene - facade room scene - supermarket scene

sub create_groupingH {


	# 0 match						1 wordtype	 2 signification	3 function			4 status			5 timeperiod
	
#" enemy ",
#" victim ",
#" victims ",
#" war ", 

#" thug ",
#" thugs ",
	
# populists, dictators and atrocities #
	@atrocity = (
	["populists, dictators and atrocities","atrocity","1", $Hpool_3 [0]],
	[" turkish consulate ",			"$Hword[5]",	"${$Hsig_ref}[3]",	"${$Hfunc_ref}[7]",	"${$Hstat_ref}[3]",	"$Htime[0]",	"null"],
	[" king of saudi arabia ",		"$Hword[9]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"10:2019:10:2019","null"],
	[" crown prince of saudi arabia ","$Hword[9]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" beirut ",					"$Hword[1]",	"${$Hsig_ref}[1]",	"${$Hfunc_ref}[7]",	"${$Hstat_ref}[3]",	"07:2020:07:2020","null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	
	@uk = (
	["populists, dictators and atrocities","UK (Brexit)","1",$Hpool_1 [$Hrand_three], $Hpool_5 [1]],
	[" brexit ",					"$Hword[7]",	"${$Hsig_ref}[5]",	"${$Hfunc_ref}[6]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" boris johnson ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" borisjohnson ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" boris j ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" theresa may ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" theresa_may ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" prime minister may ",		"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" prime minister theresa may ","$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[4]",	"$Htime[0]",	"null"],
	[" nigel_farage ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	
	@populist_leaders= (
	["populists, dictators and atrocities","populist leaders","1", $Hpool_1 [$Hrand_three]],
	[" boris johnson ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" borisjohnson ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" Boris j ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" giuseppe conte ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" giuseppeconteit ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" jair bolsonaro ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" jairbolsonaro  ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" netanyahu ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" joko widodo ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[1]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	
	@populists = (
	["populists, dictators and atrocities","gop populists","1", $Hpool_1 [$Hrand_three], $Hpool_5 [1]],
	[" rondesantisfl ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" desantis ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" repmattgaetz ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" gaetz ",						"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" sen  cruz ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" ted cruz ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" SenHawleyPress ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" hawley ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[5]",	"$Htime[0]",	"null"],
	[" greene ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[3]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	
	@dictators	 = (
	["populists, dictators and atrocities","dictators","1",$Hpool_1 [1]],
	[" kim jong un ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
	[" chariman kim ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
	[" erdogan ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
	[" alsisiofficial ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" salman ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
	[" mbs ",						"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],

	);

	@Hcontext = (
	["context","context","2",$Hpool_5 [1]],
	[" friend ",					"$Hword[5]",	"${$Hsig_ref}[4]",	"${$Hfunc_ref}[5]",	"${$Hstat_ref}[8]",	"$Htime[0]",	"null"],
	[" kushner ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[4]",	"${$Hstat_ref}[8]",	"$Htime[0]",	"null"],
	[" ivanka ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[4]",	"${$Hstat_ref}[8]",	"$Htime[0]",	"null"],
	#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	#
	##
};
sub create_groupingHv{
	
	$Hsig_ref 	= \@Hsigval;
	$Hfunc_ref	= \@Hfuncval;
	$Hstat_ref	= \@Hstatval;
	
	create_groupingH;
	
	our $atrocity_val_ref 	=  	\@atrocity;
	our $populist_leaders_val_ref 			=  	\@populist_leaders;
	our $populists_val_ref 		=  	\@populists;
	our $uk_val_ref				=  	\@uk;
	our $dictators_val_ref 		= 	\@dictators;
	our $Hcontext_val_ref		=  	\@Hcontext;	
		
	our @valuesH = ($atrocity_val_ref, $populist_leaders_val_ref, $populists_val_ref, $uk_val_ref, $dictators_val_ref, $Hcontext_val_ref);
};
sub create_groupingHo{
	$Hsig_ref 	= \@Hsig;
	$Hfunc_ref	= \@Hfunc;
	$Hstat_ref	= \@Hstat;
	
	create_groupingH;
	
	our $atrocity_ref 	=  	\@atrocity;
	our $populist_leaders_ref 			=  	\@populist_leaders;
	our $populists_ref 		=  	\@populists;
	our $uk_ref				=  	\@uk;
	our $dictators_ref 		= 	\@dictators;
	our $Hcontext_ref		=  	\@Hcontext;
	
	our @objectsH = ($atrocity_ref, $populist_leaders_ref, $populists_ref, $uk_ref, $dictators_ref, $Hcontext_ref);
	#print Dumper @objectsH;
};
	
#create_groupingHo

1;
END
