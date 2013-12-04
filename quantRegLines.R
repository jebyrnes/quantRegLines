###############
#  quantRegLines - a function to plot lines from 
#  a quantile regression at multiple levels of Tau
#
# Jarrett Byrnes
#
# Last Updated Dec 2, 2013
#
# Changelog
###############

require(quantreg)
#n.b. this is prety much lifted from the ?quantreg 
#help file
quantRegLines <- function(rq_obj, lincol="red", ...){  
  #get the taus
  taus <- rq_obj$tau
  
  #get x
  x <- rq_obj$x[,2] #assumes no intercept
  xx <- seq(min(x, na.rm=T),max(x, na.rm=T),1)
  
  #calculate y over all taus
  f <- coef(rq_obj)  
  yy <- cbind(1,xx)%*%f
  
  if(length(lincol)==1) lincol=rep(lincol, length(taus))
  #plot all lines
  for(i in 1:length(taus)){
    lines(xx,yy[,i], col=lincol[i], ...)
  }
  
}


# #An Example
# library(scales)
# data(engel)
# attach(engel)
# 
# taus <- c(.05,.1,.25,.75,.9,.95)
# plot(income,foodexp,xlab="Household Income",ylab="Food Expenditure",
#      pch=19, col=alpha("black", 0.5))
# 
# rq_fit <- rq((foodexp)~(income),tau=taus)
# 
# quantRegLines(rq_fit)