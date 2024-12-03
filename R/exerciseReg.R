#' Predictive Model based on Member Exercise Data
#'
#' @param x Input variable for linear regression to predict BMI; default = data$Calories_Burned
#'
#' @return Plots and summaries of a linear regression model
#' @export
#'
#' @examples exerciseReg()


exerciseReg <- function(x=data$Calories_Burned){
  #Creating a linear regression model to predict BMI given the user input variable
  model <- lm(BMI~x,data=data)
  print(summary(model))
  rSquared <- summary(model)$r.squared
  print(paste0("The multiple R-squared value is ", rSquared, ". This value is the proportion of variance in the dependent variable, BMI, that is explained by the independent input variable."))
  plot(model)
}
