#' Recommend Exercise Routines based on BMI
#'
#' @param x An index/observation of the "data" data set to select; defaults to 1
#'
#' @return Observations from the "data" data set are printed to the console.
#' @export
#'
#' @examples recommendBMI()
#' @examples recommendBMI(73)
#' @examples recommendBMI(x = 105)


recommendBMI <- function(x = 1){
  #Select the inputted row as an index, creating a data frame with it alone, removing unnecessary columns
  member <- data[x,]
  member <- member[,-c(5,6,7)]

  #Create variables from the new data frame
  age <- member$Age
  BMI <- member$BMI
  Weight <- member$Weight.kg
  Height <- member$Height.m

  #Create upper and lower bounds of variables to aid in searching the original data frame, "data"
  HeightUpper <- Height + 0.25
  HeightLower <- Height - 0.25
  WeightUpper <- Weight + 9
  WeightLower <- Weight - 9
  BMIUpper <- BMI + 0.15
  BMILower <- BMI - 0.15

  #If statement to check if the member is an adult or not. It's not a perfect system, but BMI is less reliable in children as they're likely still growing, so this is a way to check that.
  if(age >= 18) {

    #Similar takes other members from "data" with a BMI +- 0.15 of the inputted member
    #Healthy finds members in "data" that are in a healthy BMI range with similar weight and height as the inputted member
    similar <- data[data$BMI < BMIUpper & data$BMI > BMILower,]
    healthy <- data[data$BMI >= 18.5 & data$BMI <25,]
    healthy <- healthy[healthy$Weight.kg > WeightLower & healthy$Weight.kg < WeightUpper,]
    healthy <- healthy[healthy$Height.m > HeightLower & healthy$Height.m < HeightUpper,]

    #If statements to check which range the user's BMI is in and print the results (according to the CDC: https://www.cdc.gov/bmi/adult-calculator/bmi-categories.html)
    if (BMI < 18.5){
      print("With a BMI of: ", BMI, ", this member is underweight.")
    }
    if (BMI >= 18.5 & BMI < 25){
      print(paste0("With a BMI of: ", BMI, ", this member is a healthy weight."))
    }
    if (BMI >= 25 & BMI < 30){
      print(paste0("With a BMI of: ", BMI, ", this member is overweight."))
    }
    if (BMI >= 30 & BMI < 35){
      print(paste0("With a BMI of: ", BMI, ", this member is class one obese"))
    }
    if (BMI >= 35 & BMI < 40){
      print(paste0("With a BMI of: ", BMI, ", this member is class two obese."))
    }
    if (BMI > 40){
      print(paste0("With a BMI of: ", BMI, ", this member is class three obese."))
    }
    #Print similar and healthy
    print("These members have a similar BMI to this member:")
    print(similar)
    print("These members have a BMI in the healthy range, with similar physical measurements as this member. Consider using them as a guide for how to reach a healthy BMI:")
    print(healthy)
  }
    #Else statement for if the member is under 18
  else{
      print("This member has a BMI of: ", BMI, ". Since they are under 18, the healthy BMI ranges for the member are uncertain.")
  }
}
