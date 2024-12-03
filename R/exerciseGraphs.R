#' Graphs Based on Member Exercise Data
#'
#' @param y_axis Which variable will be on the x_axis; default = data$Workout_Hours.Weekly
#' @param point_color Which variable the points will be colored by; default = data$Workout_Type
#'
#' @return A scatterplot with a regression line
#' @export
#'
#' @examples exerciseGraphs()
#' @examples exerciseGraphs(data$Session_Duration.hours,data$Experience_Level)


exerciseGraphs <- function(y_axis = data$Workout_Hours.Weekly, point_color = data$Workout_Type){
   #Creates a Scatterplot with BMI on the x axis and the user input on the y axis. Then, plots a regression line through them to see if there's any trends (primarily to see what effect different variables have on BMI)
   library(ggplot2)
   library(gridExtra)
   plot1 <- ggplot(data=data, aes(x=BMI,y=y_axis)) + geom_point(aes(color=point_color)) +
    geom_smooth() +
    ggtitle("exerciseGraph - BMI Plotted Against User Input") +
    ylab("Input Variable") +
    labs(color = "Input Factor")
   #Creates a Bar graph with BMI on the y axis and the user input factor for point_color on the x-axis, to give a more clear view of the association between the chosen factor and BMI.
   plot2<- ggplot(data=data, aes(x=point_color, y=BMI)) +
    geom_bar(stat="identity", color="blue", fill="white") +
    ggtitle("Count of Input Factor BMI Count")
   #Arranges the two plots side by side using the gridExtra package
   grid.arrange(plot1,plot2,ncol=2)
}
