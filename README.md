# Analysis-of-Feedback-Form-Data
This repository contains Data Analysis of feedback forms, performed during my 6-month internship at R FOSSEE, IIT Bombay. The goal of the task was to use factor analysis to identify hidden features of the dataset and make meaningful conclusions. The procedure consisted of the following steps:
1. Data loading and exploration.
2. Data cleaning.
3. Data preprocessing.
4. Data analysis.

The datasets that were used for this task are:
1. 1 day Jmol Application Advanced workshop, conducted on 12th September.
2. 1 day ChemCollective Virtual Lab Workshop, conducted on 12 December 2020.

The specific methods used were as follows:

I) Data Exploration:
1. Checking for duplicate entries.
2. Changing column names for easier understanding.
3. Check if any row/column is redundant due to the presence of missing values. 

II) Data Cleaning:

A) Software Use:
1. Participants marked negative response when asked if they have used any software other than the specific software taught in the workshop, but entered the name of an alternative software in the following section.
2. Participants marked positive response when asked if they have used any software other than the specific software taught in the workshop, but did not mention the name of the software.
3. Participants marked positive response when asked if they have used the specific software taught in the workshop before, but failed to mention the purpose of use.
4. Participants marked negative response when asked if they have used specific software taught in the workshop before, but mentioned the purpose of use.

B) Knowledge:
1. Participants contradicted by responding strongly in favor of both Exposure to new knowledge and Didn't learn much statements.
2. Participants contradicted by responding strongly in oppose of both Exposure to new knowledge and Didn't learn much statements.
3. Participants indicating reduced level of knowledge after workshop.
4. Participants indicating reduced level of knowledge after screening task.
5. Checking for positive feedback in negative descriptive questions and vice versa.

III) Data Preprocessing:

1. Converting string values like Not Attempted to NA in numeric data columns.
2. Subsetting data into background, suggestions, quantitative and qualitative divisions.
3. Converting the class of Data object to data.frame and creating a backup.
4. Data type conversion from character to numeric for quantitative data columns.
5. Data type conversion from character to factor for qualitative data columns.
6. Removing columns containing participants' background information, comments, suggestions and/or opinions.

IV) Data Analysis:

Exploratory and Confirmatory Factor Analysis were tried on the dataset after performing steps I,II and III. However, it was discovered that the factor analysis is unsuitable on the given dataset as the correlation matrix was singular. Hence, there was no more data analysis performed.

