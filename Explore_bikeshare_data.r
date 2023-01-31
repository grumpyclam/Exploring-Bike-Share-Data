
library("dplyr")
library("ggplot2")

# Reading in the Chicago, Washington, and New York datasets.

ny = read.csv('new_york_city.csv')
wash = read.csv('washington.csv')
chi = read.csv('chicago.csv')

# Grabbing the top 5 rows of the new york dataset.

head(ny)

# Checking data types.

str(ny)

# Checking the summary statistics. Very similiar to pythons describe()

summary(ny)

# Finding the position of missing values by column.

sapply(ny, function(x) which(is.na(x)))
       

# Finding the count of missing values by column.

sapply(ny, function(x) sum(is.na(x)))

# Displaying the row with a null value in Trip.Duration.

ny[54770,]

# Displaying all rows where Birth.Year is NA. 

ny[is.na(ny$Birth.Year), ]

# Displaying all rows where Gender is 'NA'. We know there are empty values that should be 'NA' but are not. 

ny[is.na(ny$Gender), ]

# Grabbing 10 samples from the Washington dataset.

wash[sample(nrow(wash), 10), ]

# Checking data types.

str(wash)

# Getting summary statistics by column.

summary(wash)

# Finding the position of missing values by column.

sapply(wash, function(x) which(is.na(x)))

# Finding the count of missing values by column.

sapply(wash, function(x) sum(is.na(x)))

# Displaying the one row that is NA. We can see that there is multiple empty values in multiple columns. 

wash[89051,]

# Grabbing the first 5 rows of the Chicago dataset.

head(chi)

# Checking datatypes.

str(chi)

# Checking summary statistics.

summary(chi)

# Finding the location of missing values.

sapply(chi, function(x) which(is.na(x)))

# Getting the count of missing values by column.

colSums(is.na(chi))

# Selecting all rows where Birth.Year is 'NA'. Again, just like the other datasets, there are multiple columns where 
# values are actually empty. This will be dealt with below in 'Cleaning'.

chi[is.na(chi$Birth.Year), ]

# Creating a new dataframe (ny_2), replacing all blanks AND spaces with 'NA'.

ny_2 <- ny
ny_2[ny_2 == "" | ny_2 == " "] <- NA
head(ny_2)

# Finding the actual count of 'NA' values in the ny_2 dataset.

colSums(is.na(ny_2))

# Creating a new dataframe (wash_2), replacing all blanks AND spaces with 'NA'.

wash_2 <- wash
wash_2[wash_2 == "" | wash_2 == " "] <- NA
head(wash_2)

# Finding the count of actual 'NA' values in wash_2 dataset.
 
colSums(is.na(wash_2))

# Creating a new dataframe (chi_2), replacing all blanks AND spaces with 'NA'.

chi_2 <- chi
chi_2[chi_2 == "" | chi_2 == " "] <- NA
head(chi_2)

# Finding the actual count of 'NA' in chi_2.

colSums(is.na(chi_2))

# We need to combine the ny and chi dataframes into one dataframe.

ny_chi <- rbind(ny_2, chi_2)
ny_chi[sample(nrow(ny_chi), 10), ]

# Checking to make our datasets were merged with the correct amount of rows.

nrow(ny_chi)

# Dividing the Time.Duration column by 60 to get minutes instead of seconds.

ny_chi$Trip.Duration <- ny_chi$Trip.Duration/60
ny_chi[sample(nrow(ny_chi), 7), ]

# Rounding the Trip.Duration column to a whole number. This will make it easier to plot.

ny_chi$Trip.Duration <- round(ny_chi$Trip.Duration)
ny_chi[sample(nrow(ny_chi), 7), ]

# Passing in ny_chi and ignore the NA values.

ny_chi <- na.omit(ny_chi)

# Plotting the zoomed in version of a boxplot.

ggplot(ny_chi, aes(Gender, Trip.Duration)) +
            geom_boxplot() + 
            scale_y_continuous(limits= c(0,100)) +
            geom_jitter(color="purple", size=0.2, alpha=0.5) +
            ggtitle("Trip Duration by Gender") +
  xlab("Gender") + ylab("Trip Duration (min) ")

# Plotting the original 

ggplot(ny_chi, aes(Gender, Trip.Duration)) +
    geom_boxplot() +
    geom_jitter(color="purple", size=0.1, alpha=0.5) +
    ggtitle("Trip Duration by Gender") +
  xlab("Gender") + ylab("Trip Duration (min) ")

summary(allcity_data$Trip.Duration)

# Creating a new variable (start_station) that finds the frequency (count) of each value in Start.Station column.

start_station <- table(wash_2$Start.Station)
start_station

# Passing in start_station to find the top ten most frequented starting stations.

top_startstation <- head(sort(start_station, decreasing=TRUE),n=10)
top_startstation

# Passing in the top_startstation variable and plotting the top ten most visited starting stations.

barplot(top_startstation,
        space=4,
        horiz=TRUE,
        col="#DDDDFF",
        border="#000000",
        main='Top 10 most visited starting and ending stations',
        xlab="Number of times visited",
        ylab="Stations Visited",
        names.arg=c("Columbus Circle", "Lincoln Memorial","Jefferson Dr", "Mass Ave", "Jefferson Memorial","15th","Smithsonian",
                       "Henry Bacon", "4th", "Eastern Market"),
        las=1,
        cex.names=0.5)

mean(top_startstation)

median(top_startstation)

# Making a copy of the ny_chi dataset as not to mess up the original dataframe I already created.

drop_nychi <- data.frame(ny_chi)
head(drop_nychi)

# Dropping 'Gender' and 'Birth.Year' columns.

drop_nychi <- subset(drop_nychi, select = -c(Gender, Birth.Year))
head(drop_nychi)

# Converting the 'Trip.Duration' column to minutes by divding by 60.

wash_2$Trip.Duration <- wash_2$Trip.Duration/60
head(wash_2)

# Rounding the 'Trip.Duration' column.

wash_2$Trip.Duration <- round(wash_2$Trip.Duration)
head(wash_2)

# Merging all city tables.

allcity_data <- rbind(drop_nychi, wash_2)
allcity_data[sample(nrow(allcity_data), 7), ]

# Double checking to make sure all rows that are merged are present.

nrow(allcity_data)

# Omitting all 'NA' values.

allcity_data <- na.omit(allcity_data)

ggplot(allcity_data, aes(x=User.Type, y=Trip.Duration, fill=User.Type)) + 
  geom_violin() + 
  scale_y_continuous(limits= c(0,150)) +
  ggtitle("Sum of Trip Duratation by User Type") +
  xlab("User Type") + ylab("Trip Duration (min)")

ggplot(allcity_data, aes(x=User.Type, y=Trip.Duration, fill=User.Type)) + 
  geom_violin() +
  ggtitle("Sum of Trip Duratation by User Type") +
  xlab("User Type") + ylab("Trip Duration (min)")

summary(allcity_data$Trip.Duration)

system('python -m nbconvert Explore_bikeshare_data.ipynb')
