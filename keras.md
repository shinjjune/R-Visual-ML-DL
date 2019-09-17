# 케라스에 내장된 MNIST 데이터셋을 가져오기

library(keras)
mnist <- dataset_mnist()
train_images <-mnist$train$x
train_images <-mnist$train$y
test_images <- mnist$test$x
test_images <- mnist$test$y

```
>str(train_images)
>str(train_labels)
>str(test_images)
>str(test_labels)
```
# 신경망 아키텍쳐
network <- keras_model_sequential() %>%
  layer_dense(units = 512, activation="relu", input_shape = c(28*28)) %>%
  layer_dense(units = 10, activation = "softmax")
  
  
# 컴파일 단계
network %>% compile(
  optimizer = "rmsprop",
  loss = "categorical_crossentropy",
  metrics = c("accuracy")
)

# 이미지 데이터 준비하기
train_images <- array_reshape(train_images, c(60000, 28*28))
train_images <- train_images/255

test_images <- array_reshape(test_images, c(10000, 28*28))
test_images <- test_images/255

# 레이블 준비하기
tarin_label <- to_categorical(train_labels)
test_labels <- to_categorical(test_labels)

```
>network %>% fit(train_images, train_labels, epochs =5, batch_size =128)
```
```
>metrics <- network %>% evaluate(test_images, test_labels)
>metrics
```
