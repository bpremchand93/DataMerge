# Enter data into vectors before constructing the data frame
date_col <- c("2018-15-10", "2018-01-11", "2018-21-10", "2018-28-10", "2018-01-05")
country_col <- c("US", "US", "IRL", "IRL", "IRL")
gender_col <- c("M", "F", "F", "M", "F")
age_col <- c(32, 45, 25, 39, 99) # 99 is one of the values in the age attribute - will require recoding
q1_col <- c(5, 3, 3, 3, 2)
q2_col <- c(4, 5, 5, 3, 2)
q3_col <- c(5, 2, 5, 4, 1)
q4_col <- c(5, 5, 5, NA, 2) # NA is inserted in place of the missing data for this attribute
q5_col <- c(5, 5, 2, NA, 1)



# Create column names for data frame
column_names <- c("Date", "Country", "Gender", "Age", "Q1", "Q2", "Q3", "Q4", "Q5")

# Construct a data frame using the data from all vectors above
managers <- data.frame(date_col, country_col, gender_col, age_col, q1_col, q2_col, q3_col, q4_col, q5_col)

# Add column names to data frame using column_names vector
colnames(managers) <- column_names

# Refer to blackboard notes for an understanding
# why the following steps are required

# Recode the incorrect 'age' data to NA
managers$Age[managers$Age == 99] <- NA

# Create a new attribute called AgeCat and set valuess
# in AgeCat to the following if true:
# <= 25 = Young
# >= 26 & <= 44 = Middle Aged
# >= 45 = Elderly
# We will also recode age 'NA' to Elderly

managers$AgeCat[managers$Age >= 45] <- "Elderly"
managers$AgeCat[managers$Age >= 26 & managers$Age <= 44] <- "Middle Aged"
managers$AgeCat[managers$Age <= 25] <- "Young"
managers$AgeCat[is.na(managers$Age)] <- "Elderly"

# Recode AgeCat so that is ordinal and factored with the
# order Young, Middle aged, Elder
# We'll srore the ordinal factored data in variable 'AgeCat'
AgeCat <- factor(managers$AgeCat, order = TRUE, levels = c("Young", "Middle Aged", "Elderly"))

# managers$Date <- format(as.Date(managers$Date))
# Replace managers's AgeCat attribute with newly ordinal foctored data
managers$AgeCat <- AgeCat

# Create a new column called 'summary_col' that
# contains a summary of each row
summary_col <- managers$Q1 + managers$Q2 + managers$Q3 + managers$Q4 + managers$Q5
summary_col

# Add summary_col to the end of the data frame
managers <- data.frame(managers, summary_col)


# Calculate mean value for each row
mean_value <- rowMeans(managers[5:9])

# Add mean_value to end of managers data frame
managers <- data.frame(managers, mean_value)

# Show data frame contents
managers

# Change the name of this column to "mean value"
names(managers)[12] <- "mean_value"

# Change name of summary_col to "Answer total"
names(managers)[11] <- "Answer_total"

# Show 
str(managers)



new_managers_data <- read.csv("MoreData(1).csv",header = TRUE)
# new_managers_data
str(new_managers_data)
attach(new_managers_data)


new_managers_data_subset <- subset(new_managers_data, select = c(Date, Country, Gender, Age, Q1, Q2, Q3, Q4, Q5))

# new_managers_data_[is.na(new_managers_data_subset)] <- NA

# new_managers_data$Date <- as.Date(new_managers_data$Date, format = "%m/%d/%Y")
# new_managers_data_subset$Date <- as.Date(new_managers_data_subset$Date, format = "%m/%d/%Y")
# new_managers_data_subset$Date <- as.Date(new_managers_data_subset$Date)
#blank_vector <- c()


# new_managers_data_subset$AgeCat <- NA
# new_managers_data_subset$mean_value <- NA
# new_managers_data_subset$Answer_total <- NA

attach(new_managers_data_subset)
new_managers_data_subset$Date <- as.Date(new_managers_data_subset$Date, format = "%m/%d/%Y")
managers$Date <- as.Date(managers$Date, format = "%Y-%m-%d")
new_managers_data_subset

new_managers_data_subset$AgeCat[new_managers_data_subset$Age >= 45] <- "Elderly"
new_managers_data_subset$AgeCat[new_managers_data_subset$Age >= 26 & new_managers_data_subset$Age <= 44] <- "Middle Aged"
new_managers_data_subset$AgeCat[new_managers_data_subset$Age <= 25] <- "Young"
new_managers_data_subset$AgeCat[is.na(new_managers_data_subset$Age)] <- "Elderly"


new_managers_data_subset$Answer_total <- new_managers_data_subset$Q1 + new_managers_data_subset$Q2 + new_managers_data_subset$Q3 + new_managers_data_subset$Q4 + new_managers_data_subset$Q5

# Add summary_col to the end of the data frame
new_managers_data_subset <- rbind(new_managers_data_subset,Answer_total)


# Calculate mean value for each row
mean_value <- rowMeans(new_managers_data_subset[5:9])

# Add mean_value to end of managers data frame
new_managers_data_subset <- data.frame(new_managers_data_subset, mean_value)

# Show data frame contents
new_managers_data_subset

# Change the name of this column to "mean value"


# Change name of summary_col to "Answer total"




str(new_managers_data_subset)

# managers_data_subset  <- subset(managers, select = c(Date, Country, Gender, Age, Q1, Q2, Q3, Q4, Q5))

# managers_data_subset_exclude[!is.na(managers_data_subset_exclude)] <- NA
# managers

# combining the managers data and new managers data
new_manager_combined_data <- rbind(managers, new_managers_data_subset)
new_manager_combined_data

str(new_manager_combined_data)

