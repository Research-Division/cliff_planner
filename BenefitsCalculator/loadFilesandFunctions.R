

#library(profvis)

#profvis({

# Load all necessary supplementary files
load("BenefitsCalculator/Database/tables_tools.rdata")
load("BenefitsCalculator/Database/parameters.defaults.rdata")
#load("BenefitsCalculator/Database/expenses_tools.rdata")
#load("BenefitsCalculator/Database/benefit.parameters_tools.rdata")
load("BenefitsCalculator/Database/expenses_tools_part.rdata")
load("BenefitsCalculator/Database/benefit.parameters_tools_part.rdata")

# Load all necessry functions
compiler::loadcmp("BenefitsCalculator/functions/TANF.Rc") # TANF
compiler::loadcmp("BenefitsCalculator/functions/CCDF.Rc") # CCDF
source("BenefitsCalculator/functions/benefits_functions.R", local=TRUE) # Benefits calculations
source("BenefitsCalculator/functions/expense_functions.R", local=TRUE) # Expenses calculations
source("BenefitsCalculator/functions/wage_projection.R", local=TRUE) # Wage growth functions
source("BenefitsCalculator/functions/BenefitsCalculator_functions.R", local=TRUE) # Benefits Calculator functions
#source("BenefitsCalculator/functions/TANF.R", local=TRUE) # TANF
#source("BenefitsCalculator/functions/CCDF.R", local=TRUE) # CCDF

#})