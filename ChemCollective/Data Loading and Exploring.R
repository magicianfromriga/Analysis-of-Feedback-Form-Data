# 1) Loading data -
Data=read.csv("ChemCollective - Virtual Lab Workshop.csv")

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- #

# 2) Changing column names -
colnames(Data)=c(
  # 2.1) General information -
  "Name",
  "Institute",
  "Qualification",
  "Target Audience",
  "Background",
  "Background Other",
  # 2.2) Exposure to equivalent software -
  "Used equivalent software ",
  "Name of equivalent software",
  "Duration of use",
  "Difficulty in using ChemCollective",
  "Previous Exposure",
  # 2.3) Spoken Tutorial (ST) quality -
  "(ST) Well made",
  "(ST) Needs improvement",
  "(ST) Various aspects unclear",
  "(ST) Learnt a lot",
  # 2.4) Spoken Tutorial ratings -
  "(ST) Standard solutions",
  "(ST) Dilutions and PH measurements",
  "(ST) Density",
  "(ST) Temperature effects",
  "(ST) Acid base",
  "(ST) Buffer solutions",
  # 2.5) Workshop Aspects -
  "Understood practice problems",
  "Understood practice problems explanation",
  "Teaching assistant useful",
  "Quality of instructional material",
  "Learning through ST",
  "Practice assignment discussions",
  "Quality of online workshop",
  # 2.6) Knowledge before and after workshop -
  "Knowledge level before workshop",
  "Knowledge level after workshop",
  # 2.7) Workshop format -
  "Happy with format",
  "Didn't learn much (Format)",
  "Need less participants",
  "Charge fee for workshop",
  "Like classroom breakup",
  # 2.8) Satisfaction ratings for the workshop -
  "Exposure to new knowledge",
  "Didn't learn much (Overall)",
  "Will recommend software",
  "Will recommend workshop",
  # 2.9) Miscellaneous -
  "Most liked aspect","Most disliked aspect",
  # 2.10) Spoken Tutorial Forum (STF) -
  "STF pre register",
  "STF post questions",
  "STF answer questions"  ,
  "STF doubts clarifications",
  "STF discussions useful after workshop",
  "STF answers available to non attendees",
  "STF forum based support",
  "STF personal recognition",
  "STF recommendable",
  "STF most liked aspect","STF most disliked aspect",
  # 2.11) Support from FOSSEE and suggestions -
  "Remote help and STF support",
  "Only STF support",
  "No help needed",
  "Suggestions")

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- #

# 3) A preliminary check is performed to see if a column or row has more NA values than useful data -
# 3.1) Column search for NA values -
# 3.1.1) `NA count` holds the total number of NA values present in each data column -
`NA count`=cbind(lapply(lapply(Data, is.na), sum))
# 3.1.2) Finding unique values associated with the count of NA -
unique(`NA count`)

# NOTE: "Suggestions" is the only column with NA values. This can be ignored.

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- #

# 4) Basic Data Exploration (Checking if any participant has filled the feedback form more than once) -
# 4.1) Checking whether the number of unique names matches with the total number of rows in the data -
all.equal(length(unique(Data$Name)),nrow(Data))
# NOTE: There are only 10 unique names but 32 rows of data.

# 4.2) Finding duplicates one by one -
# 4.2.1) Sapna Sawhney -
dplct_indcs_1=which(Data$Name=="Sapna Sawhney"&Data$Institute=="KENDRIYA VIDYALAYA")
# View(Data[dplct_indcs_1,])
# 4.2.2) Andal V -
dplct_indcs_2=which(Data$Name=="Andal V"&Data$Institute=="K. C. G. College of Technology, Chennai")
# View(Data[dplct_indcs_2,])
# 4.2.3) Dhamotharan A -
dplct_indcs_3=which(Data$Name=="Dhamotharan A "&Data$Institute=="Builders Engineering College, Kangayam")
# View(Data[dplct_indcs_3,])
# 4.2.4) Bornia Mazumdar -
dplct_indcs_4=which(Data$Name=="Bornia Mazumder"&Data$Institute=="KENDRIYA VIDYALAYA CRPF AMERIGOG")
# View(Data[dplct_indcs_4,])
# 4.2.5) Priti Dod -
dplct_indcs_5=which(Data$Name=="Priti Dod"&Data$Institute=="Toc H Institute of Science and Technology, Arakkunnam")
# View(Data[dplct_indcs_5,])

# 4.3) Removing duplicate entries -
dplct_indcs=union(union(union(union(dplct_indcs_1,dplct_indcs_2),dplct_indcs_3),dplct_indcs_4),dplct_indcs_5)
Data=Data[-c(dplct_indcs),]
nrow(Data)

# 4.4) Removing all R objects except for the data frame "Data".
rm(list = setdiff(ls(),"Data"))

# NOTE: Only 5 rows from the original data remain. Hence, data is unsuitable for further analysis.