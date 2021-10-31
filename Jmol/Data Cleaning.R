# NOTE: This R script concentrates on extracting and removing row entries containing contradicting responses.

# 1) Loading data into the environment.
source("Data Loading and Exploring.R")

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 2) Extracting row entries containing contradicting responses.
# 2.1) Participants marked negative response when asked if they have used any software other than Jmol, but entered the name of an alternative software in the following section.
temp1=which(data$`Used other software`=="No")
temp2=which(data$`Other software's name`!="")
`Row entries I`=intersect(temp1,temp2)
rm(list=ls(pattern="temp"))
# 2.2) Participants marked positive response when asked if they have used any software other than Jmol, but did not mention the name of the software.
temp1=which(data$`Used other software`=="Yes")
temp2=which(data$`Other software's name`=="")
`Row entries II`=intersect(temp1,temp2)
rm(list=ls(pattern="temp"))
# 2.3) Participants contradicted by responding strongly in favor of both "Exposure to new knowledge" and "Didn't learn much" statements.
temp1=which(data$`Exposure to new knowledge`=="Strongly Agree"|data$`Exposure to new knowledge`=="Agree")
temp2=which(data$`Didn't learn much`=="Strongly Agree"|data$`Didn't learn much`=="Agree")
`Row entries III`=intersect(temp1,temp2)
rm(list=ls(pattern="temp"))
# 2.4) Participants contradicted by responding strongly in oppose of both "Exposure to new knowledge" and "Didn't learn much" statements.
temp1=which(data$`Exposure to new knowledge`=="Strongly Disagree"|data$`Exposure to new knowledge`=="Disagree")
temp2=which(data$`Didn't learn much`=="Strongly Disagree"|data$`Didn't learn much`=="Disagree")
`Row entries IV`=intersect(temp1,temp2)
rm(list=ls(pattern="temp"))
# 2.5) Participants marked positive response when asked if they have used Jmol before, but failed to mention the purpose of use.
temp1=which(data$`Used Jmol before`=="Yes")
temp2=which(data$`Jmol use/purpose`=="Other")
temp3=which(data$`Jmol use/purpose (Other)`=="")
temp4=which(data$`Jmol use/purpose`=="")
`Row entries V`=intersect(temp1,intersect(temp2,temp3))
`Row entries VI`=intersect(temp1,temp4)
rm(list=ls(pattern="temp"))
# 2.6) Participants marked negative response when asked if they have used Jmol before, but mentioned the purpose of use.
temp1=which(data$`Used Jmol before`=="No")
temp2=which(data$`Jmol use/purpose`!="")
`Row entries VII`=intersect(temp1,temp2)
rm(list=ls(pattern="temp"))
# 2.7) Participants indicating reduced level of knowledge after workshop.
temp1=which(data$`Knowledge of using Jmol before workshop`=="Expert"&(data$`Knowledge of using Jmol after workshop`=="Proficient"|data$`Knowledge of using Jmol after workshop`=="Competent"|data$`Knowledge of using Jmol after workshop`=="Amateur"|data$`Knowledge of using Jmol after workshop`=="Novice"|data$`Knowledge of using Jmol after workshop`=="Unaware"))
temp2=which(data$`Knowledge of using Jmol before workshop`=="Proficient"&(data$`Knowledge of using Jmol after workshop`=="Competent"|data$`Knowledge of using Jmol after workshop`=="Amateur"|data$`Knowledge of using Jmol after workshop`=="Novice"|data$`Knowledge of using Jmol after workshop`=="Unaware"))
temp3=which(data$`Knowledge of using Jmol before workshop`=="Competent"&(data$`Knowledge of using Jmol after workshop`=="Amateur"|data$`Knowledge of using Jmol after workshop`=="Novice"|data$`Knowledge of using Jmol after workshop`=="Unaware"))
temp4=which(data$`Knowledge of using Jmol before workshop`=="Amateur"&(data$`Knowledge of using Jmol after workshop`=="Novice"|data$`Knowledge of using Jmol after workshop`=="Unaware"))
temp5=which(data$`Knowledge of using Jmol before workshop`=="Novice"&data$`Knowledge of using Jmol after workshop`=="Unaware")
`Row entries VIII`=union(union(union(union(temp1,temp2),temp3),temp4),temp5)
rm(list=ls(pattern="temp"))
# 2.8) Participants indicating reduced level of knowledge after screening task.
temp1=which(data$`Understanding of Jmol before screening task`=="Very High"&(data$`Understanding of Jmol after screening task`=="High"|data$`Understanding of Jmol after screening task`=="Nominal"|data$`Understanding of Jmol after screening task`=="Low"|data$`Understanding of Jmol after screening task`=="Very Low"))
temp2=which(data$`Understanding of Jmol before screening task`=="High"&(data$`Understanding of Jmol after screening task`=="Nominal"|data$`Understanding of Jmol after screening task`=="Low"|data$`Understanding of Jmol after screening task`=="Very Low"))
temp3=which(data$`Understanding of Jmol before screening task`=="Nominal"&(data$`Understanding of Jmol after screening task`=="Low"|data$`Understanding of Jmol after screening task`=="Very Low"))
temp4=which(data$`Understanding of Jmol before screening task`=="Low"&(data$`Understanding of Jmol after screening task`=="Very Low"))
`Row entries IX`=union(union(union(temp1,temp2),temp3),temp4)
rm(list=ls(pattern="temp"))
# 2.9) Checking for positive feedback in negative descriptive questions and vice versa.
`Row entries X`=which(data$`Most disliked aspect`==dplyr::filter(data, grepl("good|best|amazing", `Most disliked aspect`))$`Most disliked aspect`)
`Row entries XI`=which(data$`Most liked aspect`==dplyr::filter(data, grepl("bad|worse|poor", `Most liked aspect`))$`Most liked aspect`)

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 3) Combining all contradicting row entries.
`Row entries`=union(union(union(union(union(union(union(union(union(union(`Row entries I`,`Row entries II`),`Row entries III`),`Row entries IV`),`Row entries V`),`Row entries VI`),`Row entries VII`),`Row entries VIII`),`Row entries IX`),`Row entries X`),`Row entries XI`)

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 4) Removing all contradicting row entries. 
data=data[-`Row entries`,]

# -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  ----- ----- ----- -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  -----  #

# 5) Removing all R objects except for the data frame "data".
rm(list=setdiff(ls(),"data"))