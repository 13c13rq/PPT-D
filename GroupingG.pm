package GroupingG;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingGv create_groupingGo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping G #
##############	

	our @Gword =	(
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
	our @Gsig =	(
		"null",						#[0]
		"nature",					#[1]
		"environment",				#[2]
		"energy supply chain",		#[3]
		"organization",				#[4]
		"person",					#[5]
		"international agreement",	#[6]
		"fossil fuel",				#[7]
		"environment",				#[8]
		"propaganda",				#[9]
		"adverse systemic effect",	#[10]
		"protection",		 		#[11]
		"atmospheric alteration",	#[12]
		"substance",				#[13]
		"pollutant",				#[14]
		"catastrophe",				#[15]
		);
		
	our @Gsigval=(	
		"0",						#[0]
		"2",						#[1]
		"2",						#[2]
		"3",						#[3]
		"1",						#[4]
		"1",						#[5]
		"2",						#[6]
		"3",						#[7]
		"3",						#[8]
		"3",						#[9]
		"3",						#[10]
		"2",						#[11]
		"3",						#[12]
		"1",		 				#[13]
		"3",						#[14]
		"2",						#[15]

	);
	our @Gfunc =	(
		"null",						#[0]
		"pollutant",				#[1]
		"climate change",			#[2]
		"profiting entity",			#[3]
		"mitigation",				#[4]
		"environment",				#[5]
		"accelerant",				#[6]
		"environmental damage",		#[7]
		"natural phenomenon",		#[8]
		"severity rating",			#[9]
		"protection",				#[10]
		"propaganda"				#[11]
	);
	our @Gfuncval= (		
		"0",						#[0]
		"3",						#[1]
		"3",						#[2]
		"3",						#[3]
		"3",						#[4]
		"3",						#[5]
		"3",						#[6]
		"3",						#[7]
		"1",						#[8]
		"2",						#[9]
		"3",						#[10]
		"3"							#[11]
	);	
	our @Gstat =	(
		"null",						#[0]
		"destabilizing",			#[1]
		"threatening",				#[2]
		"threatened",				#[3]
		"burdensome",				#[4]
		"protective",				#[5]
		"destructive",				#[6]
		"devastating",				#[7]
		"damaging",					#[8]
	);
	our @Gstatval=(
		0,							#[0] 
		3,							#[1]
		3,							#[2]
		3,							#[3]
		3,							#[4]
		1,							#[5]
		3,							#[6]
		3, 							#[7]
		3,							#[8]
	);
	our @Gtime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"03:2020:01:2021",			#[2] # covid crash and post crash period
		"01:2017:03:2020"			#[3] # pre covid crash
	);	
	
	
# predefining necessary variables
	our $Gsig_ref 			= undef;
	our $Gfunc_ref			= undef;
	our $Gstat_ref			= undef;
	
	our @climate_change		= undef;
	our @energy_industry	= undef;
	our @countermeasures	= undef;
	our @pollution			= undef;
	our @natural_catastrophes = undef;
	our @environmental_destruction = undef;	
	our @rhetoric 			= undef;
	our @Gcontext			= undef;
	
	our $Grand_four 		= int(rand(4));
	our $Grand_three 		= int(rand(3));
	our $Grand_two 			= int(rand(2));
	
#defining scene pools for this grouping - this grouping is not relevant frequently so a small amount of scenes is sufficient
 #climate_change -
  #+
	#/an inconvinient truth -sad polarbear drowning pathetically, silent running -opening scene: space freighter with geodesic biodomes attached, innere glut -cow heard and ashcovered palmtrees 
	our @Gpool_1 = ("Inconvinient2", "Silent_Running1", "Innere_Glut4"); 
  #++
	#/an inconvinient truth  -rising sealevel dramatically illustrated above ground zero,  silent running -closing scene: abandoned geodesic biodome drifting through space, innere glut -dead forrest
	our @Gpool_2 = ("Inconvinient1", "Silent_Running2", "Innere_Glut6");	
  
 #energy_industry -
  #+
	#/there will be blood -plainview enjoying the sea, silent running -opening scene: space freighter with geodesic biodomes attached, jarhead -soldier spectating distant oilwell plume
	our @Gpool_3 = ("There_Will_Be_Blood1","Silent_Running1","Jarhead3");
  #++
	#/innere glut -dead forrest, silent running -opening scene: space freighter with geodesic biodomes attached, silent running -closing scene: abandoned geodesic biodome drifting through space, jarhead -close to hellish burning oilwells
	our @Gpool_4 =	("Innere_Glut6", "Silent_Running2","Jarhead4");
	
 ##countermeasures -
  ##+
	##/
	#our @Gpool_5 =	();
  ##++
	##/
	#our @Gpool_6 =	();
  ##+++
	##/...
	#our @Gpool_7 =	();

 ##pollution -
  ##+
  	##/
	#our @Gpool_8 =	();
  ##++	
  	##/
	#our @Gpool_9 =	();
  ##+++
	##/...
	#our @Gpool_10 =	();
	
 ##natural_catastrophes -
  ##+
  	##/
	our @Gpool_11 =	("Inconvinient2", "The_Day_After_Tomorrow1");
  ##++	
  	##/
	#our @Gpool_12 =	();
  ##+++
	##/...
	#our @Gpool_13 =	();
	
 ##environmental_destruction -
  ##+
  	##/
	#our @Gpool_14 =	();
  ##++	
  	##/
	#our @Gpool_15 =	();
  ##+++
	##/...
	#our @Gpool_16 =	();
	
 ##rhetoric -
  ##+
  	##/
	#our @Gpool_17 =	();
  ##++	
  	##/
	#our @Gpool_18 =	();
  ##+++
	##/...
	#our @Gpool_19 =	();

 ##context
	##/
	#our @Gpool_20 =	(); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, -facade room, -closing scene.
	our @Gpool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Gpool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #requiem for a dream
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Gpool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
 #greenroom
	#/green room -discovery of murder, -neonazi redlaces gathering, -redlaces at the door, -mangled hand
	our @Gpool_movie4 =	("Greenroom1", "Greenroom2", "Greenroom3", "Greenroom4");
 #tere will blood
	#/there will be blood -plainview enjoying the sea, -empty bowling alley at plainviews estate, - finished in the bowling alley
	our @Gpool_movie5 =	("There_Will_Be_Blood1", "There_Will_Be_Blood2", "There_Will_Be_Blood3");
 #silent running
	#/silent running -opening scene: space freighter with geodesic biodomes attached, silent running -closing scene: abandoned geodesic biodome drifting through space
	our @Gpool_movie6 =	("Silent_Running1", "Silent_Running2");
#/innere glut -cow heard and ashcovered palmtrees, innere glut -dead forrest
	our @Gpool_movie7 =	("Innere_Glut4", "Innere_Glut6");
#
#
	
sub create_groupingG {
	#
	@climate_change = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["primary grouping","climate_change","1", $Gpool_1 [$Grand_four], $Gpool_1 [$Grand_four]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" climate change ",			"$Gword[3]",	"${$Gsig_ref}[8]",	"${$Gfunc_ref}[2]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" global warming ",			"$Gword[3]",	"${$Gsig_ref}[12]",	"${$Gfunc_ref}[2]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" environment ",				"$Gword[3]",	"${$Gsig_ref}[8]",	"${$Gfunc_ref}[5]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" carbon ",					"$Gword[5]",	"${$Gsig_ref}[13]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@energy_industry = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["primary grouping","energy_industry","1", $Gpool_3 [$Grand_three], $Gpool_4 [$Grand_three]],
	#	
	##	0 match							1 wordtype		2 signification		3 function				4 status				5 timeperiod	+++ scenearray	
		[" opec ",						"$Gword[1]",	"${$Gsig_ref}[4]",	"${$Gfunc_ref}[3]",		"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" oil ",						"$Gword[5]",	"${$Gsig_ref}[7]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" coal ",						"$Gword[5]",	"${$Gsig_ref}[7]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" petroleum ",					"$Gword[5]",	"${$Gsig_ref}[7]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" natural gas ",				"$Gword[5]",	"${$Gsig_ref}[7]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" gasoline ",					"$Gword[5]",	"${$Gsig_ref}[7]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" fracking ",					"$Gword[8]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" pipeline",					"$Gword[5]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" keystone ",					"$Gword[1]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[4]",		"$Gtime[0]",	"null"],
		[" drilling ",					"$Gword[8]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" energy companies ",			"$Gword[3]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[3]",		"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" energy freedom ",			"$Gword[3]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[11]",	"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" miner",						"$Gword[6]",	"${$Gsig_ref}[3]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@countermeasures= (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["primary grouping","countermeasures","1", $Gpool_movie6 [$Grand_two], $Gpool_movie6 [$Grand_two]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" epa ",						"$Gword[1]",	"${$Gsig_ref}[4]",	"${$Gfunc_ref}[4]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" paris accord ",				"$Gword[1]",	"${$Gsig_ref}[6]",	"${$Gfunc_ref}[4]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" paris environmental accord ","$Gword[1]",	"${$Gsig_ref}[6]",	"${$Gfunc_ref}[4]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" paris climate agreement ",	"$Gword[1]",	"${$Gsig_ref}[6]",	"${$Gfunc_ref}[4]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" green new Deal ",			"$Gword[1]",	"${$Gsig_ref}[11]",	"${$Gfunc_ref}[4]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@pollution = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["primary grouping","pollution","1", $Gpool_3 [$Grand_three], $Gpool_4 [$Grand_three]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" automobile industry ",		"$Gword[3]",	"${$Gsig_ref}[14]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" energy industry ",			"$Gword[3]",	"${$Gsig_ref}[14]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" steel industry ",			"$Gword[3]",	"${$Gsig_ref}[14]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" emissions ",					"$Gword[6]",	"${$Gsig_ref}[12]",	"${$Gfunc_ref}[2]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" pollution ",					"$Gword[3]",	"${$Gsig_ref}[12]",	"${$Gfunc_ref}[7]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@natural_catastrophes = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["primary grouping","natural_catastrophes","2", $Gpool_11 [$Grand_two],	"null"],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" hurricane",					"$Gword[5]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[8]",		"${$Gstat_ref}[6]",		"$Gtime[0]",	"null"],
		[" earthquake ",				"$Gword[5]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[8]",		"${$Gstat_ref}[6]",		"$Gtime[0]",	"null"],
		[" category 3 ",				"$Gword[9]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[9]",		"${$Gstat_ref}[6]",		"$Gtime[0]",	"null"],
		[" category 4 ",				"$Gword[9]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[9]",		"${$Gstat_ref}[6]",		"$Gtime[0]",	"null"],
		[" category 5 ",				"$Gword[9]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[9]",		"${$Gstat_ref}[6]",		"$Gtime[0]",	"null"],
		[" tornado ",					"$Gword[5]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[8]",		"${$Gstat_ref}[6]",		"$Gtime[0]",	"null"],
		[" rainfall ",					"$Gword[5]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[8]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@environmental_destruction = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["primary grouping","environmental_destruction","1", $Gpool_movie7 [$Grand_two], $Gpool_movie6 [$Grand_two]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" forest",						"$Gword[5]",	"${$Gsig_ref}[2]",	"${$Gfunc_ref}[5]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" national monument",			"$Gword[3]",	"${$Gsig_ref}[11]",	"${$Gfunc_ref}[10]",	"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" national park",				"$Gword[3]",	"${$Gsig_ref}[11]",	"${$Gfunc_ref}[10]",	"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" jairbolsonaro ",				"$Gword[1]",	"${$Gsig_ref}[5]",	"${$Gfunc_ref}[7]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" bolsonaro ",					"$Gword[1]",	"${$Gsig_ref}[5]",	"${$Gfunc_ref}[7]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
	);
	#
	@rhetoric = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["rhetoric and context","misinformation","1", $Gpool_3 [$Grand_three], $Gpool_4 [$Grand_three]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" energy independence ",		"$Gword[9]",	"${$Gsig_ref}[9]",	"${$Gfunc_ref}[11]",	"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" energy jobs ",				"$Gword[9]",	"${$Gsig_ref}[9]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		[" clean water  ",				"$Gword[9]",	"${$Gsig_ref}[9]",	"${$Gfunc_ref}[11]",	"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" clean coal ",				"$Gword[9]",	"${$Gsig_ref}[9]",	"${$Gfunc_ref}[11]",	"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" clean air ",					"$Gword[9]",	"${$Gsig_ref}[9]",	"${$Gfunc_ref}[11]",	"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" our own resources ",			"$Gword[9]",	"${$Gsig_ref}[9]",	"${$Gfunc_ref}[11]",	"${$Gstat_ref}[8]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@Gcontext = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["misinformation and context","context","1", $Gpool_1 [$Grand_four], $Gpool_2 [$Grand_four]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" rationing ",					"$Gword[8]",	"${$Gsig_ref}[15]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" green ",						"$Gword[2]",	"${$Gsig_ref}[2]",	"${$Gfunc_ref}[5]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		[" climate ",					"$Gword[3]",	"${$Gsig_ref}[8]",	"${$Gfunc_ref}[5]",		"${$Gstat_ref}[3]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
};

sub create_groupingGv{
	
	$Gsig_ref 	= \@Gsigval;
	$Gfunc_ref	= \@Gfuncval;
	$Gstat_ref	= \@Gstatval;
	
	create_groupingG;
	
	our $climate_change_val_ref		=  	\@climate_change;
	our $energy_industry_val_ref	=  	\@energy_industry;
	our $countermeasures_val_ref 	=  	\@countermeasures;
	our $pollution_val_ref 			=  	\@pollution;
	our $natural_catastrophes_val_ref =	\@natural_catastrophes;
	our $environmental_destruction_val_ref =	\@environmental_destruction;
	our $rhetoric_val_ref 			=  	\@rhetoric;
	our $Gcontext_val_ref 			=  	\@Gcontext;
	
	our @valuesG = ($climate_change_val_ref, $energy_industry_val_ref, $countermeasures_val_ref, $pollution_val_ref, $natural_catastrophes_val_ref, $environmental_destruction_val_ref, $rhetoric_val_ref, $Gcontext_val_ref,);
};

sub create_groupingGo{
	$Gsig_ref 	= \@Gsig;
	$Gfunc_ref	= \@Gfunc;
	$Gstat_ref	= \@Gstat;
	
	create_groupingG;
	
	our $climate_change_ref 		=  	\@climate_change;
	our $energy_industry_ref 		=  	\@energy_industry;
	our $countermeasures_ref 		=  	\@countermeasures;
	our $pollution_ref 				=  	\@pollution;
	our $natural_catastrophes_ref 	=	\@natural_catastrophes;
	our $environmental_destruction_ref =	\@environmental_destruction;
	our $rhetoric_ref 				=  	\@rhetoric;
	our $Gcontext_ref 				=  	\@Gcontext;
	
	our @objectsG = ($climate_change_ref, $energy_industry_ref, $countermeasures_ref, $pollution_ref, $natural_catastrophes_ref, $environmental_destruction_ref, $rhetoric_ref, $Gcontext_ref,);
	#print Dumper @objectsG;
};
	
#create_groupingGo;
1;
END
