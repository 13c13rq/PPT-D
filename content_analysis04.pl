#!/usr/bin/env perl
#push ok
use v5.14;
use strict;
use warnings;
use Lingua::EN::Opinion;
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


my $home	= File::HomeDir->my_home;
my $Config 	= Config::Tiny->new;


# getting tweet file
my $tweet	= "$home/active_state/Analysis_Data/Twitter/trumptweet.txt"; 

my $row			= undef;
open(my $fh, '<:encoding(UTF-8)', $tweet)
  or die "Could not open file '$tweet' $!";
my $tweet_txt = <$fh>;


# floating scalars
my $tweetcount	= undef;
my $new_tweet 	= undef;


my $Hf 			= undef;
my $Hf0 		= undef;
my $Hf1 		= undef;
my $Hf2 		= undef;


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
		# declaring configuartion file
		$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/tweetstatus.conf");
		
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
	my $countI =undef;
	
	$countI = 0;
	my @evaluation = (["Grouping_zero"],["GroupingA"],["GroupingB"],["GroupingC"],["GroupingD"],["GroupingE"],["GroupingF"],["GroupingG"],["GroupingH"]);
	my @findings = (["Grouping_zero"],["GroupingA"],["GroupingB"],["GroupingC"],["GroupingD"],["GroupingE"],["GroupingF"],["GroupingG"],["GroupingH"]);
	
	#foreach my $vlaues0 (@findings){
		#$weight_distr {$findings[$countI]} = $g_l_val[$countI];
		#$countI++;
		#}
#setting up findings array
	my @finding_data = ("word", "wordtype", "sig", "func", "stat", "relevant_time", "unique_source");
# preliminary analysis

	my @objects;
	my $objects;
	
	my $objects_ref;
	my $values_ref;
	
	my $current_grouping 	= undef;
	my $irrelevance 		= undef;
	
	my $test_counter 		= undef;
	$test_counter= 0;
	
	my $active_time 		= undef;
	$active_time = 1; #on by default ...
	
	my $grouping_displayed 	= undef;
	$grouping_displayed = 0;
	
	my $irrelevance_count	=undef;
	$irrelevance_count=0;

	my @g_l = ('A'..'H');
	my @g_l_val = (0,1,0,1,0,0,1,1);
	
	#the modifyers are a cosmetic feature.
	my @modifyers = (0, 1.51, 1.81, 1.59, 1.78, 1.57, 1.54, 1.91, 1.87); #8;
	my @zero_modifyers = (1.7, 1.5, 1.1, 1.3, 1.0);
	
	my %weight_distr;
	my %grouping_positions;
	
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
	
sub standard_test {
	$grouping_displayed=0;
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
						print "\n\n $current_grouping \n";
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
					
					#checking for irrelevance value
					if(${$objects}[0][1] eq 'irrelevant') {
						#print "\nIRRELEVANT: ";
						$irrelevance_count ++;
						#print "$irrelevance_count\n";
					};	
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
						print "\n\n $current_grouping \n";
						print $Hf1 "\n\n $current_grouping \n";
						$grouping_displayed =1;	
					};
					print "\n	",${$objects}[0][1],": '",uc $active_word,"' [inactive]";
					print $Hf1 "\n	",${$objects}[0][1],": '",uc $active_word,"' [inactive]";}
				
			};
			$countII=0;
			$countI++;
		};
	};
	$test_counter++
};

my $active_mod = undef;

sub match_groupings {
	
	#Grouping Zero - insult, boast, complaint and irrelevancy signifyers
		
		$current_grouping = "Grouping_zero";
			#values not relevant here.
		#$values_ref=\@Grouping_zero::values_zero;
		$objects_ref=\@Grouping_zero::objects_zero;
			#create_grouping_zero_v;
		create_grouping_zero_o;
		standard_test;
	
	#GroupingA - War and conflict signifyers
		$active_mod = $modifyers[0];
		$current_grouping = "Grouping_A";
			#objects not relevant here.
		#$objects_ref=\@GroupingA::objectsA;
		$objects_ref=\@GroupingA::valuesA;
			#create_groupingAo
		create_groupingAv;
		standard_test;
		
	#GroupingB - War and armed conflicts signifyers
		$active_mod = $modifyers[1];
		$current_grouping = "Grouping_B";
			#objects not relevant here.
		#$objects_ref=\@GroupingB::objectsB;
		$objects_ref=\@GroupingB::valuesB;
			#create_groupingBo
		create_groupingBv;
		standard_test;
		
	#GroupingC - War and armed conflicts signifyers
		$active_mod = $modifyers[2];
		$current_grouping = "Grouping_C";
			#objects not relevant here.
		#$objects_ref=\@GroupingC::objectsC;
		$objects_ref=\@GroupingC::valuesC;
			#create_groupingCo
		create_groupingCv;
		standard_test;
		
	#GroupingD - War and armed conflicts signifyers
		$active_mod = $modifyers[3];
		$current_grouping = "Grouping_D";
			#objects not relevant here.
		#$objects_ref=\@GroupingD::objectsD;
		$objects_ref=\@GroupingD::valuesD;
			#create_groupingDo
		create_groupingDv;
		standard_test;
		
	#GroupingE - War and armed conflicts signifyers
		$active_mod = $modifyers[4];
		$current_grouping = "Grouping_E";
			#objects not relevant here.
		#$objects_ref=\@GroupingE::objectsE;
		$objects_ref=\@GroupingE::valuesE;
			#create_groupingEo
		create_groupingEv;
		standard_test;
		
	#GroupingF - War and armed conflicts signifyers
		$active_mod = $modifyers[5];
		$current_grouping = "Grouping_F";
			#objects not relevant here.
		#$objects_ref=\@GroupingF::objectsF;
		$objects_ref=\@GroupingF::valuesF;
			#create_groupingFo
		create_groupingFv;
		standard_test;
		
	#GroupingG - War and armed conflicts signifyers
		$active_mod = $modifyers[6];
		$current_grouping = "Grouping_G";
			#objects not relevant here.
		#$objects_ref=\@GroupingG::objectsG;
		$objects_ref=\@GroupingG::valuesG;
			#create_groupingGo
		create_groupingGv;
		standard_test;
		
	#GroupingH - War and armed conflicts signifyers
		$active_mod = $modifyers[7];
		$current_grouping = "Grouping_H";
			#objects not relevant here.
		#$objects_ref=\@GroupingH::objectsH;
		$objects_ref=\@GroupingH::valuesH;
			#create_groupingHo
		create_groupingHv;
		standard_test;
		print $Hf1 "\n";
		print "\n";
};

match_groupings;


#running content analysis

	
# setting result vlaues for content modifyer...

	my $dominant_dread			= undef; #primary relevant grouping number from 1 - 8
	
	my $result_Grouping_Zero0	= undef; #irrelevant;
	my $result_Grouping_Zero1	= undef; #$insult;
	my $result_Grouping_Zero2	= undef; #$boast;
	my $result_Grouping_Zero3	= undef; #$complaint;
	my $result_GroupingA	= undef; #$atomic_dread; -1.8
	my $result_GroupingB	= undef; #$divine_dread; -1.8
	my $result_GroupingC	= undef; #$econ_dread;	 -1.6
	my $result_GroupingD	= undef; #health_dread;	 -1.8
	my $result_GroupingE	= undef; #$existential_dread_result; -1.8
	my $result_GroupingF	= undef; #$institutional_dread_result; -1.8
	my $result_GroupingG	= undef; #$eco_dread_result;-1.9
	my $result_GroupingH	= undef; #$fasho_dread_result; -1.8
	my $discard_result		= undef; #discard 
	my $result_Grouping_zero= undef;
	#my $dread_result		= undef;#total of all finding incidents (not including Grouping_Zero);
	my $elements			= undef;
	my $results				= undef;
	my $complaint_result 	= undef;
	my $grouping_count 		= undef;
	my $discard_active		= undef;
	my $discard_filter_active	= undef;
	
	$discard_active = 0;
	$discard_filter_active = 0;


	my $element_match 		= undef;
	my $match_count 		= undef;
	my $query_elements 		= undef;	
	my $query_object		= undef;
	my $query_request 		= undef;
	my $query_result 		= undef;
	my $query_count 		= undef;

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
	
	# not quite sure how to do this - think about it tomorrow!
	my $query_total		= undef;
	my $query_total_sub	= undef;
	my $query_adj_sub	= undef;
	my $query_adj		= undef;
	my $query_name_sub	= undef;
	my $query_name		= undef;
	my $query_concrete_sub	= undef;
	my $query_concrete		= undef;
	my $query_abstract_sub	= undef;
	my $query_abstract		= undef;
	my $query_high_relevance_sub	= undef;
	my $query_high_relevance		= undef;
	my $query_normal_relevance_sub	= undef;
	my $query_normal_relevance		= undef;
	my $query_finding_wieght		= undef;
	
	my $unique_source		= undef;
	my $standard_source		= undef;
	my $escalated_source 	= undef;
	my $chosen_standard_source		= undef;
	my $chosen_unique_source		= undef;
	my $chosen_escalated_source		= undef;
	my $incidence_counter			= undef;
	my $modval_part					= undef;
	
	sub add_values {
		$countI			= 1;
		$query=		(scalar(@findings)-1);
		my $addone =0;
		while ($query >= 1) {
			
			my %current_findings = ();
			my $current_findings_ref = \%current_findings;
			#print "addcount: $countI - $query\n";
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
					
					while ($valueadder <= $countIII) {
						
						$query_total_sub= 0;
						$query_adj_sub 	= 0;
						$query_name_sub = 0;
						$query_concrete_sub	= 0;
						$query_abstract_sub	= 0;
						$query_high_relevance_sub	= 0;
						$query_normal_relevance_sub	= 0;
						$incidence_counter++;
						
						unless ($findings[$countI][$valueadder] {"relevance"} == 2){
							
							$query_total_sub = $findings[$countI][$valueadder] {"sig"} + $findings[$countI][$valueadder] {"func"} + $findings[$countI][$valueadder] {"stat"};
							
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
							
							unless ($standard_source eq "undef"){
								
								# print "$standard_source\n";
								if ($query_finding_wieght == 0 or $query_finding_wieght < $query_total_sub) {
									$chosen_standard_source		= $standard_source;
									unless ($escalated_source eq "null"){ 
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
							
							#print $findings[$countI][$valueadder] {"standard_source"},"\n";
							#print $findings[$countI][$valueadder] {"escalated_source"},"\n";
							#print $findings[$countI][$valueadder] {"unique_source"},"\n";
							
							
							#print "$query_total_sub\n";
							
						};
						
						$query_total	=	$query_total+$query_total_sub;
						$query_adj		=	$query_adj_sub+$query_adj;
						$query_name		=	$query_name_sub+$query_name;
						$query_concrete	=	$query_concrete + $query_concrete_sub;
						$query_abstract	=	$query_abstract + $query_abstract_sub;
						$query_high_relevance	= $query_high_relevance + $query_high_relevance_sub;
						$query_normal_relevance	= $query_normal_relevance + $query_normal_relevance_sub;
						
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
						
						$current_findings {"standard_source"} 	=	$chosen_standard_source;
						$current_findings {"escalated_source"} 	=	$chosen_escalated_source;
						$current_findings {"unique_source"} 	=	$chosen_unique_source;
						
						
						#$query_total	= 0;
						#$query_adj		= 0;
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

#sub check_value {

		#$countI			= 0;
	#my $check_result 	= 0;
	#$grouping_count 	= 0;
	#$discard_result = scalar(@{$findings[0]});
	#foreach my $grouping (@findings) {
		#$results = 0;
		#$results = scalar((@{$findings[$countI]}))-1;
		##print ("grouping: ", $findings[$countI][0], " findings: $results \n" );
		#if ($results > 0) {$grouping_count++};
		#$countI++;	
	#};

#};

my $countII 	= 0;
$results 	= 0;
	
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

	#print"testvalue:$discard_result\n";
		
	foreach my $grouping (@findings) {
		$results = 0;
		$results = scalar((@{$findings[$countI]}))-1;
		#print ("grouping: ", $findings[$countI][0], " findings: $results \n" );
		if ($results > 0) {
			unless ($countI ==0) {
				push @active_groupings, $countI;
				};
			$grouping_count++};
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
	
	# checking for discard matches 
	
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

standard_analysis;

#my %grouping_totals = ("timesensitive" => $temp_active, );
#my %high_relevance_incidence = ("timesensitive" => $temp_active, );
my @filter_elements = undef;

sub find_largest_element {
	$countI			= 0;
	$query=		scalar(@findings);
	while ($query > 0) {
		$query_elements = scalar((@{$findings[$countI]}))-1;
		$countIII = scalar((@{$findings[$countI]}))-1;
		
		#print "query:$query\n\n";
			while ($countIII > 0) {

				unless ($findings[$countI][$countIII] {"standard_source"} eq "undef"){
					
					my $query_finding = $findings[$countI][$countIII] {$query_object};
					
					
					if ($query_finding eq $query_request){
						#print "query triggered: $query_finding $query_elements\n";
						$query_result = 1;
						#print "$query_result\n";
						$query_count++;
					};
					
					
				};
				$countIII--;	
			};
		
		$countI++;	
		$query--;
	};
	$countI			= 0;
	};

	#########
	#FILTERS#
	#########

#available vlaues::

	#'total' => 12,
	#'escalated_source' => 'Stepford2',
	#'adjective' => 0,
	#'modval' => '2.49333333333333',
	#'unique_source' => 'null',
	#'concrete' => 0,
	#'normal_relevance' => 4,
	#'abstract' => 0,
	#'standard_source' => 'Dogman2',
	#'name' => 4,
	#'high_relevance' => 2,
	#'incidence' => 3
#

#filter I *completed	
my $temp_name = undef;
sub check_priority {
	
	$priority_count = 0;
	$countI			= 1;
	$query=		scalar(@findings)-1;
	
	while ($query > 0) {
		$query_elements = scalar((@{$findings[$countI]}))-1;
		$countIII = scalar((@{$findings[$countI]}))-1;

		
		print "query:$query\n\n";
		print "$query_elements\n";
		$temp_name = ($countI -1);
		unless ($query_elements ==0){
			
			my $query_findingI = $findings[$countI][$countIII] {"normal_relevance"};
			my $query_findingII = $findings[$countI][$countIII] {"high_relevance"};
			
			my $current_grouping = $g_l[$temp_name];
			my $current_grouping_val = $g_l_val[$temp_name];
			
			unless ($current_grouping_val = $g_l_val[$temp_name] == 0) {
#					#here a more strict filter could be implemented by only allowing hig relevance values to count
				if ($query_findingI > 0 or $query_findingII > 0){
					print "normal: ", $query_findingI, ", high: ", $query_findingII, ", location: $current_grouping $current_grouping_val ", $countI, $countIII, "\n";
					if ($priority_count==0) {
						 @filter_elements =();
						 push (@filter_elements, $countI);
						}
					else {
						push (@filter_elements, $countI);
						}
					$priority_count++;
				}
			}	
		};
		$countI++;	
		$temp_name = ($countI -1);
		$query--;
	};
	
#		#changing active groupings if necessary
	if ($priority_count > 0) {
		@active_groupings =();
		@active_groupings = @filter_elements;
	};
	
	$countI			= 0;
	
};

#filter II *incomplete


	#'adjective' => 0,
	#'unique_source' => 'null',
	#'concrete' => 0,
	#'abstract' => 0,
	#'name' => 4,


my $sigword_count = undef;
my $sigword = undef;
sub  check_sigword  {
	
	$sigword_count 	= 0;
	$sigword			= 0;
	$query				= scalar(@active_groupings)-1;
	
	while ($query >= 0) {
		
		
		my $active_temp = ($active_groupings[$countI] -1);
		my $export_temp = ($active_groupings[$countI]);
		
		$countIII = scalar((@{$findings[$export_temp]}))-1;
		
		print "grouping: $export_temp - element: $countIII\n";
		my $sigwordI	= $findings[$export_temp][$countIII] {"adjective"};
		my $sigwordII	= $findings[$export_temp][$countIII] {"concrete"};
		my $sigwordIII	= $findings[$export_temp][$countIII] {"abstract"};
		my $sigwordIV	= $findings[$export_temp][$countIII] {"modval"};
		
		
		
		my $designation =$g_l [$active_temp];
		
		print "designation: $designation - adjective:$sigwordI - concrete:$sigwordII abstract: $sigwordIII modval: $sigwordIV\n\n"; 
		
		#if ($correlation > 0){
			#if ($correlation_count==0) {
				#@filter_elements =();
				#push (@filter_elements, $export_temp);
			#}
			#else {
				#push (@filter_elements, $export_temp);
			#};
			#$correlation_count++;
		#};
		
		$countI++;	
		$query--;
		
	};
	
#	#changing active groupings if necessary
	#if ($correlation_count > 0) {
		#@active_groupings =();
		#@active_groupings = @filter_elements;
	#};
	
	$countI			= 0;
};

		
#filter III *completed
my $correlation_count = undef;
my $correlation = undef;
sub check_correlation {
	
	$correlation_count 	= 0;
	$countI				= 0;
	$query				= scalar(@active_groupings)-1;
	
	while ($query >= 0) {
		
		#$temp_name = ($countI);
		my $active_temp = ($active_groupings[$countI] -1);
		my $export_temp = ($active_groupings[$countI]);
		$correlation = $mentioned_groupings_count {$g_l [$active_temp]};
		my $designation =$g_l [$active_temp];
		print "query:$query - temp:$active_temp -corr: $correlation designation: $designation\n\n"; 
		
		if ($correlation > 0){
			if ($correlation_count==0) {
				@filter_elements =();
				push (@filter_elements, $export_temp);
			}
			else {
				push (@filter_elements, $export_temp);
			};
			$correlation_count++;
		};
		$countI++;	
		$query--;
	};
	
#	#changing active groupings if necessary
	if ($correlation_count > 0) {
		@active_groupings =();
		@active_groupings = @filter_elements;
	};
	
	$countI			= 0;
};
	
#filter IV *incomplete
sub check_total {
	
	$priority_count = 0;
	$countI			= 1;
	$query=		scalar(@findings)-1;
	while ($query > 0) {
		$query_elements = scalar((@{$findings[$countI]}))-1;
		$countIII = scalar((@{$findings[$countI]}))-1;
		my $temp_name = undef;
		print "query:$query\n\n";
		print "$query_elements\n";
		
		$temp_name = ($countI -1);
		
		unless ($query_elements ==0){
			
			my $query_findingI = $findings[$countI][$countIII] {"normal_relevance"};
			my $query_findingII = $findings[$countI][$countIII] {"high_relevance"};
			
			my $current_grouping = $g_l[$temp_name];
			my $current_grouping_val = $g_l_val[$temp_name];
			
			unless ($current_grouping_val = $g_l_val[$temp_name] == 0) {
				
				if ($query_findingI > 0 or $query_findingII > 0){
					
					print "normal: ", $query_findingI, ", high: ", $query_findingII, ", location: $current_grouping $current_grouping_val ", $countI, $countIII, "\n";
					if ($priority_count==0) {
						
						 @active_groupings =();
						 push (@active_groupings, $countI);
						 
						}
					else {
						
						push (@active_groupings, $countI);
						
						}
					$priority_count++;
					
					
					
				
				}
			}
				
		};
		
		$countI++;	
		$temp_name = ($countI -1);;
		$query--;
	};
	$countI			= 0;
};
	


sub assesment {
	
	#	available values:

        #'adjective' => 0,
		#'high_relevance' => 2,
		#'unique_source' => 'null',
		#'total' => 12,
		#'standard_source' => 'Dogman2',
		#'escalated_source' => 'Stepford2',
		#'name' => 4,
		#'abstract' => 0,
		#'normal_relevance' => 4,
		#'concrete' => 0

	if ($discard_active == 1 && $discard_filter_active == 0) {
		
	print "Tweet has been discarded!\n";
	print $Hf1 "Tweet has been discarded!\n";

	}
	else {
			@filter_elements = @active_groupings;
			check_priority;
			print "priority count: $priority_count\n";
			check_correlation;
			print "correlation_count: $correlation_count\n";
			check_sigword;
			#check_correltarion

		};

	print "\nactive groupings:";
	print $Hf1 "\nactive groupings:";
	
	foreach my $currnent_grouping (@active_groupings) {
		
		unless ($currnent_grouping == 0) {
			

			print  " ", $g_l [($currnent_grouping -1)];
			
			#conclusive loop 1 - test for high priority and significance.
			if ($g_l_val [($currnent_grouping -1)] == 1)	{
				
				print " (high priority),"
				
				}
			else	{
				
				print",";
				
				};
			
			#filter correlation:
			print "mentioned: ", $mentioned_groupings_count {$g_l [($currnent_grouping -1)]}, "\n";
			
			#conclusive loop 2 - select grouping with highest sig value.
			
			#conclusive loop 3 - select grouping with adjectives or abstract nouns.
			
			#conclusive loop 4 - select grouping with highest total value
			
			
			
			
			#my %current_findings = ("timesensitive" => $temp_active,
		};
		
	};
	print "\n";
	#reuse parts of the assesment in dead_trigger.pl and adapt them to the new analysis structure.
	
};

assesment;
#analysis;
print"\n";
print Dumper @findings;
#print"active:\n";
print Dumper @active_groupings;
print"mentioned:\n";
#print Dumper @mentioned_groupings;
print Dumper %mentioned_groupings_count ;
print "test\n";
print Dumper %grouping_positions;
print "filter\n";
print Dumper @filter_elements;
#print Dumper @g_l;
#print Dumper @g_l_val;



#Output:
	#Contentmodifyer
	#Dominant Dread
	
	
sub write_eval {
# declaring configuartion file
	$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/evaluation.conf");
		
# writing dominantdread
	$Config->{content}->{dominant_dread}= $dominant_dread;
	
# writing result vlaues for content modifyer...
	$Config->{content}->{discard}				=$discard_result;	#Zero0
	$Config->{content}->{insult}				=$insult_result;	#Zero1
	$Config->{content}->{boast}					=$boast_result;		#Zero2
	$Config->{content}->{complaint}				=$complaint_result;	#Zero3
	
	$Config->{content}->{dread}					= #dominant_dread
	
	$Config->{content}->{grouping_A}			=$result_GroupingA;
	$Config->{content}->{grouping_B}			=$result_GroupingB;
	$Config->{content}->{grouping_C}			=$result_GroupingC;
	$Config->{content}->{grouping_D}			=$result_GroupingD;
	$Config->{content}->{grouping_E}			=$result_GroupingE;
	$Config->{content}->{grouping_F}			=$result_GroupingF;
	$Config->{content}->{grouping_G}			=$result_GroupingG;
	$Config->{content}->{grouping_H}			=$result_GroupingH;
	$Config->{content}->{grouping_Zero}			=$result_Grouping_zero;
	
# writing total number of dread findings
	$Config->{content}->{dread}					=$dread_result;
	
	$Config->write("$home/active_state/Analysis_Data/Twitter/evaluation.conf");			
};
	

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
