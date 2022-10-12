# 1
# 1-1
# 1-1-a
seq(1,20)
# 1-1-b
seq(20,1)
# 1-1-c
c(seq(1,20), seq(19,1))
# 1-1-d
tmp <- c(4, 6, 3)
# 1-1-e
rep(tmp, 10)
# 1-1-f
rep(v1, 10, length.out=31)
# 1-1-g
rep(tmp,times=c(10,20,30))
# 1-2
x <- seq(3, 6, 0.1)
exp(x)*cos(x)
# 1-3
# 1-3-a
(0.1 ^ seq(3, 36, 3)) * (0.2 ^ seq(1, 34, 3))
# 1-3-b
2 ^ seq(1, 25) / seq(1, 25)
# 1-4
# 1-4-a
seq(10, 100) ^ 3 + 4 * seq(10, 100) ^ 2
# 1-4-b
sum_seq = seq(1,25)
sum((2 ^ sum_seq / sum_seq) + (3 ^ sum_seq / sum_seq ^ 2))
# 1-5
# 1-5-a
paste("label", 1:30, sep=" ")
# 1-5-b
paste("fn", 1:30, sep="")
# 1-6
# 1-6-a
set.seed(50)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
nex_vec_1 <- yVec[2:250] - xVec[1:249]
nex_vec_1
# 1-6-b
nex_vec_2 <- sin(yVec[1:249])  / cos(xVec[2:250])
nex_vec_2
# 1-6-c
new_vec_3 <- xVec[1:248] + 2*xVec[2:249] - xVec[3:250]
new_vec_3
# 1-6-d
new_vec_4 <- sum((exp(-1*xVec[2:250])) / (xVec[1:249]+10))
new_vec_4
# 1-7
# 1-7-a
mask_1 = yVec > 600
yVec[mask_1]
# 1-7-b
which(mask_1)
# 1-7-c
xVec[mask_1]
# 1-7-d
mean_x = mean(xVec)
sqrt(abs(xVec-mean_x))
# 1-7-e
sum( yVec>max(yVec)-200 )
# 1-7-f
mask_2 = (xVec %% 2 == 0)
sum(mask_2)
# 1-7-g
xVec[order(yVec)]
# 1-7-h
yVec[seq(1, 250, 3)] # also yVec[c(T,F,F)]
# 1-8
frac_seq = seq(2, 38, 2)/seq(3, 39, 2)
sum(cumprod(frac_seq))+1
# 2-1
judge_dice_sum <- function(){
  dice_sum <- sum(sample(1:6, 3, replace = TRUE))
  if (dice_sum > 13){
    return("Good!!")
  }
  else{
    return("Try Again")
  }
} 

judge_dice_sum()

# 2-2
install.packages('knitr', dependencies = TRUE)
library(knitr)
an <- function (n){
  (n + 3) / (n + 8)
}
bn <- function (n){
  (2 * n^2 + 3) / (2 * n^2 + 8 * n)
}
cn <- function (n){
  sqrt(n) / (2 + sqrt(n))
}
n <- c(1, seq(10,100, by=10), 10000)
knitr::kable(cbind(n, an(n=n), bn(n=n), cn(n=n)), col.names = c("n", "an", "bn", "cn"))

# 2-3
fx <- function(x){
  ifelse(x<0, abs(x^2 + x), ifelse(x<3, sin(x), 3 * exp(x)))
}
x<- seq(-5, 5)
fx(x)
knitr::kable(cbind(x, fx(x)), col.names = c("n", "fx"))
