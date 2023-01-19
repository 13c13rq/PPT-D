package GroupingE;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingEv create_groupingEo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping E #
##############	

	our @Eword =	(
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
	our @Esig =	(
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
		"perceived aberration",	#[21]
		"societal status",			#[22]
		"governmental procedure",	#[23]	
		"chemical",					#[24]	
		"addiction",				#[25]	
		"addiction mitigation",		#[26]	
		"insurance",				#[27]
	);
	our @Esigval=(	
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
	our @Efunc =	(
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
	);
	our @Efuncval= (		
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
	);	
	
	our @Estat =	(
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
		);
	our @Estatval=(
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
		0,							#[18]
	);
	our @Etime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"11:2020:012021",			#[2] #post election
		"01:2017:10:2020",			#[3] #pre election
		"01:2021:01:2021",			#[4] #capitol riot
		"01:2020:01:2021",			#[5] #election period
	);	
	
	
# predefining necessary variables
	our $Esig_ref 			= undef;
	our $Efunc_ref			= undef;
	our $Estat_ref			= undef;
	
	our @racist_content	= undef;
	our @border_control		= undef;
	our @immigration		= undef;
	our @Econtext			= undef;	
	
	our $Erand_four 		= int(rand(4));
	our $Erand_five 		= int(rand(5));
	our $Erand_three 		= int(rand(3));
	our $Erand_two 			= int(rand(2));
	our @Epool_1 =	("Out2", "Lovecraft_Country1", "Dogman2",); #/surgery scene, teacup on tv scene "Out2"
	
	our @Epool_2 =	("Stepford1", "Stepford2", "Stepford3"); #/opening scene - facade room scene - supermarket scene
	our @Epool_3 =	("Dogman1", "Dogman2", "Dogman3"); #/opening dog scene - breakin anticipation scene - beach scene
	
	our @Epool_23 =	("Shin1", "Dogman2", "Stepford1", "Godzilla1"); #/opening scene - supermarket scene - supermarket scene
	our @Epool_32 =	("Dogman1", "Stepford2", "Dogman3", "Shin2"); #/opening dog scene - facade room scene -  #breakin anticipation scene - beach scene
	
	our @Epool_4 =	("Godzilla1", "Shin1", "Godzilla2");
	our @Epool_5 =	("Shin2", "Dogman1");
	our @Epool_6 =	("Requiem1", "Stepford1", "Jarhead2", "Dogman3", "Jarhead4");
	our @Epool_8 =	("World_War_Z1", "World_War_Z2","Under_The_Skin2"); #/zombie wall
	our @Epool_9 =	("Dogman2", "Stepford2", "Under_The_Skin3", "Out2", "Cure2"); #
	our @Epool_10 =	("Stepford2", "Dogman2", "Requiem1"); #
	our @Epool_11 =	("Under_The_Skin1", "Under_The_Skin2", "Under_The_Skin3",); #
	
sub create_groupingE {
	#
	@racist_content = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["null",			"racist content",	"1", 		$Epool_1 [$Erand_three],	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" white supremacy ","$Eword[9]",	"${$Esig_ref}[20]",	"${$Efunc_ref}[22]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" floyd ",			"$Eword[1]",	"${$Esig_ref}[3]",	"${$Efunc_ref}[24]",	"${$Estat_ref}[9]",		"$Etime[0]",	"null"],
		[" black lives matter","$Eword[9]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[4]",		"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" blm ",			"$Eword[7]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[4]",		"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" racism ",		"$Eword[3]",	"${$Esig_ref}[20]",	"${$Efunc_ref}[8]",		"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" racist ",		"$Eword[3]",	"${$Esig_ref}[3]",	"${$Efunc_ref}[25]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" alien ",			"$Eword[3]",	"${$Esig_ref}[3]",	"${$Efunc_ref}[24]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" aliens ",		"$Eword[3]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[24]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" sanctuary ",		"$Eword[3]",	"${$Esig_ref}[7]",	"${$Efunc_ref}[28]",	"${$Estat_ref}[3]",		"$Etime[0]",	$Epool_2 [2]],
		[" heartland ",		"$Eword[1]",	"${$Esig_ref}[14]",	"${$Efunc_ref}[15]",	"${$Estat_ref}[2]",		"$Etime[0]",	$Epool_2 [2]],
		[" suburb",			"$Eword[3]",	"${$Esig_ref}[7]",	"${$Efunc_ref}[30]",	"${$Estat_ref}[2]",		"$Etime[0]",	$Epool_2 [$Erand_three]],
		[" send her back ",	"$Eword[7]",	"${$Esig_ref}[9]",	"${$Efunc_ref}[33]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" send back ",		"$Eword[7]",	"${$Esig_ref}[9]",	"${$Efunc_ref}[33]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" kkk ",			"$Eword[1]",	"${$Esig_ref}[5]",	"${$Efunc_ref}[31]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" anchor babies ", "$Eword[7]",	"${$Esig_ref}[9]",	"${$Efunc_ref}[33]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		#
		[" critical race theory ",	"$Eword[0]","${$Esig_ref}[0]","${$Efunc_ref}[0]",	"${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" kanye ",			"$Eword[0]","${$Esig_ref}[0]","${$Efunc_ref}[0]",	"${$Estat_ref}[0]",		"$Etime[0]",	"null"],
	#
	);
	@border_control = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["null", 			"border control", 	"1", 		$Epool_10 [$Erand_three], 	$Epool_8 [$Erand_three]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" wall ",			"$Eword[5]",	"${$Esig_ref}[2]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[2]",		"$Etime[0]",	$Epool_8 [$Erand_three]],
		[" steel slat ",	"$Eword[5]",	"${$Esig_ref}[2]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[2]",		"$Etime[0]",	$Epool_8 [$Erand_three]],
		[" steel slats ",	"$Eword[5]",	"${$Esig_ref}[2]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[2]",		"$Etime[0]",	$Epool_8 [$Erand_three]],
		[" travel ban ",	"$Eword[3]",	"${$Esig_ref}[12]",	"${$Efunc_ref}[21]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" Smuggling ",		"$Eword[3]",	"${$Esig_ref}[10]",	"${$Efunc_ref}[5]",		"${$Estat_ref}[15]",	"$Etime[0]",	"null"],
		[" trafficking ",	"$Eword[3]",	"${$Esig_ref}[10]",	"${$Efunc_ref}[5]",		"${$Estat_ref}[15]",	"$Etime[0]",	"null"],
		[" southern border ","$Eword[5]",	"${$Esig_ref}[7]",	"${$Efunc_ref}[21]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" fence ",			"$Eword[5]",	"${$Esig_ref}[2]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[2]",		"$Etime[0]",	$Epool_8 [$Erand_three]],
		[" border patrol ",	"$Eword[5]",	"${$Esig_ref}[16]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		[" caravans ",		"$Eword[6]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" ice ",			"$Eword[1]",	"${$Esig_ref}[16]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[9]",		"$Etime[0]",	$Epool_11 [2]],
		[" ICEgov ",		"$Eword[1]",	"${$Esig_ref}[16]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[9]",		"$Etime[0]",	$Epool_11 [2]],
		[" cbp ",			"$Eword[1]",	"${$Esig_ref}[16]",	"${$Efunc_ref}[20]",	"${$Estat_ref}[2]",		"$Etime[0]",	"null"],
		#
		[" deport",			"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",		"${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		#["  ",				"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",		"${$Estat_ref}[0]",		"$Etime[0]",	"null"],
	#
	);
	#
	@immigration = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["null",			"immigration", 		"1", 		$Epool_10 [$Erand_four], 	$Epool_5[$Erand_two]],
	#
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" anchor babies ", "$Eword[9]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	$Epool_11 [2]],
		[" refugee ",		"$Eword[5]",	"${$Esig_ref}[3]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" refugees ",		"$Eword[5]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" birthright citizenship ","$Eword[9]","${$Esig_ref}[12]","${$Efunc_ref}[0]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" immigrant",		"$Eword[5]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" immigration ",	"$Eword[3]",	"${$Esig_ref}[17]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" alien",			"$Eword[4]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" caravan",		"$Eword[4]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" migrant",		"$Eword[4]",	"${$Esig_ref}[4]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" daca ",			"$Eword[3]",	"${$Esig_ref}[12]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		[" lottery ",		"$Eword[3]",	"${$Esig_ref}[12]",	"${$Efunc_ref}[14]",	"${$Estat_ref}[3]",		"$Etime[0]",	"null"],
		#["  ",				"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",		"${$Estat_ref}[0]",		"$Etime[0]",	"null"],
	);
	#
	@Econtext = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["null",			"context",			"1",		$Epool_4 [$Erand_three],	"null"],
	#
	## 0 match				1 wordtype	 	2 signification		3 function				4 status				5 timeperiod	+++ scenearray		
		[" riot",			"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" protest",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" charlottesville ","$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" division ",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" hate ",			"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" activist",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" liberal",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" radical",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" native",			"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black community ","$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black america",	"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" hispanic ",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black people ",	"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black men ",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black women ",	"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black unemployment ","$Eword[0]","${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" black workers ",	"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" synagogue ",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		[" jewish ",		"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
		#["  ",				"$Eword[0]",	"${$Esig_ref}[0]",	"${$Efunc_ref}[0]",	"	${$Estat_ref}[0]",		"$Etime[0]",	"null"],
	);	
	#		
};

sub create_groupingEv{

	$Esig_ref 	= \@Esigval;
	$Efunc_ref	= \@Efuncval;
	$Estat_ref	= \@Estatval;
	
	create_groupingE;
	
	our $racist_content_val_ref = \@racist_content;
	our $border_control_val_ref = \@border_control;		
	our $immigration_val_ref  	= \@immigration;
	our $Econtext_val_ref 		= \@Econtext;	
	our @valuesE = ($racist_content_val_ref, $border_control_val_ref,	$immigration_val_ref, $Econtext_val_ref);
	print Dumper @valuesE;
};

sub create_groupingEo{

	$Esig_ref 	= \@Esig;
	$Efunc_ref	= \@Efunc;
	$Estat_ref	= \@Estat;

	create_groupingE;
	
	our $racist_content_ref = \@racist_content;
	our $border_control_ref = \@border_control;		
	our $immigration_ref  	= \@immigration;	
	our $Econtext_ref 		= \@Econtext;
	our @objectsE = ($racist_content_ref, $border_control_ref,	$immigration_ref, $Econtext_ref);
	print Dumper @objectsE;
};
	
create_groupingEv;
1;
END
