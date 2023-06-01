package GroupingC;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_groupingCv create_groupingCo );
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping C #
##############	

	our @Cword =	(
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
	our @Csig =	(
		"null",						#[0]
		"country",					#[1]
		"person",					#[2]
		"regulation",				#[3]
		"fiscal_policy",			#[4]
		"debt",						#[5]
		"government intervention",	#[6]
		"foreign policy",			#[7]
		"economic policy",			#[8]
		"economic activity",		#[9]
		"bank",						#[10]
		"monetary policy",			#[11]
		"adverse systemic effect",	#[12]
		"value",		 			#[13]
		"organization",				#[14]
		"trade policy",				#[15]
		"agreement",				#[16]
		"economically productive activity",		#[17]
		"economically unproductive activity",	#[18]
		"nationality",				#[19]
		"deregulation",				#[20]
		
	);
	our @Csigval=(	
		"0",						#[0]
		"1",						#[1]
		"1",						#[2]
		"2",						#[3]
		"2",						#[4]
		"3",						#[5]
		"3",						#[6]
		"2",						#[7]
		"2",						#[8]
		"2",						#[9]
		"2",						#[10]
		"2",						#[11]
		"3",						#[12]
		"1",		 				#[13]
		"1",						#[14]
		"2",						#[15]
		"2",						#[16]
		"1",						#[17]
		"1",						#[18]
		"2",						#[19]	
		"3",						#[20]	
	);
	our @Cfunc =	(
		"null",						#[0]
		"creation of money",		#[1]
		"economic warfare",			#[2]
		"economic recovery",		#[3]
		"negative effect",			#[4]
		"monetary regulation",		#[5]
		"reduction of money creation rate",	#[6]
		"regulation of trade",		#[7]
		"protective measure",		#[8]
		"economic growth",			#[9]
		"economic decline",			#[10]
		"rival entity",				#[11]
		"deregulation",				#[12]
		"complaint",				#[13]

	);
	our @Cfuncval= (		
		"0",						#[0]
		"2",						#[1]
		"3",						#[2]
		"2",						#[3]
		"3",						#[4]
		"2",						#[5]
		"1",						#[6]
		"2",						#[7]
		"3",						#[8]
		"0",						#[9]
		"3",						#[10]
		"2",						#[11]
		"3",						#[12]
		"3",						#[13]
		
	);	
	our @Cstat =	(
		"null",						#[0]
		"destabilizing",			#[1]
		"threatening",				#[2]
		"threatened",				#[3]
		"burdensome",				#[4]
		"competitive",				#[5]
		"precarious",				#[6]
		"perilous", 				#[7]
		"protective",				#[8]
		"destructive",				#[9]
		"devastating",				#[10]
		"damaging",					#[11]
		"regulative",				#[12]
		"supportive",				#[13]
	);
	our @Cstatval=(
		0,							#[0] 
		2,							#[1]
		2,							#[2]
		2,							#[3]
		1,							#[4]
		1,							#[5]
		0,							#[6]
		1, 							#[7]
		2,							#[8]
		2,							#[9]
		3,							#[10]
		3,							#[11]
		1,							#[12]
		3,							#[13]
	);
	our @Ctime =	(
		"null", 					#[0]			
		"null", 					#[1]
		"03:2020:01:2021",			#[2] # covid crash and post crash period
		"01:2017:03:2020"			#[3] # pre covid
	);	
	
	
# predefining necessary variables
	our $Csig_ref 			= undef;
	our $Cfunc_ref			= undef;
	our $Cstat_ref			= undef;
	
	our @Cchina				= undef;
	our @economic_warfare	= undef;
	our @inflation			= undef;
	our @economic_decline	= undef;
	our @economy_related_rhetoric	= undef;
	our @fiscal_policy		= undef;
	our @Ccontext			= undef;	
	
	our $Crand_four 	= int(rand(4));
	our $Crand_three 	= int(rand(3));
	our $Crand_two 		= int(rand(2));
	our $one			= 1;
	
	#our @Cpool_1 = ("Margin1", "Margin2", "Cure1");	#close up of analyst during discovery - trading flores in cure and Margin.
	#our @Cpool_2 = ("Parasite1", "Requiem1");	#precarious morsecode signals & mother in red dress
	#our @Cpool_3 = ("Margin1", "Margin2");	#abstract / diffuse / nuclear -> explicit in last source
	
#defining scene pools for this grouping		
 #Cchina -protective, escalatory, divisive
  #+
	#/margin call -office at night before sellout, cure for wellness - body on the trading floor
	our @Cpool_1 = ("Margin2", "Cure1");	
  #++
	#/
	our @Cpool_2 = ();	
  #unique -
	#/
	our @Cpool_unique_1 = ();
  
 #economic_warfare -self-interested, escalatory, threatening
  #+
	#/margin call -office at night before sellout, watchmen -dr manhattan projecting power, the host -agent yellow
	our @Cpool_3 = ("Margin2", "Watchmen2", "The_Host5");
  #++
	#/
	our @Cpool_4 =	();
  #unique -
	#/
	our @Cpool_unique_2 = ();

 #inflation - reckless, greedy, irresponsible
  #+
	#/punch drunk love -shopping, requiem for a dream -seaside pier full view but close
	our @Cpool_5 =	("Punch-Drunk4", "Dream5");
  #++
	#/punch drunk love -pudding, stepford -closing scene
	our @Cpool_6 =	("Punch-Drunk5", "Stepford3");
  #+++
	#/...
	our @Cpool_7 =	();

 #fiscal_policy - frightening, deregulatory, shortsighted
  #+
  	#/margin call -office at night before sellout, cure for wellness - body on the trading floor
	our @Cpool_8 =	("Margin2","Cure1");
  #++	
  	#/cure for wellness - body on the trading floor, margin call - peter sullivan discovers the banking crisis, margin call -office at night before sellout
	our @Cpool_9 =	("Cure1", "Margin1", "Margin2");
  #+++
	#/...
	our @Cpool_10 =	();
	
 #economic_decline - frightening, sad, appalling
  #+
  	#/requiem for a dream -seaside pier onset, punchdrunk -barry in a dismal environment, parasite -flickering lights in the snow
	our @Cpool_11 =	("Dream1", "Punch-Drunk1", "The_Host7");
  #++	
  	#/requiem for a dream -unbeknownst final parting, parasyte -morsecode in the snow, the host -the monsters lair,
	our @Cpool_12 =	("Dream6", "Parasite1", "The_Host4");
  #+++
	#/...
	our @Cpool_13 =	();

 #context
	#/requiem for a dream -seaside pier onset, parasite -flickering lights in the snow, the host -perilous bridgestruct
	our @Cpool_14 =	("Dream1", "Parasite1", "The_Host7"); 

 #movie specific pools
 #
 #stepford wives
	#/stepford -opening scene, -facade room, -closing scene.
	our @Cpool_movie1 =	("Stepford1", "Stepford2", "Stepford3");
 #dogman
	#/dogman -opening scene, -decending the stairwell, -dead body on playground.
	our @Cpool_movie2 =	("Dogman1", "Dogman2", "Dogman3");
 #requiem for a dream
	#/requiem for a dream -seaside pier onset, -seaside pier clearly visible, -seaside pier full view transition, -seaside pier full view but distant, -seaside pier full view but close, -unbeknownst final parting
	our @Cpool_movie3 =	("Dream1", "Dream2", "Dream3","Dream4", "Dream5", "Dream6");
 #greenroom
	#/green room -discovery of murder, -neonazi redlaces gathering, -redlaces at the door, -mangled hand
	our @Cpool_movie4 =	("Greenroom1", "Greenroom2", "Greenroom3", "Greenroom4");
 #tere will blood
	#/there will be blood -plainview enjoying the sea, -empty bowling alley at plainviews estate, - finished in the bowling alley
	our @Cpool_movie5 =	("There_Will_Be_Blood1", "There_Will_Be_Blood2", "There_Will_Be_Blood3");
#

sub create_groupingC {
	#
# Government sanctions and tarrifs
	@Cchina = (
	##	cluster					object				rating		+ scenearray			++ scenearray	
		["foreign trade",		"china",			"2", 		$Cpool_1 [$Crand_two],	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" china ",			"$Cword[1]",	"${$Csig_ref}[1]",	"${$Cfunc_ref}[11]",	"${$Cstat_ref}[5]",	"$Ctime[0]",	"null"],
		[" chinese ",		"$Cword[2]",	"${$Csig_ref}[19]",	"${$Cfunc_ref}[11]",	"${$Cstat_ref}[5]",	"$Ctime[0]",	"null"],
		[" beijing ",		"$Cword[1]",	"${$Csig_ref}[0]",	"${$Cfunc_ref}[11]",	"${$Cstat_ref}[5]",	"$Ctime[0]",	"null"],	
		[" the chinese ",	"$Cword[1]",	"${$Csig_ref}[0]",	"${$Cfunc_ref}[11]",	"${$Cstat_ref}[5]",	"$Ctime[0]",	"null"],	
		[" president xi ",	"$Cword[1]",	"${$Csig_ref}[2]",	"${$Cfunc_ref}[11]",	"${$Cstat_ref}[5]",	"$Ctime[0]",	"null"],
		[" xi jinping ",	"$Cword[1]",	"${$Csig_ref}[2]",	"${$Cfunc_ref}[11]",	"${$Cstat_ref}[5]",	"$Ctime[0]",	"null"],
		#["  ",				"$Dword[0]",	"${$Dsig_ref}[0]",	"${$Dfunc_ref}[0]",		"${$Dstat_ref}[0]",	"$Dtime[0]",	"null"],
	
		);
		
	@economic_warfare = (
	##	cluster					object				rating		+ scenearray			++ scenearray	
		["foreign trade",		"economic warfare",	"1", 		$Cpool_3 [$Crand_three],	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" sanctions ",		"$Cword[4]",	"${$Csig_ref}[7]",	"${$Cfunc_ref}[2]",		"${$Cstat_ref}[1]",	"$Ctime[0]",	"null"],
		[" tarrifs ",		"$Cword[4]",	"${$Csig_ref}[7]",	"${$Cfunc_ref}[2]",		"${$Cstat_ref}[8]",	"$Ctime[0]",	"null"],
		[" trade deficit ",	"$Cword[3]",	"${$Csig_ref}[12]",	"${$Cfunc_ref}[4]",		"${$Cstat_ref}[11]","$Ctime[0]",	"null"],
		[" protectionist ",	"$Cword[2]",	"${$Csig_ref}[7]",	"${$Cfunc_ref}[2]",		"${$Cstat_ref}[8]",	"$Ctime[0]",	"null"],
	);
	#
	##
	
#recession and economic decline
	@inflation = (
	##	cluster								object				rating		+ scenearray			++ scenearray	
		["recession and economic decline",	"inflation",		"2",		 $Cpool_5 [$Crand_two],	$Cpool_6 [$Crand_two]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" cut interest ",	"$Cword[8]",	"${$Csig_ref}[11]",	"${$Cfunc_ref}[1]",		"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" low interest ",	"$Cword[9]",	"${$Csig_ref}[11]",	"${$Cfunc_ref}[1]",		"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" lower interest ","$Cword[8]",	"${$Csig_ref}[11]",	"${$Cfunc_ref}[1]",		"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" Federal Reserve ","$Cword[1]",	"${$Csig_ref}[10]",	"${$Cfunc_ref}[5]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],
		[" easing ",		"$Cword[3]",	"${$Csig_ref}[11]",	"${$Cfunc_ref}[1]",		"${$Cstat_ref}[11]","$Ctime[0]",	"null"],
		[" quantitative ease ","$Cword[3]",	"${$Csig_ref}[11]",	"${$Cfunc_ref}[1]",		"${$Cstat_ref}[11]","$Ctime[0]",	"null"],
		[" pumping ",		"$Cword[8]",	"${$Csig_ref}[11]",	"${$Cfunc_ref}[1]",		"${$Cstat_ref}[11]","$Ctime[0]",	"null"],
		[" devaluing ",		"$Cword[8]",	"${$Csig_ref}[12]",	"${$Cfunc_ref}[4]",		"${$Cstat_ref}[2]",	"$Ctime[0]",	"null"],
		[" devaluation ",	"$Cword[3]",	"${$Csig_ref}[12]",	"${$Cfunc_ref}[4]",		"${$Cstat_ref}[9]",	"$Ctime[0]",	"null"],
		[" quantitative tightening ","$Cword[3]","${$Csig_ref}[11]","${$Cfunc_ref}[6]",	"${$Cstat_ref}[8]",	"$Ctime[0]",	"null"],
	);

	#debt USMCA Relief Bill

	@fiscal_policy = (
	##	cluster									object				rating		+ scenearray			++ scenearray	
		["recession and economic decline",		"fiscal_policy",	"1", 		$Cpool_8 [$Crand_two],	$Cpool_9 [$Crand_three]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" tax cut",		"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" federal tax ",	"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[5]",		"${$Cstat_ref}[12]","$Ctime[0]",	"null"],
		[" cut rates ",		"$Cword[8]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" tax reform",		"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[6]",	"$Ctime[0]",	"null"],
		[" tax reduction",	"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" tax hike",		"$Cword[4]",	"${$Csig_ref}[3]",	"${$Cfunc_ref}[13]",	"${$Cstat_ref}[12]","$Ctime[0]",	"null"],
		[" payroll tax",	"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" tax increase ",	"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[13]",	"${$Cstat_ref}[12]","$Ctime[0]",	"null"],
		[" growth tax ",	"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" regulation cut",	"$Cword[4]",	"${$Csig_ref}[4]",	"${$Cfunc_ref}[12]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" regulation reduction",	"$Cword[4]", "${$Csig_ref}[4]",	"${$Cfunc_ref}[12]","${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
	
	);


	@economic_decline = (
	##	cluster								object					rating		+ scenearray			++ scenearray	
		["recession and economic decline",	"economic_decline",		"1", 		$Cpool_11 [$Crand_three],	$Cpool_12 [$Crand_three]],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" eviction ",		"$Cword[3]",	"${$Csig_ref}[12]",	"${$Cfunc_ref}[3]",		"${$Cstat_ref}[6]",	"$Ctime[0]",	"null"],
		[" stimulus ",		"$Cword[3]",	"${$Csig_ref}[6]",	"${$Cfunc_ref}[3]",		"${$Cstat_ref}[12]","$Ctime[2]",	"null"],
		[" lockdown ",		"$Cword[3]",	"${$Csig_ref}[6]",	"${$Cfunc_ref}[8]",		"${$Cstat_ref}[1]",	"$Ctime[2]",	"null"],
		[" paycheck protection program ", "$Cword[1]","${$Csig_ref}[6]","${$Cfunc_ref}[3]","${$Cstat_ref}[8]","$Ctime[0]",	"null"],
		[" unemployment",	"$Cword[3]",	"${$Csig_ref}[18]",	"${$Cfunc_ref}[10]",	"${$Cstat_ref}[11]","$Ctime[0]",	"null"],
		[" jobs ",			"$Cword[4]",	"${$Csig_ref}[17]",	"${$Cfunc_ref}[10]",	"${$Cstat_ref}[0]",	"$Ctime[2]",	"null"],
		[" economy",		"$Cword[3]",	"${$Csig_ref}[0]",	"${$Cfunc_ref}[0]",		"${$Cstat_ref}[0]",	"$Ctime[2]",	"null"],
		[" homeless",		"$Cword[2]",	"${$Csig_ref}[12]",	"${$Cfunc_ref}[4]",		"${$Cstat_ref}[6]",	"$Ctime[0]",	"null"],
		[" debt ",			"$Cword[3]",	"${$Csig_ref}[5]",	"${$Cfunc_ref}[10]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],
		[" student loan",	"$Cword[4]",	"${$Csig_ref}[5]",	"${$Cfunc_ref}[10]",	"${$Cstat_ref}[4]",	"$Ctime[0]",	"null"],

	);
	
	@economy_related_rhetoric = (
	##	cluster								object						rating	+ scenearray	++ scenearray	
		["recession and economic decline",	"economy_related_rhetoric",	"2", 	$Cpool_2 [0],	"null"],
		#[" regulation ",	"$Cword[3]",	"${$Csig_ref}[16]",	"${$Cfunc_ref}[9]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],
	);
	
	@Ccontext = (
	##	cluster								object			rating		+ scenearray				++ scenearray	
		["recession and economic decline",	"context",		"2", 		$Cpool_14 [$Crand_three],	"null"],
	#	
	##	0 match				1 wordtype		 2 signification	3 function				4 status			5 timeperiod	+++ scenearray	
		[" jobs ",			"$Cword[4]",	"${$Csig_ref}[17]",	"${$Cfunc_ref}[9]",		"${$Cstat_ref}[0]",	"$Ctime[3]",	"null"],
		[" unemployment",	"$Cword[3]",	"${$Csig_ref}[18]",	"${$Cfunc_ref}[10]",	"${$Cstat_ref}[11]","$Ctime[3]",	"null"],
		[" economy",		"$Cword[3]",	"${$Csig_ref}[0]",	"${$Cfunc_ref}[0]",		"${$Cstat_ref}[0]",	"$Ctime[3]",	"null"],
		[" trade deal ",	"$Cword[3]",	"${$Csig_ref}[16]",	"${$Cfunc_ref}[9]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],
		[" wto ",			"$Cword[1]",	"${$Csig_ref}[14]",	"${$Cfunc_ref}[7]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],
		[" world trade organization ","$Cword[1]","${$Csig_ref}[14]","${$Cfunc_ref}[7]","${$Cstat_ref}[0]", "$Ctime[0]",	"null"],
		[" trillions ",		"$Cword[4]",	"${$Csig_ref}[13]",	"${$Cfunc_ref}[0]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],
		[" billions ",		"$Cword[4]",	"${$Csig_ref}[13]",	"${$Cfunc_ref}[0]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],
		[" millions ",		"$Cword[4]",	"${$Csig_ref}[13]",	"${$Cfunc_ref}[0]",		"${$Cstat_ref}[0]",	"$Ctime[0]",	"null"],

	);
	#
	##
};
sub create_groupingCv{
	
	$Csig_ref 	= \@Csigval;
	$Cfunc_ref	= \@Cfuncval;
	$Cstat_ref	= \@Cstatval;
	
	create_groupingC;
	
	our $Cchina_val_ref 			=  	\@Cchina;
	our $economic_warfare_val_ref 	=  	\@economic_warfare;
	our $inflation_val_ref 	=  	\@inflation;
	our $economic_decline_val_ref	=  	\@economic_decline;	
	our $fiscal_policy_val_ref		=  	\@fiscal_policy;
	our $economy_related_rhetoric_val_ref = \@economy_related_rhetoric;
	our $Ccontext_val_ref			=  	\@Ccontext;	
	
	our @valuesC = ($Cchina_val_ref, $economic_warfare_val_ref, $inflation_val_ref, $economic_decline_val_ref, $fiscal_policy_val_ref, $economy_related_rhetoric_val_ref, $Ccontext_val_ref);
};

sub create_groupingCo{
	$Csig_ref 	= \@Csig;
	$Cfunc_ref	= \@Cfunc;
	$Cstat_ref	= \@Cstat;
	
	create_groupingC;
	
	our $Cchina_ref 			=  	\@Cchina;
	our $economic_warfare_ref 	=  	\@economic_warfare;
	our $inflation_ref 	=  	\@inflation;
	our $economic_decline_ref	=  	\@economic_decline;
	our $fiscal_policy_ref		=  	\@fiscal_policy;
	our $economy_related_rhetoric_ref = \@economy_related_rhetoric;
	our $Ccontext_ref			=  	\@Ccontext;	
	
	our @objectsC = ($Cchina_ref, $economic_warfare_ref, $inflation_ref, $economic_decline_ref, $fiscal_policy_ref, $economy_related_rhetoric_ref, $Ccontext_ref);
	#print Dumper @objectsC;
};
	
#create_groupingCo;
1;
END
