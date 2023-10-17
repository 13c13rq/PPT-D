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
		"perceived aberration",		#[17]
		"status",					#[18]
		"weapon",					#[19]		
	);
	our @Fsigval=(	
		0,							#[0]
		1,							#[1]
		1,							#[2]
		2,							#[3]
		2,							#[4]
		2,							#[5]
		2,							#[6]
		2,							#[7]
		2,							#[8]
		2,							#[9]
		2,							#[10]
		2,							#[11]
		2,							#[12]
		3,		 					#[13]
		3,							#[14]
		3,							#[15]
		2,							#[16]
		2,							#[17]
		1,							#[18]
		3,							#[19]	
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
		0,							#[0]
		3,							#[1]
		2,							#[2]
		3,							#[3]
		3,							#[4]
		2,							#[5]
		3,							#[6]
		3,							#[7]
		3,							#[8]
		2,							#[9]
		3,							#[10]
		3,							#[11]
		3,							#[12]
		2,							#[13]
		3,							#[14]
		2,							#[15]
		2,							#[16]
		2,							#[17]
		2,							#[18]
		3,							#[19]
		3,							#[20]
		2,							#[21]
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
		"01:2020:02:2021",			#[2] #the pandemic
		"01:2017:01:2020"			#[3] #before pandemic
	);	
	
	
# predefining necessary variables
	our $Fsig_ref 			= undef;
	our $Ffunc_ref			= undef;
	our $Fstat_ref			= undef;
	
	our @gun_control		= undef;
	our @crime				= undef;
	our @prosecution		= undef;
	our @institutional_violence	= undef;
	our @Fcontext			= undef;	
	
	our $Frand_two 			= int(rand(2));
	our $Frand_three 		= int(rand(3));
	our $Frand_four 		= int(rand(4));
	our $Frand_five 		= int(rand(5));
	our $Frand_six	 		= int(rand(6));
	
#defining scene pools for this grouping	
 #gun'control' - profitable, reckless, deadly.
  #+
	#/videodrome -creepy videodrome chamber, green room -discovery of murder, dogman -decending the stairwell
	our @Fpool_1 =	("Videodrome1","Greenroom1","Dogman2"); 
  #++
	#/videodrome -newflesh hand merged with gun, green room -mangled hand, dogman -dead body on playground
	our @Fpool_2 =	("Videodrome2","Greenroom4","Dogman3");	

 #crime - divicive, intimidating, horrifying 
  #+
	#/black panther -killmongers appartmentblock, requiem for a dream -seaside pier onset, the host -dark waters of despair
	our @Fpool_3 =	("Black_Panther1","Dream1","The_Host1",);
  #++
	#/black panther -killmongers dream, requiem for a dream -seaside pier clearly visible, the host -the monsters lair,  parasite - illicit garden celebration
	our @Fpool_4 =	("Black_Panther5","Dream2","The_Host4","Parasite4");

 #prosecution - unbalanced, selfinterested, unjust 
  #+
	#/dogman -decending the stairwell, 12yrs - capitol and dungeon, there will be blood -plainview enjoying the sea, innere glut - scenic mount unzen
	our @Fpool_5 =	("Dogman2", "12_Years_a_Slave2", "There_Will_Be_Blood1", "Innere_Glut5");
  #++
	#/under the skin -burning figure in the forest, 12yrs - window of the illegal dungeon, parasite -flickering lights in the snow, , innere glut - huddled figures lost to mount unzen
	our @Fpool_6 =	("Under_The_Skin1", "12_Years_a_Slave1", "Parasite1", "Innere_Glut8");
  #+++
	#/castle rock -curtains opening to execution chamber, clemency -execution device
	our @Fpool_7 =	("Castle_Rock1", "Clemency1",);
 #unique - various monsters
	#/the host -the monsters lair, shin godzilla -readying its maga destructive atomic lazer beam, godzilla -lurking behind a hill menacingly
	our @Fpool_unique_3 =	("The_Host4", "Shin2", "Godzilla2");

 #institutional violence - dispassionate, brutal, deadly 
  #+
  	#/black panther -tv showing violent police action, videodrome -creepy videodrome chamber, mississipi burning -cop car chasing activists, lovecraft country -sundown car chase
	our @Fpool_8 =	("Black_Panther2","Videodrome1","Mississipi_Burning1","Lovecraft_Country1",);
  #++	
  	#/the host -mass protest, lovecraft country -police harassment in underpass, shin godzilla - godzilla in the distance, parasite -dorway to the cellar
	our @Fpool_9 =	("The_Host8","Lovecraft_Country2","Shin1", "Parasite2");
  #+++
	#/ dogman -opening scene, videodrome -newflesh hand merged with gun, green room -mangled hand,
	our @Fpool_10=	("Dogman1","Videodrome2","Greenroom4");
  #unique
	#/...
	our @Fpool_unique_4 =	();

 #context
	#/dogman -decending the stairwell, black panther -tv showing violent police action, videodrome -creepy videodrome chamber, requiem for a dream -seaside pier onset,  12yrs - capitol and dungeon,
	our @Fpool_11 =	("Dogman2","Black_Panther2","Videodrome1","Dream1","12_Years_a_Slave2"); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, stepford -facade room, stepford -closing scene.
	our @Fpool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Fpool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #Requiem for a Dream
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Fpool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
#
	
sub create_groupingF {
	#
	@gun_control = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["gun_control & domestic terrorism","gun_control","1", $Fpool_1 [$Frand_four],	$Fpool_2 [$Frand_three]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" 2nd a ",			"$Fword[1]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[9]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" 2nd amendment ",	"$Fword[1]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[9]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" second amendment ","$Fword[1]",	"${$Fsig_ref}[12]",	"${$Ffunc_ref}[9]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" gun",			"$Fword[5]",	"${$Fsig_ref}[19]",	"${$Ffunc_ref}[1]",		"${$Fstat_ref}[10]",	"$Ftime[0]",	"null"],
		#
		#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	#
	@crime = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["crime, prosecution & institutional violence", "crime", "1", $Fpool_3 [$Frand_three],	$Fpool_4[$Frand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
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
		#
		#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	#
	@prosecution = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["crime, prosecution & institutional violence", "prosecution", "1", $Fpool_5 [$Frand_four],	$Fpool_6 [$Frand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" execution ",		"$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[10]",	"$Ftime[0]",	$Fpool_7 [$Frand_two]],
		[" death penalty ",	"$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[10]",	"$Ftime[0]",	$Fpool_7 [$Frand_two]],
		[" supreme court ",	"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" scotus ",		"$Fword[1]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" gorsuch ",		"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" kavanaugh ",		"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" barrett ",		"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" prison",			"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
		[" imprison",		"$Fword[8]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
		[" jail ",			"$Fword[5]",	"${$Fsig_ref}[16]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
		[" incarceration ", "$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[20]",	"${$Fstat_ref}[6]",		"$Ftime[0]",	"null"],
		#
		#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	#
	@institutional_violence = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["crime, prosecution & institutional violence", "institutional violence", "1", $Fpool_8 [$Frand_four], $Fpool_9 [$Frand_four]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" law and order ",	"$Fword[9]",	"${$Fsig_ref}[14]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" law & order ",	"$Fword[9]",	"${$Fsig_ref}[14]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" portland ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"],
		[" floyd ",			"$Fword[1]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[8]",		"${$Fstat_ref}[17]",	"$Ftime[0]",	"null"],
		[" kenosha ",		"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[9]",		"$Ftime[0]",	"null"], #time!!
		[" blm ",			"$Fword[1]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[4]",		"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
		[" protesters ",	"$Fword[6]",	"${$Fsig_ref}[4]",	"${$Ffunc_ref}[4]",		"${$Fstat_ref}[3]",		"$Ftime[0]",	"null"],
		[" vandalism ",		"$Fword[3]",	"${$Fsig_ref}[17]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[14]",	"$Ftime[0]",	"null"],
		[" minneapolis ",	"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[11]",	"${$Fstat_ref}[9]",		"$Ftime[3]",	"null"], #time!!
		[" gitmo ",			"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[8]",		"$Ftime[0]",	"null"],
		[" guantanamo ",	"$Fword[1]",	"${$Fsig_ref}[7]",	"${$Ffunc_ref}[12]",	"${$Fstat_ref}[8]",		"$Ftime[0]",	"null"],
		#
		#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	#
	@Fcontext = (
	##	cluster				object				rating		+ scenearray				++ scenearray	
		["border control, immigration and context", "context", "2", $Fpool_11 [$Frand_five],	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" security ",,		"$Fword[4]",	"${$Fsig_ref}[18]",	"${$Ffunc_ref}[21]", 	"${$Fstat_ref}[1]",		"$Ftime[0]",	"null"],
		[" border ",		"$Fword[4]",	"${$Fsig_ref}[7]",	"${ $Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" make america safe ","$Fword[7]","${$Fsig_ref}[14]",	"${$Ffunc_ref}[6]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" makeamericasafeagain ","$Fword[7]","${$Fsig_ref}[14]","${$Ffunc_ref}[6]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" keep america safe ","$Fword[7]","${$Fsig_ref}[14]",	"${$Ffunc_ref}[6]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" illegal",		"$Fword[2]",	"${$Fsig_ref}[10]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" justice ",		"$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" court ",			"$Fword[3]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" judge ",			"$Fword[3]",	"${$Fsig_ref}[3]",	"${$Ffunc_ref}[19]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" drug ",			"$Fword[5]",	"${$Fsig_ref}[19]",	"${$Ffunc_ref}[5]",		"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" police ",		"$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		[" national guard ","$Fword[5]",	"${$Fsig_ref}[15]",	"${$Ffunc_ref}[21]",	"${$Fstat_ref}[2]",		"$Ftime[0]",	"null"],
		#
		#["  ",				"$Fword[0]",	"${$Fsig_ref}[0]",	"${$Ffunc_ref}[0]",		"${$Fstat_ref}[0]",		"$Ftime[0]",	"null"],
	);
	#
};
sub create_groupingFv{

	$Fsig_ref 	= \@Fsigval;
	$Ffunc_ref	= \@Ffuncval;
	$Fstat_ref	= \@Fstatval;
	
	create_groupingF;
	
	our $gun_control_val_ref  			= \@gun_control;			
	our $crime_val_ref  				= \@crime;				
	our $prosecution_val_ref  			= \@prosecution;				
	our $institutional_violence_val_ref = \@institutional_violence;			
	our $Fcontext_val_ref  				= \@Fcontext;				
	
	our @valuesF = ($gun_control_val_ref, $crime_val_ref, $prosecution_val_ref, $institutional_violence_val_ref, $Fcontext_val_ref);

};

sub create_groupingFo{

	$Fsig_ref 	= \@Fsig;
	$Ffunc_ref	= \@Ffunc;
	$Fstat_ref	= \@Fstat;

	create_groupingF;
	
	our $gun_control_ref  			= \@gun_control;			
	our $crime_ref  				= \@crime;				
	our $prosecution_ref  			= \@prosecution;			
	our $institutional_violence_ref = \@institutional_violence;		
	our $Fcontext_ref  				= \@Fcontext;	
	
	our @objectsF = ($gun_control_ref, $crime_ref, $prosecution_ref, $institutional_violence_ref,  $Fcontext_ref);
	#print Dumper @objectsF;
};
	
#create_groupingFo;
1;
END
