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
		"perceived aberration",	#[21]
		"societal status",			#[22]
		"governmental procedure",	#[23]	
		"chemical",					#[24]	
		"addiction",				#[25]	
		"addiction mitigation",		#[26]	
		"insurance",				#[27]
	);
	our @Dsigval=(	
		0,						#[0]
		1,						#[1]
		1,						#[2]
		1,						#[3]
		1,						#[4]
		1,						#[5]
		1,						#[6]
		1,						#[7]
		1,						#[8]
		2,						#[9]
		3,						#[10]
		3,						#[11]
		3,						#[12]
		3,						#[13]
		3,						#[14]
		3,						#[15]
		3,						#[16]
		3,						#[17]
		3,						#[18]
		3,						#[19]
		3,						#[20]
		3,						#[21]
		3,						#[22]
		3,						#[23]
		3,						#[24]
		2,						#[25]
		3,						#[26]
		3,						#[27]
	);
	our @Dfunc =	(
		"null",						#[0]
		"traumatic event",			#[1]
		"generalized attribution",	#[2]
		"politician",				#[3]
		"political countermovement",	#[4]
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
		"3",							#[11]
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
		"precarious",				#[6]
		"perilous", 				#[7]
		"devastating",				#[8]
		"horrific",					#[9]
		"traumatic",				#[10]
		"adictive",					#[11]
		"deadly",					#[12]
		"helpful",					#[13]
		"vital",					#[14]
		"monopoly",					#[15]
		"monopolized",				#[16]
		"exploited",				#[17]
		"useless",					#[18]
		"deceased",					#[19]
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
		"ongoing", 					#[1]
		"01:2020:01:2021",			#[2] #the pandemic
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
	our @Dpool_1 = ("Requiem1", "Requiem2");
	our @Dpool_2 = ("Cure2", "Cure3", "Cure4");
	our @Dpool_3 = ("Covenant1", "Covenant2", "Covenant3");
	
sub create_groupingD {

	#our $Erand_four 		= int(rand(4));
	#our $Erand_three 		= int(rand(3));
	#our $Erand_two 			= int(rand(2));
	#our @Epool_1 = ("Out1", "Out2"); #/surgery scene, teacup on tv scene
	#our @Epool_2 = ("Stepford1", "Stepford2", "Stepford3"); #/opening scene - facade room scene - supermarket scene
	#our @Epool_3 = ("Dogman1", "Dogman2", "Lovecraft_Country1"); #/budoir scene - facade room scene - supermarket scene
	#our @Epool_4 = ("Shin1", "Shin2", "Godzilla1", "Godzilla2");
	
	# 0 match			1 wordtype		 2 signification		3 function			4 status			5 timeperiod

# healthcare, covid & Opioids #
	# object
	@opioids = (
	["healthcare, covid & Opioids","opioids","1",$Dpool_1 [0], "null"],
	[" opioid",			"$Dword[4]",	"${$Dsig_ref}[24]",	"${$Dfunc_ref}[7]",		"${$Dstat_ref}[11]",	"$Dtime[0]",	"null"],
	[" fentanyl ",		"$Dword[3]",	"${$Dsig_ref}[24]",	"${$Dfunc_ref}[7]",		"${$Dstat_ref}[11]",	"$Dtime[0]",	"null"],
	[" heroin ",		"$Dword[3]",	"${$Dsig_ref}[24]",	"${$Dfunc_ref}[7]",		"${$Dstat_ref}[11]",	"$Dtime[0]",	"null"],
	[" drug abuse ",	"$Dword[4]",	"${$Dsig_ref}[25]",	"${$Dfunc_ref}[8]",		"${$Dstat_ref}[2]",		"$Dtime[0]",	"null"],
	[" takebackday ",	"$Dword[7]",	"${$Dsig_ref}[26]",	"${$Dfunc_ref}[9]",		"${$Dstat_ref}[12]",	"$Dtime[0]",	"null"],
	#["  ",				"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	
	@healthcare = (
	["healthcare, covid & Opioids","healthcare","1",$Dpool_2 [$Drand_three], "null"],
	[" health insurance ","$Dword[3]",	"${$Dsig_ref}[27]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
	[" healthcare ",	"$Dword[3]",	"${$Dsig_ref}[27]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
	[" obamacare ",		"$Dword[1]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
	[" obama care ",	"$Dword[1]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[12]",	"${$Dstat_ref}[14]",	"$Dtime[0]",	"null"],
	[" big pharma ",	"$Dword[3]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[15]",	"$Dtime[0]",	"null"],
	[" prescription drug","$Dword[3]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[13]",	"${$Dstat_ref}[15]",	"$Dtime[0]",	"null"],
	[" Hospital",		"$Dword[3]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[11]",	"${$Dstat_ref}[17]",	"$Dtime[3]",	"null"], #date!!
	[" novartis ",		"$Dword[1]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[15]",	"$Dtime[0]",	"null"],
	[" pfizer ",		"$Dword[1]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[15]",	"$Dtime[0]",	"null"],
	[" patient ",		"$Dword[5]",	"${$Dsig_ref}[3]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[17]",	"$Dtime[3]",	"null"], #date!!
	[" patients ",		"$Dword[5]",	"${$Dsig_ref}[4]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[17]",	"$Dtime[3]",	"null"], #date!!
	[" americanpatientsfirst ",	"$Dword[7]","${$Dsig_ref}[14]","${$Dfunc_ref}[16]",	"${$Dstat_ref}[17]",	"$Dtime[0]",	"null"],
	[" Drug Companies ","$Dword[4]",	"${$Dsig_ref}[12]",	"${$Dfunc_ref}[10]",	"${$Dstat_ref}[15]",	"$Dtime[0]",	"null"],
	[" drug price",		"$Dword[3]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[6]",		"${$Dstat_ref}[17]",	"$Dtime[0]",	"null"],
	#["  ",				"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	
	@pandemic = (
	["healthcare, covid & Opioids","pandemic","1",$Dpool_3 [$Drand_three], "null"],
	[" cdc ",			"$Dword[1]",	"${$Dsig_ref}[5]",	"${$Dfunc_ref}[18]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" who ",			"$Dword[1]",	"${$Dsig_ref}[5]",	"${$Dfunc_ref}[17]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" world health organization ","$Dword[1]","${$Dsig_ref}[5]","${$Dfunc_ref}[17]","${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" covid ",			"$Dword[1]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
	[" coronavirus ",	"$Dword[1]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
	[" covid drugs ",	"$Dword[4]",	"${$Dsig_ref}[13]",	"${$Dfunc_ref}[13]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" virus ",			"$Dword[3]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"], #date!!
	[" Walter Reed ",	"$Dword[1]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[11]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"], #date!!
	[" hydroxychloroquine ","$Dword[1]","${$Dsig_ref}[13]",	"${$Dfunc_ref}[19]",	"${$Dstat_ref}[18]",	"$Dtime[2]",	"null"],
	[" death rate ",	"$Dword[3]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
	[" mortality rate ","$Dword[3]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
	[" vaccine",		"$Dword[5]",	"${$Dsig_ref}[16]",	"${$Dfunc_ref}[13]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" mask",			"$Dword[5]",	"${$Dsig_ref}[16]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" hospital",		"$Dword[5]",	"${$Dsig_ref}[11]",	"${$Dfunc_ref}[11]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"],
	[" test",			"$Dword[5]",	"${$Dsig_ref}[16]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[13]",	"$Dtime[2]",	"null"], #date!!
	[" case",			"$Dword[5]",	"${$Dsig_ref}[15]",	"${$Dfunc_ref}[16]",	"${$Dstat_ref}[2]",		"$Dtime[2]",	"null"],
	[" patient ",		"$Dword[5]",	"${$Dsig_ref}[3]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[3]",		"$Dtime[2]",	"null"], #date!!
	[" patients ",		"$Dword[5]",	"${$Dsig_ref}[4]",	"${$Dfunc_ref}[14]",	"${$Dstat_ref}[3]",		"$Dtime[2]",	"null"], #date!!
	#["  ",				"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);

	@Dcontext = (
	[" rhetoric & context ","context","2",,	"null"],
	# ["  ",			"$Dword[2]",	"${$Dsig_ref}[21]",	"${$Dfunc_ref}[31]",	"${$Dstat_ref}[1]",		"$Dtime[0]",	"null"], #date!!
	# ["  ",			"$Dword[3]",	"${$Dsig_ref}[21]",	"${$Dfunc_ref}[31]",	"${$Dstat_ref}[1]",		"$Dtime[0]",	"null"],
	# ["  ",			"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",		"$Dtime[0]",	"null"],
	);
	#
	##

	# 0 match		1 wordtype	 2 signification	3 function			4 status			5 timeperiod

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
#print $pandemic[0][3],"\n";
#testind stuf
1;
END
