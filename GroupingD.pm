package GroupingD;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingDv create_groupingDo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping D #
##############	

	our @Dword =	(
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
	our @Dsig =	(
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
	our @Dsigval=(	
		0,							#[0]
		1,							#[1]
		1,							#[2]
		1,							#[3]
		1,							#[4]
		1,							#[5]
		1,							#[6]
		1,							#[7]
		1,							#[8]
		2,							#[9]
		3,							#[10]
		3,							#[11]
		3,							#[12]
		3,							#[13]
		3,							#[14]
		3,							#[15]
		3,							#[16]
		3,							#[17]
		3,							#[18]
		3,							#[19]
		3,							#[20]
		3,							#[21]
		3,							#[22]
		3,							#[23]
		3,							#[24]
		2,							#[25]
		3,							#[26]
		3,							#[27]
	);
	our @Dfunc =	(
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
	);
	our @Dfuncval= (		
		"0",						#[0]
		"3",						#[1]
		"3",						#[2]
		"3",						#[3]
		"3",						#[4]
		"3",						#[5]
		"3",						#[6]
		"3",						#[7]
		"3",						#[8]
		"3",						#[9]
		"3",						#[10]
		"3",						#[11]
		"3",						#[12]
		"3",						#[13]
		"3",						#[14]
		"3",						#[15]
		"3",						#[16]
		"3",						#[17]
		"3",						#[18]
		"3",						#[19]

	);	
	
	our @Dstat =	(
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
	our @Dstatval=(
		0,							#[0] 
		3,							#[1]
		3,							#[2]
		3,							#[3]
		3,							#[4]
		3,							#[5]
		3,							#[6]
		3, 							#[7]
		3,							#[8]
		3,							#[9]
		3,							#[10]
		3,							#[11]
		3,							#[12]
		3,							#[13]
		3,							#[14]
		3,							#[15]
		3,							#[16]
		3,							#[17]
		3,							#[18]
		3,							#[19]
	);
	our @Dtime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"01:2020:02:2021",			#[2] #the pandemic
		"01:2017:01:2020"			#[3] #before pandemic
	);	
	
	
# predefining necessary variables
	our $Dsig_ref 			= undef;
	our $Dfunc_ref			= undef;
	our $Dstat_ref			= undef;
	
	our @opioids			= undef;
	our @healthcare			= undef;
	our @pandemic			= undef;
	our @Dcontext			= undef;
		
	our $Drand_four 		= int(rand(4));
	our $Drand_three 		= int(rand(3));
	our $Drand_two 			= int(rand(2));
	
	#our @Dpool_1 = ("Requiem1", "Requiem2");
	#our @Dpool_2 = ("Cure2", "Cure3");
	#our @Dpool_3 = ("Covenant1", "Covenant2", "Covenant3");
	#our @Dpool_4 = ("The_Host1", "Covenant2", "Covenant3");
	
	#our @Epool_1 = ("Out1", "Out2"); #/surgery scene, teacup on tv scene
	#our @Epool_2 = ("Stepford1", "Stepford2", "Stepford3"); #/opening scene - facade room scene - supermarket scene
	#our @Epool_3 = ("Dogman1", "Dogman2", "Lovecraft_Country1"); #/budoir scene - facade room scene - supermarket scene
	#our @Epool_4 = ("Shin1", "Shin2", "Godzilla1", "Godzilla2");
	
#defining scene pools for this grouping		
 #opioids -
  #+
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible
	our @Dpool_1 = ("Dream1", "Dream2"); 
  #++
	#/requiem for a dream -unbeknownst final parting, parasite -morse code in the snow 
	our @Dpool_2 = ("Dream6","Parasite1");	
  #unique -
	#/
	our @Dpool_unique_1 = ();
  
 #healthcare -
  #+
	#/requiem for a dream -seaside pier onset, a cure for wellness -hospital hallway, a cure for wellness - bodies suspended in liquid
	our @Dpool_3 = ("Cure2", "Dream1", "Cure3");
  #++
	#/a cure for wellness - bodies suspended in liquid, requiem for a dream -seaside pier clearly visible, a cure for wellness -hospital hallway
	our @Dpool_4 =	("Cure3", "Cure2", "Dream2");;
  #unique -
	#/
	our @Dpool_unique_2 = ();
  #unique -
	#/
	our @Dpool_unique_3 = ();
	
 #pandemic -
  #+
	#/the host - Gang-du quarantined in bag, the host -troops in hazmat suits, alien covenant -spaceship in dock discharging pathogen 
	our @Dpool_5 =	("The_Host3", "The_Host6", "Covenant1");
  #++
	#/the host - Gang-du quarantined in bag, alien covenant -spaceship discharging pathogen from below, alien covenant -pathogen cloud descending upon the engineers
	our @Dpool_6 =	("The_Host3", "Covenant2", "Covenant3");
  #+++
	#/...
	our @Dpool_7 =	();

 #context
	#/
	our @Dpool_8 =	(); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, -facade room, -closing scene.
	our @Dpool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Dpool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #requiem for a dream
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Dpool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
 #greenroom
	#/green room -discovery of murder, -neonazi redlaces gathering, -redlaces at the door, -mangled hand
	our @Dpool_movie4 =	("Greenroom1", "Greenroom2", "Greenroom3", "Greenroom4");
 #tere will blood
	#/there will be blood -plainview enjoying the sea, -empty bowling alley at plainviews estate, - finished in the bowling alley
	our @Dpool_movie5 =	("There_Will_Be_Blood1", "There_Will_Be_Blood2", "There_Will_Be_Blood3");
#
	
sub create_groupingD {
	#
	@opioids = (
	##	cluster					object				rating		+ scenearray				++ scenearray	
		["null",				"opioids",			"1",		$Dpool_1 [$Drand_two], 		$Dpool_2 [$Drand_two]],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" opioid",				"$Dword[4]",	"${$Dsig_ref}[24]",	"${$Dfunc_ref}[7]",		"${$Dstat_ref}[10]",	"$Dtime[0]",	"null"],
		[" fentanyl ",			"$Dword[3]",	"${$Dsig_ref}[24]",	"${$Dfunc_ref}[7]",		"${$Dstat_ref}[10]",	"$Dtime[0]",	"null"],
		[" heroin ",			"$Dword[3]",	"${$Dsig_ref}[24]",	"${$Dfunc_ref}[7]",		"${$Dstat_ref}[10]",	"$Dtime[0]",	"null"],
		[" drug abuse ",		"$Dword[4]",	"${$Dsig_ref}[25]",	"${$Dfunc_ref}[8]",		"${$Dstat_ref}[11]",		"$Dtime[0]",	"null"],
		[" takebackday ",		"$Dword[7]",	"${$Dsig_ref}[26]",	"${$Dfunc_ref}[9]",		"${$Dstat_ref}[12]",	"$Dtime[0]",	"null"],
		#["  ",					"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	#
	@healthcare = (
	##	cluster					object				rating		+ scenearray				++ scenearray	
		["null",				"healthcare",		"1",		$Dpool_3 [$Drand_three], 	$Dpool_4 [$Drand_three]],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" health insurance ",	"$Dword[3]",	"${$Dsig_ref}[27]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[5]",		"$Dtime[0]",	"null"],
		[" healthcare ",		"$Dword[3]",	"${$Dsig_ref}[27]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[5]",		"$Dtime[0]",	"null"],
		[" obamacare ",			"$Dword[1]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[3]",		"$Dtime[0]",	"null"],
		[" obama care ",		"$Dword[1]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[3]",		"$Dtime[0]",	"null"],
		[" big pharma ",		"$Dword[3]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
		[" prescription drug",	"$Dword[3]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[13]",	"${$Dstat_ref}[15]",	"$Dtime[0]",	"null"],
		[" hospital",			"$Dword[3]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[11]",	"${$Dstat_ref}[16]",	"$Dtime[3]",	"null"], #date!!
		[" novartis ",			"$Dword[1]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
		[" pfizer ",			"$Dword[1]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
		[" patient ",			"$Dword[5]",	"${$Dsig_ref}[3]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[16]",	"$Dtime[3]",	"null"], #date!!
		[" patients ",			"$Dword[5]",	"${$Dsig_ref}[4]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[16]",	"$Dtime[3]",	"null"], #date!!
		[" americanpatientsfirst ",	"$Dword[7]","${$Dsig_ref}[14]","${$Dfunc_ref}[16]",		"${$Dstat_ref}[16]",	"$Dtime[0]",	"null"],
		[" drug companies ",	"$Dword[4]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
		[" drug price",			"$Dword[3]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[6]",		"${$Dstat_ref}[16]",	"$Dtime[0]",	"null"],
		#["  ",					"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	#
	@pandemic = (
	##	cluster					object				rating		+ scenearray				++ scenearray	
		["null",				"pandemic",			"1",		$Dpool_5 [$Drand_three], 	$Dpool_6 [$Drand_three]],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" cdc ",				"$Dword[1]",	"${$Dsig_ref}[5]",	"${$Dfunc_ref}[18]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" the who ",			"$Dword[1]",	"${$Dsig_ref}[5]",	"${$Dfunc_ref}[17]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" world health organization ","$Dword[1]","${$Dsig_ref}[5]","${$Dfunc_ref}[17]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" covid ",				"$Dword[1]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
		[" coronavirus ",		"$Dword[1]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
		[" covid drugs ",		"$Dword[4]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[13]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" virus ",				"$Dword[3]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"], #date!!
		[" walter reed ",		"$Dword[1]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[11]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"], #date!!
		[" hydroxychloroquine ","$Dword[1]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[19]",	"${$Dstat_ref}[17]",	"$Dtime[2]",	"null"],
		[" death rate ",		"$Dword[3]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
		[" mortality rate ",	"$Dword[3]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
		[" vaccine",			"$Dword[5]",	"${$Dsig_ref}[16]",	"${$Dfunc_ref}[13]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" mask",				"$Dword[5]",	"${$Dsig_ref}[16]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" hospital",			"$Dword[5]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[11]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"],
		[" test",				"$Dword[5]",	"${$Dsig_ref}[16]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[12]",	"$Dtime[2]",	"null"], #date!!
		[" patient ",			"$Dword[5]",	"${$Dsig_ref}[3]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[3]",		"$Dtime[2]",	"null"], #date!!
		[" patients ",			"$Dword[5]",	"${$Dsig_ref}[4]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[3]",		"$Dtime[2]",	"null"], #date!!
		#["  ",					"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	#
	@Dcontext = (
	##	cluster					object				rating		+ scenearray				++ scenearray	
		["null",				"context",			"2",		$Dpool_5 [$Drand_three],	"null"],
	#	
	##	0 match					1 wordtype		 2 signification	3 function				4 status				5 timeperiod	+++ scenearray	
		[" case",				"$Dword[5]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
		# ["  ",				"$Dword[3]",	"${$Dsig_ref}[21]",	"${$Dfunc_ref}[31]",	"${$Dstat_ref}[1]",		"$Dtime[0]",	"null"],
	);
	#
};

sub create_groupingDv{

	$Dsig_ref 	= \@Dsigval;
	$Dfunc_ref	= \@Dfuncval;
	$Dstat_ref	= \@Dstatval;
	
	create_groupingD;
	
	our $opioids_val_ref 		= \@opioids;
	our $healthcare_val_ref 	= \@healthcare;
	our $pandemic_val_ref 		= \@pandemic;
	our $Dcontext_val_ref 		= \@Dcontext;
	
	our @valuesD = ($opioids_val_ref, $healthcare_val_ref, $pandemic_val_ref, $Dcontext_val_ref);
	
};

sub create_groupingDo{

	$Dsig_ref 	= \@Dsig;
	$Dfunc_ref	= \@Dfunc;
	$Dstat_ref	= \@Dstat;

	create_groupingD;
	
	our $opioids_ref 		= \@opioids;
	our $healthcare_ref 	= \@healthcare;
	our $pandemic_ref 		= \@pandemic;
	our $Dcontext_ref 		= \@Dcontext;
	
	our @objectsD = ($opioids_ref, $healthcare_ref, $pandemic_ref, $Dcontext_ref);
	#print Dumper @objectsD;

};

#create_groupingDo;
1;
END
