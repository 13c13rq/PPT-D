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
		"act of violence",			#[6]
	);
	
	our @Hsigval=(	
		"0",						#[0]
		"1",						#[1]
		"1",						#[2]
		"1",						#[3]
		"2",						#[4]
		"3",						#[5]
		"3",						#[6]

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
		"perpetrator of violence",	#[8]
		"murder victim",			#[9]
	);
	
	our @Hfuncval= (		
		"0",						#[0]
		"2",						#[1]
		"3",			#			#[2]
		"3",						#[3]
		"3",						#[4]
		"2",						#[5]
		"3",						#[6]
		"3",						#[7]
		"3",						#[8]
		"3",						#[9]
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
		"traumatic",				#[9]
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
	
	our @atrocity			= undef;
	our @domestic_terrorism	= undef;
	our @populist_leaders	= undef;
	our @populists			= undef;
	our @uk					= undef;
	our @dictators			= undef;
	our @Hcontext			= undef;	
	
	our $Hrand_four 		= int(rand(4));
	our $Hrand_three 		= int(rand(3));
	our $Hrand_two 			= int(rand(2));

#defining scene pools for this grouping		
 #atrocity -frightening, deadly, traumatizing 
  #+
	#/the host -the monster aproaches, stepford -facade room, 
	our @Hpool_1 = ("The_Host9", "Stepford2"); 
  #++
	#/stepford -closing scene, the host -the monsters lair
	our @Hpool_2 = ("Stepford3", "The_Host4");	
	#/shin godzilla -readying its maga destructive atomic lazer beam, castle rock -curtains opening to execution chamber, clemency -execution device
	our @Hpool_unique_1 = ("Shin2","Castle_Rock1", "Clemency1");
  
 #domestic_terrorism -frghtening, deadly, traumatizing 
  #+
	#/dogman -decending the stairwell, videodrome -creepy videodrome chamber, green room -discovery of murder
	our @Hpool_3 = ("Dogman2", "Videodrome1", "Green_Room1");
  #++
	#/dogman -opening scene, videodrome -newflesh hand merged with gun, green room -mangled hand
	our @Hpool_4 =	("Dogman1", "Videodrome2", "Green_Room4");
  #unique -
	#/videodrome -newflesh hand merged with gun, green room -mangled hand
	our @Hpool_unique_2 = ("Videodrome2", "Green_Room4");
  #unique -
	#/
	#our @Hpool_unique_3 = ();
	
 #uk - sad, disapointing, catastrophic
  #+
	#/ shin godzilla - godzilla in the distance, punchdrunk -barry in a dismal environment, godzilla -monstrous tracks on a beach
	our @Hpool_5 =	("Shin1", "Punch-Drunk1", "Godzilla1");
  #++
	#/punchdrunk -barry at the party,  godzilla -lurking behind a hill menacingly, the host -dark waters of despair
	our @Hpool_6 =	("Punch-Drunk3", "Godzilla2", "The_Host1");
  #+++
	#/...
	our @Hpool_7 =	();

 #populist_leaders - selfserving, reckless, dangerous
  #+
  	#/there will be blood -plainview enjoying the sea, 12yrs -mississipi sunsett, 12yrs -mississipi lichentree
	our @Hpool_8 =	("There_Will_Be_Blood1", "12_Years_a_Slave4", "12_Years_a_Slave5");
  #++	
  	#/stepford -facade room, videodrome -creepy videodrome chamber, dogman -decending the stairwell
	our @Hpool_9 =	("Stepford2", "Videodrome1", "Dogman2");
  #+++
	#/dogman -opening scene, 12yrs -patsey is left behind, videodrome -newflesh hand merged with gun
	our @Hpool_10 =	("Dogman1", "12_Years_a_Slave6", "Videodrome2");
	
 #dictators - unelected, dangerous, violent
  #+
  	#/12yrs - capitol and dungeon, black panther -tv showing violent police action, there will be blood -plainview enjoying the sea
	our @Hpool_11 =	("12_Years_a_Slave2", "Black_Panther2", "There_Will_Be_Blood1" );
  #++	
  	#/terminatorII - playground with chicago skyline immediatleybefore atomic strike, 12yrs -patsey is left behind, stepford -facade room
	our @Hpool_12 =	("Terminator2", "12_Years_a_Slave6", "Stepford2");
  #+++
	#/...
	our @Hpool_13 =	();
	
 #context
	#/there will be blood -plainview enjoying the sea, stepford -closing scene
	our @Hpool_14 =	("There_Will_Be_Blood1", "Stepford3"); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, -facade room, -closing scene.
	our @Hpool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Hpool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #requiem for a dream
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Hpool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
 #greenroom
	#/green room -discovery of murder, -neonazi redlaces gathering, -redlaces at the door, -mangled hand
	our @Hpool_movie4 =	("Greenroom1", "Greenroom2", "Greenroom3", "Greenroom4");
 #tere will blood
	#/there will be blood -plainview enjoying the sea, -empty bowling alley at plainviews estate, - finished in the bowling alley
	our @Hpool_movie5 =	("There_Will_Be_Blood1", "There_Will_Be_Blood2", "There_Will_Be_Blood3");
#

	

sub create_groupingH {
	#
	@atrocity = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["populists, dictators and atrocities","atrocity","1", $Hpool_1 [$Hrand_two],	$Hpool_2 [$Hrand_two]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function			4 status			5 timeperiod	+++ scenearray	
		[" turkish consulate ",			"$Hword[5]",	"${$Hsig_ref}[3]",	"${$Hfunc_ref}[7]",	"${$Hstat_ref}[3]",	"$Htime[0]",	"$Hpool_unique_1[2]"],
		[" king of saudi arabia ",		"$Hword[9]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"10:2019:11:2019","$Hpool_unique_1[1]"],
		[" crown prince of saudi arabia ","$Hword[9]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
		[" beirut ",					"$Hword[1]",	"${$Hsig_ref}[1]",	"${$Hfunc_ref}[7]",	"${$Hstat_ref}[3]",	"07:2020:08:2020","$Hpool_unique_1[0]"],
		#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	#
	@domestic_terrorism = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["gun_control & domestic terrorism","domestic_terrorism","1", $Hpool_3 [$Hrand_three],	$Hpool_4 [$Hrand_three]], ### dog man scene
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" shooter ",		"$Hword[5]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[8]",		"${$Hstat_ref}[1]",		"$Htime[0]",	"null"],
		[" shooting ",		"$Hword[5]",	"${$Hsig_ref}[6]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"$Htime[0]",	"null"],
		[" synagogue ",		"$Hword[5]",	"${$Hsig_ref}[3]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"$Htime[0]",	"null"],
		[" el paso ",		"$Hword[1]",	"${$Hsig_ref}[6]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"08:2019:09:2019",	"null"],
		[" pitsburg ",		"$Hword[1]",	"${$Hsig_ref}[6]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"10:2018:11:2018",	"null"],
		[" heyer ",			"$Hword[1]",	"${$Hsig_ref}[3]",	"${$Hfunc_ref}[9]",		"${$Hstat_ref}[2]",		"$Htime[0]",	"null"],
		[" car attack",		"$Hword[5]",	"${$Hsig_ref}[6]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"$Htime[0]",	"null"],
		[" charlottesville ","$Hword[1]",	"${$Hsig_ref}[6]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"08:2017:09:2017",	"null"],
		[" kenosha ",		"$Hword[1]",	"${$Hsig_ref}[6]",	"${$Hfunc_ref}[7]",		"${$Hstat_ref}[9]",		"$Htime[0]",	"null"],
		#["  ",				"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",		"${$Hstat_ref}[0]",		"$Htime[0]",	"null"],
	);
	#
	@uk = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["populists, dictators and atrocities","UK (Brexit)","1", $Hpool_5 [$Hrand_three], $Hpool_6 [$Hrand_three]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function			4 status			5 timeperiod	+++ scenearray	
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
	#
	@populist_leaders= (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["populists, dictators and atrocities","populist leaders","1", $Hpool_8 [$Hrand_three], $Hpool_9 [$Hrand_three]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function			4 status			5 timeperiod	+++ scenearray	
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
	#
	@populists = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["populists, dictators and atrocities","gop populists","1", $Hpool_8 [$Hrand_three], $Hpool_9 [$Hrand_three]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function			4 status			5 timeperiod	+++ scenearray	
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
	#
	@dictators	 = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["populists, dictators and atrocities","dictators","1", $Hpool_11 [$Hrand_three], $Hpool_12 [$Hrand_three]],
	#	
	##	0 match							1 wordtype		 2 signification	3 function			4 status			5 timeperiod	+++ scenearray	
		[" kim jong un ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
		[" chariman kim ",				"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
		[" erdogan ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
		[" alsisiofficial ",			"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
		[" salman ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[1]",	"$Htime[0]",	"null"],
		[" mbs ",						"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[2]",	"${$Hstat_ref}[6]",	"$Htime[0]",	"null"],
		#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	#
	@Hcontext = (
	##	cluster				object				rating		+ scenearray				++ scenearray
		["context","context","2",$Hpool_14 [$Hrand_two], "null"],
	#	
	##	0 match							1 wordtype		 2 signification	3 function			4 status			5 timeperiod	+++ scenearray	
		[" friend ",					"$Hword[5]",	"${$Hsig_ref}[4]",	"${$Hfunc_ref}[5]",	"${$Hstat_ref}[8]",	"$Htime[0]",	"null"],
		[" kushner ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[4]",	"${$Hstat_ref}[8]",	"$Htime[0]",	"null"],
		[" ivanka ",					"$Hword[1]",	"${$Hsig_ref}[2]",	"${$Hfunc_ref}[4]",	"${$Hstat_ref}[8]",	"$Htime[0]",	"null"],
		#["  ",					"$Hword[0]",	"${$Hsig_ref}[0]",	"${$Hfunc_ref}[0]",	"${$Hstat_ref}[0]",	"$Htime[0]",	"null"],
	);
	#
};
sub create_groupingHv{
	
	$Hsig_ref 	= \@Hsigval;
	$Hfunc_ref	= \@Hfuncval;
	$Hstat_ref	= \@Hstatval;
	
	create_groupingH;
	
	our $atrocity_val_ref 	=  	\@atrocity;
	our $domestic_terrorism_val_ref	=	\@domestic_terrorism;
	our $populist_leaders_val_ref	=  	\@populist_leaders;
	our $populists_val_ref 		=  	\@populists;
	our $uk_val_ref				=  	\@uk;
	our $dictators_val_ref 		= 	\@dictators;
	our $Hcontext_val_ref		=  	\@Hcontext;	
		
	our @valuesH = ($atrocity_val_ref, $domestic_terrorism_val_ref, $populist_leaders_val_ref, $populists_val_ref, $uk_val_ref, $dictators_val_ref, $Hcontext_val_ref);
};
sub create_groupingHo{
	$Hsig_ref 	= \@Hsig;
	$Hfunc_ref	= \@Hfunc;
	$Hstat_ref	= \@Hstat;
	
	create_groupingH;
	
	our $atrocity_ref 	=  	\@atrocity;
	our $domestic_terrorism_ref	=	\@domestic_terrorism;
	our $populist_leaders_ref 	=  	\@populist_leaders;
	our $populists_ref 		=  	\@populists;
	our $uk_ref				=  	\@uk;
	our $dictators_ref 		= 	\@dictators;
	our $Hcontext_ref		=  	\@Hcontext;
	
	our @objectsH = ($atrocity_ref, $domestic_terrorism_ref, $populist_leaders_ref, $populists_ref, $uk_ref, $dictators_ref, $Hcontext_ref);
	#print Dumper @objectsH;
};
	
#create_groupingHo;
1;
END
