# Run this file to copy the most recent files

#user<-"ilin_/Dropbox"
#user<-"ellie/Dropbox"
user<-"f1hxf02/ATL FRB Dropbox/Hongyi Fu"
#user<-"f1abm01/Dropbox (ATL FRB)"
#user<-"f1dat01/Dropbox (ATL FRB)"
#user <- "f1acs02/Dropbox (ATL FRB)"

setwd(paste0("C:/Users/", user,"/WorkForceDevProj/CareerLadderTool/Tools for Shinyapps.io/cliff_planner"))


# Database files
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/prd_parameters/tables.rdata"), paste0(getwd(),"/BenefitsCalculator/Database/tables.rdata"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/prd_parameters/parameters.defaults.rdata"), paste0(getwd(),"/BenefitsCalculator/Database/parameters.defaults.rdata"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/prd_parameters/expenses.rdata"), paste0(getwd(),"/BenefitsCalculator/Database/expenses.rdata"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/prd_parameters/benefit.parameters.rdata"), paste0(getwd(),"/BenefitsCalculator/Database/benefit.parameters.rdata"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Wage Growth/coeff_all.rdata"), paste0(getwd(),"/BenefitsCalculator/Database/coeff_all.rdata"), overwrite = TRUE)

# Function files
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/functions/benefits_functions.R"), paste0(getwd(),"/BenefitsCalculator/functions/benefits_functions.R"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/functions/expense_functions.R"), paste0(getwd(),"/BenefitsCalculator/functions/expense_functions.R"), overwrite = TRUE)
#file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Wage Growth/programs/wage_projection.R"), paste0(getwd(),"/BenefitsCalculator/functions/wage_projection.R"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/functions/BenefitsCalculator_functions.R"), paste0(getwd(),"/BenefitsCalculator/functions/BenefitsCalculator_functions.R"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/libraries.R"), paste0(getwd(),"/BenefitsCalculator/libraries.R"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/functions/TANF.R"), paste0(getwd(),"/BenefitsCalculator/functions/TANF.R"), overwrite = TRUE)
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Benefits & Expenses Database/programs/functions/CCDF.R"), paste0(getwd(),"/BenefitsCalculator/functions/CCDF.R"), overwrite = TRUE)


# List of locations
file.copy(paste0("C:/Users/",user,"/WorkForceDevProj/Documentation/Wage Growth/mapMSAtoCounty/locations_list.csv"), paste0(getwd(),"/locations_list.csv"), overwrite = TRUE)
