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

# Adding default values

add_percent <- function(value, multiplier = 100, no_digits = 1)
{
  # Multiply the number by inputted multiplier, and only show 1 digit
  percent <- round(value * multiplier, digits = no_digits)
  result <- paste(percent, "%", sep = "")
  # Return the calculation. Note this is optional 
  #since R returns the value of the last line of code
  return(result)
}

add_percent_result <- add_percent(Input_var)
add_percent_result

# decision making --------------------------------------------------------


price_calculator <- function(hours, pph = 40){
  net_price <- hours * pph
  round(net_price)
  return(net_price)
}

price_calculator(hours = 10)


# Adding a simple IF statement
# Adding a simple IF statement

price_calculator <- function(hours, pph = 40){
  net_price <- hours * pph
  if(hours > 100) {
    net_price <- net_price * 0.9
  }
  round(net_price)
  return(net_price)
}

price_calculator(hours = 100)
price_calculator(hours = 90)


price_calculator <- function(hours, pph = 40, public = TRUE){
  net_price <- hours * pph
  if(hours > 100) {
    net_price <- net_price * 0.9
  }
  if(public){
    total_price <- net_price * 1.06
  }
  else {
    total_price <- net_price * 1.12
  }
  round(total_price)
  return(total_price)
}

price_calculator(45, public = TRUE)
price_calculator(120, public = FALSE)

#complex function example
my_stats <- function(x, parametric=TRUE, print=FALSE){
  # Use an IF statement to check if value
  # of the "parametric variable is TRUE
  if (parametric){
    # If true, set CT to use mean and SD
    central_tendency <- mean(x)
    spread <- sd(x)
  }
  else 
  {
    # otherwise it is false. Use median and
    # median absolute deviation
    central_tendency <- median(x)
    spread <- mad(x)
  }
  if (print & parametric) # if both are true
  {
    # Concatenate is the same as print function
    cat("Mean=", central_tendency, "\n", "SD=", spread, "\n")
  } 
  else if (print & !parametric) 
  {
    cat("Median=", central_tendency, "\n", "MAD=", spread, "\n")
  }
  result <- list(central_tendency, spread)
  return(result)
}

#Set the environment to test this function
set.seed(34)
# rnorm generates a random value from the normal distribution
random_numbers <- rnorm(500)
random_numbers
plot(random_numbers)
summary(random_numbers)

my_stat_result <- my_stats(random_numbers, parametric = FALSE, print = TRUE)
# my_stat_result <- my_stats(random_numbers) # doesnt show anything - print is set to FALSE by default
my_stat_result

# Switch function
mydate <- function(type="long") {
  switch(type,
         long = format(Sys.time(), "%A %B %d %Y"),
         short = format(Sys.time(), "%m-%d-%y"),
         # cat used to output objects
         cat(type, "is not a recognised type")
  )
}

mydate("long")
mydate("short")
mydate()
mydate("medium")