# Small illustration of using linear regression to estimate the effect
# of an alele on a phenotype.
set.seed(1)

# This is the number of samples to simulate.
n <- 1000 

# Simulate the genotype data.
# f = frequency of alternative allele (encoded as a 1).
f <- 0.2 
x <- (runif(n) < f) +
     (runif(n) < f)
hist(x)

# Simulate the phenotype data.
# b = how much Y increases for each copy of the alternative allele.
# se = level of variation (standard deviation) due to non-genetic factors.
b  <- 0.5
se <- 1
y <- rnorm(n,x*b,se)
hist(y,n = 32)

# Find the "best fit" line between genontype (x) and phenotype (y).
xj <- x + rnorm(n,sd = 0.1)
plot(xj,y,pch = 4,cex = 0.5)
