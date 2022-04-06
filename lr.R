# Small illustration of using linear regression to estimate the effect
# of an alele on a phenotype.
set.seed(1)

# This is the number of samples to simulate.
n <- 200 

# Simulate the genotypes.
# f is the frequency of the alternative allele (encoded as a 1).
f <- 0.2 
x <- (runif(n) < f) +
     (runif(n) < f)
hist(x)

# Simulate the phenotypes.
# b is how much Y increases (on average) for each copy of the 1 allele.
# se = phenotype variation (standard deviation) due to non-genetic factors.
b  <- -0.3
se <- 1
y <- rnorm(n,x*b,se)
hist(y,n = 32)

# Find the "best fit" line relating genotype (x) to phenotype (y);
# i.e., perform linear regression of y given x.
xj <- x + rnorm(n,sd = 0.1)
plot(xj,y,pch = 4,cex = 0.5)
fit <- lm(y ~ x)
summary(fit)
b0 <- coef(fit)["(Intercept)"]
b  <- coef(fit)["x"]
abline(a = b0,b = b,col = "red",lty = "dashed")
