library(EpiEstim)
library(ggplot2)
library(readxl)
library(incidence)

library(ggpubr)


load("Fiji2021cases.rda")

head(Fiji2021cases)

res_parametric_si1 <- estimate_R(incid=Fiji2021cases$I, 
                                method="parametric_si",
                                config = make_config(list(
                                  mean_si = 5.4, 
                                  std_si = 1.5,
                                  mean_prior = 2.6,
                                  std_prior = 2))
)

res_parametric_si2 <- estimate_R(incid=Fiji2021cases$I, 
                                method="parametric_si",
                                config = make_config(list(
                                  mean_si = 5.9, 
                                  std_si = 4.1,
                                  mean_prior = 2.6,
                                  std_prior = 2))
)


er1<-res_parametric_si1$R
er2<-res_parametric_si2$R
write.csv(er1, file = "my_data1.csv")
write.csv(er2, file = "my_data2.csv")
