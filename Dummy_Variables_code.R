# One factor with 3 levels. Intercept is used as areference level
# 1st way
y    <- 1:6
c1   <- c(1,1,0,0,0,0)
c2   <- c(0,0,1,1,0,0)
c3   <- c(0,0,0,0,1,1)
c4   <- rep(1,6)

X1    <- cbind(c1,c2,c4)   #with the intercept

sol1a <- solve(t(X1)%*%X1)

reg1a <- lm(y ~ c1+c2) # the intercept epresses the 3rd level

# 2nd way

X1    <-  cbind(c1,c2,c3)  # without the intercept and withthe third level

sol1b <- solve(t(X1)%*%X1)

reg1b <- lm(y ~ c1+c2+c3-1)


### 2 factors ###

#1st way
c1   <- c(1,1,0,0,0,0)  # 1st factor, 1st level; three levels in total 
c2   <- c(0,0,1,1,0,0)  # 1st factor, 2nd level
c3   <- c(0,1,0,0,1,1)  # 2nd factor, 1st level; two levels in total 
c4   <- rep(1,6)        # intercept expresses the level of each of the two factors

X2   <- cbind(c1,c2,c3,c4) 

sol2 <- solve(t(X2)%*%X2)
df2  <- data.frame(y,X2)
lm2  <- lm(y ~ c1+c2+c3, data=df2)# c4 is icluded by default, is the intercept

## 2nd way

c1<- c(1,1,0,0,0,0)        #1st factor, 1st level; taking the three levels of the first factor 
c2<- c(0,0,1,1,0,0)        #1st factor, 2nd level 
c3<- c(0,0,0,0,1,1)        #1st factor, 3rd level 
c4<- c(0,1,0,0,1,1)        # taking only one level of the second level

X3   <- cbind(c1,c2,c3,c4) # without including the intercept
sol3 <- solve(t(X3)%*%X3)
df3  <- data.frame(y,X3)
lm3  <- lm(y ~ c1+c2+c3+c4-1)


