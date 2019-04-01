data { 
  int<lower=0> N;              // items 
  int<lower=0> K[N];           // initial trials 
  int<lower=0> y[N];           // initial successes 
} 
transformed data { 
  real min_y;   // minimum successes 
  real max_y;   // maximum successes 
  real mean_y;  // sample mean successes 
  real sd_y;    // sample std dev successes 
 
  min_y = min(y); 
  max_y = max(y); 
  mean_y = mean(to_vector(y)); 
  sd_y = sd(to_vector(y)); 
} 
parameters { 
  real<lower=0, upper=1> phi;         // population chance of success 
  real<lower=1> kappa;                // population concentration 
  vector<lower=0, upper=1>[N] theta;  // chance of success  
} 
model {
  phi ~ beta(0.01, 1);
  kappa ~ gamma(1, 0.01); // hyperprior (generic vague)
  theta ~ beta(phi * kappa, (1 - phi) * kappa);  // prior 
  y ~ binomial(K, theta);                        // likelihood 
} 
generated quantities { 
  real prob_diff[N];
 
  for (n in 1:N) {
    prob_diff[n] = theta[n] - phi;
  }
}
