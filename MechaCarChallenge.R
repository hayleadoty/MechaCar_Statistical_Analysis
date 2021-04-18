library(tidyverse)

#read in the csv file for the MechaCar_mpg data set
mecha_mpg <- read.csv(file='MechaCar_mpg.csv', stringsAsFactors = F)

#generate multiple linear regression model
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_mpg)

#generate summary stats to determine the p-value and the r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecha_mpg))

#read in the csv file for the Suspension_Coil data set
suspension_coil <- read.csv(file='Suspension_Coil.csv', stringsAsFactors = F)

#write an RScript that creates a total_summary data frame using the summarize() function
#to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column
total_summary <- suspension_coil %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#write an RScript that creates a lot_summary dataframe using the group_by()
#and the summarize() functions to group each manufacturing lot by the mean, median,
#variance, and standard deviation of the suspension coil’s PSI column
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')

#write an RScript using the t.test() function to determine if the PSI across all manufacturing
#lots is statistically different from the population mean of 1,500 pounds per square inch
t.test(suspension_coil$PSI, mu = mean(suspension_coil$PSI))

#write three more RScripts in your MechaCarChallenge.RScript using the t.test() function
#and its subset() argument to determine if the PSI for each manufacturing lot is statistically different
#from the population mean
#Lot 1:
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot1")$PSI, mu = mean(suspension_coil$PSI))
#Lot 2:
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot2")$PSI, mu = mean(suspension_coil$PSI))
#Lot 3:
t.test(subset(suspension_coil, Manufacturing_Lot=="Lot3")$PSI, mu = mean(suspension_coil$PSI))
