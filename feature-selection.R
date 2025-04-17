getBenchmark <- function(){
  datatele <- read.csv("C:/Users/shaik/Desktop/Modern Optimization/Session 5/Practical/Telecom.csv")
  "C:/Users/shaik/Desktop/Modern Optimization/Session 5/Practical/Telecom.csv"
  mod <- glm(Churn ~ AccountWeeks+	ContractRenewal+	DataPlan+	DataUsage+	CustServCalls+	DayMins+	
               DayCalls+	MonthlyCharge+	OverageFee+	RoamMins,data = datatele, family = binomial)
  
  return (mod)
}

getData <- function(){ 
  datatele <- read.csv("C:/Users/shaik/Desktop/Modern Optimization/Session 5/Practical/Telecom.csv")
  mod <- getBenchmark()
  xx <- model.matrix(mod)[, -1]   
  yy <- ifelse(datatele$Churn == "Yes", 1, 0)  # Convert churn to binary response variable
  data <- cbind(xx, yy)
  return (data)
}

featureFitness <- function(string, xx, yy) {
  # print(string) # Uncomment this line if you want to print every single solution
  inc <- which(string == 1)  # 'inc' includes those features/variables for which 'string' contains 1
  if (length(inc) == 0) return (-10E20)  # If no feature is selected then give a terrible fitness to this solution
  X <- cbind(1, xx[, inc])  # Create a matrix of values for all the variables contained in 'inc'
  mod <- glm(yy ~ X[, -1], family = binomial)  # Fit logistic regression model
  return (-AIC(mod))
}
