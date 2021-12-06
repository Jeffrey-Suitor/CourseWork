#FAMD Dry Run

library(tidyverse)
library(rgl)
library(aod)
library("readr")
library("FactoMineR")
library("factoextra")
library(pROC)

library(lmtest)

library("readr")
library("MASS")
library("car")
library("pscl")
library("caret")

data(wine)
df <- wine[,c(1,2, 16, 22, 29, 28, 30,31)]
head(df[, 1:7], 4)


heart = read_csv("~/school/4qz3-modelling/project/heart.csv")
#Cleaning blank BP and Cholesterol Values
heart = subset(heart, RestingBP>20) # Resting BP can't be 0
heart = subset(heart, Cholesterol>20) # Cholesterol can't be 0

#Factorize Qualitative Data
num_patients = nrow(heart)
heart$Sex <- as.factor(heart$Sex)
heart$ChestPainType <- as.factor(heart$ChestPainType)
heart$RestingECG <- as.factor(heart$RestingECG)
heart$ST_Slope <- as.factor(heart$ST_Slope)
heart$ExerciseAngina <- as.factor(heart$ExerciseAngina)

#Fix Fasting to Categorical
heart <- heart %>%
  mutate(FastingBS = replace(FastingBS, FastingBS == 1, "Y"))

heart <- heart %>%
  mutate(FastingBS = replace(FastingBS, FastingBS == 0, "N"))

heart$FastingBS <- as.factor(heart$FastingBS)

#==================================================================================

#Initial Model
model.full = glm(HeartDisease ~ Age + Sex + RestingBP + Cholesterol + FastingBS + MaxHR +
                   ExerciseAngina + Oldpeak + ST_Slope + ChestPainType + ST_Slope,
                 data=heart,
                 family = binomial(link="logit")
)
summary(model.full)

#==================================================================================
#Remove dependent variable (Heart Disease)
heart = subset(heart, select=-c(HeartDisease))

#===================================================================================

#Run FAMD (Factor Analysis of Mixed Data)
#Combines PCA (Numerical, Continuous) and MCA (Categorical)

res.famd <- FAMD(heart, ncp = 11, graph = TRUE)
print(res.famd)
eig.val <- get_eigenvalue(res.famd)
eig.val #Percent contributed to total variance by each Component
fviz_screeplot(res.famd) #Scree Plot


# Plot of variables
fviz_famd_var(res.famd, 'var', 
              axes = c(1, 2),
              col.var = 'cos2')
# Contribution to the first dimension
fviz_contrib(res.famd, "var", axes = 1)
# Contribution to the second dimension
fviz_contrib(res.famd, "var", axes = 2)
# Contribution to the third dimension and so on
fviz_contrib(res.famd, "var", axes = 3)
fviz_contrib(res.famd, "var", axes = 4)
fviz_contrib(res.famd, "var", axes = 5)

#=================================================================
#New Model
#Reduced from FAMD

model.reduced = glm(HeartDisease ~ Age  + RestingBP + FastingBS +RestingECG +
                   ExerciseAngina + Oldpeak + ST_Slope + ChestPainType + MaxHR,
                 data=heart,
                 family = binomial(link="logit"))

summary(model.reduced)

#Compare full to reduced. P < 2.2e-16, so we reject null and go with the full model
#This is backed by the fact that our PCs only cover 38% of the variance, but to cover 
#even 50% we need all 11 variables in some capacity.
lrtest(model.full, model.reduced)
anova(model.full, model.reduced, test = "chisq")


predictions = ifelse(predict(model.reduced, type="response") >= 0.5, 1, 0)
actual_values = model.reduced$y
conf_matrix = table(predictions, actual_values)
conf_matrix
sensitivity(conf_matrix)
specificity(conf_matrix)
