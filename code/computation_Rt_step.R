library(EpiEstim)
library(ggplot2)
library(readxl)
library(incidence)

library(ggpubr)

load("Fiji2021cases.rda")
head(Fiji2021cases)

head(Fiji2021cases)


#t_start <- c(2, 6,13,20,38,43,56,81,86,104,136,157,174,183,202,212,219) # starting at 2 as conditional on the past observations
#t_end <- c(5,12,19,37,42,55,80,85,103,135,156,173,182,201,211,218,227)

t_start <- c(2, 6,13,20,38,43,81,86,104,136,157) # starting at 2 as conditional on the past observations
t_end <- c(5,12,19,37,42,80,85,103,135,156,227)

# computation of Rt using SI1
res_parametric_si1 <- estimate_R(incid=Fiji2021cases$I, 
                                 method="parametric_si",
                                 config = make_config(list(
                                   t_start = t_start,
                                   t_end = t_end,
                                   mean_si = 3.6, 
                                   std_si = 4.9,
                                   mean_prior = 2.6,
                                   std_prior = 2))
)



plot(res_parametric_si1,'R') 

results1<-res_parametric_si1$R


write.csv(results1, file = "stepRfinal.csv")
