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
	our @Gpool_1 = ("Inconvinient2", "Silent_Running1", "Silent_Running2", "Inconvinient1");
	our @Gpool_2 = ("Inconvinient2",  "Silent_Running1", "The_Day_After_Tomorrow1");
	
sub create_groupingG {
	#
	@climate_change = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["primary grouping","climate_change","1", $Gpool_1 [$Grand_four], "null"],
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
		["primary grouping","energy_industry","1", $Gpool_1 [$Grand_four], "null"],
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
		["primary grouping","countermeasures","1", $Gpool_1 [$Grand_four], "null"],
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
		["primary grouping","pollution","1", $Gpool_1 [$Grand_three],	"null"],
	#	
	##	0 match							1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" automobile industry ",		"$Gword[3]",	"${$Gsig_ref}[14]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" energy industry ",			"$Gword[3]",	"${$Gsig_ref}[14]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" Steel Industry ",			"$Gword[3]",	"${$Gsig_ref}[14]",	"${$Gfunc_ref}[6]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" emissions ",					"$Gword[6]",	"${$Gsig_ref}[12]",	"${$Gfunc_ref}[2]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		[" pollution ",					"$Gword[3]",	"${$Gsig_ref}[12]",	"${$Gfunc_ref}[7]",		"${$Gstat_ref}[2]",		"$Gtime[0]",	"null"],
		#["  ",							"$Gword[0]",	"${$Gsig_ref}[0]",	"${$Gfunc_ref}[0]",		"${$Gstat_ref}[0]",		"$Gtime[0]",	"null"],
	);
	#
	@natural_catastrophes = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["primary grouping","natural_catastrophes","1", $Gpool_2 [2],	"null"],
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
		["primary grouping","environmental_destruction","1", $Gpool_2 [1],	"null"],
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
		["rhetoric and context","misinformation","1", $Gpool_1 [1],	"null"],
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
		["misinformation and context","context","2", $Gpool_2 [$Grand_three],	"null"],
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
