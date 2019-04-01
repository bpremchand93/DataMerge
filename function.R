#Function accepts a vector and calculated the percentage value for each element

add_percent <- function(input, mul_variable, no_of_digit)
{
  percent <- round(input * mul_variable, digits = no_of_digit)
  result <- paste(percent, "%", sep = "")
  # Return the calculation. Note this is an optional
  # since R returns the values of the last line of code
  return(result)
}

Input_var <- c(0.458, 1.6653, 0.83113)
mul_variable <- c(0.458, 1.6653, 0.83113)
no_of_digit <- 2
updated_vector <- add_percent(Input_var, mul_variable= 100, no_of_digit=3)
updated_vector