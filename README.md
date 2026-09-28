# business_intelligence
# ISA 401: Business Intelligence & Data Visualization), Isobel Bartels, Semester: Fall 2026, Data Acquisition & Transformation, Data Visualization & Communication, Exploratory Data Mining

##Skills
- Git
- R

## Airbnb analysis

The eight analyses are in [airbnb_analysis.Rmd.Rmd](airbnb_analysis%3A/airbnb_analysis.Rmd.Rmd),
using `data/midwest_airbnb_extended.db`.

An `anti_join()` of listings against all availability rows finds **456 listings**
with no availability data: **Chicago 267**, **Twin Cities 120**, and **Columbus 69**.
Chicago loses the most listings. The October mostly-taken shares use only entire
homes with an October 2026 availability row; listings without a matching row are
excluded from that denominator.
