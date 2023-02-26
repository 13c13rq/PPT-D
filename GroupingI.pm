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
		0,							#[0]
		1,							#[1]
		1,							#[2]
		1,							#[3]
		1,							#[4]
		1,							#[5]
		1,							#[6]
		1,							#[7]
		2,							#[8]
		3,							#[9]
		3,							#[10]
		2,							#[11]
		3,							#[12]
		2,							#[13]
		3,							#[14]
		3,							#[15]
		3,							#[16]
		3,							#[17]
		1,							#[18]
		3,							#[19]
		3,							#[20]
		3,							#[21]
		1,							#[22]
		1,							#[23]
		2,							#[24]
		3,							#[25]
		3,							#[26]
		3,							#[27]
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
	
#defining scene pools for this grouping		
 #divicive_content - misleading, hateful, frightening
  #+
	#/punchdrunk -barry in a dismal environment, dogman -decending the stairwell, there will be blood -empty bowling alley at plainviews estate, the host -perilous bridgestruct
	our @Ipool_1 = ("Punch-Drunk1", "Dogman2", "There_Will_Be_Blood2", "The_Host7"); 
  #++
	#/videodrome -creepy videodrome chamber, stepford -facade room, the host -monsters lair, black panther -tv showing violent police action
	our @Ipool_2 = ("Videodrome1", "Stepford2", "The_Host4", "Black_Panther2");	
  #unique - various monsters
	#/the host -the monsters lair, shin godzilla -readying its maga destructive atomic lazer beam, godzilla -lurking behind a hill menacingly
	our @Ipool_unique_1 = ("The_Host4", "Shin2", "Godzilla2");
  
 #slogans - glitering generalities.  
  #+
	#/stepford -opening scene, there will be blood -plainview enjoying the sea, punch drunk love -emerging into the open, punch drunk love -shopping
	our @Ipool_3 = ("Stepford1", "There_Will_Be_Blood1", "Punch-Drunk2", "Punch-Drunk4");
  #++
	#/black panther -killmongers dream, punch drunk love -pudding, requiem for a dream -seaside peir onsett -seaside pier clearly visible, stepford -closing scene
	our @Ipool_4 =	("Black_Panther5", "Punch-Drunk5", "Dream1", "Dream2", "Stepford3");
  #unique -precious dreams
	#/requiem for a dream -seaside pier full view but distant, -seaside pier full view but close, punch drunk love -pudding
	our @Ipool_unique_2 = ("Dream4", "Dream5", "Punch-Drunk5");
  #unique -fantasies of power
	#/jarhead -buring oilwell in the distance, watchmen -dr manhattan projecting power, the host -agent yellow, margin call -office at night before sellout
	our @Ipool_unique_3 = ("Jarhead3", "Watchmen2", "The_Host5", "Margin2");
	
 #election_denial - misleading, deceteful, perilous 
  #+
	#/dogman -decending the stairwell, there will be blood -empty bowling alley at plainviews estate, godzilla -monstrous tracks on a beach, shin godzilla - looming between distant skyscrapers
	our @Ipool_5 =	("Dogman2", "There_Will_Be_Blood2", "Godzilla1", "Shin1");
  #++
	#/under the skin -threshold of the forrest, stepford -facade room, green room -discovery of murder, the host -monster on the far shore
	our @Ipool_6 =	("Under_The_Skin2", "Stepford2", "Green_Room1", "The_Host2");
  #+++
	#/...
	our @Ipool_7 =	();

 #jan6_insurection - exposing, fascist, deadly 
  #+
  	#/green room -neonazi redlaces gathering, -redlaces at the door, the host -the monster aproaches, dogman -dead body on playground
	our @Ipool_8 =	("Green_Room2", "Green_Room3", "The_Host9", "Dogman3");
  #++	
  	#/dogman -opening scene, green room -mangled hand, there will be blood -finished in the bowling alley, videodrome -newflesh hand merged with gun,
	our @Ipool_9 =	("Dogman1", "Green_Room4", "There_Will_Be_Blood3", "Videodrome2");
  #+++
	#/...
	our @Ipool_10 =	();

 #context
	#/dogman -decending the stairwell, videodrome -creepy videodrome chamber, requiem for a dream -seaside peir onsett, punchdrunk -barry in a dismal environment
	our @Ipool_11 =	("Dogman2","Videodrome1","Dream1","Punch-Drunk1"); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, -facade room, -closing scene.
	our @Ipool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Ipool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #requiem for a dream
	#/requiem for a dream -seaside peir onsett, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Ipool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
 #greenroom
	#/green room -discovery of murder, -neonazi redlaces gathering, -redlaces at the door, -mangled hand
	our @Ipool_movie4 =	("Greenroom1", "Greenroom2", "Greenroom3", "Greenroom4");
 #tere will blood
	#/there will be blood -plainview enjoying the sea, -empty bowling alley at plainviews estate, - finished in the bowling alley
	our @Ipool_movie5 =	("There_Will_Be_Blood1", "There_Will_Be_Blood2", "There_Will_Be_Blood3");
#

sub create_groupingI {
	#
	@divisive_content = (
	##	cluster		object					rating		+ scenearray				++ scenearray
		["null",	"divisive content",		"1", 		$Ipool_1 [$Irand_four], 	$Ipool_2 [$Irand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" fake media ",	"$Iword[9]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[34]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],# no special source here and below because it is so common, bad for eval...
		[" fake news ",		"$Iword[9]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[34]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],# ""
		[" lie ",			"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" lies ",			"$Iword[4]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" corrupt",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[34]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" anarchy ",		"$Iword[3]",	"${$Isig_ref}[22]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" antifa ",		"$Iword[1]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" american dream ","$Iword[7]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[15]",	"${$Istat_ref}[18]",	"$Itime[0]",	$Ipool_unique_2 [$Irand_three]],
		[" radical left ",	"$Iword[3]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" castro ",		"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[18]",	"$Itime[0]",	"null"],
		[" socialist ",		"$Iword[2]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" socialism ",		"$Iword[3]",	"${$Isig_ref}[22]",	"${$Ifunc_ref}[27]",	"${$Istat_ref}[1]",		"$Itime[0]",	"null"],
		[" squad ",			"$Iword[1]",	"${$Isig_ref}[4]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"07:2019:09:2019",	"null"],
		[" iayapal ",		"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" omar ",			"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" tlaib ",			"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" aoc ",			"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[3]",		"${$Istat_ref}[3]",		"$Itime[0]",	"null"],
		[" ben shapiro ",	"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[2]",		"$Itime[0]",	$Ipool_6[$Irand_four]],
		[" tucker ",		"$Iword[1]",	"${$Isig_ref}[3]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[2]",		"$Itime[0]",	$Ipool_6[$Irand_four]],
		[" breitbartnews ",	"$Iword[1]",	"${$Isig_ref}[5]",	"${$Ifunc_ref}[15]",	"${$Istat_ref}[2]",		"$Itime[0]",	$Ipool_6[$Irand_four]],
		[" charlottesville ","$Iword[1]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[2]",		"$Itime[0]",	$Ipool_movie2[1]],
		#["  ",				"$Iword[0]",	"${$Isig_ref}[0]",	"${$Ifunc_ref}[0]",		"${$Istat_ref}[0]",		"$Itime[0]",	"null"],
	);
	#
	@slogans = (
	##	cluster		object					rating		+ scenearray				++ scenearray
		["null",	"campaign slogans",		"2", 		$Ipool_3 [$Irand_four], 	$Ipool_4 [$Irand_five]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" maga ",			"$Iword[7]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[15]",	"${$Istat_ref}[2]",		"$Itime[0]",	"null"],
		[" make america great again ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" makeamericagreatagain ",		"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" make america strong again ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],#high priority duplicate in grouping A 
		[" makeamericastrongagain ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],#""
		[" make america safe again ",	"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],#high priority duplicate in grouping F
		[" makeamericasafeagain  ",		"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],#""
		[" keep america great ",		"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" keepamericagreat ",			"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" keep america safe ",			"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		[" america first ",				"$Iword[7]","${$Isig_ref}[14]","${$Ifunc_ref}[15]","${$Istat_ref}[2]",	"$Itime[0]",	"null"],
		#["  ",				"$Iword[0]",	"${$Isig_ref}[0]",	"${$Ifunc_ref}[0]",		"${$Istat_ref}[0]",		"$Itime[0]",	"null"],
	);
	#
	@election_denial = (
	##	cluster		object				rating	+ scenearray			++ scenearray
		["null",	"election denial",	"1", 	$Ipool_5 [$Irand_four],	$Ipool_6[$Irand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" election ",		"$Iword[5]",	"${$Isig_ref}[23]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[3]",		"$Itime[5]",	"null"],
		[" dominion ",		"$Iword[1]",	"${$Isig_ref}[12]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"],
		[" stolen election ","$Iword[9]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[2]",	"null"],
		[" vote",			"$Iword[5]",	"${$Isig_ref}[23]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"],
		[" ballot",			"$Iword[5]",	"${$Isig_ref}[23]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[1]",		"$Itime[5]",	"null"],
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
		["null",	"jan6_insurection",	"1", 	$Ipool_8 [$Irand_four], $Ipool_9 [$Irand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" capitol ",		"$Iword[1]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[9]",		"$Itime[2]",	"null"],
		[" Ianuary 6th ",	"$Iword[5]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[9]",		"$Itime[4]",	"null"],
		[" stopthesteal ",	"$Iword[7]",	"${$Isig_ref}[14]",	"${$Ifunc_ref}[1]",		"${$Istat_ref}[9]",		"$Itime[2]",	"null"],
		[" certification ",	"$Iword[5]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[19]",	"${$Istat_ref}[9]",		"$Itime[4]",	"null"],
		[" pence ",			"$Iword[1]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[25]",	"${$Istat_ref}[9]",		"$Itime[4]",	"null"],
		[" patriots",		"$Iword[4]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[11]",	"$Itime[4]",	"null"],
		[" courage ",		"$Iword[3]",	"${$Isig_ref}[20]",	"${$Ifunc_ref}[22]",	"${$Istat_ref}[11]",	"$Itime[4]",	"null"],
		[" fraudulent ",	"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[4]",	"null"],
		[" irregular ",		"$Iword[2]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[1]",		"$Itime[4]",	"null"],
		[" inauguration ",	"$Iword[3]",	"${$Isig_ref}[21]",	"${$Ifunc_ref}[31]",	"${$Istat_ref}[19]",	"$Itime[4]",	$Ipool_9[2]],
	);	
	#
	@Icontext = (
		##	cluster	object		rating	+ scenearray				++ scenearray
		["null",	"context",	"2", 	$Ipool_11 [$Irand_four], 	"null"],
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
