package GroupingF;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingFv create_groupingFo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping F #
##############	

	our @Fword =	(
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
	our @Fsig =	(
		"null",						#[0]
		"country",	#	#	#	#	#[1]
		"building",					#[2]
		"person",					#[3]
		"group of people",			#[4]
		"organization",				#[5]
		"date",						#[6]
		"location",		#	#	#	#[7]
		"minority", 	#	#	#	#[8]
		"derogative",	#	#	#	#[9]
		"crime",		#	#	#	#[10]
		"prosecutable abberrarion",	#[11]
		"law",						#[12]
		"weapon",					#[13]
		"propaganda",			#	#[14]
		"act of violence",			#[15]
		"institution",				#[16]
		"perceived aberration",	#[17]
		"status",					#[18]
		"weapon",					#[19]		
	);
	our @Fsigval=(	
		0,						#[0]
		1,						#[1]
		1,						#[2]
		2,						#[3]
		2,						#[4]
		2,						#[5]
		2,						#[6]
		2,						#[7]
		2,						#[8]
		2,						#[9]
		2,						#[10]
		2,						#[11]
		2,						#[12]
		3,		 				#[13]
		3,						#[14]
		3,						#[15]
		2,						#[16]
		2,						#[17]
		1,						#[18]
		3,						#[19]	
	);
	our @Ffunc =	(
		"null",						#[0]
		"traumatic event",			#[1]
		"generalized attribution",	#[2]
		"politician",				#[3]
		"political countermovement",#[4]
		"prosecutable act",		#	#[5]
		"propaganda",			#	#[6]
		"belligerent",			#	#[7]
		"victim",				#	#[8]
		"gun distribution",		#	#[9]
		"assailant",			#	#[10]		
		"threatened location",	#	#[11]		
		"crime scene",		#	#	#[12]	
		"prosecutable person",	#	#[13]	
		"vulnerable person(s)",	#	#[14]
		"criminal group",	#	#	#[15]				
		"suspicious group",	#	#	#[16]	
		"suspicious situation",	#	#[17]	
		"suspicious person",	#	#[18]	
		"legislature",	#	#	#	#[19]	
		"institutional violence",	#[20]
		"security",					#[21]
	);
	our @Ffuncval= (		
		0,						#[0]
		3,						#[1]
		2,						#[2]
		3,						#[3]
		3,						#[4]
		2,						#[5]
		3,						#[6]
		3,						#[7]
		3,						#[8]
		2,						#[9]
		3,						#[10]
		3,						#[11]
		3,						#[12]
		2,						#[13]
		3,						#[14]
		2,						#[15]
		2,						#[16]
		2,						#[17]
		2,						#[18]
		3,						#[19]
		3,						#[20]
		2,						#[21]
	);	
	our @Fstat =	(
		"null",						#[0]
		"destabilizing",			#[1]
		"threatening",				#[2]
		"threatened",				#[3]
		"burdensome",				#[4]
		"precarious",				#[5]
		"perilous", 				#[6]
		"devastating",				#[7]
		"horrific",					#[8]
		"traumatic",				#[9]
		"deadly",					#[10]
		"helpful",					#[11]
		"vital",					#[12]
		"monopoly",					#[13]
		"monopolized",				#[14]
		"exploited",				#[15]
		"useless",					#[16]
		"deceased",					#[17]
	);
	our @Fstatval=(
		0,							#[0] 
		2,							#[1]
		2,							#[2]
		2,							#[3]
		2,							#[4]
		2,							#[5]
		3,							#[6]
		3, 							#[7]
		3,							#[8]
		3,							#[9]
		3,							#[10]
		1,							#[11]
		2,							#[12]
		1,							#[13]
		1, 							#[14]
		2,							#[15]
		1,							#[16]
		3,							#[17]
	);
	our @Ftime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"01:2020:01:2021",			#[2] #the pandemic
		"01:2017:01:2020"			#[3] #before pandemic
	);	
	
	
# predefining necessary variables
	our $Fsig_ref 			= undef;
	our $Ffunc_ref			= undef;
	our $Fstat_ref			= undef;
	
	our @gun_control			= undef;
	our @domestic_terrorism	= undef;
	our @crime				= undef;
	our @prosecution		= undef;
	our @institutional_violence	= undef;
	our @border_control		= undef;
	our @immigration		= undef;
	our @Fcontext			= undef;	

	our $Frand_four 		= int(rand(4));
	our $Frand_three 		= int(rand(3));
	our $Frand_two 			= int(rand(2));
	our @Fpool_1 = ("Out1", "Out2", "Stepford2"); #/surgery scene, teacup on tv scene
	our @Fpool_2 = ("Stepford1", "Stepford2", "Stepford3"); #/opening scene - facade room scene - supermarket scene
	our @Fpool_3 = ("Dogman1", "Dogman2", "Dogman3"); #/dog opening - ?? - beach burial
	our @Fpool_4 = ("Godzilla1", "Shin1", "Godzilla2"); #/godzilla suspense scenes
	our @Fpool_5 = ("Shin2", "Host1"); #/american abominations in full view
	our @Fpool_6 = ("Castle_Rock1", "Clemency1", "Out2"); #/execution theartres
	our @Fpool_7 = ("Lovecraft_Country1", "Lovecraft_Country2"); #/sundown chase scene - tunnel curse by cop scene
	our @Fpool_8 = ("World_War_Z1", "World_War_Z2"); #/zombie wall

sub create_groupingF {
	
	
	# 0 match			1 wordtype		 2 signification		3 function			4 status			5 timeperiod
# guns & domestic terrorism #
	# guncontol
	@gun_control = (
	["gun_control & domestic terrorism","guncontol","1", $Fpool_3 [2],	"null"],
	[" 2nd a ",			"$Fword[1]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[9]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" 2nd amendment ",	"$Fword[1]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[9]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" second amendment ","$Fword[1]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[9]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" gun",			"$Fword[5]",	"${$Fsig_ref}[19]",	"${$Ffunc_ref}[1]",		"${$Fstat_ref}[10]",	"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
	# domestic terrorism
	@domestic_terrorism = (
	["gun_control & domestic terrorism","domestic_terrorism","1", $Fpool_3 [1],	"null"], ### dog man scene
	[" stopthesteal ",	"$Fword[7]",	"${$Fsig_ref}[14]",	"${$Ffunc_ref}[1]",		"${$Fstat_ref}[9]",		"01:2021:01:2021",	"null"],
	[" January 6th ",	"$Fword[5]",	"${$Fsig_ref}[6]",	"${$Ffunc_ref}[1]",		"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"],
	[" shooter ",		"$Fword[5]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[10]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" shooting ",		"$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[1]",		"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"],
	[" synagogue ",		"$Fword[5]",	"${$Fsig_ref}[2]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	[" el paso ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[9]",		"08:2019:08:2019",	"null"],
	[" pitsburg ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[9]",		"10:2018:10:2018",	"null"],
	[" el paso ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"],
	[" heyer ",			"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[8]",		"${$Fstat_ref}[17]",	"$Ftime[0]",	"null"],
	[" car attack",		"$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[1]",		"$Ftime[0]",	"null"],
	[" charlottesville ","$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[9]",		"08:2017:08:2017",	"null"],
	[" kenosha ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	#

# crime, prosecution and imprisonment #
	# crime
	@crime = (
	["crime, prosecution & institutional violence", "crime", "1", $Fpool_4 [$Frand_two],	"null"],
	[" criminal ",		"$Fword[5]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[13]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" crime ",			"$Fword[3]",	"${$Fsig_ref}[10]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[5]",		"$Ftime[0]",	"null"],
	[" gang",			"$Fword[5]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[15]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" ms-13 ",			"$Fword[5]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[15]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" mob ",			"$Fword[5]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[16]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" murder",			"$Fword[5]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[10]",	"$Ftime[0]",	"null"],
	[" drug lord ",		"$Fword[5]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[13]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" drug-infested ",	"$Fword[2]",	"${$Fsig_ref}[9]",	"${$Ffunc_ref}[18]",	"${$Fstat_ref}[5]",		"$Ftime[0]",	"null"],
	[" hombres ",		"$Fword[4]",	"${$Fsig_ref}[9]",	"${$Ffunc_ref}[18]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" trafficking ",	"$Fword[8]",	"${$Fsig_ref}[10]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[15]",	"$Ftime[0]",	"null"],
	[" cartel",			"$Fword[4]",	"${$Fsig_ref}[5]",	"${$Ffunc_ref}[15]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
	@prosecution = (
	["crime, prosecution & institutional violence", "prosecution", "1", $Fpool_6 [$Frand_two],	$Fpool_2[$Frand_three]],
	[" supreme court ",	"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" kavanaugh ",		"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" execution ",		"$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[10]",	"$Ftime[0]",	"null"],
	[" death penalty ",	"$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[10]",	"$Ftime[0]",	"null"],
	[" scotus ",		"$Fword[1]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" neil gorsuch ",	"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" barrett ",		"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" prison",			"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
	[" imprison",		"$Fword[8]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
	[" jail ",			"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
	[" incarceration ", "$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
	@institutional_violence = (
	["crime, prosecution & institutional violence", "institutional violence", "1", $Fpool_7 [$Frand_two],	$Fpool_1 [$Frand_three]],
	[" law and order ",	"$Fword[9]",	"${$Fsig_ref}[14]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" law & order ",	"$Fword[9]",	"${$Fsig_ref}[14]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" portland ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"],
	[" floyd ",			"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[8]",		"${$Fstat_ref}[17]",	"$Ftime[0]",	"null"],
	[" kenosha ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"], #time!!
	[" blm ",			"$Fword[1]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[4]",		"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" protesters ",	"$Fword[6]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[4]",		"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" vandalism ",		"$Fword[3]",	"${$Fsig_ref}[17]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[14]",	"$Ftime[0]",	"null"],
	[" minneapolis ",	"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"], #time!!
	[" gitmo ",			"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[8]",		"$Ftime[0]",	"null"],
	[" guantanamo ",	"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[8]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
# guns & domestic terrorism #
	# border control, immigration and context
	@border_control = (
	["border control, immigration and context", "border control", "1", $Fpool_8 [$Frand_two], $Fpool_2[$Frand_three]],
	[" wall ",			"$Fword[5]",	"${$Fsig_ref}[2]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" steel slat ",	"$Fword[5]",	"${$Fsig_ref}[2]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" steel slats ",	"$Fword[5]",	"${$Fsig_ref}[2]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" travel ban ",	"$Fword[3]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" Smuggling ",		"$Fword[3]",	"${$Fsig_ref}[10]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[15]",	"$Ftime[0]",	"null"],
	[" trafficking ",	"$Fword[3]",	"${$Fsig_ref}[10]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[15]",	"$Ftime[0]",	"null"],
	[" southern border ","$Fword[5]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" fence ",			"$Fword[5]",	"${$Fsig_ref}[2]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" border patrol ",	"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" caravans ",		"$Fword[6]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" ice ",			"$Fword[1]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" ICEgov ",		"$Fword[1]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" cbp ",			"$Fword[1]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
	
	@immigration = (
	["border control, immigration and context", "immigration", "1", $Fpool_1 [$Frand_two], $Fpool_2[$Frand_three]],
	[" anchor babies ", "$Fword[9]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" refugee ",		"$Fword[5]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" refugees ",		"$Fword[5]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" birthright citizenship ","$Fword[9]","${$Fsig_ref}[12]","${$Ffunc_ref}[0]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" immigrant",		"$Fword[5]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" immigration ",	"$Fword[3]",	"${$Fsig_ref}[17]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" alien",			"$Fword[4]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" caravan",		"$Fword[4]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" migrant",		"$Fword[4]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" daca ",			"$Fword[3]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	[" lottery ",		"$Fword[3]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[14]",	"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
	@Fcontext = (
	["border control, immigration and context", "context", "2", $Fpool_1 [$Frand_two],	$Fpool_2[$Frand_three]],
	[" security ",,		"$Fword[4]",	"${$Fsig_ref}[18]",	"${$Ffunc_ref}[21]", 	"${$Fstat_ref}[1]",		"$Ftime[2]",	"null"],
	[" not secure ",	"$Fword[2]",	"${$Fsig_ref}[18]",	"${$Ffunc_ref}[21]", 	"${$Fstat_ref}[1]",		"$Ftime[2]",	"null"],
	[" fraud ",			"$Fword[3]",	"${$Fsig_ref}[17]",	"${$Ffunc_ref}[5]", 	"${$Fstat_ref}[1]",		"$Ftime[2]",	"null"],
	[" border ",		"$Fword[4]",	"${$Fsig_ref}[7]",	"${ $Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" make america safe ","$Fword[7]","${$Fsig_ref}[14]",	"${$Ffunc_ref}[6]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" illegal",		"$Fword[2]",	"${$Fsig_ref}[10]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" justice ",		"$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" court ",			"$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" drug ",			"$Fword[5]",	"${$Fsig_ref}[19]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	[" police ",		"$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
	#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	
};
sub create_groupingFv{

	$Fsig_ref 	= \@Fsigval;
	$Ffunc_ref	= \@Ffuncval;
	$Fstat_ref	= \@Fstatval;
	
	create_groupingF;
	
	our $gun_control_val_ref  			= \@gun_control;			
	our $domestic_terrorism_val_ref  	= \@domestic_terrorism;	
	our $crime_val_ref  				= \@crime;				
	our $prosecution_val_ref  			= \@prosecution;				
	our $institutional_violence_val_ref = \@institutional_violence;	
	our $border_control_val_ref  		= \@border_control;		
	our $immigration_val_ref  			= \@immigration;		
	our $Fcontext_val_ref  				= \@Fcontext;				
	
	our @valuesF = ($gun_control_val_ref, $domestic_terrorism_val_ref, $crime_val_ref, $prosecution_val_ref, $institutional_violence_val_ref, $border_control_val_ref,	$immigration_val_ref, $Fcontext_val_ref);

};

sub create_groupingFo{

	$Fsig_ref 	= \@Fsig;
	$Ffunc_ref	= \@Ffunc;
	$Fstat_ref	= \@Fstat;

	create_groupingF;
	
	our $gun_control_ref  			= \@gun_control;			
	our $domestic_terrorism_ref  	= \@domestic_terrorism;	
	our $crime_ref  				= \@crime;				
	our $prosecution_ref  			= \@prosecution;			
	our $institutional_violence_ref = \@institutional_violence;	
	our $border_control_ref  		= \@border_control;		
	our $immigration_ref  			= \@immigration;		
	our $Fcontext_ref  				= \@Fcontext;	
	
	our @objectsF = ($gun_control_ref, $domestic_terrorism_ref, $crime_ref, $prosecution_ref, $institutional_violence_ref, $border_control_ref,	$immigration_ref, $Fcontext_ref);
	#print Dumper @objectsF;

};
	
#create_groupingFo

1;
END
