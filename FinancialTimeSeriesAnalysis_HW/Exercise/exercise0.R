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
rep(v1, 10)
# 1-1-f
c(rep(v1, 10), 4)
# 1-1-g
c(rep(4, 10), rep(6, 20), rep(3, 30))
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
(2 ^ sum_seq / sum_seq) + (3 ^ sum_seq / sum_seq ^ 2)
# 1-5
# 1-5-a
paste("label", 1:30, sep=" ")
# 1-5-b
paste("fn", 1:30, sep="")
