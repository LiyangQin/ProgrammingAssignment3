rankhospital <- function(state, outcome, num = "best") {
	## Read outcome data
	result <-  read.csv("outcome-of-care-measures.csv", 
	colClasses = "character", na.strings = "Not Available")
	data <- result[c(2, 7, 11, 17, 23)]
	
	## Rearrage data
	names(data)[1] <- "hospital"
	names(data)[2] <- "states"
	names(data)[3] <- "heart attack"
	names(data)[4] <- "heart failure"
	names(data)[5] <- "pneumonia"
	
	## Check that state and outcome are valid
	r.state <- unique(data[, 2])
	r.outcome <- c("heart attack", "heart failure", "pneumonia")
	if( state %in% r.state == FALSE ) stop("invalid state")
	if( outcome %in% r.outcome == FALSE ) stop("invalid outcome")
	
	## Return hospital name in that state with the given rank
	## 30-day death rate
	state_data <- split(data, data$states)
	state_data <- state_data[[state]]
	vals <- state_data[[outcome ]]
	vals <- vals[!is.na(vals)]
	vals <- as.numeric(vals)
	
	order_val <- order(vals)
	if (num == "best") { 
		rowN <- 1
	} else if (num == "worst"){
		rowN <-nrow(order_val)
	} else{
		rowN <- num
	}
	state_data[rowN, ]$hospital
}