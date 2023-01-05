par(mfrow=c(2,2), mar = c(2, 2, 2, 2))

# simulate a population(1000 points) which come from a linear model 
set.seed(100)
x1=rnorm(1000,50,3)
error=rnorm(1000,0,2)
y1=23 + 2*x1 + error
fit <- lm(y1~x1)
plot(x = x1, y = y1)
abline(fit)
mtext(paste("simulation simple linear data; x1:", fit$coefficients[2], "intercept:",fit$coefficients[1], sep=" "))

# sampling small samples from the simulate population
rand_ind = sample(1000, 10)  # sampling ten points
small_sample = list(x = x1[rand_ind], y = y1[rand_ind])
plot(x = small_sample$x, y = small_sample$y)
mtext(paste("sample from simulation of population(linear model)", sep=" "))

# monte-carlo-simulation start
# use small samples to fit fitted-coefficients
small_sample_fit <- lm(small_sample$y~small_sample$x)
cat(small_sample_fit$coefficients)

# use [small_sample_fit$coefficients] and [random samples from normal distribution] and [small_sample$x] to generate new data
monte_carlo_sim_x1_coef <- NULL
monte_carlo_sim_intercept <- NULL
for ( i in 1:10000) {  # 10000 iterations of monte-carlo-simulation
  new_y = small_sample_fit$coefficients[1] + small_sample_fit$coefficients[2]*small_sample$x + rnorm(10,0,1)
  monte_carlo_fit <- lm(new_y~small_sample$x)
  monte_carlo_sim_x1_coef =c(monte_carlo_sim_x1_coef, monte_carlo_fit$coefficients[2])
  monte_carlo_sim_intercept =c(monte_carlo_sim_intercept, monte_carlo_fit$coefficients[1])
}


hist(monte_carlo_sim_x1_coef, breaks=100)
abline(v=small_fit$coefficients[2], col=2, lty=3, lwd=4)
hist(monte_carlo_sim_intercept, breaks=100)
abline(v=small_fit$coefficients[1], col=2, lty=3, lwd=4)

mc_sim_x1_coef_upper = quantile(monte_carlo_sim_x1_coef, probs=0.95)
mc_sim_x1_coef_lower = quantile(monte_carlo_sim_x1_coef, probs=0.05)
mc_sim_intcp_upper = quantile(monte_carlo_sim_intercept, probs=0.95)
mc_sim_intcp_lower = quantile(monte_carlo_sim_intercept, probs=0.05)


if (small_fit$coefficients[2] < mc_sim_x1_coef_upper & small_fit$coefficients[2] > mc_sim_x1_coef_lower){
  print("small samples is come from the linear model")
}else{
  print("small samples is not come from the linear model")
}


