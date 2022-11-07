# 1-A
ans_1_A = c(rep(4, 50), rep(6, 150), rep(3, 80))
ans_1_A
# 1-B-(1)
x = seq(3, 203, 4)
y = seq(5, 155, 3)
ans_1_B_1 = 0.3 ^ x * 0.8 ^ y
ans_1_B_1
# 1-B-(2)
n = seq(1, 99, 1)
ans_1_B_2 = (3 ^ n) / n
ans_1_B_2
# 1-C
ans_1_C = NULL
for (i in seq(2, 100, 2)){
  ans_1_C <- c(ans_1_C,paste("xyz ", i ,sep = ""))
}
ans_1_C
# 1-D
i = seq(99, 199, 1)
ans_1_D <- sum((i ^ 3) + (4 * (i ^ 2)))
ans_1_D

# 2
# sample data for my.dat
N <- 1024
set.seed(2022)
my.dat <- sample(1:500, N, replace=TRUE)
ans_2 = my.dat[seq(((500-2)%%5), N, 5)]
ans_2

# 3-A
n <- 1000
set.seed(2022)
x <- sample(1:1000, n, replace=TRUE)
y <- sample(1:1000, n, replace=TRUE)
ans_3_A <- (300 < y) & (y < 600)
ans_3_A
######### uncomment following codes to check results ######### 
# head(300 < y) 
# head(y < 600)
# head((300 < y) & (y < 600))
######### uncomment above codes to check results ######### 

# 3-B
ans_3_B <- x[(300 < y) & (y < 600)]
ans_3_B
######### uncomment following codes to check results ######### 
# sum((300 < y) & (y < 600))
# length(ans_3_B)
######### uncomment above codes to check results ######### 

# 4
test.f<-function(m,n){
  cat("\n")
  a<-1
  for (k in m:n) 
  {
    for (p in 1:a)
    {
      cat(k,"*",p,"=",k*p,"\t")
    }
    a<-a+1
    cat("\n")
  }
  cat("\n")
}
ans_4 = test.f(m=9,n=3)
ans_4
################## outlook of ans_4 ##################
# 
# 9 * 1 = 9 	
# 8 * 1 = 8 	8 * 2 = 16 	
# 7 * 1 = 7 	7 * 2 = 14 	7 * 3 = 21 	
# 6 * 1 = 6 	6 * 2 = 12 	6 * 3 = 18 	6 * 4 = 24 	
# 5 * 1 = 5 	5 * 2 = 10 	5 * 3 = 15 	5 * 4 = 20 	5 * 5 = 25 	
# 4 * 1 = 4 	4 * 2 = 8 	4 * 3 = 12 	4 * 4 = 16 	4 * 5 = 20 	4 * 6 = 24 	
# 3 * 1 = 3 	3 * 2 = 6 	3 * 3 = 9 	3 * 4 = 12 	3 * 5 = 15 	3 * 6 = 18 	3 * 7 = 21 	
# 
################## outlook of ans_4 ##################
