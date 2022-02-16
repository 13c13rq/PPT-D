package Grouping_zero;
use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw( create_grouping_zero_v create_grouping_zero_o ); 
our $catval = undef;
use Data::Dumper qw(Dumper);
##############
# Grouping zero_ #
##############	

	our @zero_word =	(
		"null",						#[0]
		"name", 					#[1]
		"adjective", 				#[2]
		"abstract noun",			#[3]
		"plural abstract noun",		#[4]
		"concrete noun",			#[5]
		"plural concrete noun",		#[6]
		"slogan",					#[7]
		"verb/action",				#[8]
		"description",				#[9]
		"superlative",				#[10]
		"salutation",				#[11]
	);
	
	our @zero_sig =	(
		"null",						#[0]
		"link",						#[1]
		"historic event",			#[2]
		"endorsement",				#[3]
		"success",					#[4]
		"fatality",					#[5]
		"joyfull event",			#[6]
		"holliday",					#[7]
		"personal insult",			#[8]
		"general insult",			#[9]
		"derrogative",				#[10]
		"racist slur",				#[11]
		"nickname",					#[12]
		"fatality",					#[13]
		"boast of excelence",		#[14]
		"boast of success",			#[15]
		"boast of intent",			#[16]
		"propaganda",				#[17]
		"personal complaint",		#[18]
		"general complaint",		#[19]
	);
	
	our @zero_sigval=(	
		0,							#[0]
		0,							#[1]
		0,							#[2]
		0,							#[3]
		0,							#[4]
		0,							#[5]
		0,							#[6]
		0,							#[7]
		0,							#[8]
		0,							#[9]
		0,							#[10]
		0,							#[11]
		0,							#[12]
		0,							#[13]
		0,							#[14]
		0,							#[15]
		0,							#[16]
		0,							#[17]
		0,							#[18]
		0,							#[19]
	);
	
	our @zero_func =	(
		"null",						#[0]
		"",							#[1]
		"",							#[2]
		"",							#[3]
		"",							#[4]
		"",							#[5]
		"",							#[6]
		"",							#[7]
	);
	
	our @zero_funcval= (		
		0,							#[0]
		0,							#[1]
		0,							#[2]
		0,							#[3]
		0,							#[4]
		0,							#[5]
		0,							#[6]
		0,							#[7]
	);	
	
	our @zero_groupings=(
		"null",						#[0]
		"A",						#[1]
		"B",						#[2]
		"C",						#[3]
		"D",						#[4]
		"E",						#[5]
		"F",						#[6]
		"G",						#[7]
		"H",						#[8]
	);
	
	our @zero_time =	(
		"null", 					#[0]			
		"ongoing", 					#[1]
		"11:2020:01:2021",			#[2] #post election
		"01:2017:10:2020",			#[3] #pre election
		"01:2021:01:2021",			#[4] #capitol riot
		"01:2020:01:2021",			#[5] #election period
		"01:2020:01:2021",			#[6] #the pandemic
		"01:2017:01:2020",			#[7] #before pandemic
	);	
	
	
# predefining necessary variables
	our $zero_sig_ref 			= undef;
	our $zero_func_ref			= undef;
	our $grouping_ref			= \@zero_groupings;
	
	our @irrelevant				= undef;
	our @insult					= undef;
	our @boast					= undef;
	our @complaint				= undef;
	our @zero_context			= undef;	


sub create_grouping_zero {


	# 0 match				1 wordtype	 		2 signification			3 function				4 status				5 timeperiod
	
# boast, dictators and atrocities #
	@irrelevant = (
	["preliminary analysis", "irrelevant", "1",],
	[" best wishes ",		"$zero_word[11]",	"${$zero_sig_ref}[6]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" celebrate ",			"$zero_word[8]",	"${$zero_sig_ref}[6]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" celebration ",		"$zero_word[5]",	"${$zero_sig_ref}[6]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" christmas ",			"$zero_word[11]",	"${$zero_sig_ref}[7]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" congratulations ",	"$zero_word[11]",	"${$zero_sig_ref}[6]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" condolences ",		"$zero_word[11]",	"${$zero_sig_ref}[5]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" endorse ",			"$zero_word[8]",	"${$zero_sig_ref}[3]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" endorsed ",			"$zero_word[8]",	"${$zero_sig_ref}[3]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" endorsement ",		"$zero_word[4]",	"${$zero_sig_ref}[3]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" fallen heroes ",		"$zero_word[5]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" golf ",				"$zero_word[5]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" happy ",				"$zero_word[11]",	"${$zero_sig_ref}[7]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" https ",				"$zero_word[0]",	"${$zero_sig_ref}[1]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" http ",				"$zero_word[0]",	"${$zero_sig_ref}[1]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" world war two ",		"$zero_word[5]",	"${$zero_sig_ref}[2]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" world war one ",		"$zero_word[5]",	"${$zero_sig_ref}[2]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" ww i ",				"$zero_word[5]",	"${$zero_sig_ref}[2]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" ww ii ",				"$zero_word[5]",	"${$zero_sig_ref}[2]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" veteran ",			"$zero_word[5]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[1]",	"$zero_time[0]"],
	[" veterans ",			"$zero_word[6]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[1]",	"$zero_time[0]"], 
	[" vets ",				"$zero_word[6]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[1]",	"$zero_time[0]"], 
	[" thank you ",			"$zero_word[11]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	
	
	#["  ",		"$zero_word[0]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	);
	
	@insult= (
	["preliminary analysis", "insult", "1",],
	[" bad ",				"$zero_word[2]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" boring ",			"$zero_word[2]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" clown ",				"$zero_word[5]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" clowns ",			"$zero_word[6]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" crazed ",			"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" disgusting ",		"$zero_word[2]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" disgrace ",			"$zero_word[5]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" disgracefull " ,		"$zero_word[2]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" dope ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" dopey ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" dumb ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" dumber ",			"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" dumbest ",			"$zero_word[10]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" fool ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" garbage ",			"$zero_word[5]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" goofy ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" hater ",				"$zero_word[5]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" haters ",			"$zero_word[6]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" hoax ",				"$zero_word[3]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" hoaxters ",			"$zero_word[4]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" incompetence ",		"$zero_word[5]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" incompetent ",		"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" loser ",				"$zero_word[5]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" losers ",			"$zero_word[6]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" lunatic ",			"$zero_word[5]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" low i q ",			"$zero_word[9]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" low iq ",			"$zero_word[9]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" low life ",			"$zero_word[9]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" lowlife ",			"$zero_word[9]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" low-life ",			"$zero_word[9]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" moron",				"$zero_word[5]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" nasty ",				"$zero_word[2]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" no talent ",			"$zero_word[0]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" over-rated ",		"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" overrated ",			"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" pathetic ",			"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" phony ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" racist",				"$zero_word[6]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" shame ",				"$zero_word[3]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" scum ",				"$zero_word[3]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" stumbling ",			"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" stupid ",			"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" stupidest ",			"$zero_word[10]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" ugly ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" unatractive ",		"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" weak ",				"$zero_word[2]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" wiseguys ",			"$zero_word[6]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" worse ",				"$zero_word[2]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" worst ",				"$zero_word[10]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" zero ",				"$zero_word[3]",	"${$zero_sig_ref}[9]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" dumb as a rock ",	"$zero_word[3]",	"${$zero_sig_ref}[8]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" sleepy joe ",		"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" 1  joe ",			"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" basement biden ",	"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" beijingbiden ",		"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" slow joe ",			"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" little michael ",	"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" mini mike ",			"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" joe hiden ",			"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" pocahontas ",		"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" sick puppy ",		"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" crazy bernie ",		"$zero_word[1]",	"${$zero_sig_ref}[12]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	
	
	#["  ",		"$zero_word[0]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	);
	
	@boast = (
	["preliminary analysis", "boast", "1",],
	[" best economy ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"],
	[" best economic ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"],
	[" best growth ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"],
	[" best potus ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" best jobs ",			"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"],
	[" best numbers ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"],
	[" best president ",	"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" best result ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" best results ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" draintheswamp ",		"$zero_word[7]",	"${$zero_sig_ref}[17]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" i am the best ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i am accomplishing ","$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i am bringing ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i am working hard ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i have done ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i have already ",	"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i have beaten ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i have a good ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i have long ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i have personally ",	"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i m the best ",		"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i m accomplishing ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i m bringing ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i m working hard ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will always ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" i will beat ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],  
	[" i will bring ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" i will cut ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"], 
	[" i will create ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i wILL defeat ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" i will deliver ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will eliminate ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will fight ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will fix ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will get ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will handle ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" i will keep ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will never ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" i will renegotiate ","$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[3]",	"$zero_time[0]"],
	[" i will repeal ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"],
	[" i will replace ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will issue ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"],
	[" i will sign ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will stand ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will stop ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will solve  ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will sue ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"],
	[" i will teach ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will terminate ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will unleash ",	"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will win ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will work ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i will write ",		"$zero_word[9]",	"${$zero_sig_ref}[16]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i ve done ",			"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i ve already ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i ve beaten ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i ve a good ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i ve long ",			"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" i ve personally ",	"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" make america great again ",	"$zero_word[7]",	"${$zero_sig_ref}[17]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" make america srong again ",	"$zero_word[7]",	"${$zero_sig_ref}[17]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" makeamericastrongagain ",	"$zero_word[7]",	"${$zero_sig_ref}[17]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[1]",	"$zero_time[0]"],
	[" makeamericagreatagain ",		"$zero_word[7]",	"${$zero_sig_ref}[17]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" maga ",				"$zero_word[9]",	"${$zero_sig_ref}[17]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" my inteligence ",	"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" my i q ",			"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"], 
	[" my iq ",				"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" my skill ",			"$zero_word[9]",	"${$zero_sig_ref}[14]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" my success ",		"$zero_word[9]",	"${$zero_sig_ref}[15]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	
	
	#["  ",		"$zero_word[0]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	);
	
	@complaint = (
	["preliminary analysis", "complaint","1",],
	[" birth certificate ",	"$zero_word[5]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" bernie ",			"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" clinton ",			"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" comey ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"],
	[" collusion ",			"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"],
	[" crooked hillary ",	"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" democrats ",			"$zero_word[1]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" fbi ",				"$zero_word[1]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"], 
	[" insulting ",			"$zero_word[2]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	[" mark elias ",		"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" obama ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" sanders ",			"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" witch hunt ",		"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[6]",	"$zero_time[0]"], 
	[" biden ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"], 
	[" camala harris ",		"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" fauci ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[4]",	"$zero_time[0]"],
	[" cdc ",				"$zero_word[1]",	"${$zero_sig_ref}[5]",	"${$zero_func_ref}[0]","${$grouping_ref}[4]",	"$zero_time[6]"],
	[" who ",				"$zero_word[1]",	"${$zero_sig_ref}[5]",	"${$zero_func_ref}[0]","${$grouping_ref}[4]",	"$zero_time[6]"],
	[" world health organization ","$zero_word[1]",	"${$zero_sig_ref}[5]",	"${$zero_func_ref}[0]","${$grouping_ref}[4]",	"$zero_time[6]"],
	[" black lives matter",	"$zero_word[9]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" blm ",				"$zero_word[7]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" alien ",				"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" aliens ",			"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" sanctuary ",			"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" fake media ",		"$zero_word[1]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" fake news ",			"$zero_word[1]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" lie ",				"$zero_word[4]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" lies ",				"$zero_word[4]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" corrupt",			"$zero_word[2]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" anarchy ",			"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" antifa ",			"$zero_word[1]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" radical left ",		"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" Castro ",			"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" socialist ",			"$zero_word[2]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" socialism ",			"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" squad ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"07:2019:09:2019"],
	[" Jayapal ",			"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" omar ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" tlaib ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" aoc ",				"$zero_word[1]",	"${$zero_sig_ref}[18]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[0]"],
	[" election ",			"$zero_word[5]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[4]"],
	[" dominion ",			"$zero_word[1]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[5]"],
	[" stolen election ",	"$zero_word[9]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[2]"],
	[" January 6th ",		"$zero_word[5]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[4]"],
	[" stopthesteal ",		"$zero_word[7]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[2]"],
	[" vote",				"$zero_word[5]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[5]"],
	[" ballot ",			"$zero_word[5]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[5]"],
	[" rigged ",			"$zero_word[2]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[2]"],
	[" stolen ",			"$zero_word[2]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[2]"],
	[" fraud ",				"$zero_word[3]",	"${$zero_sig_ref}[19]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[5]",	"$zero_time[2]"],
	#["  ",					"$zero_word[0]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	);
	
	@zero_context = (
	["context","context","2",],
	[" basement ",		"$zero_word[0]",	"${$zero_sig_ref}[0]",	"${$zero_func_ref}[0]",	"${$grouping_ref}[0]",	"$zero_time[0]"],
	);
	#
	##
};
sub create_grouping_zero_v{
	
	$zero_sig_ref 	= \@zero_sigval;
	$zero_func_ref	= \@zero_funcval;
	
	create_grouping_zero;

	our $irrelevant_val_ref 	=  	\@irrelevant;
	our $insult_val_ref 		=  	\@insult;
	our $boast_val_ref 			=  	\@boast;
	our $complaint_val_ref		=  	\@complaint;
	our $zero_context_val_ref	=  	\@zero_context;	
		
	our @values_zero = ($irrelevant_val_ref, $insult_val_ref, $boast_val_ref, $complaint_val_ref, $zero_context_val_ref);
	#print Dumper @values_zero;
};
sub create_grouping_zero_o{
	$zero_sig_ref 	= \@zero_sig;
	$zero_func_ref	= \@zero_func;
	
	create_grouping_zero;
	
	our $irrelevant_ref 	=  	\@irrelevant;
	our $insult_ref 		=  	\@insult;
	our $boast_ref 			=  	\@boast;
	our $complaint_ref		=  	\@complaint;
	our $zero_context_ref	=  	\@zero_context;
	
	our @objects_zero = ($irrelevant_ref, $insult_ref, $boast_ref, $complaint_ref, $zero_context_ref);
};
	
#create_grouping_zero_v;

1;
END
