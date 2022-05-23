library(EpiEstim)
library(ggplot2)
library(readxl)
library(incidence)

library(ggpubr)

load("Fiji2021cases.rda")
head(Fiji2021cases)

head(Fiji2021cases)

# computation of Rt using SI1
res_parametric_si1 <- estimate_R(incid=Fiji2021cases$I, 
                                 method="parametric_si",
                                 config = make_config(list(
                                   mean_si = 3.6, 
                                   std_si = 4.9,
                                   mean_prior = 2.6,
                                   std_prior = 2))
)

T <- nrow(Fiji2021cases)

plot(res_parametric_si1,'R')


# sensitivity analysis computation of Rt using SI2
res_parametric_si2 <- estimate_R(incid=Fiji2021cases$I, 
                                 method="parametric_si",
                                 config = make_config(list(
                                   mean_si = 2.3, 
                                   std_si = 3.4,
                                   mean_prior = 2.6,
                                   std_prior = 2))
)


# sensitivity analysis computation of Rt using SI3
res_parametric_si3 <- estimate_R(incid=Fiji2021cases$I, 
                                 method="parametric_si",
                                 config = make_config(list(
                                   mean_si = 4.24, 
                                   std_si = 3.95,
                                   mean_prior = 2.6,
                                   std_prior = 2))
)

# computation of Rt using different prior R0 (default epiestim)
res_parametric_si4 <- estimate_R(incid=Fiji2021cases$I, 
                                 method="parametric_si",
                                 config = make_config(list(
                                   mean_si = 3.6, 
                                   std_si = 4.9,
                                   mean_prior = 5,
                                   std_prior = 5))
)


#compute serial_distribution for calculation of overall infectivity                   
sitest <- discr_si(seq(0, T-1), 3.6, 4.9)

#compute overall infectivity using SI1
lambda <- overall_infectivity(incid=Fiji2021cases$I,sitest)

results1<-res_parametric_si1$R
results2<-res_parametric_si2$R
results3<-res_parametric_si3$R
results4<-res_parametric_si4$R
reslambda<-lambda

write.csv(results1, file = "results1.csv")
write.csv(results2, file = "results2.csv")
write.csv(results3, file = "results3.csv")
write.csv(results4, file = "results4.csv")
write.csv(reslambda, file = "lambda.csv")



