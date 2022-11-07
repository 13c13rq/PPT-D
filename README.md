# PPT-Dread
https://leclerqs-abode.com/PPT-Dread

With the project 'Precipitating Dread' I aim to alter the aggregate state of atmospheric dread that dissipated through the now deleted Twitter feed of former President Donald Trump and crystallize it into a visually intriguing and possibly psychoactive substance. 

This repository contains the content analysis module that I wrote specifically for this purpose. It accomplishes three processes; topic mapping, word processing and evaluation, using multi-dimensional arrays of hashes. There are 9 of these arrays in total. These are Grouping 0 and Grouping A … H; each grouping contains a general topic with a variable number of subtopic objects composed of words and their respective hash values. After matching them against the Tweet, the output of all groupings is gathered and then assessed further to determine the relevance and contextual background of the text input.

#Grouping 0

This grouping sits apart from the rest since it does not contain arrays relevant to the recognition of atmospheric dread. Its purpose is to determine the presence of insults, boasts and complaints, as well as matches that may indicate irrelevance. These findings are later used for a more nuanced assessment of the results procured by the primary groupings.

#Grouping A...H

Each grouping contains an array of topics that in turn contain an array of words that are each associated with a hash of values. So, each grouping is, as mentioned before, a multidimensional array of hashes. Actually, the hashes themselves are also designed to have multiple possible values. A function, however, that is not currently used to a great extent.

This is a general overview of the topics contained in each grouping:

A: War, the military and the nuclear threat </br>
B: Terrorism, islamophobia and the 'war on terror'</br>
C: Economy, economic warfare, fiscal policy and employment</br>
D: Healthcare, the opiate crisis and the pandemic</br>
E: Racist and divisive content as well as election denial</br>
F: The justice system, institutional violence, crime, immigration, border and gun control. </br>
G: Climate change, environmental issues and natural catastrophes</br>
H: Populists, dictators and atrocities</br>

#Assessment of Results

The words of each subtopic object are compared with the Tweet and, if there is a match, their hash values are transferred into the findings array. This findings array, also a multidimensional array of hashes, is then run though a filter that generates a modifier for each grouping, which in turn is then used to determine the dominant grouping for each Tweet. The filter that applies the modifiers takes into account word type, significance, correlation of objects and groupings, grouping priority (Grouping D and G are heavily buffed, E and F nerfed), the presence of specified image sources, as well as the date of creation. Some matches are only relevant at a certain time, indicated by [0] in the analysis display if inactive. The final modifier, which is applied to the results of the sentiment analysis to generate the octagonal shape, is calculated in the following manner:

[ [ ( $prime_em_sett * $active_mod ) + $sec_em_sett ] * $content_modifyer ] / 8.

$active_mod is the modifier of the dominant grouping. $prime_em_sett and $sec_em_sett are the two totals found during sentiment analysis, and the $content_modifyer value is the final value derived from all grouping modifiers together, divided by their respective match and filter incidence (as well as several other factors, such as grouping weighting and possible results from grouping 0). Finally, these are divided by eight because there are eight relevant groupings as well as eight primary emotions. 

#

This Project is my attempt at creating a holistic work of art, not so much an objective scientific examination. I am aware that there are many existing language analysis packages and libraries that I could have used. That I did not do so is due to my curiosity and because it made sense to me on a conceptual level.

(:
