x <- c(1,2,3,4,5,6)
y <- c(1,2,3,4,NA,5,6)
states <- c('UP','AP','HP','MP','JK')
#To calculate frequency for State vector, you can use table function.
table(states)
mean(x)
mean(y)
#To calculate mean for a vector excluding NA values,
#you can include na.rm = TRUE parameter in mean function. 
mean(y, na.rm = TRUE)

sum(x[c(3,5)]) # use subscripts to refer elements of a vector
sum(x[c(3:5)]) # calling subvectors

#use subscripts to refer elements of a vector
data$x = as.numeric(data$x) #Error in data$x : object of type 'closure' is not subsettable

#     FACTORS     #

#R has a special data structure to store categorical variables. 
#It tells R that a variable is nominal or ordinal by making it a factor.

#Simplest form of factor function : 
gender <- c(1,2,1,2,1,2,1,2)
gender <- factor(gender)

#Ideal form of the factor function
gender <- c(1,2,1,2,1,2,1,2)
gender <- factor(gender, levels= c(1,2), labels = c("male","female"))

table(gender)

#The factor function has three parameters:
#Vector Name 
#Values (Optional)
#Value labels (Optional)

#Convert a column "x" to factor
data$x = as.factor(data$x) #Error in data$x : object of type 'closure' is not subsettable

#   MATRICES   #

x <- c(1,2,3,4,5)
y <- c(1,3,5,7,9)
z <- c(1,2,3,4,9)
matrix1 <- cbind(x,y,z)
matrix1

dim1 <- dim(matrix1) #dimension
corr1 <-cor(matrix1) #correlation matrix of matrix1
matrix1_row3 <- matrix1[3,] #3rd row matrix
matrix1_row3_col1 <- matrix1[3,1] #element from 3rd row 1st column

#     ARRAYS      #
#Arrays are similar to matrices but can have more than two dimensions.

#    DATA FRAMES  #
# A data frame is similar to SAS and SPSS datasets. It contains variables and records
# more general than a matrix i.e  in that different columns can have different modes (numeric, character, factor, etc).

data_frame_1 <- data.frame(x,y,z,states)

#     LISTS     #
# A list allows you to store a variety of  objects.

list_1 <- list(x,y,z,states,data_frame_1)
list_1[[3]] #usbscripts to slect specific components

#      Examining DATA_TYPE of a column
# 1. 'class' is a property assigned to an object that determines how generic
#     functions operate with it.  It is not a mutually exclusive classification.

# 2. 'mode' is a mutually exclusive classification of objects according to their basic structure.
#    The 'atomic' modes are numeric, complex, charcter and logical.

class(list_1[[3]])
mode(list_1[[3]])

class(gender)
mode(gender)

