model <-readRDS("LinearReg_model.RDS")
## Batch Prediction
nov_data <- data.frame(
  id = 1:3,
  hp = c(200,158,188),
  wt = c(2.5,1.9,5.2)
)
nov_predic <- predict(model,newdata = nov_data)

## write CSV
nov_data$pred <- nov_predic
write.csv(nov_data,"resultNov.csv",row.names = F)
