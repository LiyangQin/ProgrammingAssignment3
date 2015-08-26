best <- function(state, outcome){
	## Read outcome data
	result <-  read.csv("outcome-of-care-measures.csv", colClasses = "character")
	r.state <- unique(result[, 7])
	r.HA <- as.numeric(result[, 11])
	r.HF <- as.numeric(result[, 17])
	r.PN <- as.numeric(result[, 23])
	## Check that state and outcome are valid
	
	
	## Return hospital name in that state with lowest 30-day death
	## rate
}