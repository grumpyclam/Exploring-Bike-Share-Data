# Exploring-Bike-Share-Data


**Background**

Over the past decade, bicycle-sharing systems have been growing in number and popularity in cities across the world. Bicycle-sharing systems allow users to rent bicycles on a very short-term basis for a price. This allows people to borrow a bike from point A and return it at point B, though they can also return it to the same location if they'd like to just go for a ride. Regardless, each bike can serve several users per day.

Thanks to the rise in information technologies, it is easy for a user of the system to access a dock within the system to unlock or return bicycles. These technologies also provide a wealth of data that can be used to explore how these bike-sharing systems are used.

**Data Selection**

Three csv files were provided via Udacity but they can also be found and downloaded here as well: https://divvybikes.com/system-data

**Organizational Need** 

To use data provided by Motivate(Divy/Lyft), a bike share system provider for many major cities in the United States, to uncover bike share usage patterns. To compare the system usage between three large cities: Chicago, New York City, and Washington, DC. To answer the questions below:

1. In New York and Chicago, what does trip duration time look like by gender?

2. In Washington D.C., what were the top ten most frequently visited start stations?

3. For all datasets, did people who were subscribed to the bike share program travel more than those who were not subscribed?

**Conclusions**

**1. In New York and Chicago, what does trip duration time look like by gender?**

   Men took slightly more trips than women. The average trip was 10-15 minutes and some occasionally extending to 25-50 minutes, this supports the median trip duration of 11 minutes. There were a few outliers that show outliers of having took a trip of over 15000 minutes, this is probably due to someone not returning a bike over a few days and should not be considered in the average (this is represented by max in summary statistics).

**2. In Washington D.C., what were the top ten most frequently visited start stations?**

  It was visited more than double the amount of times that the Eastern Market station was visited, even though it was still top ten! We can also see that from the top ten most visited stations, the average number of times that a station was visited was ~1170 times. The median is not far off, with 1054 being right in the middle.

Columbus Circle being visited the most would make sense, as it is right next to Union Station, which brings in people from nearby Virginia, Maryland, and the outskirts of Washington D.C. People are starting their day getting off at Union Station and grabbing a bike to go head to work and to visit the city when from out of town.

**3. For all datasets, did people who were subscribed to the bike share program travel more than those who were not subscribed?**

  Subscribers were more likely to take more frequent but shorter trips where as regular customers (non-subscribers) took less frequent and longer trips.
