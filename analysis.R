library(tidyverse)
library(dslabs)

data("temp_carbon")

save(temp_carbon, file="rdas/temp_carbon.rda")

temp_carbon %>% ggplot(aes(year)) +
  geom_line(aes(y=carbon_emissions/1000)) +
  ylab("carbon emissions in billions of metric tons") +
  ggtitle("Annual carbon emissions by year, 1751-2014")

ggsave("figs/carbon_emissions_lineplot.png")

temp_carbon %>% ggplot(aes(year)) +
  geom_abline(slope=0, col="gray") +
  geom_line(aes(y=temp_anomaly, col="combined anomaly"), alpha=.5, lwd=.5) +
  geom_line(aes(y=land_anomaly, col="land anomaly"), alpha=.5, lwd=.5) +
  geom_line(aes(y=ocean_anomaly, col="ocean anomaly"), alpha=.5, lwd=.5) +
  geom_text(x=1810, y=0.06, label="20th Century Mean", col="gray65") +
  ylab(expression("temperature anomaly ("*~degree*"C)")) +
  ggtitle("Temperature anomaly relative to 20th century mean, 1880-2018") +
  theme(legend.position = c(.2,.7))

ggsave("figs/temp_anomaly_lineplot.png")

data("greenhouse_gases")

save(greenhouse_gases, file="rdas/greenhouse_gases.rda")

greenhouse_gases %>% ggplot(aes(year, concentration)) +
  geom_line() + 
  facet_grid(gas~., scales="free") +
  geom_vline(xintercept = 1850, col="gray65") +
  scale_x_continuous(breaks = c(0,500,1000,1500,1850,2000)) +
  ylab(expression(paste("Concentration (",CH[4],"/",N[2],"O ppb, ",CO[2]," ppm)"))) +
  ggtitle("Atmospheric greenhouse gas concentration by year, 0-2000")

ggsave("figs/greenhouse_gas_concentrations_lineplot.png")

data("historic_co2")

save(historic_co2, file="rdas/historic_co2.rda")

co2_time <- historic_co2 %>% ggplot(aes(year/1000, co2, col=source)) +
  geom_line() +
  ylab(expression(paste(CO[2]," concentration in ppm by volume"))) +
  xlab("millenium")

co2_time + 
  ggtitle(expression(paste("Atmospheric ",CO[2]," concentration over 800,000 years")))

ggsave("figs/historic_co2_800_millenia_lineplot.png")

co2_time + xlim(-800, -775) +
  ggtitle(expression(paste("Atmospheric ",CO[2]," 800,000 BCE - 775,000 BCE")))

ggsave("figs/historic_co2_800000BCE_775000BCE_lineplot.png")

co2_time + xlim(-375, -330) +
  ggtitle(expression(paste("Atmospheric ",CO[2]," 375,000 BCE - 330,000 BCE")))

ggsave("figs/historic_co2_375000BCE_330000BCE_lineplot.png")

co2_time + xlim(-140, -120) +
  ggtitle(expression(paste("Atmospheric ",CO[2]," 140,000 BCE - 120,000 BCE")))

ggsave("figs/historic_co2_140000BCE_120000BCE_lineplot.png")

historic_co2 %>% ggplot(aes(year, co2, col=source)) +
  geom_line() +
  geom_vline(xintercept = 1850, col="gray65") +
  ylab(expression(paste(CO[2]," concentration in ppm by volume"))) +
  xlim(-3000, 2018) +
  geom_text(x=1420, y=225, label="1850 CE", col="gray65") +
  ggtitle(expression(paste("Atmospheric ",CO[2]," 3000 BCE - 2018 CE")))

ggsave("figs/historic_co2_3000BCE_2018CE_lineplot.png")
