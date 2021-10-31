# NOTE: This R script concentrates on data pre-processing.

# 1) Loading data into the environment.
source("Data Cleaning.R")

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 2) Performing data type conversions.
# 2.1) Converting string values like "Not Attempted" to NA in numeric data columns.
data[,16:29] <- apply(data[,16:29],2,as.numeric)
# 2.2) Sub-setting data.
# 2.2.1) Columns containing participants' background information.
background <- 1:9
# 2.2.2) Columns containing comments, suggestions or opinions of the participants.
suggestions <- c(44:49)
# 2.2.3) Columns containing quantitative and qualitative data.
quantitative <- 16:29
qualitative <- c(1:ncol(data))[!c(1:ncol(data))%in%c(background,suggestions,quantitative)]
# 2.3) Converting the class of "Data" object to "data.frame" and creating a backup.
data <- as.data.frame(data)
backup <- data
# 2.4) Data type conversion from character to numeric for quantitative data columns.
for(i in 1:length(quantitative))
{
  data[,quantitative[i]] <- as.numeric(data[,quantitative[i]])
}
# 2.5) Data type conversion from character to factor for qualitative data columns.
for(i in 1:length(qualitative))
{
  data[,qualitative[i]] <- as.factor(data[,qualitative[i]])
}

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 3) Removing R objects.
rm(i,quantitative,qualitative)

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 4) Removing columns containing participants' background information, comments, suggestions and/or opinions.
data <- data[,-c(background,suggestions)]

