#!/usr/bin/env perl 
#ok
use strict;
use warnings;    
use Config::Tiny;
use File::HomeDir;
use Term::ANSIColor;
use Text::Wrap;

my $home	= File::HomeDir->my_home;	
my  $Config	= undef;
my  $eternal = 0;
$Config	= Config::Tiny->new;

# sentiment variables
my ($anger,
$disgust,
$fear,
$joy,
$sadness,
$surprise,
$trust,
$mean,
$sum,
$love,
$hate,
$anticipation) = undef;

# content variables
my ($discard,
$complaint,
$boast,
$insult,
$dread,

# dread category variables
$divine_dread,
$various_dread,
$atomic_dread,
$econ_dread,
$social_dread,
$eco_dread,
$inst_dread,
$dominant_dread,

# other variables
$chance0,
$tweetcount,
$new_tweet,
$color,
$IoD,
$ultra_mean,
$ultra_mean_inversion,
$prime_em_sett,
$neutral,
$sec_em_sett,
$sentence_total,
$content_modifyer,
$inversion_pos1,
$inversion_neg1,
$inversion_pos2,
$inversion_neg2,
$content_modifyer_temp,
$content_ind_pos,
$content_ind_neg,
$mean_intent,
$content_intent,
$Hf1) = undef;


# reading data 
# from external config file containing emotional and contetn evaluation results
	
	# declaring configuartion file
		$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/evaluation.conf");
		
	# reading content values
		$discard	= $Config->{content}->{discard};
		$complaint	= $Config->{content}->{complaint};
		$boast		= $Config->{content}->{boast};	
		$insult		= $Config->{content}->{insult};
		$neutral	= 0;
		
		$dread		= $Config->{content}->{dread};	
		
		$grouping_A	= $Config->{content}->{grouping_A};
		$grouping_B	= $Config->{content}->{grouping_B};
		$grouping_C = $Config->{content}->{grouping_C};
		$grouping_D = $Config->{content}->{grouping_D};
		$grouping_E	= $Config->{content}->{grouping_E};
		$grouping_F = $Config->{content}->{grouping_F};
		$grouping_G	= $Config->{content}->{grouping_G};
		$grouping_H	= $Config->{content}->{grouping_H};
		$grouping_Zero	= $Config->{content}->{grouping_Zero};
		
	# reading em values
		$anger		= $Config->{emotion}->{anger};
		$anticipation = $Config->{emotion}->{anticipation};
		$disgust	= $Config->{emotion}->{disgust};
		$fear		= $Config->{emotion}->{fear};
		$joy		= $Config->{emotion}->{joy};
		$sadness	= $Config->{emotion}->{sadness};
		$surprise	= $Config->{emotion}->{surprise};
		$trust		= $Config->{emotion}->{trust};
		
	# reading disposition values
		$mean		= $Config->{neutrality}->{disposition_mean};
		$sum		= $Config->{neutrality}->{disposition_sum};
		$sentence_total = $Config->{neutrality}->{sentence_total};
		
	# declaring configuartion file
		$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/tweetstatus.conf");
			
	# writing color
		$color = $Config->{color}->{color};
		$IoD = $Config->{color}->{IoD};

# summary values
	
	# emotional eval sums
		my $positive_em = ($joy + $trust + $surprise + $anticipation);
		my $negative_em = ($anger + $disgust + $sadness + $fear);
		my $em_total 	= $negative_em + $positive_em;

# modifyers
		
		my @modifyers = (0, 1.51, 1.81, 1.59, 1.78, 1.57, 1.54, 1.91, 1.87); #8;
		
			
		my @other_mods = (1.7, 1.5, 1.1, 1.3, 1.0);	
		

	# increasing other eval results for easyer comparison
		$insult = $insult * $other_mods[0];
		$boast = $boast*$other_mods[1];
		$discard = $discard*$other_mods[2];
		$complaint = $complaint*$other_mods[3];
		$neutral = $discard*$other_mods[4];
		 
	# setting dominant modifyer & primary emotion sum
		if ($color == 3) {
			$content_modifyer = $dread_mods[($dread + 1)];
			$prime_em_sett 	= $negative_em;
			$sec_em_sett 	= $positive_em;
		}
		
		elsif (($complaint + $insult + $boast) > $discard){
			$prime_em_sett 	= $negative_em;
			$sec_em_sett 	= $positive_em;
			
			############################################################################
			
			if ($insult < $insult && $complaint) {
				$content_modifyer = $other_mods[0];
			}
			elsif ($boast < $complaint && $complaint) {
				$content_modifyer = $other_mods[1];
			}
			elsif ($complaint < $complaint && $insult) {
				$content_modifyer = $other_mods[3];
			}
		}
		
		elsif ($discard > ($complaint + $insult + $boast)){
			
			$prime_em_sett 	= $positive_em;
			$sec_em_sett 	= $negative_em;
			
			$content_modifyer = $other_mods[2];
		}
		
		else {
			
			$prime_em_sett 	= $positive_em;
			$sec_em_sett 	= $negative_em;

			$content_modifyer = $other_mods[4];
			};
			
	# content eval sum	
		# this is the sum of the result of each content query multiplied with their individual modifyers - both negative and positive results are possible
			my $content_sum = (($grouping_A*$dread_mods[0]) + ($grouping_B*$dread_mods[1]) + ($grouping_C*$dread_mods[2])  + ($grouping_D*$dread_mods[3]) + ($grouping_E*$dread_mods[4]) + ($grouping_F*$dread_mods[5]) + ($grouping_G*$dread_mods[6]) + ($grouping_H*$dread_mods[7) + ($insult * $other_mods[0) + ($boast*$other_mods[1]) + ($discard*$other_mods[2]) + ($complaint*$other_mods[3]) + ($neutral*$other_mods[4]));
			
	# safguard againt 0 division ...
		if ($mean == 0) {$mean = 1};
			
	# creating $mean_intent - this value represents the emotional disposition of the tweet
		if ($mean >= 0){
			$mean_intent = 1;
		}
		else {
			$mean_intent = -1;
		};	
		
	# creating $content_intent - this value represents the emotional disposition of the tweet
		if ($content_modifyer >= 0){
			$content_intent = 1;
		}
		else {
			$content_intent = -1;
		};	
		 
	# safguard againt 0 division ...
		if ($mean == 0) {$mean = 1};
		#if ($negative_em == 0 ){ $negative_em = 1};
		#if ($positive_em == 0 ){ $positive_em = 1};
	
	# ultra_mean Algorithm
	# when does inversion mean become active?
	# take care of the incorrect file usage
	
		$ultra_mean = ((((($prime_em_sett*$content_modifyer) + ($sec_em_sett * $mean_intent))*$content_modifyer) + $content_sum)/ 10);
			
		if($ultra_mean < 0) {
			$ultra_mean= $ultra_mean*(-1);
			};
			
		print "\ncontent mean calculation\n((((($prime_em_sett*$content_modifyer) + ($sec_em_sett * $mean_intent))*$content_modifyer) + $content_sum)/ 10) = $ultra_mean (no neagative values allowed) \n\n";
		
		
		if($content_intent > 1){
			
			$ultra_mean_inversion = ((((($prime_em_sett*(2-$content_modifyer)) + ($sec_em_sett * $mean_intent))*(2-$content_modifyer)) + $content_sum)/10);
			
			if($ultra_mean_inversion < 0) {
			$ultra_mean_inversion = $ultra_mean_inversion*(-1);
			};
			
			print "\ninverted content mean calculation\n((((($prime_em_sett*(2-$content_modifyer)) + ($sec_em_sett * $mean_intent))*(2-$content_modifyer)) + $content_sum)/10) = $ultra_mean_inversion (no neagative values allowed) \n\n";

		}
		
		else {
			
			$ultra_mean_inversion = ((((($prime_em_sett*(2+$content_modifyer)) + ($sec_em_sett * $mean_intent))*(2+$content_modifyer)) + $content_sum)/10);
			
			if($ultra_mean_inversion < 0) {
			$ultra_mean_inversion = $ultra_mean_inversion*(-1);
			};
			
			print "\ninverted content mean calculation\n((((($prime_em_sett*(2+$content_modifyer)) + ($sec_em_sett * $mean_intent))*(2+$content_modifyer)) + $content_sum)/10) = $ultra_mean_inversion (no neagative values allowed) \n\n";
			
		};
	
	# defining $content_modifyer_temp - this value is usefull to define a range of tolerance.
		if ($content_modifyer > 0) {
			$content_modifyer_temp = $content_modifyer*(-1);
		}
		else {
			$content_modifyer_temp = $content_modifyer;
		};
		
	#opening text file for svg output
		my $svg_txt3="/active_state/Analysis_Data/Twitter/textIV.txt";
		open ( $Hf1, '>>', "$home/$svg_txt3")
		or die "Could not open file ' textfile IV'";
	
	# defining inversion effect
		if ($ultra_mean < 0) {
			# if ultra mean is smaller than 0 
				# * side note: This case does not indicate that the input is of negative nature - only that it is selfcontradictory - meaning that the general implications of the content (as percieved by the public) are not in alignment with the emotions expressed - e.g. joy about "clean coal" and tough tarrifs etc.
			if ($content_modifyer == 1) {
				#print $Hf1 "value inversion inactive - sentiment and meaning are not asessible";
				# and the neutral content exception occurs, then there is no inversion.
					$inversion_pos1 = ($ultra_mean);
					$inversion_neg1 = ($ultra_mean);
					$inversion_pos2 = ($ultra_mean);
					$inversion_neg2 = ($ultra_mean);
				}
			elsif ($ultra_mean*(-1) < ($content_modifyer_temp + 2)) {
				#print $Hf1 "minor negative value inversion active - sentiment and meaning are in conflict";
				# and within the zone of tolerance defined by adding the negative content_modifyer_temp value to 2
				if ($content_intent > 0){
					# schould the content_modifyers then be a negative value - then only the strong positive emotions (joy tust) are inverted 
					$inversion_pos1 = ($ultra_mean);
					$inversion_neg1 = ($ultra_mean);
					$inversion_pos2 = ($ultra_mean_inversion)*(-1);
					$inversion_neg2 = ($ultra_mean);
				}
				else {
				#print $Hf1 "minor positive value inversion active - sentiment and meaning are in conflict";
					# otherwise, when the content_modifyer is a positive value - then only the strong negative values (anger disgust fear) are inverted ...
					$inversion_pos1 = ($ultra_mean);
					$inversion_neg1 = ($ultra_mean);
					$inversion_pos2 = ($ultra_mean);
					$inversion_neg2 = ($ultra_mean_inversion)*(-1);
					};
			}
			else {
				#print $Hf1 "major negative value inversion active - sentiment and meaning are in conflict";
				# otherwise, when $ultra_mean is larger than the tolerance value.
				# A total inversion occurs.
				if ($content_intent > 0){
					# schould the content_modifyer be a negative value - then all positive emotions (joy trust surprise anticipation) are inverted 
					$inversion_pos1 = ($ultra_mean_inversion)*(-1);
					$inversion_neg1 = ($ultra_mean);
					$inversion_pos2 = ($ultra_mean_inversion)*(-1);
					$inversion_neg2 = ($ultra_mean);
				}
				else {
					#print $Hf1 "major positive value inversion active - sentiment and meaning are in conflict";
					# otherwise, when the content_modifyer is a positive value - then all negative values (anger disgust fear sadness) are inverted ...
					$inversion_pos1 = ($ultra_mean);
					$inversion_neg1 = ($ultra_mean_inversion)*(-1);
					$inversion_pos2 = ($ultra_mean);
					$inversion_neg2 = ($ultra_mean_inversion)*(-1);
					};
			};
		}
	
	else {
		#print $Hf1 "value inversion inactive - sentiment and meaning are congruent";
		# schould $ultra_mean however be larger than zero 
			if ($ultra_mean*(-1) < ($content_modifyer_temp + 2)) {
				# and within the zone of tolerance defined by adding the negative content_modifyer_temp value to 2
				# then no inversion occurs ** this is here just in case I want to expand this later...
			
				$inversion_pos1 = ($ultra_mean);
				$inversion_neg1 = ($ultra_mean);
				$inversion_pos2 = ($ultra_mean);
				$inversion_neg2 = ($ultra_mean);
			}
			else {
				# otherwise, when $ultra_mean is larger than the tolerance described by the content_modifyer.
				# no inversion occurs. ** same probably wont need it tho ...
				
				$inversion_pos1 = ($ultra_mean);
				$inversion_neg1 = ($ultra_mean);
				$inversion_pos2 = ($ultra_mean);
				$inversion_neg2 = ($ultra_mean);
			};
		};
	
print "\n\n inversion_pos1 = $inversion_pos1 inversion_neg1 = $inversion_neg1 inversion_pos2 = $inversion_pos2 inversion_neg2 = $inversion_neg2 \n\n";		

# declaring configuartion file
	$Config	= Config::Tiny->read("$home/active_state/Analysis_Data/Twitter/evaluation.conf");

# declaring ultra_mean & other calculated values
	$Config->{neutrality}->{ultra_mean} = $ultra_mean;
	$Config->{neutrality}->{ultra_mean} = $ultra_mean;
	$Config->{neutrality}->{inversion_pos1} = $inversion_pos1;
	$Config->{neutrality}->{inversion_neg1} = $inversion_neg1;
	$Config->{neutrality}->{inversion_pos2} = $inversion_pos2;
	$Config->{neutrality}->{inversion_neg2} = $inversion_neg2;

#writeing to file
	$Config->write("$home/active_state/Analysis_Data/Twitter/evaluation.conf");	

#writing to svgfile displaying analysis results
	#print $Hf1 "\nultra_mean: ··· $ultra_mean\n(((($prime_em_sett-$sec_em_sett)*$content_modifyer) + $content_sum)/ 10)*$mean\n";
	print $Hf1 "\n\n content_modifyer = $inversion_pos1";
	#print $Hf1 "\n\n inversion_pos1 = $inversion_pos1 inversion_neg1 = $inversion_neg1 inversion_pos2 = $inversion_pos2 inversion_neg2 = $inversion_neg2 \n\n";	
	close $Hf1;

exit;
