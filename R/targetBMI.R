#' Recommend Exercise Routine based on a Target BMI
#'
#' @param x The BMI you wish to reach; defaults to 21.75 - the middle of the healthy range
#'
#' @return A print out with descriptive text and calculated variables that shows the exercise routine of observations with similar BMI's to the target, x
#' @export
#'
#' @examples targetBMI()
#' @examples targetBMI(28)
#' @examples targetBMI(x=17)


targetBMI <- function(x = 21.75){
  #Takes the inputted target BMI and sets the bounds for those considered similar (+ or - 4)
  targetUpper <- x + 4
  targetLower <- x - 4

  #Selects the observations within those BMI bounds
  target <- data[data$BMI >= targetLower & data$BMI <= targetUpper,]

  #Analyzes the selected observations to determine how they exercise (type and schedule)
  type <- table(target['Workout_Type'])
  days_average <- mean(as.numeric(target$Workout_Frequency.daysPerWeek))
  session_average <- mean(target$Session_Duration.hours)
  weekly_average <- mean(target$Workout_Hours.Weekly)

  #Prints out the results
  print(paste0("Your inputted target BMI is ", x))
  print(paste0("Below are stats for members with a similar BMI (+-4): "))
  print("These are the types of workouts: ")
  print(type)
  print(paste0("This is the average workout days per week: ", days_average))
  print(paste0("This is the average session length (in hours): ", session_average))
  print(paste0("This is the average weekly length (in hours): ", weekly_average))
}
