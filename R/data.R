#' Gym Member's Exercise Data
#'
#' A dataset that includes the information of various member's of a gym. Data has been cleaned by me, having done the following things: change some variable types to factor, rename columns, and create a new column.
#'
#' @format ## `data`
#' A data frame with 7,240 rows and 60 columns:
#' \describe{
#'   \item{Age}{Age}
#'   \item{Gender}{Gender: Male or Female}
#'   \item{Weight.kg}{Weight in kilograms}
#'   \item{Height.m}{Height in meters}
#'   \item{Max_BPM}{Max BPM}
#'   \item{Avg_BPM}{Average BPM}
#'   \item{Resting_BPM}{Resting BPM}
#'   \item{Session_Duration.hours}{Hours of exercise in one day/session}
#'   \item{Calories_Burned}{Calories burned during one session}
#'   \item{Workout_Type}{Type of workout}
#'   \item{Fat_Percentage}{Fat percentage}
#'   \item{Water_Intake.liters}{Water intake in liters}
#'   \item{Workout_Frequency.daysPerWeek}{Sessions/days per week}
#'   \item{Experience_Level}{Experience level}
#'   \item{BMI}{BMI}
#'   \item{Workout_Hours.Weekly}{Hours worked out per week. Created manually by me by multiplying Workout_Frequency by Session_Duration}
#' }
#' @source <https://www.kaggle.com/datasets/valakhorasani/gym-members-exercise-dataset>
#' @examples
#' data(data)
"data"
