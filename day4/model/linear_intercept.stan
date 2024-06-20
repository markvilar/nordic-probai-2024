data {
  int N;
  vector[N] x;
  vector[N] y;
}

parameters {
  real beta;
  real<lower = 0> sigma;
  real alpha;
}

model {
  // prior
  beta ~ normal(1, 1);
  sigma ~ gamma(1, 1);
  alpha ~ normal(0, 20);
  
  // likelihood
  y ~ normal(x * beta + alpha, sigma);
}

generated quantities {
  array[N] real y_pred = normal_rng(beta * x + alpha, sigma);
}
