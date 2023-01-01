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

# Classification
data("PimaIndiansDiabetes")
df <- PimaIndiansDiabetes
head(df)

# Target: diabetes
glimpse(df)

df %>% 
  count(diabetes) %>%
  mutate(pct = n/sum(n))

mean(complete.cases(df))

# Build Model
split_data <- train_test_split(df)
train_data <- split_data[[1]]
test_data <- split_data[[2]]

set.seed(42)
crtl <- trainControl(method="cv",
                     number = 5,
                     verboseIter = T)

## build knn model
model <- train(diabetes ~ ., 
               data = train_data,
               method = "knn",
               metric = "Accuracy",
               trControl = ctrl)

p <- predict(model, newdata=test_data)

mean(p == test_data$diabetes)

## build another model
set.seed(42)
rf_model <- train(diabetes ~ ., 
               data = train_data,
               method = "rf",
               metric = "Accuracy",
               trControl = ctrl)

p2 <- predict(rf_model, newdata=test_data)

mean(p2 == test_data$diabetes)


## build decision tree model
set.seed(42)
tree_model <- train(diabetes ~ ., 
                  data = train_data,
                  method = "rpart",
                  metric = "Accuracy",
                  trControl = ctrl)

p3 <- predict(tree_model, newdata=test_data)

mean(p3 == test_data$diabetes)


## build logistic regression model
set.seed(42)
logit_model <- train(diabetes ~ ., 
                    data = train_data,
                    method = "glm",
                    metric = "Accuracy",
                    trControl = ctrl)

p4 <- predict(logit_model, newdata=test_data)

mean(p4 == test_data$diabetes)
