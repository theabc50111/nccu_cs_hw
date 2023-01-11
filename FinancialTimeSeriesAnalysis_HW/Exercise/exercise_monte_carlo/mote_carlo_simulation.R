par(mfrow=c(4,2), mar = c(2, 2, 2, 2))

# ==========================simulate a population==========================
# simulate a population(1000 points) which come from a linear model 
set.seed(100)
x1=rnorm(1000,50,3)
error=rnorm(1000,0,2)
y1=23 + 2*x1 + error
fit <- lm(y1~x1)
plot(x = x1, y = y1)
abline(fit)
mtext(paste("Population data(linear); x1:", fit$coefficients[2], "intercept:",fit$coefficients[1], sep=" "))
# ==========================simulate a population==========================


# ==========================sampling small samples==========================
# sampling small samples from the simulate population
rand_ind = sample(1000, 10)  # sampling ten points
small_sample = list(x = x1[rand_ind], y = y1[rand_ind])
plot(x = small_sample$x, y = small_sample$y)
mtext(paste("sample from simulation of population(linear model)", sep=" "))
# ==========================sampling small samples==========================


# ==========================monte-carlo-simulation(based on 2-degree-polynomial-model)==========================
# use small samples to fit a polynomial-model(we assume these small sample come from a polynomial-model)
# assuming model: y = intcp + a1x + a2x^2 
small_sample_pl_fit <- lm(small_sample$y ~ poly(small_sample$x, 2))  # 2 is degree of polynomial-model
print(small_sample_pl_fit$coefficients)

# use #[random samples from normal distribution]# and [small_sample_pl_fit$coefficients] and [small_sample$x] to generate new data
monte_carlo_sim_pl_x1_d2_coef <- NULL
monte_carlo_sim_pl_x1_coef <- NULL
monte_carlo_sim_pl_intercept <- NULL

for ( i in 1:10000) {  # 10000 iterations of monte-carlo-simulation
  new_y = small_sample_pl_fit$coefficients[1] + small_sample_pl_fit$coefficients[2]*small_sample$x  + small_sample_pl_fit$coefficients[2]*small_sample$x^2 + rnorm(10,0,1)
  monte_carlo_pl_fit <- lm(new_y ~ poly(small_sample$x, 2))
  monte_carlo_sim_pl_x1_d2_coef =c(monte_carlo_sim_pl_x1_d2_coef, monte_carlo_pl_fit$coefficients[3])
  monte_carlo_sim_pl_x1_coef =c(monte_carlo_sim_pl_x1_coef, monte_carlo_pl_fit$coefficients[2])
  monte_carlo_sim_pl_intercept =c(monte_carlo_sim_pl_intercept, monte_carlo_pl_fit$coefficients[1])
}

hist(monte_carlo_sim_pl_x1_d2_coef, breaks=100)
abline(v=small_sample_pl_fit$coefficients[3], col=2, lty=3, lwd=4)
hist(monte_carlo_sim_pl_x1_coef, breaks=100)
abline(v=small_sample_pl_fit$coefficients[2], col=2, lty=3, lwd=4)
hist(monte_carlo_sim_pl_intercept, breaks=100)
abline(v=small_sample_pl_fit$coefficients[1], col=2, lty=3, lwd=4)
plot(0)
mtext("For typography, this subplot means nothing")

mc_sim_pl_x1_d2_coef_upper = quantile(monte_carlo_sim_pl_x1_d2_coef, probs=0.95)
mc_sim_pl_x1_d2_coef_lower = quantile(monte_carlo_sim_pl_x1_d2_coef, probs=0.05)
mc_sim_pl_x1_coef_upper = quantile(monte_carlo_sim_pl_x1_coef, probs=0.95)
mc_sim_pl_x1_coef_lower = quantile(monte_carlo_sim_pl_x1_coef, probs=0.05)
mc_sim_pl_intcp_upper = quantile(monte_carlo_sim_pl_intercept, probs=0.95)
mc_sim_pl_intcp_lower = quantile(monte_carlo_sim_pl_intercept, probs=0.05)

if (small_sample_pl_fit$coefficients[3] < mc_sim_pl_x1_d2_coef_upper &
    small_sample_pl_fit$coefficients[3] > mc_sim_pl_x1_d2_coef_lower &
    small_sample_pl_fit$coefficients[2] < mc_sim_pl_x1_coef_upper & 
    small_sample_pl_fit$coefficients[2] > mc_sim_pl_x1_coef_lower &
    small_sample_pl_fit$coefficients[1] < mc_sim_pl_intcp_upper &
    small_sample_pl_fit$coefficients[1] > mc_sim_pl_intcp_lower){
  print("small samples is come from the 2-dgree-polynomial-regression model")
}else{
  print("small samples is not come from the 2-dgree-polynomial-regression model")
}
# ==========================monte-carlo-simulation(based on 2-degree-polynomial-model)==========================


# ==========================monte-carlo-simulation(based on linear-regression-model)==========================
# use small samples to fit a simple-linear-model(we assume these small sample come from a simple-linear-model)
# assuming model: y = intcp + ax 
small_sample_lm_fit <- lm(small_sample$y~small_sample$x)
print(small_sample_lm_fit$coefficients)

# use #[random samples from normal distribution]# and [small_sample_lm_fit$coefficients] and [small_sample$x] to generate new data
monte_carlo_sim_lm_x1_coef <- NULL
monte_carlo_sim_lm_intercept <- NULL

for ( i in 1:10000) {  # 10000 iterations of monte-carlo-simulation
  new_y = small_sample_lm_fit$coefficients[1] + small_sample_lm_fit$coefficients[2]*small_sample$x + rnorm(10,0,1)
  monte_carlo_lm_fit <- lm(new_y~small_sample$x)
  monte_carlo_sim_lm_x1_coef =c(monte_carlo_sim_lm_x1_coef, monte_carlo_lm_fit$coefficients[2])
  monte_carlo_sim_lm_intercept =c(monte_carlo_sim_lm_intercept, monte_carlo_lm_fit$coefficients[1])
}


hist(monte_carlo_sim_lm_x1_coef, breaks=100)
abline(v=small_sample_lm_fit$coefficients[2], col=2, lty=3, lwd=4)
hist(monte_carlo_sim_lm_intercept, breaks=100)
abline(v=small_sample_lm_fit$coefficients[1], col=2, lty=3, lwd=4)

mc_sim_lm_x1_coef_upper = quantile(monte_carlo_sim_lm_x1_coef, probs=0.95)
mc_sim_lm_x1_coef_lower = quantile(monte_carlo_sim_lm_x1_coef, probs=0.05)
mc_sim_lm_intcp_upper = quantile(monte_carlo_sim_lm_intercept, probs=0.95)
mc_sim_lm_intcp_lower = quantile(monte_carlo_sim_lm_intercept, probs=0.05)

if (small_sample_lm_fit$coefficients[2] < mc_sim_lm_x1_coef_upper & 
    small_sample_lm_fit$coefficients[2] > mc_sim_lm_x1_coef_lower &
    small_sample_lm_fit$coefficients[1] < mc_sim_lm_intcp_upper &
    small_sample_lm_fit$coefficients[1] > mc_sim_lm_intcp_lower){
  print("small samples is come from the linear model")
}else{
  print("small samples is not come from the linear model")
}
# ==========================monte-carlo-simulation(based on linear-regression-model)==========================





