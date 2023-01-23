package GroupingI;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingIv create_groupingIo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping I #
##############	

	our @Iword =	(
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
	our @Isig =	(
		"null",						#[0]
		"country",	#	#	#	#	#[1]
		"building",					#[2]
		"person",					#[3]
		"group of people",			#[4]
		"organization",				#[5]
		"date",						#[6]
		"location",	#	#	#	#	#[7]
		"minority", #	#	#	#	#[8]
		"insult",	#	#	#	#	#[9]
		"illegal behaviour",		#[10]
		"state owned institution",	#[11]
		"private institution",		#[12]
		"medicine",		#	#	#	#[13]
		"propaganda",			#	#[14]
		"pandemic",					#[15]
		"protective measure",		#[16]
		"useless medicine",		#	#[17]
		"law",						#[18]
		"weapon",					#[19]	
		"act of violence",			#[20]
		"perceived aberration",		#[21]
		"societal status",			#[22]
		"governmental procedure",	#[23]	
		"chemical",					#[24]	
		"addiction",				#[25]	
		"addiction mitigation",		#[26]	
		"insurance",				#[27]
	);
	our @Isigval=(	
		0,						#[0]
		1,						#[1]
		1,						#[2]
		1,						#[3]
		1,						#[4]
		1,						#[5]
		1,						#[6]
		1,						#[7]
		2,						#[8]
		3,						#[9]
		3,						#[10]
		2,						#[11]
		3,						#[12]
		2,						#[13]
		3,						#[14]
		3,						#[15]
		3,						#[16]
		3,						#[17]
		1,						#[18]
		3,						#[19]
		3,						#[20]
		3,						#[21]
		1,						#[22]
		1,						#[23]
		2,						#[24]
		3,						#[25]
		3,						#[26]
		3,						#[27]
	);
	our @Ifunc =	(
		"null",						#[0]
		"traumatic event",			#[1]
		"generalized attribution",	#[2]
		"politician",				#[3]
		"political countermovement",#[4]
		"prosecutable abberation",	#[5]
		"negative effect",			#[6]
		"damaging substance",		#[7]
		"harmful behaviour",		#[8]
		"preventive measure",		#[9]
		"medicine producer",		#[10]
		"medical service provider",	#[11]
		"guaranteed care",			#[12]
		"valuable commodity",		#[13]
		"care recipient",			#[14]
		"propaganda",				#[15]
		"pandemic",					#[16]
		"international care",		#[17]
		"national care",			#[18]
		"misinformation",			#[19]
		"gun proliferation",		#[20]
		"instrument of death",		#[21]
		"deadly behaviour",			#[22]
		"crime scene",				#[23]
		"victim",					#[24]
		"divisive individual",		#[25]
		"divisive media",			#[26]
		"divisive expression",		#[27]
		"shelter",					#[28]
		"inequality",				#[30]
		"belligerent",				#[31]
		"election denial",			#[31]		
		"voting machine",			#[32]
		"divisive insult",			#[33]
		"deception",				#[34]
	);
	our @Ifuncval= (		
		0,							#[0]
		3,							#[1]
		2,							#[2]
		1,							#[3]
		2,							#[4]
		2,							#[5]
		3,							#[6]
		2,							#[7]
		2,							#[8]
		2,							#[9]
		2,							#[10]
		3,							#[11]
		3,							#[12]
		2,							#[13]
		2,							#[14]
		3,							#[15]
		3,							#[16]
		2,							#[17]
		2,							#[18]
		2,							#[19]
		3,							#[20]
		3,							#[21]
		3,							#[22]
		2,							#[23]
		3,							#[24]
		3,							#[25]
		3,							#[26]
		3,							#[27]
		3,							#[28]
		3,							#[29]
		3,							#[30]
		3,							#[31]
		3,							#[32]
		3,							#[33]
		3,							#[34]
	);	
	
	our @Istat =	(
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
		"adictive",					#[10]
		"deadly",					#[11]
		"helpful",					#[12]
		"vital",					#[13]
		"monopoly",					#[14]
		"monopolized",				#[15]
		"exploited",				#[16]
		"useless",					#[17]
		"deceased",					#[18]
		"loser",					#[19]
		);
	our @Istatval=(
		0,							#[0] 
		3,							#[1]
		3,							#[2]
		3,							#[3]
		2,							#[4]
		3,							#[5]
		3,							#[6]
		3, 							#[7]
		3,							#[8]
		3,							#[9]
		3,							#[10]
		3,							#[11]
		1,							#[12]
		3,							#[13]
		3,							#[14]
		3,							#[15]
		3,							#[16]
		2,							#[17]
		3,							#[18]
		3,							#[19]
	);
	our @Itime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"10:2020:02:2021",			#[2] #post election
		"01:2017:11:2020",			#[3] #pre election
		"01:2021:02:2021",			#[4] #capitol riot
		"01:2020:02:2021",			#[5] #election period
	);	
	
	
# predefining necessary variables
	our $Isig_ref 			= undef;
	our $Ifunc_ref			= undef;
	our $Istat_ref			= undef;
	
	our @divisive_content 	= undef;
	our @slogans			= undef;
	our @Icontext			= undef;	
	our @election_denial	= undef;	
	our @jan6_insurection	= undef;
	
	our $Irand_four 		= int(rand(4));
	our $Irand_five 		= int(rand(5));
	our $Irand_three 		= int(rand(3));
	our $Irand_two 			= int(rand(2));
	our @Ipool_1 = ("Out2", "Lovecraft_Country1", "Dogman2",); #/surgery scene, teacup on tv scene "Out2"
	
	our @Ipool_2 = ("Stepford1", "Stepford2", "Stepford3"); #/opening scene - facade room scene - supermarket scene
	our @Ipool_3 = ("Dogman1", "Dogman2", "Dogman3"); #/opening dog scene - breakin anticipation scene - beach scene
	
	our @Ipool_23 = ("Shin1", "Dogman2", "Stepford1", "Godzilla1"); #/opening scene - supermarket scene - supermarket scene
	our @Ipool_32 = ("Dogman1", "Stepford2", "Dogman3", "Shin2"); #/opening dog scene - facade room scene -  #breakin anticipation scene - beach scene
	
	our @Ipool_4 = ("Godzilla1", "Shin1", "Godzilla2");
	our @Ipool_5 = ("Shin2", "Dogman1");
	our @Ipool_6 = ("Requiem1", "Stepford1", "Jarhead2", "Dogman3", "Jarhead4");

sub create_groupingI {
	#
	@divisive_content = (
	##	cluster		object					rating		+ scenearray				++ scenearray
		["null",	"divisive content",		"1", 		$Ipool_23 [$Irand_four], 	$Ipool_32 [$Irand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" fake media ",	"$Iword[9]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[34]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" fake news ",		"$Iword[9]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[34]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" lie ",			"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" lies ",			"$Iword[4]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" corrupt",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[34]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" anarchy ",		"$Iword[3]",	"${$Isig_ref}[22]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" antifa ",		"$Iword[1]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" american dream ","$Iword[7]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[15]",	"${$Istat_ref}[18]",	"$Itime[0]",	$Ipool_6 [0]],
		[" radical left ",	"$Iword[3]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" Castro ",		"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[18]",	"$Itime[0]",	"null"],
		[" socialist ",		"$Iword[2]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" socialism ",		"$Iword[3]",	"${$Isig_ref}[22]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" squad ",			"$Iword[1]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"07:2019:09:2019",	"null"],
		[" Iayapal ",		"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" omar ",			"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" tlaib ",			"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" aoc ",			"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" Ben Shapiro ",	"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[2]",		"$Itime[0]",	"null"],
		[" tucker ",		"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[2]",		"$Itime[0]",	"null"],
		[" BreitbartNews ",	"$Iword[1]",	"${$Isig_ref}[5]",	"${$Ifunc_ref}[15]",	"${$Istat_ref}[2]",		"$Itime[0]",	"null"],
		#["  ",				"$Iword[0]",	"${$Isig_ref}[0]",	"${$Ifunc_ref}[0]",		"${$Istat_ref}[0]",		"$Itime[0]",	"null"],
	);
	#
	@slogans = (
	##	cluster		object					rating		+ scenearray				++ scenearray
		["null",	"campaign slogans",		"2", 		$Ipool_23 [$Irand_four], 	$Ipool_32 [$Irand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" maga ",			"$Iword[7]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[15]",	"${$Istat_ref}[2]",		"$Itime[0]",	"null"],
		[" make america great again ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" makeamericagreatagain ",		"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" make america strong again ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" makeamericastrongagain ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" make america safe again ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" makeamericasafeagain  ",		"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" keep america great ",		"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" keepamericagreat ",			"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" keep america safe ",			"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" america first ",				"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		#["  ",				"$Iword[0]",	"${$Isig_ref}[0]",	"${$Ifunc_ref}[0]",		"${$Istat_ref}[0]",		"$Itime[0]",	"null"],
	);
	#
	@election_denial = (
	##	cluster		object				rating	+ scenearray			++ scenearray
		["null",	"election denial",	"1", 	$Ipool_5 [$Irand_two],	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" election ",		"$Iword[5]",	"${$Isig_ref}[23]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[3]",		"$Itime[5]",	"null"],
		[" dominion ",		"$Iword[1]",	"${$Isig_ref}[12]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"],
		[" stolen election ","$Iword[9]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" vote",			"$Iword[5]",	"${$Isig_ref}[23]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"],
		[" ballot",			"$Iword[5]",	"${$Isig_ref}[23]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"], #date!!
		[" certification ",	"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" elector ",		"$Iword[5]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[3]",		"$Itime[2]",	"null"],
		[" landslide ",		"$Iword[0]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" win ",			"$Iword[8]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" won ",			"$Iword[8]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" steal ",			"$Iword[8]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" stole",			"$Iword[8]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		#["  ",				"$Iword[0]",	"${$Isig_ref}[0]",	"${$Ifunc_ref}[0]",		"${$Istat_ref}[0]",		"$Itime[0]",	"null"],
	);	
	#
	@jan6_insurection = (
	##	cluster		object				rating	+ scenearray			++ scenearray
		["null",	"jan6_insurection",	"1", 	$Ipool_5 [$Irand_two], "null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" capitol ",		"$Iword[1]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[9]",		"$Itime[2]",	"null"], #date!!
		[" Ianuary 6th ",	"$Iword[5]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[9]",		"$Itime[4]",	"null"],
		[" stopthesteal ",	"$Iword[7]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[9]",		"$Itime[2]",	"null"],
		[" certification ",	"$Iword[5]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[9]",		"$Itime[4]",	"null"],
		[" pence ",			"$Iword[1]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[9]",		"$Itime[4]",	"null"],
		[" patriots",		"$Iword[4]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[11]",	"$Itime[4]",	"null"],
		[" courage ",		"$Iword[3]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[22]",	"${$Istat_ref}[11]",	"$Itime[4]",	"null"],
		[" fraudulent ",	"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[4]",	"null"],
		[" irregular ",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[4]",	"null"],
		[" inauguration ",	"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[19]",	"$Itime[4]",	"null"],
	);	
	#
	@Icontext = (
		##	cluster	object		rating	+ scenearray				++ scenearray
		["null",	"context",	"1", 	$Ipool_4 [$Irand_three], 	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" rigged ",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[2]",		"$Itime[2]",	"null"],
		[" fraud",			"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[2]",		"$Itime[2]",	"null"],
		[" truth ",			"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" mail ",			"$Iword[5]",	"${$Isig_ref}[11]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"],
		[" irregular ",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" inacurate ",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" riot",			"$Iword[5]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" protest",		"$Iword[5]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[4]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" division ",		"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" hate ",			"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" activist",		"$Iword[3]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[4]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" liberal",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[4]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" radical",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[4]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		#[" ",				"$Iword[0]",	"${$Isig_ref}[0]",	"${$Ifunc_ref}[0]",	"	${$Istat_ref}[0]",		"$Itime[0]",	"null"],
	);
	#
};
sub create_groupingIv{

	$Isig_ref 	= \@Isigval;
	$Ifunc_ref	= \@Ifuncval;
	$Istat_ref	= \@Istatval;
	
	create_groupingI;
	
	our $divisive_content_val_ref	= \@divisive_content;
	our $slogans_val_ref			= \@slogans;
	our $election_denial_val_ref	= \@election_denial;
	our $jan6_insurection_val_ref 	= \@jan6_insurection;
	our $Icontext_val_ref			= \@Icontext;
	our @valuesI = ($divisive_content_val_ref, $slogans_val_ref, $election_denial_val_ref, $jan6_insurection_val_ref, $Icontext_val_ref);

};

sub create_groupingIo{

	$Isig_ref 	= \@Isig;
	$Ifunc_ref	= \@Ifunc;
	$Istat_ref	= \@Istat;

	create_groupingI;
	
	our $divisive_content_ref 	= \@divisive_content;
	our $slogans_ref		= \@slogans;
	our $election_denial_ref	= \@election_denial;
	our $jan6_insurection_ref 	= \@jan6_insurection;
	our $Icontext_ref 			= \@Icontext;
	our @objectsI = ($divisive_content_ref, $slogans_ref, $election_denial_ref, $jan6_insurection_ref ,$Icontext_ref);
	print Dumper @objectsI;
};
	
create_groupingIo;
#create_groupingIv;
1;
END
