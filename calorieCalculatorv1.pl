#!/usr/bin/perl

#Run the program as long as the user doesnt hit the 'n' key, from the if statement at the end of the program

while (true) {

print "***************************************************************************************\n";
print "This program allows you to calculate the calories to take per day in order to\n";
print "maintain your optimal weight, according to the \n";
print "Harris\–Benedict equations revised by Mifflin and St Jeor in 1990\n";
print "***************************************************************************************\n\n\n";


#Asking the user to input his weight, height, age and gender

print "How old are you?  Type in number of years, then press enter.\n";
chomp (my $age = <STDIN>);   #Age input and cutting the next line from the input


print "How much do you weigh?  Enter weight in pounds, then press enter.\n";
chomp (my $weight = <STDIN>);
$weight = $weight/2.2;		# Calculate weight to kilograms dividin by 2.2

print "What is your height?  Enter height in feet on one line, then inches on the next line.\n";
print "For example, if you are 6 feet 8 inches, enter\n6\n8\n\n";


chomp (my $feet = <STDIN>);
chomp (my $inches = <STDIN>);

my $height = (($feet * 12) + $inches) * 2.54;	# Calculate height in centimeters

print "Are you male or female?  Enter 'm' for male or 'f' for female.\n";
chomp (my $gender = <STDIN>);

print "Look at the activity levels listed below.  Then enter the number that\n";
print "applies to the activity level you are closest  on a weekly basis.\n";
print "1) No Active		(little or no exercise, desk job)\n";
print "2) Lightly Active	(light exercise/sports 1-3 days/wk)\n";
print "3) Mod. Active		(moderate exercise/sports 3-5 days/wk)\n";
print "4) Very Active		(hard exercise/sports 6-7 days/wk)\n";
print "5) Extr. Active		(hard daily exercise/sports & physical job)\n";


chomp (my $activityLevel = <STDIN>);
print "The activity level you chose is $activityLevel\n";

#calculation of activity factor that will be used later to calculate the maintenance calories

if ($activityLevel == 1) {
	 $activityFactor = 1.2;
} elsif ($activityLevel == 2) {
	$activityFactor = 1.375;
} elsif ($activityLevel == 3) {
	$activityFactor = 1.55;
} elsif ($activityLevel == 4) {
	$activityFactor = 1.725;
} elsif ($activityLevel == 5) {
	$activityFactor = 1.9;
} else {
	$activityFactor = 1.375;
}

#case-insensitive way to find letter 'm' via regular expression, returns true
#calculating Basic Metabolic Rate via the formula, in order to make the maintenance calories later

if ($gender =~ /m/i) {
	print "You are a $age year old male that weights $weight kilograms and is $height centimeters height.\n";
	$bmr = 66 + (13.7*$weight)+(5*$height)-(6.8*$age);
} elsif ($gender =~ /f/i) {
	print "You are a $age female that weights $weight kilograms and is $height centimeters height.\n";
	$bmr = 655 + (9.6*$weight)+(1.8*$height)-(4.7*$age);
} else {
	print "Try again.  Enter a 'm' for male or 'f' for female.\n";
	chomp ($gender = <STDIN>);
}

#Calculation of maintenance calories

print "Your Basal Metabolic Rate (BMR) is $bmr\n";
my $maintenanceCalories = $bmr*$activityFactor;

#Output to the user of the maintenance calories that calculated

print "Your estimated daily caloric intake to maintain your weight is $maintenanceCalories calories per day.\n";
print "To lose weight, drop your calories by 15-20%.\n";
print "Your calories with a 15 percent drop would be ", $maintenanceCalories - $maintenanceCalories*0.15, "\n";
print "Your calories with a 20 percent drop would be ", $maintenanceCalories - $maintenanceCalories*0.2, "\n";


print "\n\nWould you like to calculate calories again?  Enter 'y' for yes or 'n' to quit.\n";
chomp ($answer = <STDIN>);
if ($answer eq 'n') {
	exit;
} else {
	print "\n\n";
}
}
