# NOTE: This R script concentrates on loading and exploring the Jmol workshop feedback data.

# 1) Loading library for data exploration.
suppressPackageStartupMessages(library(tidyverse))

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 2) Loading data into the environment.
data=read.csv("Jmol Application Advanced Workshop.csv")

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 3) Changing column names.
colnames(data)=c(# 3.1) General information:
                 "Name",
                 "Institute",
                 "Background",
                 "Background (Other)",
                 "Duration of workshop attended previously (if any)",
                 # 3.2) Exposure to Jmol:
                 "Used other software",
                 "Other software's name",
                 "Used Jmol before",
                 "Jmol use/purpose",
                 "Jmol use/purpose (Other)",
                 "Teaching/Learning without software",
                 "Jmol useful in teaching",
                 "Jmol difficulty",
                 # 3.3) Experience of screening task:
                 "Understanding of Jmol before screening task",
                 "Efforts put in screening task",
                 "Understanding of Jmol after screening task",
                 # 3.4) Spoken Tutorial ratings:
                 "(Spoken Tutorial) Surfaces and Orbitals",
                 "(Spoken Tutorial) Script Commands",
                 "(Spoken Tutorial) Symmetry Point Groups",
                 "(Spoken Tutorial) Proteins Macromolecules",
                 "(Spoken Tutorial) 3D Enzyme Models",
                 # 3.5) Live Demonstration ratings:
                 "(Live Demonstration) Molecular Orbitals",
                 "(Live Demonstration) Structures from databases",
                 "(Live Demonstration) Creating GIF",
                 "(Live Demonstration) Conformations of disubstituted Ethane",
                 # 3.6) Assignment ratings:
                 "(Assignment) Molecular Orbitals",
                 "(Assignment) Cyclohexane",
                 "(Assignment) Point Groups",
                 "(Assignment) Protein Structure",
                 "(Assignment) Enzyme Structure",
                 # 3.7) Knowledge before and after workshop:
                 "Knowledge of using Jmol before workshop",
                 "Knowledge of using Jmol after workshop",
                 # 3.8) Overall quality ratings:
                 "Quality of instructional material",
                 "Self learning through Spoken Tutorial",
                 "Live Demonstration",
                 "Discussions on assignments",
                 "Advanced features demonstration",
                 "Interaction with speakers",
                 "Overall screening quality",
                 # 3.9) Workshop satisfaction ratings:
                 "Exposure to new knowledge",
                 "Unhappy with format",
                 "Willing to participate in future activites",
                 "Didn't learn much",
                 "Recommend others to use Jmol",
                 # 3.10) Miscellaneous:
                 "Plan for Jmol use",
                 "Interested in becoming a Teaching Assistant",
                 "Most liked aspect",
                 "Most disliked aspect",
                 "Forum suggestions",
                 "Other suggestions")

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 4) A preliminary check is performed to see if a column or row has majority as NA or not.
# 4.1) Column search for NA -
# 4.1.1) `NA count` holds the count of NA values present in a given column.
`NA count`=cbind(lapply(lapply(data, is.na), sum))
# 4.1.2) Finding unique values associated with the count of NA.
unique(`NA count`)
# 4.1.3) Finding column number with the maximum count for NA i.e. 17.
which(`NA count`==17)
# 4.1.4) Observing non-NA values present in the 4th column.
as.numeric(na.omit(data[,4]))
# 4.2) Row search for NA -
# 4.2.1) `NA count` holds the count of NA values present in a given row.
`NA count`=cbind(lapply(lapply(as.data.frame(t(data)), is.na), sum))
# 4.2.2) Finding unique values associated with the count of NA.
unique(`NA count`)

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 5) The 4th column only contains NA. Hence, it will be useless for further analysis, therefore removing it.
data=data[,-4]

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 6) Data exploration (Checking if any participant had filled the feedback form more than once).
# 6.1) Checking whether the number of unique participants' names matches with the total number of rows in the data.
all.equal(nrow(data),n_distinct(data$Name))
# 6.2) Matching all name components individually to check whether any participant had filled the form more than once using a different version of his/her name or not.
# For example, interchanging the first and last names.
sum(unique(lengths(lapply(data$Name,grep,data$Name,value=TRUE))-1))
# Zero indicates that all participants' names are unique.

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 7) Removing all R objects except for the data frame "data".
rm(list=setdiff(ls(),"data"))

