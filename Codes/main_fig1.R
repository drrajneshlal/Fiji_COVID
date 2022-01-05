#main fig 1
library(EpiEstim)
library(ggplot2)
library(readxl)
library(incidence)

library(ggpubr)

load("Fiji2021cases.rda")
head(Fiji2021cases)
                
res_parametric_si <- estimate_R(incid=Fiji2021cases$I, 
                                method="parametric_si",
                                config = make_config(list(
                                  mean_si = 5.4, 
                                  std_si = 1.5,
                                  mean_prior = 2.6,
                                  std_prior = 2))
)


ps<-plot(res_parametric_si,"incid",options_I = list(col = c("blue"), transp = 0.7, xlim =NULL, ylim = c(0,1500), interval =
                                                                  1L, xlab = "Time (Number of days from April 19, 2021)", ylab = "Daily incidence"),legend = FALSE)+ scale_x_continuous(breaks=seq(0,230,10))
pr<-plot(res_parametric_si,"R", options_R = list(col = c("black"), transp = 0.2, xlim = c(0,230), ylim = c(0,6), xlab =
                                                                "Time (Number of days from April 19, 2021)", ylab = "Reproduction number"),legend = TRUE)+theme(legend.position = "bottom")+ scale_x_continuous(breaks=seq(0,230,10))



pdf("fig1.pdf")

gridExtra::grid.arrange(ps, pr,nrow = 2)


dev.off() 


 