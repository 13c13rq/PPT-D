#!/usr/bin/env perl
use v5.14;
use strict;
use warnings;
use List::Util qw( max );
use Statistics::Lite qw( mean );
use List::Util qw( min max sum0 );
use Config::Tiny;
use Data::Dumper qw(Dumper);
use Config::Tiny;
use File::HomeDir;
use Term::ANSIColor;
use Scalar::Util 'blessed';
use File::Basename qw(dirname);
use Cwd  qw(abs_path);
use Data::Dumper qw(Dumper);
use Switch;

my $home	= File::HomeDir->my_home;
my $Config 	= Config::Tiny->new;


$Config	= Config::Tiny->read("$home/PPT-D/asset_paths.conf");
		
	# reading path strings
	my $status_path		= $Config->{paths}->{status};
	my $modules_path 	= $Config->{paths}->{modules};
	my $em_path 		= $Config->{paths}->{em};
# add all other necessary paths 
#custom modules
use lib dirname(dirname abs_path $0) . '$home/active_state/modules/PPT_D/modules';
use Grouping_zero qw( create_grouping_zero_v create_grouping_zero_o );
use GroupingA qw( create_groupingAv create_groupingAo );
use GroupingB qw( create_groupingBv create_groupingBo );
use GroupingC qw( create_groupingCv create_groupingCo );
use GroupingD qw( create_groupingDv create_groupingDo );
use GroupingE qw( create_groupingEv create_groupingEo );
use GroupingF qw( create_groupingFv create_groupingFo );
use GroupingG qw( create_groupingGv create_groupingGo );
use GroupingH qw( create_groupingHv create_groupingHo );



# getting tweet file
my $tweet	= "$home/active_state/Analysis_Data/Twitter/trumptweet.txt"; 

my $row			= undef;
open(my $fh, '<:encoding(UTF-8)', $tweet)
  or die "Could not open file '$tweet' $!";
my $tweet_txt = <$fh>;

# filehandles
my (
	$Hf	,
	$Hf0	,
	$Hf1	,
	$Hf2	,	
	) = undef;

# counting scalars
my $dread_result 	=0;
my $boast_result 	=0;
my $insult_result 	=0;

my $svg_txt1="/active_state/Analysis_Data/Twitter/textVI.txt";
open( $Hf, '>', "$home/$svg_txt1")
or die "Could not open file ' textfile VI'";
binmode $Hf, ':encoding(UTF-8)';
		
print"\ncontent_analysis1.pl\n";	
#print $Hf "\ncontent_analysis1.pl\n";
close $Hf;

#title
print color('bold white');
print"\n 	~ CONTENT ANALYSIS ~\n";
print color('reset');

####################################
############ ANALYSIS ##############
####################################

#opening filehandles for report
	#declaration file
my $svg_txt2="/active_state/Analysis_Data/Twitter/textVII.txt";
open( $Hf0, '>', "$home/$svg_txt2")
or die "Could not open file ' textfile VII'";
	#Analysis file
my $svg_txt3= "$home/active_state/Analysis_Data/Twitter/textX.txt";
open( $Hf1, '>', "$svg_txt3")
  or die "Could not open file '$svg_txt3' $!";
#print $Hf1

#0# pereparations
my @current_time = undef;
	#reading tweetstatus
sub read_details {
		# declaring configuartion file ->
		$Config	= Config::Tiny->read("$home/$status_path");
		
		# reading essential vaulues
		@current_time =split /-/,$Config->{class}->{month};
};
read_details;

#cleaning tweet
	#print $Hf0  "stripping obstructive characters\n";
	print "\nstripping obstructive characters\n";
	$tweet_txt =~ tr/!?&'"#()[]{}-–”“~*;,:.%@=/ /;
	#print $Hf0  "upper case all\n";
	print "lower case all\n";
	$tweet_txt = lc $tweet_txt;
	close $Hf0;
	
#setting up findings array
my @evaluation 	= (["Grouping_zero"],["GroupingA"],["GroupingB"],["GroupingC"],["GroupingD"],["GroupingE"],["GroupingF"],["GroupingG"],["GroupingH"]);
my @findings 	= (["Grouping_zero"],["GroupingA"],["GroupingB"],["GroupingC"],["GroupingD"],["GroupingE"],["GroupingF"],["GroupingG"],["GroupingH"]);
my @finding_data = ("word", "wordtype", "sig", "func", "stat", "relevant_time", "unique_source");

	my @objects;
	my $objects;
	my $objects_ref;
	my $values_ref;
	
my (	
	$current_grouping	,
	$irrelevance	,
	$active_time	,
	$grouping_displayed	,
	$countI	,
	$standard_incidence_count	,
		$test_counter	,
		$irrelevance_count	,
		$insult_count	,
		$complaint_count	,
		$boast_count	,
	) = undef;
	
$active_time 				= 1; #on by default ...
$grouping_displayed 		= 0;
$test_counter				= 0;
$irrelevance_count			= 0;
$insult_count 				= 0;
$boast_count 				= 0;
$complaint_count 			= 0;
$standard_incidence_count 	= 0;

my @g_l = ('A'..'H');
my @g_l_val = (0,1,0,1,0,0,1,1); #high priority groupings
my @g_c_val = (0,0,0,0,0,0,1,0); #special priority for climate grouping

my @modifyers = (0, 1.51, 1.81, 1.59, 1.78, 1.57, 1.54, 1.91, 1.87); #8;
my @zero_modifyers = (1.7, 1.5, 1.1, 1.3, 1.0);

my %weight_distr;
my %grouping_positions;

#initializing mutidimensional hash array
my $countnow = 0;
foreach my $vlaues (@g_l_val){
	$weight_distr {$g_l[$countnow]} = $g_l_val[$countnow];
	$countnow++;
	}
$countnow = 1;
foreach my $vlaues0 (@g_l){
	$grouping_positions {$g_l[$countnow-1]} = $countnow;
	$countnow++;
	}
$countnow = 0;

my @mentioned_groupings;  # contains all groupings that were mentioned in grouping Zero.
my %mentioned_groupings_count;

$countnow = 1;
foreach my $vlaues1 (@g_l){
	$mentioned_groupings_count {$g_l[$countnow-1]} = 0;
	$countnow++;
	}
$countnow = 0;

my %grouping_incidence; #counter for number of findings per grouping - may be redundant.


sub standard_test {
	$grouping_displayed=0;
	$standard_incidence_count = 0;
	foreach $objects (@{$objects_ref}) {
		
		#defining temporary values
		my $object_number= scalar(@{$objects});
		my $object_words= ($object_number-1);
		my $countI 		= 1;
		my $countII 	= 0;
		my $grouping_zero_result = 0;
		my $grouping_zero_finding 	= undef;
		my $temp_active 	= undef;
		
		#while loop for each grouping
		while ( $countI <= $object_words){
			$temp_active	= 0;	
			my $active_word = ${$objects}[$countI][0];
			#looking for match
			if ( $tweet_txt =~ m/$active_word/) {
				
				#testing if relevant time period is defined
				if (${$objects}[$countI][5] eq "null") {
					$active_time = 1;
				}
				else {
					#deactivating time relevance indicator
					$active_time = 0;
					#creating timespan array
					my @timespan = 		split /:/, ${$objects}[$countI][5];
					#testing timespan
					if ($current_time[1] >= $timespan[1] && $current_time[1] <= $timespan[3]) {
						
						if ($current_time[1] == $timespan[1] && $current_time[1] == $timespan[3]) {
							if ($current_time[0] >= $timespan[0]) {
								unless ($timespan[2]<$current_time[0]) {
									$active_time = 1;
									$temp_active = 1;
								}
							}
						}
						elsif ($current_time[1] == $timespan[3]) {
							if ($current_time[0] <= $timespan[2]) {
								$active_time = 1;
								$temp_active	= 1;
							}
						}
						else {
							$active_time = 1;
							$temp_active = 1;
						};
					
					};
				};
				
				#if currently relevant, saving findings hash into mutidimensional array 
				if ($active_time == 1) {	
					if ($grouping_displayed == 0){
						print "\n\n Grouping_$current_grouping \n";
						print $Hf1 "\n\n $current_grouping \n";
						$grouping_displayed =1;
					};

					#writing results to file
					print "\n";
					 print "	${$objects}[0][1]:";
					print $Hf1  "	${$objects}[0][1]:";
					 print color('bold white');
					 print uc " '$active_word' ";
					print  $Hf1 uc" '$active_word' ";
					 print color('reset');
					
					#creating findings hash
					my %current_findings = ("timesensitive" => $temp_active, "object" => ${$objects}[0][1], "relevance" => ${$objects}[0][2], "standard_source" => ${$objects}[0][3], "escalated_source" => ${$objects}[0][4]);
					
					#populating hash
					while ( $countII <= 6){
						$current_findings {$finding_data[$countII]} = ${$objects}[$countI][$countII];
						$countII++;
					};
					
					my $current_findings_ref = \%current_findings;
					 #$grouping_zero_finding = \@{@{$objects}[$countI]};
					
					#pushing hach in to array
					push($findings[$test_counter], $current_findings_ref);
					$grouping_zero_result++;
					
					#checking for irrelevance value and setting grouping incidence;
					#$test_groupings {$loop_result} = $currnent_grouping;

					if ($current_grouping eq "zero") {
						if(${$objects}[0][1] eq 'irrelevant') {
							$irrelevance_count ++;
						}
						elsif(${$objects}[0][1] eq 'insult')	{
							$insult_count ++;
							}
						elsif(${$objects}[0][1] eq 'boast')		{
							$boast_count ++;
							}
						elsif(${$objects}[0][1] eq 'complaint')	{
							$complaint_count ++;
							}
						else{};
					}
					else {
					$standard_incidence_count++;
					#print "incidence_count active!\n"
					}
					
					if($test_counter==0) {
						
						my $grouping_indicatior = $current_findings {"stat"};
						unless ($grouping_indicatior eq "null") {
							
							my $mention_count =	$mentioned_groupings_count {$grouping_indicatior};
							#print "$mention_count\n";

							if ($mention_count == 0) {
								push @mentioned_groupings, $grouping_positions {"$grouping_indicatior"};	
							};
							
							$mention_count++;
							$mentioned_groupings_count {$grouping_indicatior} = $mention_count;
							
							print "	[", $grouping_indicatior, "]";
						};
					};
					
				}
				#incase of inactive timeperiod
				else {
					if ($grouping_displayed == 0){
						print "\n\n Grouping_$current_grouping \n";
						print $Hf1 "\n\n Grouping_$current_grouping \n";
						$grouping_displayed =1;	
						
					};
					print "\n	",${$objects}[0][1],": '",uc $active_word,"' [inactive]";
					print $Hf1 "\n	",${$objects}[0][1],": '",uc $active_word,"' [inactive]";
				};
			};
			$countII=0;
			$countI++;
		};
	};
	$test_counter++;
	#print "\ngrouping incidence =$standard_incidence_count\n";
};

my $active_mod = undef;

sub match_groupings {
	
	#Grouping Zero - insult, boast, complaint and irrelevancy signifyers
		
		$current_grouping = "zero";
			#values not relevant here.
		#$values_ref=\@Grouping_zero::values_zero;
		$objects_ref=\@Grouping_zero::objects_zero;
			#create_grouping_zero_v;
		create_grouping_zero_o;
		standard_test;
		$grouping_incidence {'irrelevant'} 	= $irrelevance_count; 
		$grouping_incidence {'insult'} 		= $insult_count; 
		$grouping_incidence {'boast'} 		= $boast_count; 
		$grouping_incidence {'complaint'} 	= $complaint_count; 
		
	#GroupingA - War and conflict signifyers
		$active_mod = $modifyers[0];
		$current_grouping = "A";
			#objects not relevant here.
		#$objects_ref=\@GroupingA::objectsA;
		$objects_ref=\@GroupingA::valuesA;
			#create_groupingAo
		create_groupingAv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingB - War and armed conflicts signifyers
		$active_mod = $modifyers[1];
		$current_grouping = "B";
			#objects not relevant here.
		#$objects_ref=\@GroupingB::objectsB;
		$objects_ref=\@GroupingB::valuesB;
			#create_groupingBo
		create_groupingBv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingC - War and armed conflicts signifyers
		$active_mod = $modifyers[2];
		$current_grouping = "C";
			#objects not relevant here.
		#$objects_ref=\@GroupingC::objectsC;
		$objects_ref=\@GroupingC::valuesC;
			#create_groupingCo
		create_groupingCv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingD - War and armed conflicts signifyers
		$active_mod = $modifyers[3];
		$current_grouping = "D";
			#objects not relevant here.
		#$objects_ref=\@GroupingD::objectsD;
		$objects_ref=\@GroupingD::valuesD;
			#create_groupingDo
		create_groupingDv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingE - War and armed conflicts signifyers
		$active_mod = $modifyers[4];
		$current_grouping = "E";
			#objects not relevant here.
		#$objects_ref=\@GroupingE::objectsE;
		$objects_ref=\@GroupingE::valuesE;
			#create_groupingEo
		create_groupingEv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingF - War and armed conflicts signifyers
		$active_mod = $modifyers[5];
		$current_grouping = "F";
			#objects not relevant here.
		#$objects_ref=\@GroupingF::objectsF;
		$objects_ref=\@GroupingF::valuesF;
			#create_groupingFo
		create_groupingFv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingG - War and armed conflicts signifyers
		$active_mod = $modifyers[6];
		$current_grouping = "G";
			#objects not relevant here.
		#$objects_ref=\@GroupingG::objectsG;
		$objects_ref=\@GroupingG::valuesG;
			#create_groupingGo
		create_groupingGv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	#GroupingH - War and armed conflicts signifyers
		$active_mod = $modifyers[7];
		$current_grouping = "H";
			#objects not relevant here.
		#$objects_ref=\@GroupingH::objectsH;
		$objects_ref=\@GroupingH::valuesH;
			#create_groupingHo
		create_groupingHv;
		standard_test;
		$grouping_incidence {$current_grouping} = $standard_incidence_count; 
		
	print $Hf1 "\n";
	print "\n";
};

match_groupings;

#variables for 'check_element' sub
my (
	$query_elements	,
	$query_object	,
	$query_request	,
	$query_result 	,
	$query_count	,
	)	= undef;

my $countIII 			=undef;

my @finding_total = (0);
my $finding_total_ref = \@finding_total;
my $query 				= undef;
my $inconclusive = undef;
my $priority_count = undef;
my @active_groupings;  # contains all active groupings.

sub check_element {
	$countI			= 0;
	$query=		scalar(@findings);
	$query_result = 0;
	while ($query > 0) {
		$query_elements = scalar((@{$findings[$countI]}))-1;
		$countIII = scalar((@{$findings[$countI]}))-1;
		#print "query:$query\n\n";

		while ($countIII >0) {
			my $query_finding = $findings[$countI][$countIII] {$query_object};
			if ($query_finding eq $query_request){
				#print "query triggered: $query_finding $query_elements\n";
				$query_result = 1;
				#print "$query_result\n";
				$query_count++;
			};
			$countIII--;
		};
		$countI++;	
		$query--;
	};
	$countI			= 0;
};


my (
	$query_total,
	$query_total_sub,
	$query_adj		,
	$query_adj_sub	,
	$query_name		,
	$query_name_sub	,
	$query_concrete		,
	$query_concrete_sub	,
	$query_abstract		,
	$query_abstract_sub	,
	$query_high_relevance		,
	$query_high_relevance_sub	,
	$query_normal_relevance		,
	$query_normal_relevance_sub	,
	
	$query_finding_wieght	,
	$query_timesensitivity	,
	$query_timesensitivity_sub	,
	
	$unique_source	,
	$chosen_unique_source	,
	$standard_source	,
	$chosen_standard_source		,
	$escalated_source 	,
	$chosen_escalated_source	,
	
	$incidence_counter	,
	$modval_part	) = undef;

sub add_values {
	$countI			= 1;
	$query=		(scalar(@findings)-1);
	my $addone =0;
	while ($query >= 1) {
		
		my %current_findings = ();
		my $current_findings_ref = \%current_findings;
		$query_elements = scalar((@{$findings[$countI]}))-1;
		$countIII = scalar((@{$findings[$countI]}))-1;
		if ($countIII > 0){
				if ($addone >= $countIII) {
					push @finding_total, $addone;
					$addone++;
				};
				my $valueadder = 1;
				$query_adj 		=0;
				$query_total	=0;
				$query_name		=0;
				$query_concrete	= 0;
				$query_abstract	= 0;
				$query_high_relevance	= 0;
				$query_normal_relevance	= 0;
				$query_finding_wieght	= 0;
				$incidence_counter		= 0;
				$modval_part			= 0;
				$query_timesensitivity	= 0;
				while ($valueadder <= $countIII) {
					
					$query_total_sub= 0;
					$query_adj_sub 	= 0;
					$query_name_sub = 0;
					$query_concrete_sub	= 0;
					$query_abstract_sub	= 0;
					$query_high_relevance_sub	= 0;
					$query_normal_relevance_sub	= 0;
					$query_timesensitivity_sub	= 0;
					$incidence_counter++;
					
					#excluding context
					unless ($findings[$countI][$valueadder] {"relevance"} == 2){
						$query_total_sub = $findings[$countI][$valueadder] {"sig"} + $findings[$countI][$valueadder] {"func"} + $findings[$countI][$valueadder] {"stat"};
			
						if ($findings[$countI][$valueadder] {"timesensitive"} == 1) {
							if ($query_total_sub >= 4 ) {
								$query_timesensitivity_sub++
							};
						};
						
						if ($findings[$countI][$valueadder] {"wordtype"} eq "adjective") {$query_adj_sub++};
						if ($findings[$countI][$valueadder] {"wordtype"} eq "name") {$query_name_sub++};
						if ($findings[$countI][$valueadder] {"wordtype"} eq "concrete noun" or $findings[$countI][$valueadder] {"wordtype"} eq "plural concrete noun") {$query_concrete_sub++};
						if ($findings[$countI][$valueadder] {"wordtype"} eq "abstract noun" or $findings[$countI][$valueadder] {"wordtype"} eq "plural abstract noun") {$query_abstract_sub++};
						if ($findings[$countI][$valueadder] {"wordtype"} eq "name") {$query_name_sub++};
						
						my @temp_queryvals=( $findings[$countI][$valueadder] {"sig"} , $findings[$countI][$valueadder] {"func"} , $findings[$countI][$valueadder] {"stat"} );
						foreach my $testvalues (@temp_queryvals) {
							if ($testvalues > 2) {$query_high_relevance_sub++};
							if ($testvalues > 1) {$query_normal_relevance_sub++};
						};
						
						$standard_source	= $findings[$countI][$valueadder] {"standard_source"};
						$escalated_source 	= $findings[$countI][$valueadder] {"escalated_source"};
						$unique_source		= $findings[$countI][$valueadder] {"unique_source"};
						#print "test: $escalated_source  \n";
						unless ($standard_source eq "undef"){
							
							# print "$standard_source\n";
							if ($query_finding_wieght == 0 or $query_finding_wieght < $query_total_sub) {
								$chosen_standard_source		= $standard_source;
								if ($escalated_source eq "null"){ 
									#print "$escalated_source eq null\n";
									$chosen_escalated_source	= undef;	
								}
								else {
									#print "$escalated_source ne null\n";
									$chosen_escalated_source	= $escalated_source;									
								};
								if($unique_source ne "undef") {
									$chosen_unique_source = $unique_source;
								};
							}
							elsif ($query_finding_wieght == $query_total_sub) {
								my $random_choice = int(rand(2));
								if ($random_choice == 0) {
									$chosen_standard_source		= $standard_source;
									$chosen_escalated_source	= $escalated_source;
									if($unique_source ne undef) {
										$chosen_unique_source = $unique_source;
									};
								}
								else {};
							};
						};
					};
					
					$query_total	=	$query_total+$query_total_sub;
					$query_adj		=	$query_adj_sub+$query_adj;
					$query_name		=	$query_name_sub+$query_name;
					$query_concrete	=	$query_concrete + $query_concrete_sub;
					$query_abstract	=	$query_abstract + $query_abstract_sub;
					$query_high_relevance	= $query_high_relevance + $query_high_relevance_sub;
					$query_normal_relevance	= $query_normal_relevance + $query_normal_relevance_sub;
					$query_timesensitivity	= $query_timesensitivity + $query_timesensitivity_sub;
					
					$active_mod  = $modifyers[$countI];
					print "query:$countI, mod: $active_mod\n";
					
					$modval_part = (($query_total/$incidence_counter)/3)*$active_mod;
					
					$valueadder++;
					$current_findings {"incidence"} 		=	$incidence_counter;
					$current_findings {"modval"}			=	$modval_part;
					$current_findings {"total"}				=	$query_total;
					$current_findings {"adjective"}			=	$query_adj;
					$current_findings {"name"} 				=	$query_name;
					$current_findings {"concrete"} 			=	$query_concrete;
					$current_findings {"abstract"}			=	$query_abstract;
					$current_findings {"high_relevance"} 	=	$query_high_relevance;
					$current_findings {"normal_relevance"} 	=	$query_normal_relevance;
					$current_findings {"timesensitivity"} 	=	$query_timesensitivity;
					$current_findings {"standard_source"} 	=	$chosen_standard_source;
					$current_findings {"escalated_source"} 	=	$chosen_escalated_source;
					$current_findings {"unique_source"} 	=	$chosen_unique_source;
				};
				push($findings[$countI], "summarised values");
				push($findings[$countI], $current_findings_ref);
			};	
		$countI++;
		$query--;
		#print "$countIII - - $query_total\n";
	};
	$countI			= 0;
};



my (
	$grouping_count	,
		$discard_active	,
		$discard_filter_active	,
		$discard_result	,
	$results,	
	) = undef;


my $countII 			= 0;
$discard_active 		= 0;
$discard_filter_active 	= 0;
$results 				= 0;
	
sub printdebug {
	print "\n\n###discard-sort###\n";
	print "query_elements: $query_elements\n";
	print "irrelevance count: $irrelevance_count\n";
	print "zero results: $results\n";
	print "query result: $query_result\n";
	print "query count: $query_count\n";
	print "grouping_count: $grouping_count\n";
	print "irrel_count: $irrelevance_count\n";
	print "###-###\n\n";
};

sub standard_analysis {
	#outputs essential values such as the number of significant elements in the respective groupings

	#analysis on results:
	$countI			= 0;
	$grouping_count = 0;
	$discard_result = scalar(@{$findings[0]});
		
	foreach my $grouping (@findings) {
		$results = 0;
		$results = scalar((@{$findings[$countI]}))-1;
		if ($results > 0) {
			unless ($countI ==0) {
				push @active_groupings, $countI;
				};
			$grouping_count++
			};
		$countI++;	
	};
	
	if ($discard_result > 0) {
		$grouping_count--;
	};

	#test for presence of links:
	$query_object = "object";
	$query_request = "irrelevant";
	$query_count = 0;
	check_element;
	my $irrelevance_count = $query_count;
	
	$query_object = "sig";
	$query_request = "link";
	$query_count = 0;
	check_element;	
	
	#test for discard matches 
	if ($query_result==1) {
		if ($grouping_count == 0) {
			print "\nlink found - discard is active!\n";
			$discard_active = 1;
			printdebug;
		}
		elsif($grouping_count > 0 && $query_count < $irrelevance_count) {
			print "\nlink + possibly irrelevant match found - discard_filter is active!";
			$discard_filter_active = 1;
			printdebug;
		}
		else {
			print "\nlink + relevant match found - discard is inactive!";
			$discard_active = 0;
			printdebug;
		};
	}
	elsif ($query_count > $irrelevance_count) {
			print "\n possibly irrelevant match found - discard_filter is active!";
			$discard_filter_active = 1;
			printdebug;
	}
	else {
			print "\nno zero - discard is inactive!";
			$discard_active = 0;
			printdebug;
	};
	
	add_values;	
	
};

my @filter_elements;
my %test_groupings;
sub assesment {
	if ($discard_active == 1 && $discard_filter_active == 0) {
		
	print "Tweet has been discarded!\n";
	print $Hf1 "Tweet has been discarded!\n";
	
	#what export cenario takes place here? Setting relevant variables must occur.
	}
	else {
			
		print "\nrelevant groupings:\n";
		print $Hf1 "\nrelevant groupings:";
		
		foreach my $currnent_grouping (@active_groupings) {
			
			my $loop_result = undef;
			my $loop_sum 	= undef;
			$loop_sum		= 0;
			$loop_result	= 0;
			unless ($currnent_grouping == 0) {
				#
				print  " ", $g_l [($currnent_grouping -1)], ": ";
				print $Hf1 " ", $g_l [($currnent_grouping -1)], ": ";
				#
				my $temp_grouping_scalar	= (scalar((@{$findings[$currnent_grouping]})))-1;
				
	#	#	#	#filter high_priority:
				my $normal_relevance_temp	= $findings[$currnent_grouping][$temp_grouping_scalar] {"normal_relevance"};
				my $high_relevance_temp		= $findings[$currnent_grouping][$temp_grouping_scalar] {"high_relevance"};
				if ($normal_relevance_temp > 0 or $high_relevance_temp > 0){
					if ($g_l_val [($currnent_grouping -1)] == 1)	{
						print "high_priority, ";
						print $Hf1 "high_priority, ";
						$loop_sum++;
					};
				};
				
	#	#	#	#filter climate_priority (this one tends to be undervalued):
				if ($normal_relevance_temp > 0 or $high_relevance_temp > 0){
					if ($g_c_val [($currnent_grouping -1)] == 1)	{
						print "climate_priority, ";
						print $Hf1 "climate_priority, ";
						$loop_sum++;
					};
				};
				
	#	#	#	#filter correlation:
				my $temp_mention = $mentioned_groupings_count {$g_l [($currnent_grouping -1)]};
				if ($temp_mention > 0 ){	
					my $mention_count_temp = $mentioned_groupings_count {$g_l [($currnent_grouping -1)]};		
					print "correlated (", $mentioned_groupings_count {$g_l [($currnent_grouping -1)]}, "), ";
					print $Hf1 "correlated (", $mentioned_groupings_count {$g_l [($currnent_grouping -1)]}, "), ";
					#$loop_sum = ($loop_sum + $mention_count_temp);
					$loop_sum++;
				};
				
	#	#	#	#word filter
				my $adjective_temp	= $findings[$currnent_grouping][$temp_grouping_scalar] {"adjective"};
				my $concrete_temp	= $findings[$currnent_grouping][$temp_grouping_scalar] {"concrete"};
				my $abstract_temp	= $findings[$currnent_grouping][$temp_grouping_scalar] {"abstract"};
				if ($adjective_temp > 0 or $concrete_temp >= 2 or $abstract_temp >= 2){
					my @relevant_words_temp;
					if ($adjective_temp > 0){
						push (@relevant_words_temp, "adjective ");
						$loop_sum++;
					};
					if ($concrete_temp >= 2){
						push (@relevant_words_temp, "concrete noun ");	
						$loop_sum++;
					};
					if ($abstract_temp >= 2){
						push (@relevant_words_temp, "abstract noun ");
						$loop_sum++;
					};
					print "relevant wordtype ( @relevant_words_temp", "), ";
					print $Hf1 "relevant wordtype ( @relevant_words_temp", "), ";
				};
				
	#	#	#	#source filter
				my $escalated_temp	= $findings[$currnent_grouping][$temp_grouping_scalar] {"escalated_source"};
				my $unique_temp		= $findings[$currnent_grouping][$temp_grouping_scalar] {"unique_source"};
				if (defined($escalated_temp) or $unique_temp ne 'null'){
					my @relevant_words_temp;
					if (defined($escalated_temp)) {push (@relevant_words_temp, "$escalated_temp -> escalated ");
						$loop_sum++;
					};
					if ($unique_temp ne 'null')  {push (@relevant_words_temp, "$unique_temp -> unique");	
						$loop_sum++;
					};
					print "relevant source: ( @relevant_words_temp", "), ";
					print $Hf1 "relevant source: ( @relevant_words_temp", "), ";
				};
				
	#	#	#	#time filter
				my $time_temp		= $findings[$currnent_grouping][$temp_grouping_scalar] {"timesensitivity"};
				if ($time_temp > 0){
					print "timesensitive, ";	$loop_sum++;
				};	
				
	#	#	#	#finalizing results
				my $modval_temp		= $findings[$currnent_grouping][$temp_grouping_scalar] {"modval"};
				my $incidence_temp	= $findings[$currnent_grouping][$temp_grouping_scalar] {"incidence"}; 
				print "modval: $modval_temp, ";
				print  "\n";
				print $Hf1 "\n";
				if ($loop_sum == 0) {
					$loop_result = $modval_temp /10;
					}
				else{
					$loop_result = ($loop_sum*$modval_temp)/$incidence_temp;
				};
				$test_groupings {$loop_result} = $currnent_grouping;
			};
	#	#	#finishing
			print "loop done - result: $loop_result ($loop_sum);\n\n";
		};
	};	
};

#running subroutines
standard_analysis;
assesment;
my $highest_loop_result = max keys %test_groupings;
my $required = $test_groupings{$highest_loop_result};
my $highest_grouping_name = $g_l [($required -1)];

print "Grouping $highest_grouping_name is dominant!\n";
my $highest_grouping_scalar	= (scalar((@{$findings[$required]})))-1;

my $standard	= $findings[$required][$highest_grouping_scalar] {"standard_source"};
my $escalated	= $findings[$required][$highest_grouping_scalar] {"escalated_source"};
my $unique		= $findings[$required][$highest_grouping_scalar] {"unique_source"};

print "Active Image source:\n";

if (defined($escalated)) {print"escalated source:$escalated\n";};
if ($unique ne 'null')  {print"unique source:$unique\n";};
print"standard source:$standard\n";

#reading em values -> active_state/Analysis_Data/Twitter/evaluation.conf"
$Config	= Config::Tiny->read("$home/$em_path");

	# reading em values
		my $anger		= $Config->{emotion}->{anger};
		my $anticipation= $Config->{emotion}->{anticipation};
		my $disgust		= $Config->{emotion}->{disgust};
		my $fear		= $Config->{emotion}->{fear};
		my $joy			= $Config->{emotion}->{joy};
		my $sadness		= $Config->{emotion}->{sadness};
		my $surprise	= $Config->{emotion}->{surprise};
		my $trust		= $Config->{emotion}->{trust};
		
	# reading disposition values
		my $mean		= $Config->{neutrality}->{disposition_mean};
		my $sum			= $Config->{neutrality}->{disposition_sum};
		my $sentence_total = $Config->{neutrality}->{sentence_total};



#debug - show array contents
	#print"\n";
	#print Dumper @findings;
	#print"active:\n";
	#print Dumper @active_groupings;
	#print"mentioned:\n";
	#print Dumper @mentioned_groupings;
	#print Dumper %mentioned_groupings_count;
	#print "test\n";
	#print Dumper %grouping_positions;
	#print "filter\n";
	#print Dumper @filter_elements;
	#print Dumper %test_groupings;
	#print Dumper @g_l;
	#print Dumper @g_l_val;
	#print "\n\n output incidence:\n";
	#print Dumper %grouping_incidence;
#



#Output:
	#Contentmodifyer
	#Dominant Dread


#potential export values

#my $dominant_dread		= undef; #primary relevant grouping number from 1 - 8
#my $result_Grouping_Zero0	= undef; #irrelevant;
#my $result_Grouping_Zero1	= undef; #$insult;
#my $result_Grouping_Zero2	= undef; #$boast;
#my $result_Grouping_Zero3	= undef; #$complaint;
#my $result_GroupingA	= undef; #$atomic_dread; -1.8
#my $result_GroupingB	= undef; #$divine_dread; -1.8
#my $result_GroupingC	= undef; #$econ_dread;	 -1.6
#my $result_GroupingD	= undef; #health_dread;	 -1.8
#my $result_GroupingE	= undef; #$existential_dread_result; -1.8
#my $result_GroupingF	= undef; #$institutional_dread_result; -1.8
#my $result_GroupingG	= undef; #$eco_dread_result;-1.9
#my $result_GroupingH	= undef; #$fasho_dread_result; -1.8
#my $dread_result		= undef;#total of all finding incidents (not including Grouping_Zero);
#my $complaint_result 	= undef;
#my $result_Grouping_zero= undef;

	
#sub write_eval {
## declaring configuartion file
	#$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/evaluation.conf");
		
## writing dominantdread
	#$Config->{content}->{dominant_dread}= $dominant_dread;
	
## writing result vlaues for content modifyer...
	#$Config->{content}->{discard}				=$discard_result;	#Zero0
	#$Config->{content}->{insult}				=$insult_result;	#Zero1
	#$Config->{content}->{boast}					=$boast_result;		#Zero2
	#$Config->{content}->{complaint}				=$complaint_result;	#Zero3
	
	#$Config->{content}->{dread}					= #dominant_dread
	
	#$Config->{content}->{grouping_A}			=$result_GroupingA;
	#$Config->{content}->{grouping_B}			=$result_GroupingB;
	#$Config->{content}->{grouping_C}			=$result_GroupingC;
	#$Config->{content}->{grouping_D}			=$result_GroupingD;
	#$Config->{content}->{grouping_E}			=$result_GroupingE;
	#$Config->{content}->{grouping_F}			=$result_GroupingF;
	#$Config->{content}->{grouping_G}			=$result_GroupingG;
	#$Config->{content}->{grouping_H}			=$result_GroupingH;
	#$Config->{content}->{grouping_Zero}			=$result_Grouping_zero;
	
## writing total number of dread findings
	#$Config->{content}->{dread}					=$dread_result;
	
	#$Config->write("$home/active_state/Analysis_Data/Twitter/evaluation.conf");			
#};
	

##2# preliminary analysis

	#print "\n	preliminary analysis:\n";
	#print $Hf1 "\n	Grouping_zero - preliminary analysis:\n";
	
	#print "#\n\n Grouping_zero \n";
	#use Grouping_zero qw( create_grouping_zero_v create_grouping_zero_o );
	
	#while ($complaint_words > (-1)) {
		#if ( $tweet_txt =~ m/$complaint[$complaint_words]/) {	
			#print "	found match: ··";
			#print $Hf1  "	found match: ··";
			#print color('bold white');
			#print uc " '$complaint[$complaint_words]' \n";
			#print  $Hf1 uc" '$complaint[$complaint_words]' \n";
			#print color('reset');
			#$complaint_result	= ($complaint_result +1);
		#}
		#else {};
		#$complaint_words = ($complaint_words - 1);
	#};	
	
	
## summarising results
	#if ($complaint_result > 1)		{
		#print color('bold white');#yellow
		#print"	$complaint_result ";
		#print $Hf1 "	$complaint_result ";
		#print color('reset');
		#print " matches for complaint found!\n";
		#print $Hf1 " matches for complaint found!\n";
		#}
	#elsif ($complaint_result == 1)	{
		#print color('bold white');#yellow
		#print"	$complaint_result ";
		#print $Hf1 "	$complaint_result ";
		#print color('reset');
		#print " match for complaint found!\n";
		#print $Hf1 " match for complaint found!\n";
		#}
	#else {
		#print "	no match found!\n	#\n	#\n"; # ...
		#print $Hf1 " no match found!\n	#\n	#\n"; # ...
		#};	



	
# declaring configuartion file



$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/evaluation.conf");	

	# writing detected content values
#$Config->{content}->{discard}	=$discard_result;
#$Config->{content}->{complaint}	=$complaint_result;
#$Config->{content}->{boast}		=$boast_result;
#$Config->{content}->{insult}	=$insult_result;
#$Config->{content}->{divine_dread}	=$divine_dread_result;
#$Config->{content}->{various_dread}	=$various_dread_result;
#$Config->{content}->{atomic_dread}	=$atomic_dread_result;
#$Config->{content}->{econ_dread}	=$econ_dread_result;

#$Config->{content}->{existential_dread}	=$existential_dread_result;
#$Config->{content}->{institutional_dread}	=$institutional_dread_result;

#$Config->{content}->{eco_dread}		=$eco_dread_result;
#$Config->{content}->{dread}			=$dread_result;

$Config->write("$home/active_state/Analysis_Data/Twitter/evaluation.conf");	

#END
close $Hf1;
exit;
