library(caret)

model1 <- lm(mpg ~hp+wt,
             data = mtcars)
model1

#caret
model2 <- train(mpg ~ hp + wt,
                data = mtcars,
                method = "lm")

model2$finalModel
##function in R
train_Datafuntion <- function(data,train_size=0.8){
  set.seed(47)
  n   <- nrow(data)
  id  <- sample(n,size = n * train_size)
  train_data <- data[id,]
  test_data <- data[-id,]
  return(list(train_data,test_data))
}

## 1.Prepare / split Data
split_data <- train_Datafuntion(mtcars)
train_data <- split_data[[1]]
test_data  <- split_data[[2]]

## 2.train model
set.seed(47)
crlt <- trainControl(method = "repeatedcv",
                    number = 5,
                    repeats = 5,
                    verboseIter = T)

model <- train(mpg ~ hp + wt,
      data = train_data,
      method = "lm",
      trControl = crlt)
## 3.score model / prediction
p_mpg <- predict(model,newdata = test_data)
## 4.evaluate model
error <- p_mpg - test_data$mpg
(test_rmse <- sqrt(mean(error ** 2)))

## 5.save model
saveRDS(model,"LinearReg_model.RDS")
