#**********************************************************************
# Global data and processing settings for Shiny 
# Anything not updated in each query goes here
#**********************************************************************

rm(list=ls())

library(shinycssloaders)
options(spinner.color="#0275D8", spinner.color.background="#ffffff", spinner.size=2)



# !!! Specify User !!!
#user<-"f1ixi02/Dropbox (ATL FRB)" # Elias
#user <- "F1ABM01/Dropbox (ATL FRB)" #Austin
#user <- "f1axr04/Dropbox" # Alex
#user<-"ellie/Dropbox"
#user<-"ilin_/Dropbox" # Elias
#user <- "alex/Dropbox" # Alex 
#user <- "C:/Users/f1abm01/Work Folders/Documents/cliff1" 

####################################
# LOAD REQUIRED LIBRARIES
####################################
# Uncomment when push to the server to make sure that they are installed



####################################
# LOAD GLOBAL DATA
####################################
# Call all the functions
source("BenefitsCalculator/loadFilesandFunctions.R", local=TRUE) # Load auxiliary files and required functions
source("BenefitsCalculator/libraries.R", local=TRUE) # Load required packages


data_wage_parameters <- readRDS("BenefitsCalculator/Database/data_parameters_2025.rds")
#area_county_town <- fread('BenefitsCalculator/Database/cw_area_county_town_2025.csv', colClasses = "character")
cw_state_minwage <- fread('BenefitsCalculator/Database/cw_state_year_min_wage_2025.csv')
occ_area <- fread('BenefitsCalculator/Database/area_occupations_list_2025.csv', colClasses = "character")

####################################
#GLOBAL SETTINGS
####################################
budget.ALICE<-"survivalforcliff"

jscode1 <- "shinyjs.next1 = function() {window.scrollTo(0, 0);}"
jscode2 <- "shinyjs.next2 = function() {window.scrollTo(0, 0);}"
jscode3 <- "shinyjs.next3 = function() {window.scrollTo(0, 0);}"
jscode4 <- "shinyjs.next4 = function() {window.scrollTo(0, 0);}"
jscode5 <- "shinyjs.next5 = function() {window.scrollTo(0, 0);}"
jscode6 <- "shinyjs.next6 = function() {window.scrollTo(0, 0);}"
jscode7 <- "shinyjs.next7 = function() {window.scrollTo(0, 0);}"
jscode8 <- "shinyjs.next5 = function() {window.scrollTo(0, 0);}"
jscode9 <- "shinyjs.next6 = function() {window.scrollTo(0, 0);}"
jscode10 <- "shinyjs.next7 = function() {window.scrollTo(0, 0);}"


jscodeback1 <- "shinyjs.back1 = function() {window.scrollTo(0, 0);}"
jscodeback2 <- "shinyjs.back2 = function() {window.scrollTo(0, 0);}"
jscodeback3 <- "shinyjs.back3 = function() {window.scrollTo(0, 0);}"
jscodeback4 <- "shinyjs.back4 = function() {window.scrollTo(0, 0);}"
jscodeback5 <- "shinyjs.back5 = function() {window.scrollTo(0, 0);}"
jscodeback6 <- "shinyjs.back6 = function() {window.scrollTo(0, 0);}"

#############################################
# NEEDED FOR TESTING 
#############################################
# inputs<- list()
# 
# inputs$stateAbbrev<-"GA"
# inputs$countyortownName<-'Fulton County'
# 
# inputs$startAgePerson1<-30
# inputs$startAgePerson2<-NA_real_
# inputs$startAgePerson3<-NA_real_
# inputs$startAgePerson4<-NA_real_
# inputs$startAgePerson5<-NA_real_
# inputs$startAgePerson6<-NA_real_
# inputs$startAgePerson7<-NA_real_
# inputs$startAgePerson8<-NA_real_
# inputs$startAgePerson9<-NA_real_
# inputs$startAgePerson10<-NA_real_
# inputs$startAgePerson11<-NA_real_
# inputs$startAgePerson12<-NA_real_
# 
# inputs$fam_disab<-"No"
# inputs$startDisability1<-0
# inputs$startDisability2<-0
# inputs$startDisability3<-0
# inputs$startDisability4<-0
# inputs$startDisability5<-0
# inputs$startDisability6<-0
# inputs$startDisability7<-0
# inputs$startDisability8<-0
# inputs$startDisability9<-0
# inputs$startDisability10<-0
# inputs$startDisability11<-0
# inputs$startDisability12<-0
# 
# inputs$startBlind1<-0
# inputs$startBlind2<-0
# inputs$startBlind3<-0
# inputs$startBlind4<-0
# inputs$startBlind5<-0
# inputs$startBlind6<-0
# inputs$startBlind7<-0
# inputs$startBlind8<-0
# inputs$startBlind9<-0
# inputs$startBlind10<-0
# inputs$startBlind11<-0
# inputs$startBlind12<-0
# 
# inputs$prev_ssi<-0
# 
# marital_status<-"Yes"
# 
# if(marital_status=="No"){
#   inputs$FilingStatus<-1
#   inputs$married<-0
# }else if(marital_status=="Yes"){
#   inputs$FilingStatus<-2
#   inputs$married<-1
# }
# 
# startingWage_c<-0
# current_hours<-0
# 
# 
# checking_account<-0
# 
# inputs$ownorrent<-"rent"
# 
# inputs$assets.cash<-checking_account
# #inputs$assets.car1<-value_vehicle_1-owe_vehicle_1
# inputs$assets.car1<-0
# 
# inputs$income.investment<-0
# 
# inputs$income.otherfamily<-0
# if(inputs$income.otherfamily > 0){
#   inputs$numworkingadults <- 2
# }else{
#   inputs$numworkingadults <- 1
# }
# inputs$income.child_support<-0
# inputs$income.gift<-0
# 
# 
# inputs$type_career_1<-"default"
# 
# if(inputs$type_career_1=="default"){
#   #inputs$choiceOccupation_1 <- "Counter Attendants, Cafeteria, Food Concession, and Coffee Shop"
#   inputs$choiceOccupation_1 <- "Cashiers"
# 
#   # Health Insurance
#   inputs$choiceOccupation.empl_healthcare_1<-0
# 
#   inputs$startingWage_1<-NA
#   inputs$experience_1<-0
# 
#   inputs$tuition_fees_1<-0
#   inputs$Grants_1<-0
#   inputs$loans_1<-0
# 
#   inputs$startingWage_1<-NA # ER: Repeated two lines necessary?
#   inputs$experience_1<-0
# 
#   inputs$hours_inschool_1<-0
#   inputs$wage_inschool_1<-0
# 
#   inputs$educationDuration_1<-0
#   inputs$schooling_years_1<-0
#   inputs$schooling_months_1<-0
# 
# }
# 
# inputs$type_career_2<-"empty"
# 
# # If none selected default to "empty"
# if(inputs$type_career_1=="empty"){
#   inputs$choiceOccupation_1 <- "empty"
# }
# 
# current_year<-2022
# years<-seq(current_year,current_year+25, by=1)
# 
# # Assumption on when child leaves the house
# child.leaves.house<-19
# 
# # Default parameter for which year to apply
# #ruleYear<-2021
# #ruleYear<-c(2021,rep(2020,length(years)-1)) # Apply American Rescue Plan provisions only in the first year
# ruleYear<-rep(2022,length(years))
# 
# 
# include_health_insurance_init<-"Yes"
# 
# 
# # #---------------------------------------------------------------------------
# # # Public Assistance Programs
# # #---------------------------------------------------------------------------
# #programs.healthcare<-isolate(as.logical(input$healthcare))
# programs.medicaid_adults<-TRUE
# programs.medicaid_child<-TRUE
# programs.aca<-TRUE
# programs.snap<-TRUE
# programs.schoolMeals<-TRUE
# programs.wic<-TRUE
# programs.ccdf<-TRUE
# programs.ccdf_cont<-TRUE
# programs.fates<-FALSE
# programs.head_start<-TRUE
# programs.prek<-TRUE
# programs.eitc<-TRUE
# programs.ctc<-TRUE
# programs.cdctc<-TRUE
# programs.section8<-TRUE
# programs.section8_cont<-FALSE
# programs.tanf<-FALSE
# programs.rap<-FALSE
# programs.ssdi<-TRUE
# programs.ssi<-TRUE
# 
# # Initial/Continuous Eligibility
# contelig.headstart <- TRUE
# contelig.earlyheadstart <- TRUE
# contelig.ccdf <- TRUE
# 
# # Disability amounts
# inputs$ssdiPIA1<-0
# inputs$ssdiPIA2<-0
# inputs$ssdiPIA3<-0
# inputs$ssdiPIA4<-0
# inputs$ssdiPIA5<-0
# inputs$ssdiPIA6<-0
# inputs$disab.work.exp<-0
# 
# # Reverse the logical conditions
# if(contelig.headstart==TRUE){contelig.headstart<-FALSE}else if(contelig.headstart==FALSE){contelig.headstart<-TRUE}
# if(contelig.earlyheadstart==TRUE){contelig.earlyheadstart<-FALSE}else if(contelig.earlyheadstart==FALSE){contelig.earlyheadstart<-TRUE}
# if(contelig.ccdf==TRUE){contelig.ccdf<-FALSE}else if(contelig.ccdf==FALSE){contelig.ccdf<-TRUE}

##########################################
# END OF TESTING ^
##########################################

APPLY_CHILDCARE<-TRUE # Childcare block - Head Start and CCDF
APPLY_LIHEAP<-FALSE # Keep turned-off for now

line_colors <- c("#661100", "#E69F00")
line_colors2 <- c("#E69F00","#661100")
# Global parameters for lifetime projections
# Lifetime horizon is fixed
current_year <- as.numeric(format(Sys.Date(), "%Y"))
#years<-seq(current_year,current_year+25, by=1)
years<-seq(current_year,2100, by=1)

# Assumption on when child leaves the house
child.leaves.house<-19

# Default parameter for which year to apply
#ruleYear<-2021
#ruleYear<-c(2021,rep(2020,length(years)-1)) # Apply American Rescue Plan provisions only in the first year
ruleYear<-rep(current_year,length(years))
shapes <- c(15,17,16,18)
#childcare needs assumptions
k_ftorpt <- "FT" #not used anywher in benefits calc right now
schoolagesummercare <- "PT" #don't change - ben calc not yet set up to handle FT
headstart_ftorpt <-"PT" #use the same for both headstart & earlyheadstart 
preK_ftorpt <- "PT"

#################################################################################
# Required Functions
#################################################################################

#-----------------------------------------------------------------------

net.res.life.values <- function(data1, data2, inputs){
  
  
  ########################
  # PRE-PROCESSING
  ########################
  if(inputs$choiceOccupation_1=="empty"){
    data1<-data1 %>% 
      mutate(CareerPath="Select Career Option",
             NetResources=0)
  }
  
  if(inputs$choiceOccupation_2=="empty"){
    data2<-data2 %>% 
      mutate(CareerPath="Select Career Option",
             NetResources=0)
  }
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: if career option is not chosen
  validate(
    need(inputs$choiceOccupation_1 != "empty" | inputs$choiceOccupation_2 != "empty", "Career Options are not specified. Please go to the Identify Careers tab and tell us about jobs you are interested.")
  )
  
  # Error 2: if career option is not chosen
  validate(
    need(!is.na(sum(data1$income)) & !is.na(sum(data2$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
   
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
      
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty"){d<-data1}
  if(inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty"){d<-data2}
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 !="empty"){d<-rbind(data1,data2)}
  
  data1<-data1 %>% 
    select(CareerPath,NetResources)
  
  data2<-data2 %>% 
    select(CareerPath,NetResources)
  
  data1$CareerPath_disp<-"Career Option 1"
  data2$CareerPath_disp<-"Career Option 2"
  
  data<-rbind(data1,data2)
  
  data.lifetime <- data %>% dplyr::group_by(CareerPath_disp, CareerPath) %>%
    dplyr::summarise(net.res.lifetime = sum(NetResources))
  
 
  ########################
  # CHART  ########################## NEEDS PLOTLY 
  ########################
  net.res.lifetime <-  ggplot(data.lifetime) + 
    geom_bar(aes(x = CareerPath_disp, y = net.res.lifetime,
                 text = paste("Career Path:", CareerPath,
                              "<br>Lifetime Net Resources: $", format(net.res.lifetime, big.mark = ",", scientific = FALSE))
    ), stat = "identity", position = "dodge", fill = "#0072B2")+
    scale_y_continuous(label = comma) +
    scale_x_discrete("") +
   
    ylab("Dollars ($)") + xlab("") +
    theme(plot.title = element_text(hjust = .5, size = 16), 
          plot.caption = element_text(hjust=0, size=12),
          axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "grey", linetype = 2),
          panel.grid.minor = element_line(colour = "grey", linetype = 2),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) +
  
    ggtitle("")
 
  net.res.lifetime <- net.res.lifetime + geom_hline(yintercept = 0, lty = 1, size = 1)
 
  net.res.lifetime <- ggplotly(net.res.lifetime, tooltip = "text") %>% 
    layout(legend = list(orientation = "h", x = 0.4, y = -0.7)) %>%  # GGPLOTLY doesn't know how to deal with legend location so have to do that
    layout(annotations = list(x = 0, y = -0.9, text = "Lifetime net resources assumes you retire at age 65.", 
                              showarrow = F, xref='paper', yref='paper', 
                              xanchor='center', yanchor='auto', xshift=0, yshift=0,
                              font=list(size=15, color="black")))  
  
  return(print(net.res.lifetime))
  
}



# Summary Bar Chart - Lifetime After Tax Income 
income.life.values <- function(data1,data2,c,inputs){
  
  ########################
  # PRE-PROCESSING
  ########################
  if(inputs$choiceOccupation_1=="empty"){
    data1<-data1 %>% 
      mutate(CareerPath="Select Career Option",
             income_ind=0)
  }
  
  if(inputs$choiceOccupation_2=="empty"){
    data2<-data2 %>% 
      mutate(CareerPath="Select Career Option",
             income_ind=0)
  }
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: if career option is not chosen
  validate(
    need(inputs$choiceOccupation_1 != "empty" | inputs$choiceOccupation_2 != "empty", "Career Options are not specified. Please go to the Identify Careers tab and tell us about jobs you are interested.")
  )
  
  # Error 2: if career option is not chosen
  validate(
    need(!is.na(sum(data1$income)) & !is.na(sum(data2$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )

  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty"){d<-data1}
  if(inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty"){d<-data2}
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 !="empty"){d<-rbind(data1,data2)}

  data1<-data1 %>% 
    select(CareerPath,income_ind)
  
  data2<-data2 %>% 
    select(CareerPath,income_ind)

  data1$CareerPath_disp<-"Career Option 1"
  data2$CareerPath_disp<-"Career Option 2"
  
  data<-rbind(data1,data2)

  data.lifetime <- data %>% dplyr::group_by(CareerPath_disp, CareerPath) %>%
    dplyr::summarise(income.lifetime = sum(income_ind))

  
  ########################
  # CHART  ########################## NEEDS PLOTLY 
  ########################
  income.lifetime <-  ggplot(data.lifetime) + 
    geom_bar(aes(x = CareerPath_disp, y = income.lifetime,
                 text = paste("Career Path:", CareerPath,
                              "<br>Lifetime Income After Taxes: $", format(income.lifetime, big.mark = ",", scientific = FALSE))
                 ), stat = "identity", position = "dodge", fill = "#0072B2")+
    scale_y_continuous(label = comma) +
    scale_x_discrete("") +
      
    ylab("Dollars ($)") + xlab("") +
    theme(plot.title = element_text(hjust = .5, size = 16), 
          plot.caption = element_text(hjust=0, size=12),
          axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "grey", linetype = 2),
          panel.grid.minor = element_line(colour = "grey", linetype = 2),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) +
      
    ggtitle("")

  income.lifetime <- income.lifetime + labs(title="", 
                                caption=c,
                                color = "") 
  
    
  income.lifetime <- income.lifetime + geom_hline(yintercept = 0, lty = 1, size = 1)

  income.lifetime <- ggplotly(income.lifetime, tooltip = "text") %>% 
    layout(legend = list(orientation = "h", x = 0.4, y = -0.7)) %>%  # GGPLOTLY doesn't know how to deal with legend location so have to do that
    layout(annotations = list(x = 0, y = -0.9, text = "Lifetime income assumes you retire at age 65.", 
                              showarrow = F, xref='paper', yref='paper', 
                              xanchor='center', yanchor='auto', xshift=0, yshift=0,
                              font=list(size=15, color="black"))) %>% layout(annotations = list(x = 0.85, y = -0.2, text = c, 
                                   showarrow = F, xref='paper', yref='paper', 
                                   xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                   font=list(size=15, color="black")))

  return(print(income.lifetime))
}

#-----------------------------------------------------------------------

# NET RESOURCES

net.resources <- function(data1, data2, dataInit, c, inputs){
  
 # data1_nr <<- data1 
 # data2_nr <<- data2
 # dataInit_nr <<- dataInit
  #c_nr <<- c
 # inputs_nr <<- inputs
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: if career option is not chosen
  validate(
    need(inputs$choiceOccupation_1 != "empty" | inputs$choiceOccupation_2 != "empty", "Career Options are not specified. Please go to the Identify Careers tab and tell us about jobs you are interested.")
  )
  
  # Error 2: if career option is not chosen
  validate(
    need(!is.na(sum(data1$income)) & !is.na(sum(data2$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty"){d<-data1}
  if(inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty"){d<-data2}
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 !="empty"){d<-rbind(data1,data2)}
  
  ########################
  # CHART 
  ########################
  d$`Age of Person` <- d$agePerson1
  dataInit$`Age of Person` <- dataInit$agePerson1
  d$`Net Resources` <- as.numeric(round(d$NetResources, 0))
  dataInit$`Net Resources` <- as.numeric(round(dataInit$NetResources, 0))
  d$`Career Path` <- d$CareerPath
  
  # Case I: Career Option 1 is NOT Current Path
  if(inputs$type_career_1 != "current"){
    
    net.res <- ggplot() +
      geom_line(d, mapping=aes(x=`Age of Person` ,y=`Net Resources`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`), size=1.5) +
      geom_point(d, mapping=aes(x=`Age of Person` ,y=`Net Resources`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`, text = paste("<br>Career Path:", `Career Path`,
                                                                                                                                                             "<br>Net Resources: $", format(income_ind, digits = 1, big.mark = ",", scientific = FALSE))), size=4) +
      geom_point(dataInit, mapping=aes(x = `Age of Person`, y = `Net Resources`, colour = "Current Job", shape = "Current Job",
                                       text = paste("Current Net Resources: $", format(`Net Resources`, digits = 1, big.mark = ",", scientific = FALSE))), size=4)+
      scale_x_continuous(limits=c(min(d$agePerson1), min(d$agePerson1) + 25), 
                         breaks = seq(min(d$agePerson1), min(d$agePerson1) + 25, 1)) + 
      scale_y_continuous(label = comma)+  
      
      ylab("Dollars ($) per year")+ 
      xlab("Age") +
      
      theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
            axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
            axis.text.x = element_text(angle = 0, vjust = .5), 
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
            panel.grid.major = element_line(colour = "#999999"),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.key = element_rect(fill = "white"), 
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 16)) 
    
    net.res <- net.res + geom_hline(yintercept = 0, lty =2, size = 1.5)
    
    ########
    ## set fixed color for Self-Sufficiency line
    ########
    path_names <- unique(d$CareerPath)
    
    ##copy line_colors vector
    if((inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty") | (inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty")){
      path_colors_vector <- line_colors2[1]
    }else{
      path_colors_vector <- line_colors2}
    
    ## add names to vector
    names(path_colors_vector) <- path_names
    
    ## add Self-Sufficiency target to vector
    path_colors_vector <- c(path_colors_vector, "#999999", "red")
    
    names(path_colors_vector)[length(path_colors_vector)-1] <-  "Minimum Household Budget"

    names(path_colors_vector)[length(path_colors_vector)] <-  "Current Job"
    
    net.res <- net.res + scale_color_manual(values = c(path_colors_vector))
    
    
    net.res <- net.res + scale_shape_manual(values = shapes)
    
    net.res <- ggplotly(net.res, tooltip = c("x","y","group")#"text"
    ) %>% 
      layout(legend = list(orientation = "h", x = 0, y = -0.4, title = list(text = ' '))) # GGPLOTLY doesn't know how to deal with legend location so have to do that
    
  }
  
  
  # Case I: Career Option 1 is Current Path
  if(inputs$type_career_1 == "current"){
    
    
    net.res <- ggplot() +
      geom_line(d, mapping=aes(x=`Age of Person` ,y=`Net Resources`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`), size=1.5) +
      geom_point(d, mapping=aes(x=`Age of Person` ,y=`Net Resources`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`, text = paste("<br>Career Path:", `Career Path`,
                                                                                                                                                             "<br>Net Resources: $", format(`Net Resources`, big.mark = ",", scientific = FALSE))), size=4) +
      scale_x_continuous(limits=c(min(d$agePerson1), min(d$agePerson1) + 25), 
                         breaks = seq(min(d$agePerson1), min(d$agePerson1) + 25, 1)) + 
      scale_y_continuous(label = comma)+  
      
      ylab("Dollars ($) per year")+ 
      xlab("Age") +
      
      theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
            axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
            axis.text.x = element_text(angle = 0, vjust = .5), 
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
            panel.grid.major = element_line(colour = "#999999"),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.key = element_rect(fill = "white"), 
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 16)) +
      
      ggtitle("Net Resources")
    
    
    ########
    ## set fixed color for Self-Sufficiency line
    ########
    path_names <- unique(d$CareerPath)
    
    ##copy line_colors vector
    if((inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty") | (inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty")){
      path_colors_vector <- line_colors2[1]
    }else{
      path_colors_vector <- line_colors2}
    
    ## add names to vector
    names(path_colors_vector) <- path_names
    
    ## add Self-Sufficiency target to vector
    path_colors_vector <- c(path_colors_vector, "#999999")

    names(path_colors_vector)[length(path_colors_vector)] <-  "Minimum Household Budget"
    
    net.res <- net.res + scale_color_manual(values = c(path_colors_vector))
    
    net.res <- net.res + geom_hline(yintercept = 0, lty =2, size = 1.5)
    
    net.res <- net.res + scale_shape_manual(values = shapes)
    
    net.res <- ggplotly(net.res, tooltip = c("x","y","group")#"text"
    ) %>% 
      layout(legend = list(orientation = "h", x = 0, y = -0.4, title = list(text = ' '))) # GGPLOTLY doesn't know how to deal with legend location so have to do that
    
  }
  
  
  
  return(print(net.res))
  
  
}




# Career Paths Comparison - Gross Income
income.gross <- function(data1,data2, dataInit, c,inputs){
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: if career option is not chosen
  validate(
    need(inputs$choiceOccupation_1 != "empty" | inputs$choiceOccupation_2 != "empty", "Career Options are not specified. Please go to the Identify Careers tab and tell us about jobs you are interested.")
  )

  # Error 2: if career option is not chosen
  validate(
    need(!is.na(sum(data1$income)) & !is.na(sum(data2$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
 
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty"){d<-data1}
  if(inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty"){d<-data2}
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 !="empty"){d<-rbind(data1,data2)}
  
  ########################
  # CHART 
  ########################
  d$`Age of Person` <- d$agePerson1
  dataInit$`Age of Person` <- dataInit$agePerson1
  d$`Individual Income` <- as.numeric(round(d$income_ind, 0))
  dataInit$`Individual Income` <- as.numeric(round(dataInit$income_ind, 0))
  d$`Career Path` <- d$CareerPath
  
  d$c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  
  
  # Case I: Career Option 1 is NOT Current Path
  if(inputs$type_career_1 != "current"){
    
  income.gross <- ggplot() +
    geom_line(d, mapping=aes(x=`Age of Person` ,y=`Individual Income`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`), size=1.5) +
    geom_point(d, mapping=aes(x=`Age of Person` ,y=`Individual Income`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`, text = paste("<br>Career Path:", `Career Path`,
                                                                                                                                                           "<br>Income Before Taxes: $", format(income_ind, digits = 1, big.mark = ",", scientific = FALSE))), size=4) +
    geom_point(dataInit, mapping=aes(x = `Age of Person`, y = `Individual Income`, colour = "Current Job", shape = "Current Job",
                                     text = paste("Current Income Before Taxes: $", format(`Individual Income`, digits = 1, big.mark = ",", scientific = FALSE))), size=4)+
    scale_x_continuous(limits=c(min(d$agePerson1), min(d$agePerson1) + 25), 
                       breaks = seq(min(d$agePerson1), min(d$agePerson1) + 25, 1)) + 
    scale_y_continuous(label = comma)+  
    
    ylab("Dollars ($) per year")+ 
    xlab("Age") +
    
    theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
          axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
          axis.text.x = element_text(angle = 0, vjust = .5), 
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "#999999"),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) +
    
    ggtitle("Income Before Taxes")
  
  income.gross <- income.gross + labs(title="", 
                                caption=c,
                                color = "") 
  
  ########
  ## set fixed color for Self-Sufficiency line
  ########
  path_names <- unique(d$CareerPath)
  
  ##copy line_colors vector
  if((inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty") | (inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty")){
    path_colors_vector <- line_colors2[1]
  }else{
    path_colors_vector <- line_colors2}
  
  ## add names to vector
  names(path_colors_vector) <- path_names
  
  ## add Self-Sufficiency target to vector
  path_colors_vector <- c(path_colors_vector, "#999999", "red")
  
  names(path_colors_vector)[length(path_colors_vector)-1] <-  "Minimum Household Budget"
  
  names(path_colors_vector)[length(path_colors_vector)] <-  "Current Job"
  
  income.gross <- income.gross + scale_color_manual(values = c(path_colors_vector))
  
  
  income.gross <- income.gross + scale_shape_manual(values = shapes)
  
  income.gross <- ggplotly(income.gross, tooltip = c("x","y","group")#"text"
  ) %>% 
    layout(legend = list(orientation = "h", x = 0, y = -0.4, title = list(text = ' '))) %>% layout(annotations = list(x = 0.85, y = -0.4, text = c, 
                                   showarrow = F, xref='paper', yref='paper', 
                                   xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                   font=list(size=15, color="black")))
  
  
  
  # GGPLOTLY doesn't know how to deal with legend location so have to do that
  
  }
  
  
  # Case I: Career Option 1 is Current Path
  if(inputs$type_career_1 == "current"){
    
    
    income.gross <- ggplot() +
      geom_line(d, mapping=aes(x=`Age of Person` ,y=`Individual Income`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`), size=1.5) +
      geom_point(d, mapping=aes(x=`Age of Person` ,y=`Individual Income`, group = `Career Path`, colour = `Career Path`, shape = `Career Path`, text = paste("<br>Career Path:", `Career Path`,
                                                                                                                                                             "<br>Income Before Taxes: $", format(`Individual Income`, big.mark = ",", scientific = FALSE))), size=4) +
      scale_x_continuous(limits=c(min(d$agePerson1), min(d$agePerson1) + 25), 
                         breaks = seq(min(d$agePerson1), min(d$agePerson1) + 25, 1)) + 
      scale_y_continuous(label = comma)+  
      
      ylab("Dollars ($) per year")+ 
      xlab("Age") +
      
      theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
            axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
            axis.text.x = element_text(angle = 0, vjust = .5), 
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
            panel.grid.major = element_line(colour = "#999999"),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.key = element_rect(fill = "white"), 
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 16)) +
      
      ggtitle("Income Before Taxes")
    
    income.gross <- income.gross + labs(title="", 
                                        caption=c,
                                        color = "") 
    
    
    ########
    ## set fixed color for Self-Sufficiency line
    ########
    path_names <- unique(d$CareerPath)
    
    ##copy line_colors vector
    if((inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty") | (inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty")){
      path_colors_vector <- line_colors2[1]
    }else{
      path_colors_vector <- line_colors2}
    
    ## add names to vector
    names(path_colors_vector) <- path_names
    
    ## add Self-Sufficiency target to vector
    path_colors_vector <- c(path_colors_vector, "#999999")
    
    names(path_colors_vector)[length(path_colors_vector)] <-  "Minimum Household Budget"
    
    income.gross <- income.gross + scale_color_manual(values = c(path_colors_vector))
    
    income.gross <- income.gross + geom_hline(yintercept = 0, lty =2, size = 1.5)
    
    income.gross <- income.gross + scale_shape_manual(values = shapes)
    
    income.gross <- ggplotly(income.gross, tooltip = c("x","y","group")#"text"
    ) %>% 
      layout(legend = list(orientation = "h", x = 0, y = -0.4, title = list(text = ' '))) %>%  layout(annotations = list(x = 0.85, y = -0.4, text = c, 
                                                                                                                         showarrow = F, xref='paper', yref='paper', 
                                                                                                                         xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                                                         font=list(size=15, color="black")))
    
    
    # GGPLOTLY doesn't know how to deal with legend location so have to do that
    
  }
  
  
  
  return(print(income.gross))
  
}


#-----------------------------------------------------------------------
# Career Paths Comparison - After Tax Income + Self-Sufficiency Target
after.tax.self.sufficiency.values <- function(data1,data2,dataInit,c,inputs){
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: if career option is not chosen
  validate(
    need(inputs$choiceOccupation_1 != "empty" | inputs$choiceOccupation_2 != "empty", "Career Options are not specified. Please go to the Identify Careers tab and tell us about jobs you are interested.")
  )
  
  # Error 2: if career option is not chosen
  validate(
    need(!is.na(sum(data1$income)) & !is.na(sum(data2$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty"){d<-data1}
  if(inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty"){d<-data2}
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 !="empty"){d<-rbind(data1,data2)}

  d$`Age of Person` <- d$agePerson1
  dataInit$`Age of Person` <- dataInit$agePerson1
  d$`After Tax Income` <- as.numeric(round(d$taxedEarnedIncomeOnly, 0))
  #d$`After Tax Income` <- d$`After Tax Income` - (d$income.gift+d$income.investment+d$income.child_support)
  dataInit$`After Tax Income` <- as.numeric(round(dataInit$taxedEarnedIncomeOnly, 0))
 # dataInit$`After Tax Income` <- dataInit$`After Tax Income` - (dataInit$income.gift+dataInit$income.investment+dataInit$income.child_support)
  d$`Career Path` <- d$CareerPath
  d$`Minimum Household Budget` <- as.numeric(round(d$SelfSufficiency,0))
  
  d$c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  ########################
  # CHART    ########################## NEEDS PLOTLY 
  ########################
  
  # Case I: Career Option 1 is NOT Current Path
  if(inputs$type_career_1 != "current"){
  
    after.tax <- ggplot(d, aes(x=`Age of Person`, shape = `Career Path`)) +
      
      geom_line(aes(y=`After Tax Income`, group = `Career Path`, color = `Career Path`), size=1.5) +
      
      geom_point(aes(y=`After Tax Income`, color = `Career Path`, group = `Career Path`,
                     text = paste("<br>Career Path:", `Career Path`,
                                  "<br>Income After Taxes: $", 
                                  format(`After Tax Income`, digits = 1, big.mark = ",", scientific = FALSE))), size=4) +
      
      geom_point(dataInit, mapping=aes(x = `Age of Person`, y = `After Tax Income`, colour = "Current Job", shape = "Current Job",
                                      text = paste("Current Income After Taxes: $", format(taxedEarnedIncomeOnly, digits = 1, big.mark = ",", scientific = FALSE))), size=4)+
                                       
      scale_x_continuous(limits=c(min(d$agePerson1), min(d$agePerson1) + 25), 
                                             breaks = seq(min(d$agePerson1), min(d$agePerson1) + 25, 1)) + 
                           scale_y_continuous(label = comma)+
    
 
    ylab("Dollars ($) per year") + 
    xlab("Age") +
    
    theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
          axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
          axis.text.x = element_text(angle = 0, vjust = .5), 
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "#999999"),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) 
    
    after.tax <- after.tax + labs(title="", 
                              caption=c,
                              color = "") 
    after.tax <-after.tax+
    ggtitle("Annual Take-Home Pay and the Minimum Household Budget") +
    geom_line(d, mapping=aes(x=`Age of Person`, y=`Minimum Household Budget`, color = "Minimum Household Budget", shape = "Minimum Household Budget"), lty=3, size = 1.5) 
  

  ########
  ## set fixed color for Self-Sufficiency line
  ########
  ## grab career path names
  
  path_names <- unique(d$CareerPath)
  
  ##copy line_colors vector
  if((inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty") | (inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty")){
    path_colors_vector <- line_colors2[1]
  }else{
    path_colors_vector <- line_colors2}
  
  ## add names to vector
  names(path_colors_vector) <- path_names
  
  ## add Self-Sufficiency target to vector
  path_colors_vector <- c(path_colors_vector, "#999999", "red")
  
  names(path_colors_vector)[length(path_colors_vector)-1] <-  "Minimum Household Budget"
  
  names(path_colors_vector)[length(path_colors_vector)] <-  "Current Job"

  
after.tax <- after.tax + scale_color_manual(values = path_colors_vector)

after.tax <- after.tax + scale_shape_manual(values = shapes)

  ########
  
  after.tax <- after.tax + geom_hline(yintercept = 0, lty =2, size = 1.5)

after.tax <- ggplotly(after.tax, tooltip = c("x","y","group") #"text"
) %>% 
  layout(legend = list(orientation = "h", x = 0, y = -0.4, title = list(text = ' '))) %>%  layout(annotations = list(x = 0.85, y = -0.4, text = c, 
                                                                                                                    showarrow = F, xref='paper', yref='paper', 
                                                                                                                    xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                                                    font=list(size=15, color="black")))
  }
  

  # Case II: Career Option 1 is Current Path
  if(inputs$type_career_1 == "current"){
    
    after.tax <- ggplot() +
      
      geom_line(d,mapping=aes(x=`Age of Person`, y=`After Tax Income`, color = `Career Path`, group = `Career Path`, shape = `Career Path`), size=1.5) +
      geom_point(d, mapping=aes(x=`Age of Person`, y=`After Tax Income`, color = `Career Path`, group = `Career Path`, shape = `Career Path`,
                                text = paste("<br>Career Path:", `Career Path`,
                                             "<br>Income After Taxes: $", format(`After Tax Income`, digits = 1, big.mark = ",", scientific = FALSE))), size=4) +
      
      scale_x_continuous(limits=c(min(d$agePerson1), min(d$agePerson1) + 25), 
                         breaks = seq(min(d$agePerson1), min(d$agePerson1) + 25, 1)) + 
      scale_y_continuous(label = comma)+
      
      ylab("Dollars ($) per year") + 
      xlab("Age") +
      
      theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
            axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
            axis.text.x = element_text(angle = 0, vjust = .5), 
            axis.title.x = element_text(size = 15),
            axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
            panel.grid.major = element_line(colour = "#999999"),
            panel.background = element_blank(), axis.line = element_line(colour = "black"),
            legend.key = element_rect(fill = "white"), 
            legend.text = element_text(size = 12),
            legend.title = element_text(size = 16)) 
    
    after.tax <- after.tax + labs(title="", 
                                  caption=c,
                                  color = "") 
      after.tax <-after.tax+
      ggtitle("Annual Take-Home Pay and the Minimum Household Budget") +
      geom_line(d, mapping=aes(x=`Age of Person`, y=`Minimum Household Budget`, color = "Minimum Household Budget", shape = "Minimum Household Budget"), lty=3, size = 1.5) 
    
    
    ########
    ## set fixed color for Self-Sufficiency line
    ########
    ## grab career path names


    path_names <- unique(d$CareerPath)
    
    ##copy line_colors vector
    if((inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty") | (inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty")){
      path_colors_vector <- line_colors2[1]
    }else{
      path_colors_vector <- line_colors2}
    
    ## add names to vector
    names(path_colors_vector) <- path_names
    
    ## add Self-Sufficiency target to vector
    path_colors_vector <- c(path_colors_vector, "#999999")
    
    names(path_colors_vector)[length(path_colors_vector)] <-  "Minimum Household Budget"
    
    xxxxx <<- 916
    
    after.tax <- after.tax + scale_color_manual(values = path_colors_vector)
    ########
    after.tax <- after.tax + scale_shape_manual(values = shapes)
    
    after.tax <- after.tax + geom_hline(yintercept = 0, lty =2, size = 1.5)
    
    after.tax <- ggplotly(after.tax, tooltip = c("x","y","group")) %>%  layout(legend = list(orientation = "h", x = 0, y = -0.4, title = list(text = ' '))) %>%  layout(annotations = list(x = 0.85, y = -0.4, text = c, 
                                                                                                                                                                                           showarrow = F, xref='paper', yref='paper', 
                                                                                                                                                                                           xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                                                                                                                           font=list(size=15, color="black")))
    
  
  }
  
   
  return(print(after.tax))
  
}

xxxxx <<- 11

#-----------------------------------------------------------------------
# Career Paths Comparison - Self-Sufficiency Expenses
expenses.breakdown.values <- function(data1,data2,c,inputs){
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: if career option is not chosen
  validate(
    need(inputs$choiceOccupation_1 != "empty" | inputs$choiceOccupation_2 != "empty", "Career Options are not specified. Please go to the Identify Careers tab and tell us about jobs you are interested.")
  )
  
  # Error 2: if career option is not chosen
  validate(
    need(!is.na(sum(data1$income)) & !is.na(sum(data2$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 =="empty"){d<-data1}
  if(inputs$choiceOccupation_1 =="empty" & inputs$choiceOccupation_2 !="empty"){d<-data2}
  if(inputs$choiceOccupation_1 !="empty" & inputs$choiceOccupation_2 !="empty"){d<-data1}

  # # Error 2: if career option is not chosen
  # validate(
  #   need(!is.na(sum(d$income)), "Data for one of the selected occupations does not exist in the selected location. Please switch to a different location or select an alternative career path.")
  # )
  
  data1 <- data1[data1$agePerson1 < (min(data1$agePerson1)+26),]
  data2 <- data2[data2$agePerson1 < (min(data2$agePerson1)+26),]
  
  
  if("CareerPath" %in% colnames(data1)){
  d2 <- subset(data1, select = c("total.expenses.SS"))
  }else{
  d2 <- subset(data2, select = c("total.expenses.SS"))
  }
  
  
  if("CareerPath" %in% colnames(data1)){
  d <- subset(data1, select = c("agePerson1", "CareerPath","countyortownName","stateAbbrev", "exp.childcare.SS", "exp.healthcare.SS", "exp.food.SS",
                                "exp.rentormortgage.SS", "exp.utilities.SS", "exp.transportation.SS", "exp.misc.SS", "exp.tech.SS"))
  }else{
  d <- subset(data2, select = c("agePerson1", "CareerPath","countyortownName","stateAbbrev", "exp.childcare.SS", "exp.healthcare.SS", "exp.food.SS",
                                "exp.rentormortgage.SS", "exp.utilities.SS", "exp.transportation.SS", "exp.misc.SS", "exp.tech.SS"))
  }
    
  d$c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  
  d$stateAbbrev <- NULL
  d$countyortownName <- NULL
  
    ## reshape data into long form
    
    expenses.decomp <- melt(d, id.vars=c("agePerson1","CareerPath","c"),
                            variable.name="Expense",value.name="Amount")
    
    ## Rename Factors 
    
    expenses.decomp$Expense <- revalue(expenses.decomp$Expense, 
                                       c("exp.childcare.SS" = "Childcare", 
                                         "exp.healthcare.SS" = "Health Care", 
                                         "exp.food.SS" = "Food",
                                         "exp.rentormortgage.SS" = "Rent",
                                         "exp.utilities.SS" = "Utilities",
                                         "exp.transportation.SS" = "Transportation",
                                         "exp.tech.SS" = "Technology",
                                         "exp.misc.SS" = "Misc"))
    
    ## define colors
    
    expense_colors <- c("Childcare"="#117733","Food"= "#AA4499","Health Care"= "#D55E00",
                        "Rent" = "#44AA99", "Utilities" = "#332288", "Technology" = "#56B4E9", "Transportation"=  "#661100", "Misc"= "#DDCC77")
    
  ########################
  # CHART
  ########################
  ## plot stacked bar chart 
  
  expenses.plot <- ggplot(expenses.decomp, aes(fill = Expense, y = Amount, x = agePerson1 ,
                                               text = paste("<br>Age:", agePerson1,
                                                            "<br>Expense Item:", format(Expense, digits = 1, big.mark = ","),
                                                            "<br>Amount: $", format(Amount, digits = 1, big.mark = ",")))) + 
    geom_bar(position = "stack", stat = "identity") #+ facet_wrap(~CareerPath)
  
  expenses.plot <- expenses.plot + scale_fill_manual(values = expense_colors)
  
  expenses.plot <- expenses.plot + scale_x_continuous(labels = min(expenses.decomp$agePerson1):(min(expenses.decomp$agePerson1)+25), 
                                                      breaks = min(expenses.decomp$agePerson1):(min(expenses.decomp$agePerson1)+25))

  expenses.plot <- expenses.plot + scale_y_continuous(label = comma)
  
  expenses.plot <- expenses.plot + xlab("Age")
  
  expenses.plot <- expenses.plot +
    
    theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
          axis.text = element_text(size = 12, colour = "black"), # text on x and y axis
          axis.text.x = element_text(angle = 0, vjust = .5), 
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "#999999"),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) 

  expenses.plot <-expenses.plot +
  labs(title="Expenses Included in the Minimum Household Budget",
       caption=paste0(c),
       fill = "Expense:") + ylab("Dollars ($) per year")

  
  expenses.plot <- ggplotly(expenses.plot, tooltip = "text") %>% 
    layout(legend = list(orientation = "h", x = 0, y = -0.4)) %>%  layout(annotations = list(x = 0.85, y = -0.4, text = c, 
                                                                                             showarrow = F, xref='paper', yref='paper', 
                                                                                             xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                             font=list(size=15, color="black"))) 
  
  
  
  
  # GGPLOTLY doesn't know how to deal with legend location so have to do that
  
  expenses.plot <- expenses.plot %>% config(displayModeBar = F)
  
  return(print(expenses.plot))
}

xxxxx <<- 12
#-----------------------------------------------------------------------
# Budgeting - Net Resources
net.res.budget.values <- function(data1,data2, dataInit, selected, horizon, exp_type,inputs){
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: Nothing is selected
  validate(
    need(selected != "empty", "Please select a career path to plan for")
  )
  
  validate(
    need(exp_type != 0, "Expenses Type has not been selected on prior page. Please select one of the Expense Type options.")
  )
  
  validate(
    need(inputs$missing_age!=1, "         ")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "        ")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "        ")
    )
    
  }
  
  dataInit$year.index<-dataInit$year.index-1
  dataInit$agePerson1<-dataInit$agePerson1-1
  
  if(selected=="Career Option 1"){
    d<-rbind(dataInit,data1)
  }else if(selected=="Career Option 2"){
    d<-rbind(dataInit,data2)
  }
  
  d$c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  
  # Error 2: Career option was not specified
  validate(
    need(!is.na(sum(d$income)), "This career option was not specified at the 'Choose Career' step")
  )
  
  years<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9", "Year 10") # specify years to plot on the x-axis
  minage <- min(d$agePerson1)
  maxage <- min(d$agePerson1)+horizon
  
  ########################
  # CHART    ########################## NEEDS PLOTLY 
  ########################

  net.res <- ggplot(d)+geom_bar(aes(x = agePerson1, y = NetResources,
                 text = paste(#"Career Path:", CareerPath,
                   "<br>Annual Budget: $", format(NetResources, digits = 1, big.mark = ",", scientific = FALSE))
    ), stat = "identity", #position = "dodge", 
    fill = "#661100")+
    
    scale_x_continuous(limits=c(min(d$agePerson1)-0.5, min(d$agePerson1)+horizon+1-0.5),
                       labels = years[1:(horizon+1)],
                       breaks = seq(minage, maxage, 1)) +
    scale_y_continuous(label = comma) +
    
    ylab("Dollars ($)") + 
    xlab("") +
    
    theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
          axis.text = element_text(size = 10, colour = "black"), # text on x and y axis
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1), 
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "#999999"),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) +
    
    ggtitle("Annual Budget") +
    geom_hline(aes(yintercept = 0, color = "Break-even line"), linetype = "dashed", size = 1) +
    theme(legend.position = "none")
  
  net.res <- net.res + scale_color_manual(values = c("black","#661100", "#999999"))
  
  net.res <- net.res + expand_limits(x = min(d$agePerson1)+horizon+1-1)
  
  net.res <- ggplotly(net.res, tooltip = "text") %>% 
    layout(legend = list(orientation = "h", x = 0, y = -0.3)) %>%  layout(annotations = list(x = 0.85, y = -0.445, text = c, 
                                                                                             showarrow = F, xref='paper', yref='paper', 
                                                                                             xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                             font=list(size=15, color="black")))
  # GGPLOTLY doesn't know how to deal with legend location so have to do that

  return(print(net.res))
  
}

xxxxx <<- 13
#-----------------------------------------------------------------------
# Budgeting - Public Assistance Breakdown
transfers.budget.values <- function(data1,data2, dataInit, selected, horizon, exp_type, inputs, benefitslist){
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: Nothing is selected
  validate(
    need(selected != "empty", "Please select a career to plan for")
  )
  
  validate(
    need(exp_type != 0, "Expenses Type has not been selected on prior page. Please select one of the Expense Type options.")
  )
  
  
  
  validate(
    need(inputs$missing_age!=1, "       ")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "       ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, select 'Yes' to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If it has been selected that at least one family member is disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  
  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "        ")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "        ")
    )
    
  }
  
  dataInit$year.index<-dataInit$year.index-1
  dataInit$agePerson1<-dataInit$agePerson1-1
  
  if(selected=="Career Option 1"){
    d<-rbind(dataInit,data1)
  }else if(selected=="Career Option 2"){
    d<-rbind(dataInit,data2)
  }
  
  d$c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  
  
  # Error 2: Career option was not specified
  validate(
    need(!is.na(sum(d$income)), "This career option was not specified at the 'Choose Career' step")
  )

  years<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9", "Year 10") # specify years to plot on the x-axis
  minage <- min(d$agePerson1)
  maxage <- min(d$agePerson1)+horizon
  
  d<-d[d$agePerson1<=maxage,]
  d$value.assistance.other <- d$value.assistance.other + d$value.assistance.tax.other
  
  ## Rename Factors
  names(d)[names(d)=="value.medicaid.adult"] <- "Medicaid for Adults"
  names(d)[names(d)=="value.medicaid.child"] <- "Medicaid for Children/CHIP"
  names(d)[names(d)=="value.snap"] <- "Supplemental Nutrition Assistance Program (SNAP)"
  names(d)[names(d)=="value.wic"] <- "Women, Infants and Children Nutrition Program (WIC)"
  names(d)[names(d)=="value.cdctc"] <- "Child and Dependent Care Tax Credit (CDCTC)"
  names(d)[names(d)=="value.section8"] <- "Section 8 Housing Voucher"
  if (d$stateAbbrev[1] == "FL") 
    names(d)[names(d)=="value.CCDF"] <- "CCDF/SR Plus"
  else
    names(d)[names(d)=="value.CCDF"] <- "Child Care Subsidy (CCDF)"
  names(d)[names(d)=="value.aca"] <- "Health Insurance Marketplace Subsidy"
  names(d)[names(d)=="value.eitc"] <- "Earned Income Tax Credit (EITC)"
  names(d)[names(d)=="value.ctc"] <- "Child Tax Credit (CTC)"
  names(d)[names(d)=="value.schoolmeals"] <- "Free or Reduced Price School Meals"
  #names(d)[names(d)=="value.liheap"] <- "LIHEAP"
  names(d)[names(d)=="value.HeadStart"] <- "Head Start"
  #names(d)[names(d)=="value.earlyHeadStart"] <- "Early Head Start"
  names(d)[names(d)=="value.PreK"] <- "State-Funded Pre-Kindergarten"
  names(d)[names(d)=="tax.income.fed"] <- "Federal Income Tax"
  names(d)[names(d)=="tax.income.state"] <- "State Income Tax"
  names(d)[names(d)=="tax.FICA"] <- "FICA Tax"
  names(d)[names(d)=="value.tanf"] <- "Temporary Assistance for Needy Families (TANF)"
  #names(d)[names(d)=="value.FATES"] <- "FATES"
  names(d)[names(d)=="value.ssi"] <- "Supplemental Security Income (SSI)"
  names(d)[names(d)=="value.ssdi"] <- "Social Security Disability Insurance (SSDI)"
  names(d)[names(d)=="value.hhf"] <- "Career MAP Income Support"
  names(d)[names(d)=="value.assistance.other"] <- "Wraparound Support"
  names(d)[names(d)=="value.dcflex"] <- "DC Flex"
  
  if ("Career MAP - Housing" %in% benefitslist){
    names(d)[names(d)=="Section 8 Housing Voucher"] <- "Career MAP - Housing"
  }
  else if ("FRSP" %in% benefitslist){
    names(d)[names(d)=="Section 8 Housing Voucher"] <- "FRSP"
  } 
  else if ("RAP" %in% benefitslist){
    names(d)[names(d)=="Section 8 Housing Voucher"] <- "RAP"
  }      
 #browser() 
  d2<-subset(d, select = c("total.transfers"))
  d <- subset(d, select = c("agePerson1", "year.index", "CareerPath",
                            benefitslist, "c"))

  
  benefits.decomp <- melt(d, id.vars=c("agePerson1", "year.index", "CareerPath","c"),
                          variable.name="Program",value.name="Transfer")
  
  #benefits.decomp$Transfer <- replace(benefits.decomp$Transfer, benefits.decomp$Transfer==0, NA)
  #benefits.decomp <- benefits.decomp[is.na(benefits.decomp$Transfer) == FALSE, ]
  #benefits.decomp$Program <- droplevels(benefits.decomp$Program)
  
  
  ########################
  # CHART   
  ########################
  ## define colors
  #117733
  benefit_colors <- c("Medicaid for Adults"="#332288", "Medicaid for Children/CHIP"="#E69F00", "Health Insurance Marketplace Subsidy"="#117733", 
                      "Temporary Assistance for Needy Families (TANF)"="#0072B2", #"Section 8 Housing Voucher"="#CC79A7", "LIHEAP"="#CC6677", 
                      "Supplemental Nutrition Assistance Program (SNAP)"="#D55E00", "Women, Infants and Children Nutrition Program (WIC)"="#AA4499", 
                      "Free or Reduced Price School Meals"="#999933", "Child Care Subsidy (CCDF)"="#882255", "CCDF/SR Plus"="#882255",
                      "Head Start" = "#88CCEE", "Early Head Start" = "light green", "State-Funded Pre-Kindergarten" = "black", 
                      "Earned Income Tax Credit (EITC)"="#888888", "Child Tax Credit (CTC)"="#44AA99", 
                      "Child and Dependent Care Tax Credit (CDCTC)"="#F0E442", "Wraparound Support"="#661100",
                      "Supplemental Security Income (SSI)"="red3","Social Security Disability Insurance (SSDI)"="turquoise4", 
                      "Career MAP Income Support"="#0000CD", "DC Flex"="#800080")
  
  if ("Career MAP - Housing" %in% benefitslist){
    names(d)[names(d)=="Section 8 Housing Voucher"] <- "Career MAP - Housing"
    benefit_colors <- c(benefit_colors,"Career MAP - Housing"="#CC79A7")
  }
  else if ("FRSP" %in% benefitslist){
    names(d)[names(d)=="Section 8 Housing Voucher"] <- "FRSP"
    benefit_colors <- c(benefit_colors,"FRSP"="#CC79A7")
  } 
  else if ("RAP" %in% benefitslist){
    names(d)[names(d)=="Section 8 Housing Voucher"] <- "RAP"
    benefit_colors <- c(benefit_colors,"RAP"="#CC79A7")
  }        
  else {
    benefit_colors <- c(benefit_colors,"Section 8 Housing Voucher"="#CC79A7")
  }
  
  
  ####################
  ## plot stacked bar chart  
  ####################

  benefits.plot <- ggplot(benefits.decomp, aes(fill = Program, y = Transfer, x = agePerson1 ,
                                               text = paste("<br>Program:", Program,
                                                            "<br>Amount: $", format(Transfer, digits=2, big.mark = ",")))) + 
    geom_bar(position = "stack", stat = "identity") #+ facet_wrap(~CareerPath) 
  
  benefits.plot <- benefits.plot + scale_fill_manual(values = benefit_colors)
  
  benefits.plot <- benefits.plot + scale_x_continuous(labels = years[1:(horizon+1)], 
                                                      breaks = seq(minage, maxage, 1))
  
  benefits.plot <- benefits.plot + expand_limits(x = maxage)
  
  benefits.plot <- benefits.plot + scale_y_continuous(label = comma)
  
  benefits.plot <- benefits.plot + ylab("Dollars ($)") +  xlab("")
  
  benefits.plot <- benefits.plot +
    
    theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
          axis.text = element_text(size = 10, colour = "black"), # text on x and y axis
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1), 
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "#999999"),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) +
    
    ggtitle("Public Assistance + Wraparound Support")
  
  benefits.plot <- ggplotly(benefits.plot, tooltip = "text") %>% 
    layout(legend = list(orientation = "h", x = 0, y = -0.55))  %>%  layout(annotations = list(x = 0.85, y = -0.45, text = c, 
                                                                                              showarrow = F, xref='paper', yref='paper', 
                                                                                              xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                              font=list(size=15, color="black")))
  
  # GGPLOTLY doesn't know how to deal with legend location so have to do that
  
  benefits.plot <- benefits.plot %>% config(displayModeBar = F)
  
  return(print(benefits.plot)) 
  
}

xxxxx <<- 14

#-----------------------------------------------------------------------
# Budgeting - Expenses Breakdown
expenses.budget.values <- function(data1,data2,dataInit, selected, horizon, exp_type, expenses_type, inputs){
  
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: Nothing is selected
  validate(
    need(selected != "empty", "Please select a career path to plan for")
  )
  validate(
    need(exp_type != 0, "Expenses Type has not been selected on prior page. Please select one of the Expense Type options.")
  )
  
  validate(
    need(inputs$missing_age!=1, "      ")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "       ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "        ")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "        ")
    )
    
  }
  
  dataInit$year.index<-dataInit$year.index-1
  dataInit$agePerson1<-dataInit$agePerson1-1
  
  if(selected=="Career Option 1"){
    d<-rbind(dataInit,data1)
  }else if(selected=="Career Option 2"){
    d<-rbind(dataInit,data2)
  }
  
  d$c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  c <- paste0(d$countyortownName, ", ", d$stateAbbrev)
  d$netexp.healthcare <- d$netexp.healthcare - d$oop.health.family.ALICE
  
  # Error 2: Career option was not specified
  validate(
    need(!is.na(sum(d$income)), "This career option was not specified at the 'Choose Career' step")
  )
  
  d <- replace(d, d==0, NA)
  
  years<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9", "Year 10") # specify years to plot on the x-axis
  minage <- min(d$agePerson1)
  maxage <- min(d$agePerson1)+horizon
  
  d<-d[d$agePerson1<=maxage,]
  
  d2 <- subset(d, select = c("total.expenses"))
  
  if(expenses_type=="expenses.actual"){d <- subset(d, select = c("c","agePerson1", "year.index", "CareerPath", "netexp.childcare", "oop.health.family.ALICE", "netexp.food", "netexp.healthcare", "netexp.rentormortgage", "netexp.utilities", "exp.tech", "exp.transportation", "exp.misc", "studentLoanRepayment", "value.loans", "value.tuition.net"))}
  if(expenses_type=="expenses.default"){d <- subset(d, select = c("c","agePerson1", "year.index", "CareerPath", "netexp.childcare", "oop.health.family.ALICE", "netexp.food", "netexp.healthcare", "netexp.rentormortgage", "netexp.utilities", "exp.tech", "exp.transportation", "exp.misc", "studentLoanRepayment", "value.loans", "value.tuition.net"))}
  
  ## reshape data into long form

  expenses.decomp <- melt(d, id.vars=c("agePerson1", "year.index", "CareerPath","c"),
                          variable.name="Expense",value.name="Amount")
  
  ## Rename Factors 
  
  if(expenses_type=="expenses.actual"){
  expenses.decomp$Expense <- revalue(expenses.decomp$Expense, 
                                     c("netexp.childcare" = "Childcare",
                                       "netexp.food" = "Food", 
                                       "netexp.healthcare" = "Health Insurance Premium",
                                       "oop.health.family.ALICE" = "Health Care Out-of-Pocket Costs",
                                       "netexp.rentormortgage" = "Rent or Mortgage",
                                       "netexp.utilities" = "Utilities",
                                       "exp.transportation" = "Transportation",
                                       "exp.tech" = "Technology",
                                       "exp.misc" = "Other",
                                       "studentLoanRepayment" = "Student Loan Repayments",
                                       "value.loans" = "Repayment of Other Loans",
                                       "value.tuition.net" = "Out-of-Pocket Tuition"
                                       
                                     ))
  expense_colors <- c("Childcare" = "#117733", "Food" = "#AA4499", "Health Insurance Premium" = "#D55E00", "Health Care Out-of-Pocket Costs" = "#DDCC77", "Rent or Mortgage" = "#44AA99"
                      ,"Utilities" = "#332288", "Transportation" = "#661100","Technology" = "#56B4E9", "Other" = "#F0E442", 
                      "Student Loan Repayments" = "#CC6677", "Repayment of Other Loans" = "#009E73"
                      , "Out-of-Pocket Tuition" = "#999933")
  }
  
  if(expenses_type=="expenses.default"){
  expenses.decomp$Expense <- revalue(expenses.decomp$Expense, 
                                     c("netexp.childcare" = "Childcare",
                                       "netexp.food" = "Food", 
                                       "netexp.healthcare" = "Health Insurance Premium",
                                       "oop.health.family.ALICE" = "Health Care Out-of-Pocket Costs",
                                       "netexp.rentormortgage" = "Rent or Mortgage",
                                       "netexp.utilities" = "Utilities",
                                       "exp.tech" = "Technology",
                                       "exp.transportation" = "Transportation",
                                       "exp.misc" = "Other",
                                       "studentLoanRepayment" = "Student Loan Repayments",
                                       "value.loans" = "Repayment of Other Loans",
                                       "value.tuition.net" = "Out-of-Pocket Tuition"
                                       
                                     ))
  ## define colors
  
  expense_colors <- c("Childcare" = "#117733", "Food" = "#AA4499", "Health Insurance Premium" = "#D55E00", "Health Care Out-of-Pocket Costs" = "#DDCC77", "Rent or Mortgage" = "#44AA99"
                        ,"Utilities" = "#332288","Technology" = "#56B4E9", "Transportation" = "#661100", "Other" = "#F0E442", 
                      "Student Loan Repayments" = "#CC6677", "Repayment of Other Loans" = "#009E73"
                      , "Out-of-Pocket Tuition" = "#999933")
  
  }
  
  expenses.decomp$Amount <- as.integer(expenses.decomp$Amount)
  
  ########################
  # CHART 
  ########################
  ## plot stacked bar chart 
  
  expenses.plot <- ggplot(expenses.decomp, aes(fill = Expense, y = Amount, x = agePerson1  ,
                                               text = paste("<br>Expense Item:", Expense,
                                                            "<br>Amount: $", format(Amount, big.mark = ",")))) + 
    geom_bar(position = "stack", stat = "identity") #+ facet_wrap(~CareerPath)
  
  expenses.plot <- expenses.plot + scale_fill_manual(values = expense_colors)
  
  expenses.plot <- expenses.plot + scale_x_continuous(labels = years[1:(horizon+1)], 
                                                      breaks = seq(minage, maxage, 1))
  
  expenses.plot <- expenses.plot + scale_y_continuous(label = comma)
  
  expenses.plot <- expenses.plot + ylab("Dollars ($)") + xlab("")
  
  expenses.plot <- expenses.plot +
    
    theme(plot.title = element_text(hjust = .5, size = 16),  # title of the chart
          axis.text = element_text(size = 10, colour = "black"), # text on x and y axis
          axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1), 
          axis.title.x = element_text(size = 15),
          axis.title.y = element_text(angle = 90, size=15, vjust = 0.525),
          panel.grid.major = element_line(colour = "#999999"),
          panel.background = element_blank(), axis.line = element_line(colour = "black"),
          legend.key = element_rect(fill = "white"), 
          legend.text = element_text(size = 12),
          legend.title = element_text(size = 16)) +
    ggtitle("Expenses After Public Assistance") 
  
  expenses.PA.plot <- expenses.plot
  
  expenses.PA.plot <- ggplotly(expenses.PA.plot, tooltip = "text") %>% 
    layout(legend = list(orientation = "h", x = 0, y = -0.55))  %>%  layout(annotations = list(x = 0.85, y = -0.4, text = c, 
                                                                                              showarrow = F, xref='paper', yref='paper', 
                                                                                              xanchor='center', yanchor='auto', xshift=0, yshift=0,
                                                                                              font=list(size=15, color="black")))
  # GGPLOTLY doesn't know how to deal with legend location so have to do that
  
  expenses.PA.plot <- expenses.PA.plot %>% config(displayModeBar = F)
  
  return(print(expenses.PA.plot))
  
 }


#-----------------------------------------------------------------------
# Budgeting - Override Default Expenses with Custom Values (case when "Actual" expenses type is selected)
overrideExpenses.Actual <- function(data, expenses.list, horizon, childcare1 = FALSE, childcare2 = FALSE){
  
  
  if(horizon==1){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.1
    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.1
    
    if(childcare1==FALSE & childcare2==FALSE){
    data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.1
    }
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.1
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.1
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.1
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.1
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.1
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.1
  }
  
  if(horizon==2){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.2
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.2

    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.2
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.2
    
    if(childcare1==FALSE & childcare2==FALSE){
    data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.2
    data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.2
    }
    
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.2
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.2
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.2
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.2
    

    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.2
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.2
    
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.2
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.2
   
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.2
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.2
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.2
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.2
}
  
  if(horizon==3){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.3
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.3
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.3

    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.3
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.3
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.3

    if(childcare1==FALSE & childcare2==FALSE){
    data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.3
    data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.3
    data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.3
    }
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.3
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.3
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.3
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.3
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.3
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.3
    
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.3
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.3
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.3

    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.3
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.3
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.3
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.3
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.3
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.3
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.3
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.3
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.3
    
  }
  
  if(horizon==4){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.4
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.4
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.4
    data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.4

    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.4
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.4
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.4
    data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.4
    
    if(childcare1==FALSE & childcare2==FALSE){
    data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.4
    data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.4
    data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.4
    data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.4
    }
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.4
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.4
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.4
    data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.4
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.4
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.4
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.4
    data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.4
 
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.4
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.4
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.4
    data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.4
   
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.4
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.4
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.4
    data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.4
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.4
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.4
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.4
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.4
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.4
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.4
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.4
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.4
    
  }
  
  if(horizon==5){
  data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.5
  data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.5
  data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.5
  data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.5
  data$exp.rentormortgage[data$Year==current_year+4]<-expenses.list$exp.rentormortgage.year5.5
  
  data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.5
  data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.5
  data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.5
  data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.5
  data$exp.utilities[data$Year==current_year+4]<-expenses.list$exp.utilities.year5.5

  if(childcare1==FALSE & childcare2==FALSE){
  data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.5
  data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.5
  data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.5
  data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.5
  data$exp.childcare[data$Year==current_year+4]<-expenses.list$exp.childcare.year5.5
  }
  data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.5
  data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.5
  data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.5
  data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.5
  data$exp.food[data$Year==current_year+4]<-expenses.list$exp.food.year5.5
  
  data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.5
  data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.5
  data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.5
  data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.5
  data$oop.health.family.ALICE[data$Year==current_year+4]<-expenses.list$exp.oop.year5.5
  
  data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.5
  data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.5
  data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.5
  data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.5
  data$exp.transportation[data$Year==current_year+4]<-expenses.list$exp.transportation.year5.5
  
  data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.5
  data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.5
  data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.5
  data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.5
  data$exp.tech[data$Year==current_year+4]<-expenses.list$exp.tech.year5.5
  
  data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.5
  data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.5
  data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.5
  data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.5
  data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.5
  
  data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.5
  data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.5
  data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.5
  data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.5
  data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.5
  
  }

  if(horizon==6){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.6
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.6
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.6
    data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.6
    data$exp.rentormortgage[data$Year==current_year+4]<-expenses.list$exp.rentormortgage.year5.6
    data$exp.rentormortgage[data$Year==current_year+5]<-expenses.list$exp.rentormortgage.year6.6
    
    
    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.6
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.6
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.6
    data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.6
    data$exp.utilities[data$Year==current_year+4]<-expenses.list$exp.utilities.year5.6
    data$exp.utilities[data$Year==current_year+5]<-expenses.list$exp.utilities.year6.6
    
    data$exp.tech<-0
    
    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.6
      data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.6
      data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.6
      data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.6
      data$exp.childcare[data$Year==current_year+4]<-expenses.list$exp.childcare.year5.6
      data$exp.childcare[data$Year==current_year+5]<-expenses.list$exp.childcare.year6.6
    }
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.6
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.6
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.6
    data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.6
    data$exp.food[data$Year==current_year+4]<-expenses.list$exp.food.year5.6
    data$exp.food[data$Year==current_year+5]<-expenses.list$exp.food.year6.6
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.6
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.6
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.6
    data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.6
    data$oop.health.family.ALICE[data$Year==current_year+4]<-expenses.list$exp.oop.year5.6
    data$oop.health.family.ALICE[data$Year==current_year+5]<-expenses.list$exp.oop.year6.6
    
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.6
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.6
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.6
    data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.6
    data$exp.transportation[data$Year==current_year+4]<-expenses.list$exp.transportation.year5.6
    data$exp.transportation[data$Year==current_year+5]<-expenses.list$exp.transportation.year6.6
    
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.6
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.6
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.6
    data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.6
    data$exp.tech[data$Year==current_year+4]<-expenses.list$exp.tech.year5.6
    data$exp.tech[data$Year==current_year+5]<-expenses.list$exp.tech.year6.6
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.6
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.6
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.6
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.6
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.6
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.6
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.6
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.6
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.6
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.6
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.6
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.6
    
  }
  
  if(horizon==7){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.7
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.7
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.7
    data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.7
    data$exp.rentormortgage[data$Year==current_year+4]<-expenses.list$exp.rentormortgage.year5.7
    data$exp.rentormortgage[data$Year==current_year+5]<-expenses.list$exp.rentormortgage.year6.7
    data$exp.rentormortgage[data$Year==current_year+6]<-expenses.list$exp.rentormortgage.year7.7
    
    
    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.7
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.7
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.7
    data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.7
    data$exp.utilities[data$Year==current_year+4]<-expenses.list$exp.utilities.year5.7
    data$exp.utilities[data$Year==current_year+5]<-expenses.list$exp.utilities.year6.7
    data$exp.utilities[data$Year==current_year+6]<-expenses.list$exp.utilities.year7.7

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.7
      data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.7
      data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.7
      data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.7
      data$exp.childcare[data$Year==current_year+4]<-expenses.list$exp.childcare.year5.7
      data$exp.childcare[data$Year==current_year+5]<-expenses.list$exp.childcare.year6.7
      data$exp.childcare[data$Year==current_year+6]<-expenses.list$exp.childcare.year7.7
    }
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.7
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.7
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.7
    data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.7
    data$exp.food[data$Year==current_year+4]<-expenses.list$exp.food.year5.7
    data$exp.food[data$Year==current_year+5]<-expenses.list$exp.food.year6.7
    data$exp.food[data$Year==current_year+6]<-expenses.list$exp.food.year7.7
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.7
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.7
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.7
    data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.7
    data$oop.health.family.ALICE[data$Year==current_year+4]<-expenses.list$exp.oop.year5.7
    data$oop.health.family.ALICE[data$Year==current_year+5]<-expenses.list$exp.oop.year6.7
    data$oop.health.family.ALICE[data$Year==current_year+6]<-expenses.list$exp.oop.year7.7
    
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.7
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.7
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.7
    data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.7
    data$exp.transportation[data$Year==current_year+4]<-expenses.list$exp.transportation.year5.7
    data$exp.transportation[data$Year==current_year+5]<-expenses.list$exp.transportation.year6.7
    data$exp.transportation[data$Year==current_year+6]<-expenses.list$exp.transportation.year7.7
    
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.7
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.7
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.7
    data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.7
    data$exp.tech[data$Year==current_year+4]<-expenses.list$exp.tech.year5.7
    data$exp.tech[data$Year==current_year+5]<-expenses.list$exp.tech.year6.7
    data$exp.tech[data$Year==current_year+6]<-expenses.list$exp.tech.year7.7
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.7
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.7
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.7
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.7
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.7
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.7
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.7
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.7
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.7
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.7
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.7
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.7
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.7
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.7
    
  }
  
  if(horizon==8){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.8
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.8
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.8
    data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.8
    data$exp.rentormortgage[data$Year==current_year+4]<-expenses.list$exp.rentormortgage.year5.8
    data$exp.rentormortgage[data$Year==current_year+5]<-expenses.list$exp.rentormortgage.year6.8
    data$exp.rentormortgage[data$Year==current_year+6]<-expenses.list$exp.rentormortgage.year7.8
    data$exp.rentormortgage[data$Year==current_year+7]<-expenses.list$exp.rentormortgage.year8.8
    
    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.8
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.8
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.8
    data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.8
    data$exp.utilities[data$Year==current_year+4]<-expenses.list$exp.utilities.year5.8
    data$exp.utilities[data$Year==current_year+5]<-expenses.list$exp.utilities.year6.8
    data$exp.utilities[data$Year==current_year+6]<-expenses.list$exp.utilities.year7.8
    data$exp.utilities[data$Year==current_year+7]<-expenses.list$exp.utilities.year8.8
    
    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.8
      data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.8
      data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.8
      data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.8
      data$exp.childcare[data$Year==current_year+4]<-expenses.list$exp.childcare.year5.8
      data$exp.childcare[data$Year==current_year+5]<-expenses.list$exp.childcare.year6.8
      data$exp.childcare[data$Year==current_year+6]<-expenses.list$exp.childcare.year7.8
      data$exp.childcare[data$Year==current_year+7]<-expenses.list$exp.childcare.year8.8
    }
    
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.8
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.8
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.8
    data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.8
    data$exp.food[data$Year==current_year+4]<-expenses.list$exp.food.year5.8
    data$exp.food[data$Year==current_year+5]<-expenses.list$exp.food.year6.8
    data$exp.food[data$Year==current_year+6]<-expenses.list$exp.food.year7.8
    data$exp.food[data$Year==current_year+7]<-expenses.list$exp.food.year8.8
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.8
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.8
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.8
    data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.8
    data$oop.health.family.ALICE[data$Year==current_year+4]<-expenses.list$exp.oop.year5.8
    data$oop.health.family.ALICE[data$Year==current_year+5]<-expenses.list$exp.oop.year6.8
    data$oop.health.family.ALICE[data$Year==current_year+6]<-expenses.list$exp.oop.year7.8
    data$oop.health.family.ALICE[data$Year==current_year+7]<-expenses.list$exp.oop.year8.8
    
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.8
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.8
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.8
    data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.8
    data$exp.transportation[data$Year==current_year+4]<-expenses.list$exp.transportation.year5.8
    data$exp.transportation[data$Year==current_year+5]<-expenses.list$exp.transportation.year6.8
    data$exp.transportation[data$Year==current_year+6]<-expenses.list$exp.transportation.year7.8
    data$exp.transportation[data$Year==current_year+7]<-expenses.list$exp.transportation.year8.8
    
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.8
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.8
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.8
    data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.8
    data$exp.tech[data$Year==current_year+4]<-expenses.list$exp.tech.year5.8
    data$exp.tech[data$Year==current_year+5]<-expenses.list$exp.tech.year6.8
    data$exp.tech[data$Year==current_year+6]<-expenses.list$exp.tech.year7.8
    data$exp.tech[data$Year==current_year+7]<-expenses.list$exp.tech.year8.8
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.8
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.8
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.8
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.8
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.8
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.8
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.8
    data$exp.misc[data$Year==current_year+7]<-expenses.list$exp.misc.year8.8
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.8
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.8
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.8
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.8
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.8
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.8
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.8
    data$value.loans[data$Year==current_year+7]<-expenses.list$loans.year8.8
    
  }
  
  if(horizon==9){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.9
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.9
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.9
    data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.9
    data$exp.rentormortgage[data$Year==current_year+4]<-expenses.list$exp.rentormortgage.year5.9
    data$exp.rentormortgage[data$Year==current_year+5]<-expenses.list$exp.rentormortgage.year6.9
    data$exp.rentormortgage[data$Year==current_year+6]<-expenses.list$exp.rentormortgage.year7.9
    data$exp.rentormortgage[data$Year==current_year+7]<-expenses.list$exp.rentormortgage.year8.9
    data$exp.rentormortgage[data$Year==current_year+8]<-expenses.list$exp.rentormortgage.year9.9
    
    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.9
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.9
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.9
    data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.9
    data$exp.utilities[data$Year==current_year+4]<-expenses.list$exp.utilities.year5.9
    data$exp.utilities[data$Year==current_year+5]<-expenses.list$exp.utilities.year6.9
    data$exp.utilities[data$Year==current_year+6]<-expenses.list$exp.utilities.year7.9
    data$exp.utilities[data$Year==current_year+7]<-expenses.list$exp.utilities.year8.9
    data$exp.utilities[data$Year==current_year+8]<-expenses.list$exp.utilities.year9.9

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.9
      data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.9
      data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.9
      data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.9
      data$exp.childcare[data$Year==current_year+4]<-expenses.list$exp.childcare.year5.9
      data$exp.childcare[data$Year==current_year+5]<-expenses.list$exp.childcare.year6.9
      data$exp.childcare[data$Year==current_year+6]<-expenses.list$exp.childcare.year7.9
      data$exp.childcare[data$Year==current_year+7]<-expenses.list$exp.childcare.year8.9
      data$exp.childcare[data$Year==current_year+8]<-expenses.list$exp.childcare.year9.9
    }
    
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.9
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.9
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.9
    data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.9
    data$exp.food[data$Year==current_year+4]<-expenses.list$exp.food.year5.9
    data$exp.food[data$Year==current_year+5]<-expenses.list$exp.food.year6.9
    data$exp.food[data$Year==current_year+6]<-expenses.list$exp.food.year7.9
    data$exp.food[data$Year==current_year+7]<-expenses.list$exp.food.year8.9
    data$exp.food[data$Year==current_year+8]<-expenses.list$exp.food.year9.9
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.9
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.9
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.9
    data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.9
    data$oop.health.family.ALICE[data$Year==current_year+4]<-expenses.list$exp.oop.year5.9
    data$oop.health.family.ALICE[data$Year==current_year+5]<-expenses.list$exp.oop.year6.9
    data$oop.health.family.ALICE[data$Year==current_year+6]<-expenses.list$exp.oop.year7.9
    data$oop.health.family.ALICE[data$Year==current_year+7]<-expenses.list$exp.oop.year8.9
    data$oop.health.family.ALICE[data$Year==current_year+8]<-expenses.list$exp.oop.year9.9
    
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.9
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.9
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.9
    data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.9
    data$exp.transportation[data$Year==current_year+4]<-expenses.list$exp.transportation.year5.9
    data$exp.transportation[data$Year==current_year+5]<-expenses.list$exp.transportation.year6.9
    data$exp.transportation[data$Year==current_year+6]<-expenses.list$exp.transportation.year7.9
    data$exp.transportation[data$Year==current_year+7]<-expenses.list$exp.transportation.year8.9
    data$exp.transportation[data$Year==current_year+8]<-expenses.list$exp.transportation.year9.9
    
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.9
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.9
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.9
    data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.9
    data$exp.tech[data$Year==current_year+4]<-expenses.list$exp.tech.year5.9
    data$exp.tech[data$Year==current_year+5]<-expenses.list$exp.tech.year6.9
    data$exp.tech[data$Year==current_year+6]<-expenses.list$exp.tech.year7.9
    data$exp.tech[data$Year==current_year+7]<-expenses.list$exp.tech.year8.9
    data$exp.tech[data$Year==current_year+8]<-expenses.list$exp.tech.year9.9
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.9
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.9
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.9
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.9
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.9
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.9
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.9
    data$exp.misc[data$Year==current_year+7]<-expenses.list$exp.misc.year8.9
    data$exp.misc[data$Year==current_year+8]<-expenses.list$exp.misc.year9.9
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.9
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.9
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.9
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.9
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.9
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.9
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.9
    data$value.loans[data$Year==current_year+7]<-expenses.list$loans.year8.9
    data$value.loans[data$Year==current_year+8]<-expenses.list$loans.year9.9
    
  }
  
  if(horizon==10){
    data$exp.rentormortgage[data$Year==current_year]<-expenses.list$exp.rentormortgage.year1.10
    data$exp.rentormortgage[data$Year==current_year+1]<-expenses.list$exp.rentormortgage.year2.10
    data$exp.rentormortgage[data$Year==current_year+2]<-expenses.list$exp.rentormortgage.year3.10
    data$exp.rentormortgage[data$Year==current_year+3]<-expenses.list$exp.rentormortgage.year4.10
    data$exp.rentormortgage[data$Year==current_year+4]<-expenses.list$exp.rentormortgage.year5.10
    data$exp.rentormortgage[data$Year==current_year+5]<-expenses.list$exp.rentormortgage.year6.10
    data$exp.rentormortgage[data$Year==current_year+6]<-expenses.list$exp.rentormortgage.year7.10
    data$exp.rentormortgage[data$Year==current_year+7]<-expenses.list$exp.rentormortgage.year8.10
    data$exp.rentormortgage[data$Year==current_year+8]<-expenses.list$exp.rentormortgage.year9.10
    data$exp.rentormortgage[data$Year==current_year+9]<-expenses.list$exp.rentormortgage.year10.10
    
    data$exp.utilities[data$Year==current_year]<-expenses.list$exp.utilities.year1.10
    data$exp.utilities[data$Year==current_year+1]<-expenses.list$exp.utilities.year2.10
    data$exp.utilities[data$Year==current_year+2]<-expenses.list$exp.utilities.year3.10
    data$exp.utilities[data$Year==current_year+3]<-expenses.list$exp.utilities.year4.10
    data$exp.utilities[data$Year==current_year+4]<-expenses.list$exp.utilities.year5.10
    data$exp.utilities[data$Year==current_year+5]<-expenses.list$exp.utilities.year6.10
    data$exp.utilities[data$Year==current_year+6]<-expenses.list$exp.utilities.year7.10
    data$exp.utilities[data$Year==current_year+7]<-expenses.list$exp.utilities.year8.10
    data$exp.utilities[data$Year==current_year+8]<-expenses.list$exp.utilities.year9.10
    data$exp.utilities[data$Year==current_year+9]<-expenses.list$exp.utilities.year10.10

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare[data$Year==current_year]<-expenses.list$exp.childcare.year1.10
      data$exp.childcare[data$Year==current_year+1]<-expenses.list$exp.childcare.year2.10
      data$exp.childcare[data$Year==current_year+2]<-expenses.list$exp.childcare.year3.10
      data$exp.childcare[data$Year==current_year+3]<-expenses.list$exp.childcare.year4.10
      data$exp.childcare[data$Year==current_year+4]<-expenses.list$exp.childcare.year5.10
      data$exp.childcare[data$Year==current_year+5]<-expenses.list$exp.childcare.year6.10
      data$exp.childcare[data$Year==current_year+6]<-expenses.list$exp.childcare.year7.10
      data$exp.childcare[data$Year==current_year+7]<-expenses.list$exp.childcare.year8.10
      data$exp.childcare[data$Year==current_year+8]<-expenses.list$exp.childcare.year9.10
      data$exp.childcare[data$Year==current_year+9]<-expenses.list$exp.childcare.year10.10
    }
    
    data$exp.food[data$Year==current_year]<-expenses.list$exp.food.year1.10
    data$exp.food[data$Year==current_year+1]<-expenses.list$exp.food.year2.10
    data$exp.food[data$Year==current_year+2]<-expenses.list$exp.food.year3.10
    data$exp.food[data$Year==current_year+3]<-expenses.list$exp.food.year4.10
    data$exp.food[data$Year==current_year+4]<-expenses.list$exp.food.year5.10
    data$exp.food[data$Year==current_year+5]<-expenses.list$exp.food.year6.10
    data$exp.food[data$Year==current_year+6]<-expenses.list$exp.food.year7.10
    data$exp.food[data$Year==current_year+7]<-expenses.list$exp.food.year8.10
    data$exp.food[data$Year==current_year+8]<-expenses.list$exp.food.year9.10
    data$exp.food[data$Year==current_year+9]<-expenses.list$exp.food.year10.10
    
    data$oop.health.family.ALICE[data$Year==current_year]<-expenses.list$exp.oop.year1.10
    data$oop.health.family.ALICE[data$Year==current_year+1]<-expenses.list$exp.oop.year2.10
    data$oop.health.family.ALICE[data$Year==current_year+2]<-expenses.list$exp.oop.year3.10
    data$oop.health.family.ALICE[data$Year==current_year+3]<-expenses.list$exp.oop.year4.10
    data$oop.health.family.ALICE[data$Year==current_year+4]<-expenses.list$exp.oop.year5.10
    data$oop.health.family.ALICE[data$Year==current_year+5]<-expenses.list$exp.oop.year6.10
    data$oop.health.family.ALICE[data$Year==current_year+6]<-expenses.list$exp.oop.year7.10
    data$oop.health.family.ALICE[data$Year==current_year+7]<-expenses.list$exp.oop.year8.10
    data$oop.health.family.ALICE[data$Year==current_year+8]<-expenses.list$exp.oop.year9.10
    data$oop.health.family.ALICE[data$Year==current_year+9]<-expenses.list$exp.oop.year10.10
    
    data$exp.transportation[data$Year==current_year]<-expenses.list$exp.transportation.year1.10
    data$exp.transportation[data$Year==current_year+1]<-expenses.list$exp.transportation.year2.10
    data$exp.transportation[data$Year==current_year+2]<-expenses.list$exp.transportation.year3.10
    data$exp.transportation[data$Year==current_year+3]<-expenses.list$exp.transportation.year4.10
    data$exp.transportation[data$Year==current_year+4]<-expenses.list$exp.transportation.year5.10
    data$exp.transportation[data$Year==current_year+5]<-expenses.list$exp.transportation.year6.10
    data$exp.transportation[data$Year==current_year+6]<-expenses.list$exp.transportation.year7.10
    data$exp.transportation[data$Year==current_year+7]<-expenses.list$exp.transportation.year8.10
    data$exp.transportation[data$Year==current_year+8]<-expenses.list$exp.transportation.year9.10
    data$exp.transportation[data$Year==current_year+9]<-expenses.list$exp.transportation.year10.10
    
    data$exp.tech[data$Year==current_year]<-expenses.list$exp.tech.year1.10
    data$exp.tech[data$Year==current_year+1]<-expenses.list$exp.tech.year2.10
    data$exp.tech[data$Year==current_year+2]<-expenses.list$exp.tech.year3.10
    data$exp.tech[data$Year==current_year+3]<-expenses.list$exp.tech.year4.10
    data$exp.tech[data$Year==current_year+4]<-expenses.list$exp.tech.year5.10
    data$exp.tech[data$Year==current_year+5]<-expenses.list$exp.tech.year6.10
    data$exp.tech[data$Year==current_year+6]<-expenses.list$exp.tech.year7.10
    data$exp.tech[data$Year==current_year+7]<-expenses.list$exp.tech.year8.10
    data$exp.tech[data$Year==current_year+8]<-expenses.list$exp.tech.year9.10
    data$exp.tech[data$Year==current_year+9]<-expenses.list$exp.tech.year10.10
    
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.10
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.10
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.10
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.10
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.10
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.10
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.10
    data$exp.misc[data$Year==current_year+7]<-expenses.list$exp.misc.year8.10
    data$exp.misc[data$Year==current_year+8]<-expenses.list$exp.misc.year9.10
    data$exp.misc[data$Year==current_year+9]<-expenses.list$exp.misc.year10.10
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.10
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.10
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.10
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.10
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.10
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.10
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.10
    data$value.loans[data$Year==current_year+7]<-expenses.list$loans.year8.10
    data$value.loans[data$Year==current_year+8]<-expenses.list$loans.year9.10
    data$value.loans[data$Year==current_year+9]<-expenses.list$loans.year10.10
    
  }

  
  return(data)
}


#-----------------------------------------------------------------------
# Budgeting - Override Default Expenses with Custom Values (case when "Actual" expenses type is selected) - data_init version
overrideExpenses.Actual.init <- function(data, expenses.list, horizon, childcare1 = FALSE, childcare2 = FALSE){
  
    if(horizon==1){
  
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.1
    data$exp.utilities<-expenses.list$exp.utilities.year1.1
    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.1
    }
    data$exp.food<-expenses.list$exp.food.year1.1
    data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.1
    data$exp.transportation<-expenses.list$exp.transportation.year1.1
    data$exp.tech<-expenses.list$exp.tech.year1.1
    data$exp.misc<-expenses.list$exp.misc.year1.1
    data$value.loans<-expenses.list$loans.year1.1
  
    }
  
  if(horizon==2){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.2
    data$exp.utilities<-expenses.list$exp.utilities.year1.2
    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.2
    }
    data$exp.food<-expenses.list$exp.food.year1.2
    data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.2
    data$exp.transportation<-expenses.list$exp.transportation.year1.2
    data$exp.tech<-expenses.list$exp.tech.year1.2
    data$exp.misc<-expenses.list$exp.misc.year1.2
    data$value.loans<-expenses.list$loans.year1.2
    
  }
  
  if(horizon==3){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.3
    data$exp.utilities<-expenses.list$exp.utilities.year1.3
   
    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.3
    }
    data$exp.food<-expenses.list$exp.food.year1.3
  data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.3
    data$exp.transportation<-expenses.list$exp.transportation.year1.3
    data$exp.tech<-expenses.list$exp.tech.year1.3
    data$exp.misc<-expenses.list$exp.misc.year1.3
    data$value.loans<-expenses.list$loans.year1.3
    
  }
  
  if(horizon==4){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.4
    data$exp.utilities<-expenses.list$exp.utilities.year1.4
    
    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.4
    }
    data$exp.food<-expenses.list$exp.food.year1.4
    data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.4
    data$exp.transportation<-expenses.list$exp.transportation.year1.4
    data$exp.tech<-expenses.list$exp.tech.year1.4
    data$exp.misc<-expenses.list$exp.misc.year1.4
    data$value.loans<-expenses.list$loans.year1.4
    
  }
  
  
  if(horizon==5){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.5
    data$exp.utilities<-expenses.list$exp.utilities.year1.5

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.5
    }
    data$exp.food<-expenses.list$exp.food.year1.5
    data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.5
    data$exp.transportation<-expenses.list$exp.transportation.year1.5
    data$exp.tech<-expenses.list$exp.tech.year1.5
    data$exp.misc<-expenses.list$exp.misc.year1.5
    data$value.loans<-expenses.list$loans.year1.5
    
  }
  
  if(horizon==6){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.6
    data$exp.utilities<-expenses.list$exp.utilities.year1.6

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.6
    }
    
    data$exp.food<-expenses.list$exp.food.year1.6
    data$oop.health.family.ALICE<-expenses.list$exp.food.year1.6
    data$exp.transportation<-expenses.list$exp.transportation.year1.6
    data$exp.tech<-expenses.list$exp.tech.year1.6
    data$exp.misc<-expenses.list$exp.misc.year1.6
    data$value.loans<-expenses.list$loans.year1.6
    
  }
  
  if(horizon==7){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.7
    data$exp.utilities<-expenses.list$exp.utilities.year1.7

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.7
    }
    data$exp.food<-expenses.list$exp.food.year1.7
   data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.7
    data$exp.transportation<-expenses.list$exp.transportation.year1.7
    data$exp.tech<-expenses.list$exp.tech.year1.7
    data$exp.misc<-expenses.list$exp.misc.year1.7
    data$value.loans<-expenses.list$loans.year1.7
    
  }
  
  if(horizon==8){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.8
    data$exp.utilities<-expenses.list$exp.utilities.year1.8

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.8
    }
    data$exp.food<-expenses.list$exp.food.year1.8
   data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.8
    data$exp.transportation<-expenses.list$exp.transportation.year1.8
    data$exp.tech<-expenses.list$exp.tech.year1.8
    data$exp.misc<-expenses.list$exp.misc.year1.8
    data$value.loans<-expenses.list$loans.year1.8
    
  }
  
  if(horizon==9){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.9
    data$exp.utilities<-expenses.list$exp.utilities.year1.9

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.9
    }
    data$exp.food<-expenses.list$exp.food.year1.9
    data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.9
    data$exp.transportation<-expenses.list$exp.transportation.year1.9
    data$exp.tech<-expenses.list$exp.tech.year1.9
    data$exp.misc<-expenses.list$exp.misc.year1.9
    data$value.loans<-expenses.list$loans.year1.9
    
  }
  
  if(horizon==10){
    
    data$exp.rentormortgage<-expenses.list$exp.rentormortgage.year1.10
    data$exp.utilities<-expenses.list$exp.utilities.year1.10

    if(childcare1==FALSE & childcare2==FALSE){
      data$exp.childcare<-expenses.list$exp.childcare.year1.10
    }
    data$exp.food<-expenses.list$exp.food.year1.10
    data$oop.health.family.ALICE<-expenses.list$exp.oop.year1.10
    data$exp.transportation<-expenses.list$exp.transportation.year1.10
    data$exp.tech<-expenses.list$exp.tech.year1.10
    data$exp.misc<-expenses.list$exp.misc.year1.10
    data$value.loans<-expenses.list$loans.year1.10
    
  }
  
    
  return(data)
}

xxxxx <<- 17

#-----------------------------------------------------------------------
# Budgeting - Override Default Expenses with Custom Values (case when "Default" expenses type is selected)
overrideExpenses.SS <- function(data, expenses.list, horizon){
  
  if(horizon==1){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.1+data$exp.misc.SS[data$Year==current_year]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.1
  }
  
  if(horizon==2){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.2+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.2+data$exp.misc.SS[data$Year==current_year+1]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.2
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.2
  }
  
  if(horizon==3){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.3+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.3+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.3+data$exp.misc.SS[data$Year==current_year+2]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.3
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.3
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.3
    
  }
  
  if(horizon==4){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.4+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.4+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.4+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.4+data$exp.misc.SS[data$Year==current_year+3]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.4
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.4
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.4
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.4
    
  }

  if(horizon==5){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.5+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.5+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.5+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.5+data$exp.misc.SS[data$Year==current_year+3]
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.5+data$exp.misc.SS[data$Year==current_year+4]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.5
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.5
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.5
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.5
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.5
    
  }
  
  if(horizon==6){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.6+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.6+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.6+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.6+data$exp.misc.SS[data$Year==current_year+3]
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.6+data$exp.misc.SS[data$Year==current_year+4]
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.6+data$exp.misc.SS[data$Year==current_year+5]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.6
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.6
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.6
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.6
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.6
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.6
    
  }
  
  if(horizon==7){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.7+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.7+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.7+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.7+data$exp.misc.SS[data$Year==current_year+3]
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.7+data$exp.misc.SS[data$Year==current_year+4]
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.7+data$exp.misc.SS[data$Year==current_year+5]
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.7+data$exp.misc.SS[data$Year==current_year+6]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.7
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.7
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.7
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.7
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.7
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.7
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.7
  
  }
  
  if(horizon==8){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.8+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.8+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.8+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.8+data$exp.misc.SS[data$Year==current_year+3]
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.8+data$exp.misc.SS[data$Year==current_year+4]
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.8+data$exp.misc.SS[data$Year==current_year+5]
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.8+data$exp.misc.SS[data$Year==current_year+6]
    data$exp.misc[data$Year==current_year+7]<-expenses.list$exp.misc.year8.8+data$exp.misc.SS[data$Year==current_year+7]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.8
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.8
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.8
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.8
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.8
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.8
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.8
    data$value.loans[data$Year==current_year+7]<-expenses.list$loans.year8.8
    
  }
  
  if(horizon==9){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.9+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.9+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.9+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.9+data$exp.misc.SS[data$Year==current_year+3]
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.9+data$exp.misc.SS[data$Year==current_year+4]
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.9+data$exp.misc.SS[data$Year==current_year+5]
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.9+data$exp.misc.SS[data$Year==current_year+6]
    data$exp.misc[data$Year==current_year+7]<-expenses.list$exp.misc.year8.9+data$exp.misc.SS[data$Year==current_year+7]
    data$exp.misc[data$Year==current_year+8]<-expenses.list$exp.misc.year9.9+data$exp.misc.SS[data$Year==current_year+8]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.9
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.9
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.9
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.9
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.9
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.9
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.9
    data$value.loans[data$Year==current_year+7]<-expenses.list$loans.year8.9
    data$value.loans[data$Year==current_year+8]<-expenses.list$loans.year9.9
    
  }
  
  if(horizon==10){
    data$exp.misc[data$Year==current_year]<-expenses.list$exp.misc.year1.10+data$exp.misc.SS[data$Year==current_year]
    data$exp.misc[data$Year==current_year+1]<-expenses.list$exp.misc.year2.10+data$exp.misc.SS[data$Year==current_year+1]
    data$exp.misc[data$Year==current_year+2]<-expenses.list$exp.misc.year3.10+data$exp.misc.SS[data$Year==current_year+2]
    data$exp.misc[data$Year==current_year+3]<-expenses.list$exp.misc.year4.10+data$exp.misc.SS[data$Year==current_year+3]
    data$exp.misc[data$Year==current_year+4]<-expenses.list$exp.misc.year5.10+data$exp.misc.SS[data$Year==current_year+4]
    data$exp.misc[data$Year==current_year+5]<-expenses.list$exp.misc.year6.10+data$exp.misc.SS[data$Year==current_year+5]
    data$exp.misc[data$Year==current_year+6]<-expenses.list$exp.misc.year7.10+data$exp.misc.SS[data$Year==current_year+6]
    data$exp.misc[data$Year==current_year+7]<-expenses.list$exp.misc.year8.10+data$exp.misc.SS[data$Year==current_year+7]
    data$exp.misc[data$Year==current_year+8]<-expenses.list$exp.misc.year9.10+data$exp.misc.SS[data$Year==current_year+8]
    data$exp.misc[data$Year==current_year+9]<-expenses.list$exp.misc.year10.10+data$exp.misc.SS[data$Year==current_year+9]
    
    data$value.loans[data$Year==current_year]<-expenses.list$loans.year1.10
    data$value.loans[data$Year==current_year+1]<-expenses.list$loans.year2.10
    data$value.loans[data$Year==current_year+2]<-expenses.list$loans.year3.10
    data$value.loans[data$Year==current_year+3]<-expenses.list$loans.year4.10
    data$value.loans[data$Year==current_year+4]<-expenses.list$loans.year5.10
    data$value.loans[data$Year==current_year+5]<-expenses.list$loans.year6.10
    data$value.loans[data$Year==current_year+6]<-expenses.list$loans.year7.10
    data$value.loans[data$Year==current_year+7]<-expenses.list$loans.year8.10
    data$value.loans[data$Year==current_year+8]<-expenses.list$loans.year9.10
    data$value.loans[data$Year==current_year+9]<-expenses.list$loans.year10.10
    
  }
  
  
  return(data)
}

xxxxx <<- 18
#-----------------------------------------------------------------------
# Budgeting - Override Default Expenses with Custom Values (case when "Default" expenses type is selected) - data_init version
overrideExpenses.SS.init <- function(data, expenses.list, horizon){
  
  if(horizon==1){
    data$exp.misc<-expenses.list$exp.misc.year1.1+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==2){
    data$exp.misc<-expenses.list$exp.misc.year1.2+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==3){
    data$exp.misc<-expenses.list$exp.misc.year1.3+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==4){
    data$exp.misc<-expenses.list$exp.misc.year1.4+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==5){
    data$exp.misc<-expenses.list$exp.misc.year1.5+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==6){
    data$exp.misc<-expenses.list$exp.misc.year1.6+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==7){
    data$exp.misc<-expenses.list$exp.misc.year1.7+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==8){
    data$exp.misc<-expenses.list$exp.misc.year1.8+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==9){
    data$exp.misc<-expenses.list$exp.misc.year1.9+data$exp.misc.SS[data$Year==current_year]
  }
  
  if(horizon==10){
    data$exp.misc<-expenses.list$exp.misc.year1.10+data$exp.misc.SS[data$Year==current_year]
  }
  
  
  return(data)
}


#-----------------------------------------------------------------------
# Budgeting - Include Tuition and Fees into Calculations
overrideTuition <- function(data, tuition, grants, loans, educationDuration){
  
  if(is.na(educationDuration)){ # Allow tuition override only in the "custom" mode
    
    data$value.tuition[data$Year==current_year]<-0
    data$value.grants[data$Year==current_year]<-0
    data$value.loans.student[data$Year==current_year]<-0
    
  }else if(educationDuration==0 | educationDuration==1){
      data$value.tuition[data$Year==current_year]<-tuition
      data$value.grants[data$Year==current_year]<-grants
      data$value.loans.student[data$Year==current_year]<-loans
      
  }else if(educationDuration==2){
    
    data$value.tuition[data$Year==current_year]<-tuition/2
    data$value.grants[data$Year==current_year]<-grants/2
    data$value.loans.student[data$Year==current_year]<-loans/2
    
    data$value.tuition[data$Year==current_year+1]<-tuition/2
    data$value.grants[data$Year==current_year+1]<-grants/2
    data$value.loans.student[data$Year==current_year+1]<-loans/2
    
  }else if(educationDuration==3){
    
    data$value.tuition[data$Year==current_year]<-tuition/3
    data$value.grants[data$Year==current_year]<-grants/3
    data$value.loans.student[data$Year==current_year]<-loans/3
    
    data$value.tuition[data$Year==current_year+1]<-tuition/3
    data$value.grants[data$Year==current_year+1]<-grants/3
    data$value.loans.student[data$Year==current_year+1]<-loans/3
    
    data$value.tuition[data$Year==current_year+2]<-tuition/3
    data$value.grants[data$Year==current_year+2]<-grants/3
    data$value.loans.student[data$Year==current_year+2]<-loans/3
    
  }else if(educationDuration==4){
    
    data$value.tuition[data$Year==current_year]<-tuition/4
    data$value.grants[data$Year==current_year]<-grants/4
    data$value.loans.student[data$Year==current_year]<-loans/4
    
    data$value.tuition[data$Year==current_year+1]<-tuition/4
    data$value.grants[data$Year==current_year+1]<-grants/4
    data$value.loans.student[data$Year==current_year+1]<-loans/4
    
    data$value.tuition[data$Year==current_year+2]<-tuition/4
    data$value.grants[data$Year==current_year+2]<-grants/4
    data$value.loans.student[data$Year==current_year+2]<-loans/4
    
    data$value.tuition[data$Year==current_year+3]<-tuition/4
    data$value.grants[data$Year==current_year+3]<-grants/4
    data$value.loans.student[data$Year==current_year+3]<-loans/4
    
  }else if(educationDuration==5){
    
    data$value.tuition[data$Year==current_year]<-tuition/5
    data$value.grants[data$Year==current_year]<-grants/5
    data$value.loans.student[data$Year==current_year]<-loans/5
    
    data$value.tuition[data$Year==current_year+1]<-tuition/5
    data$value.grants[data$Year==current_year+1]<-grants/5
    data$value.loans.student[data$Year==current_year+1]<-loans/5
    
    data$value.tuition[data$Year==current_year+2]<-tuition/5
    data$value.grants[data$Year==current_year+2]<-grants/5
    data$value.loans.student[data$Year==current_year+2]<-loans/5
    
    data$value.tuition[data$Year==current_year+3]<-tuition/5
    data$value.grants[data$Year==current_year+3]<-grants/5
    data$value.loans.student[data$Year==current_year+3]<-loans/5
    
    data$value.tuition[data$Year==current_year+4]<-tuition/5
    data$value.grants[data$Year==current_year+4]<-grants/5
    data$value.loans.student[data$Year==current_year+4]<-loans/5
    
  }else if(educationDuration==6){
    
    data$value.tuition[data$Year==current_year]<-tuition/6
    data$value.grants[data$Year==current_year]<-grants/6
    data$value.loans.student[data$Year==current_year]<-loans/6
    
    data$value.tuition[data$Year==current_year+1]<-tuition/6
    data$value.grants[data$Year==current_year+1]<-grants/6
    data$value.loans.student[data$Year==current_year+1]<-loans/6
    
    data$value.tuition[data$Year==current_year+2]<-tuition/6
    data$value.grants[data$Year==current_year+2]<-grants/6
    data$value.loans.student[data$Year==current_year+2]<-loans/6
    
    data$value.tuition[data$Year==current_year+3]<-tuition/6
    data$value.grants[data$Year==current_year+3]<-grants/6
    data$value.loans.student[data$Year==current_year+3]<-loans/6
    
    data$value.tuition[data$Year==current_year+4]<-tuition/6
    data$value.grants[data$Year==current_year+4]<-grants/6
    data$value.loans.student[data$Year==current_year+4]<-loans/6
    
    data$value.tuition[data$Year==current_year+5]<-tuition/6
    data$value.grants[data$Year==current_year+5]<-grants/6
    data$value.loans.student[data$Year==current_year+5]<-loans/6
  }
  
  return(data)
}


xxxxx <<- 20
#-----------------------------------------------------------------------
# Budgeting - Include Student Loans into Calculations
overrideStudentLoans <- function(data, loans, educationDuration){
  
  if(is.na(educationDuration)){educationDuration<-0}
    
  data$studentLoanRepayment<-0
  # Specify the duration depending on the loan amount
  # U.S. Department of Education
  # https://www.credible.com/blog/statistics/average-time-to-repay-student-loans-statistics/ 
  if(loans>=0 & loans<=7499){
    duration<-10
  }else if(loans>=7500 & loans<=9999){
    duration<-12
  }else if(loans>=10000 & loans<=19999){
    duration<-15
  }else if(loans>=20000 & loans<=39999){
    duration<-20
  }else if(loans>=40000 & loans<=59999){
    duration<-25
  }else if(loans>=60000){
    duration<-30
  }
  
  # Average in 2021 for direct unsubsidiezed federal student loans (for professional or graduate students)
  # https://www.thebalance.com/average-student-loan-interest-rate-4684306
  rate<-0.043/12
  
  data$studentLoanRepayment[(1+educationDuration):min(nrow(data),duration+educationDuration)]<-12*loans/(((1+rate)^(duration*12)-1)/(rate*(1+rate)^(duration*12)))
  
  return(data)
}


#-----------------------------------------------------------------------
# Budgeting - Include Asset Mapping into Calculations
addAssetMapping <- function(data, assistance.list, horizon){
  
  # The easiest is to override income
  if(horizon==1){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.1)
  }
  
  if(horizon==2){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.2)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.2)

  }
  
  if(horizon==3){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.3)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.3)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.3)

  }
  
  if(horizon==4){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.4)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.4)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.4)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.4)

  }
  
  if(horizon==5){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.5)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.5)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.5)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.5)
    data$value.assistance.other[data$Year==current_year+4]<-data$value.assistance.other[data$Year==current_year+4]+as.numeric(assistance.list$assistance.year5.5)

  }
  
  if(horizon==6){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.6)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.6)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.6)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.6)
    data$value.assistance.other[data$Year==current_year+4]<-data$value.assistance.other[data$Year==current_year+4]+as.numeric(assistance.list$assistance.year5.6)
    data$value.assistance.other[data$Year==current_year+5]<-data$value.assistance.other[data$Year==current_year+5]+as.numeric(assistance.list$assistance.year6.6)
  }
  
  if(horizon==7){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.7)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.7)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.7)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.7)
    data$value.assistance.other[data$Year==current_year+4]<-data$value.assistance.other[data$Year==current_year+4]+as.numeric(assistance.list$assistance.year5.7)
    data$value.assistance.other[data$Year==current_year+5]<-data$value.assistance.other[data$Year==current_year+5]+as.numeric(assistance.list$assistance.year6.7)
    data$value.assistance.other[data$Year==current_year+6]<-data$value.assistance.other[data$Year==current_year+6]+as.numeric(assistance.list$assistance.year7.7)
  }
  
  if(horizon==8){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.8)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.8)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.8)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.8)
    data$value.assistance.other[data$Year==current_year+4]<-data$value.assistance.other[data$Year==current_year+4]+as.numeric(assistance.list$assistance.year5.8)
    data$value.assistance.other[data$Year==current_year+5]<-data$value.assistance.other[data$Year==current_year+5]+as.numeric(assistance.list$assistance.year6.8)
    data$value.assistance.other[data$Year==current_year+6]<-data$value.assistance.other[data$Year==current_year+6]+as.numeric(assistance.list$assistance.year7.8)
    data$value.assistance.other[data$Year==current_year+7]<-data$value.assistance.other[data$Year==current_year+7]+as.numeric(assistance.list$assistance.year8.8)
  }
  
  if(horizon==9){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.9)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.9)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.9)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.9)
    data$value.assistance.other[data$Year==current_year+4]<-data$value.assistance.other[data$Year==current_year+4]+as.numeric(assistance.list$assistance.year5.9)
    data$value.assistance.other[data$Year==current_year+5]<-data$value.assistance.other[data$Year==current_year+5]+as.numeric(assistance.list$assistance.year6.9)
    data$value.assistance.other[data$Year==current_year+6]<-data$value.assistance.other[data$Year==current_year+6]+as.numeric(assistance.list$assistance.year7.9)
    data$value.assistance.other[data$Year==current_year+7]<-data$value.assistance.other[data$Year==current_year+7]+as.numeric(assistance.list$assistance.year8.9)
    data$value.assistance.other[data$Year==current_year+8]<-data$value.assistance.other[data$Year==current_year+8]+as.numeric(assistance.list$assistance.year9.9)
  }
  
  if(horizon==10){
    data$value.assistance.other[data$Year==current_year]<-data$value.assistance.other[data$Year==current_year]+as.numeric(assistance.list$assistance.year1.10)
    data$value.assistance.other[data$Year==current_year+1]<-data$value.assistance.other[data$Year==current_year+1]+as.numeric(assistance.list$assistance.year2.10)
    data$value.assistance.other[data$Year==current_year+2]<-data$value.assistance.other[data$Year==current_year+2]+as.numeric(assistance.list$assistance.year3.10)
    data$value.assistance.other[data$Year==current_year+3]<-data$value.assistance.other[data$Year==current_year+3]+as.numeric(assistance.list$assistance.year4.10)
    data$value.assistance.other[data$Year==current_year+4]<-data$value.assistance.other[data$Year==current_year+4]+as.numeric(assistance.list$assistance.year5.10)
    data$value.assistance.other[data$Year==current_year+5]<-data$value.assistance.other[data$Year==current_year+5]+as.numeric(assistance.list$assistance.year6.10)
    data$value.assistance.other[data$Year==current_year+6]<-data$value.assistance.other[data$Year==current_year+6]+as.numeric(assistance.list$assistance.year7.10)
    data$value.assistance.other[data$Year==current_year+7]<-data$value.assistance.other[data$Year==current_year+7]+as.numeric(assistance.list$assistance.year8.10)
    data$value.assistance.other[data$Year==current_year+8]<-data$value.assistance.other[data$Year==current_year+8]+as.numeric(assistance.list$assistance.year9.10)
    data$value.assistance.other[data$Year==current_year+9]<-data$value.assistance.other[data$Year==current_year+9]+as.numeric(assistance.list$assistance.year10.10)
  }
  
  return(data)
  
}

xxxxx <<- 22

addAssetMappingTax <- function(data, assistance.tax.list, horizon){
  
  # The easiest is to override income
  if(horizon==1){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.1)
  }
  
  if(horizon==2){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.2)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.2)
    
  }
  
  if(horizon==3){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.3)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.3)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.3)
    
  }
  
  if(horizon==4){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.4)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.4)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.4)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.4)
    
  }
  
  if(horizon==5){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.5)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.5)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.5)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.5)
    data$value.assistance.tax.other[data$Year==current_year+4]<-data$value.assistance.tax.other[data$Year==current_year+4]+as.numeric(assistance.tax.list$assistance.tax.year5.5)
    
  }
  
  if(horizon==6){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.6)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.6)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.6)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.6)
    data$value.assistance.tax.other[data$Year==current_year+4]<-data$value.assistance.tax.other[data$Year==current_year+4]+as.numeric(assistance.tax.list$assistance.tax.year5.6)
    data$value.assistance.tax.other[data$Year==current_year+5]<-data$value.assistance.tax.other[data$Year==current_year+5]+as.numeric(assistance.tax.list$assistance.tax.year6.6)
  }
  
  
  if(horizon==7){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.7)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.7)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.7)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.7)
    data$value.assistance.tax.other[data$Year==current_year+4]<-data$value.assistance.tax.other[data$Year==current_year+4]+as.numeric(assistance.tax.list$assistance.tax.year5.7)
    data$value.assistance.tax.other[data$Year==current_year+5]<-data$value.assistance.tax.other[data$Year==current_year+5]+as.numeric(assistance.tax.list$assistance.tax.year6.7)
    data$value.assistance.tax.other[data$Year==current_year+6]<-data$value.assistance.tax.other[data$Year==current_year+6]+as.numeric(assistance.tax.list$assistance.tax.year7.7)
  }
  
  if(horizon==8){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.8)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.8)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.8)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.8)
    data$value.assistance.tax.other[data$Year==current_year+4]<-data$value.assistance.tax.other[data$Year==current_year+4]+as.numeric(assistance.tax.list$assistance.tax.year5.8)
    data$value.assistance.tax.other[data$Year==current_year+5]<-data$value.assistance.tax.other[data$Year==current_year+5]+as.numeric(assistance.tax.list$assistance.tax.year6.8)
    data$value.assistance.tax.other[data$Year==current_year+6]<-data$value.assistance.tax.other[data$Year==current_year+6]+as.numeric(assistance.tax.list$assistance.tax.year7.8)
    data$value.assistance.tax.other[data$Year==current_year+7]<-data$value.assistance.tax.other[data$Year==current_year+7]+as.numeric(assistance.tax.list$assistance.tax.year8.8)
  }
  
  if(horizon==9){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.9)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.9)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.9)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.9)
    data$value.assistance.tax.other[data$Year==current_year+4]<-data$value.assistance.tax.other[data$Year==current_year+4]+as.numeric(assistance.tax.list$assistance.tax.year5.9)
    data$value.assistance.tax.other[data$Year==current_year+5]<-data$value.assistance.tax.other[data$Year==current_year+5]+as.numeric(assistance.tax.list$assistance.tax.year6.9)
    data$value.assistance.tax.other[data$Year==current_year+6]<-data$value.assistance.tax.other[data$Year==current_year+6]+as.numeric(assistance.tax.list$assistance.tax.year7.9)
    data$value.assistance.tax.other[data$Year==current_year+7]<-data$value.assistance.tax.other[data$Year==current_year+7]+as.numeric(assistance.tax.list$assistance.tax.year8.9)
    data$value.assistance.tax.other[data$Year==current_year+8]<-data$value.assistance.tax.other[data$Year==current_year+8]+as.numeric(assistance.tax.list$assistance.tax.year9.9)
  }
  
  if(horizon==10){
    data$value.assistance.tax.other[data$Year==current_year]<-data$value.assistance.tax.other[data$Year==current_year]+as.numeric(assistance.tax.list$assistance.tax.year1.10)
    data$value.assistance.tax.other[data$Year==current_year+1]<-data$value.assistance.tax.other[data$Year==current_year+1]+as.numeric(assistance.tax.list$assistance.tax.year2.10)
    data$value.assistance.tax.other[data$Year==current_year+2]<-data$value.assistance.tax.other[data$Year==current_year+2]+as.numeric(assistance.tax.list$assistance.tax.year3.10)
    data$value.assistance.tax.other[data$Year==current_year+3]<-data$value.assistance.tax.other[data$Year==current_year+3]+as.numeric(assistance.tax.list$assistance.tax.year4.10)
    data$value.assistance.tax.other[data$Year==current_year+4]<-data$value.assistance.tax.other[data$Year==current_year+4]+as.numeric(assistance.tax.list$assistance.tax.year5.10)
    data$value.assistance.tax.other[data$Year==current_year+5]<-data$value.assistance.tax.other[data$Year==current_year+5]+as.numeric(assistance.tax.list$assistance.tax.year6.10)
    data$value.assistance.tax.other[data$Year==current_year+6]<-data$value.assistance.tax.other[data$Year==current_year+6]+as.numeric(assistance.tax.list$assistance.tax.year7.10)
    data$value.assistance.tax.other[data$Year==current_year+7]<-data$value.assistance.tax.other[data$Year==current_year+7]+as.numeric(assistance.tax.list$assistance.tax.year8.10)
    data$value.assistance.tax.other[data$Year==current_year+8]<-data$value.assistance.tax.other[data$Year==current_year+8]+as.numeric(assistance.tax.list$assistance.tax.year9.10)
    data$value.assistance.tax.other[data$Year==current_year+9]<-data$value.assistance.tax.other[data$Year==current_year+9]+as.numeric(assistance.tax.list$assistance.tax.year10.10)
  }
  
  return(data)
  
}

xxxxx <<- 23

#-----------------------------------------------------------------------
# Table that Shows Default SS Expenses
table.DefaultExpenses<-function(data, horizon,inputs){
  
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "Both occupations are missing. Please select at least one occupation option on the previous page, then calculate results. ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
      
   
  table<-data.frame(matrix(0,nrow=8, ncol=horizon))
  
  rownames(table)<-c("Rent or Mortgage", "Utilities", "Child Care","Healthcare Insurance Out-of-Pocket Costs*","Food", "Transportation", "Technology", "Misc")
  
  ##### HORIZON BUDGET
   
  if(horizon==1){
    colnames(table)<-c("Year 1")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    }
  
  if(horizon==2){
    colnames(table)<-c("Year 1", "Year 2")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
  }
  
  if(horizon==3){
    colnames(table)<-c("Year 1", "Year 2", "Year 3")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
  }
  
  if(horizon==4){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
  }
  if(horizon==5){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4", "Year 5")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
    table[1,5]<-data$exp.rentormortgage.SS[data$Year==current_year+4]/12
    table[2,5]<-data$exp.utilities.SS[data$Year==current_year+4]/12
    table[3,5]<-data$exp.childcare.SS[data$Year==current_year+4]/12
    table[4,5]<-data$oop.health.family.ALICE[data$Year==current_year+4]/12
    table[5,5]<-data$exp.food.SS[data$Year==current_year+4]/12
    table[6,5]<-data$exp.transportation.SS[data$Year==current_year+4]/12
    table[7,5]<-data$exp.tech.SS[data$Year==current_year+4]/12
    table[8,5]<-data$exp.misc.SS[data$Year==current_year+4]/12
    
  }
  
  if(horizon==6){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
    table[1,5]<-data$exp.rentormortgage.SS[data$Year==current_year+4]/12
    table[2,5]<-data$exp.utilities.SS[data$Year==current_year+4]/12
    table[3,5]<-data$exp.childcare.SS[data$Year==current_year+4]/12
    table[4,5]<-data$oop.health.family.ALICE[data$Year==current_year+4]/12
    table[5,5]<-data$exp.food.SS[data$Year==current_year+4]/12
    table[6,5]<-data$exp.transportation.SS[data$Year==current_year+4]/12
    table[7,5]<-data$exp.tech.SS[data$Year==current_year+4]/12
    table[8,5]<-data$exp.misc.SS[data$Year==current_year+4]/12
    
    table[1,6]<-data$exp.rentormortgage.SS[data$Year==current_year+5]/12
    table[2,6]<-data$exp.utilities.SS[data$Year==current_year+5]/12
    table[3,6]<-data$exp.childcare.SS[data$Year==current_year+5]/12
    table[4,6]<-data$oop.health.family.ALICE[data$Year==current_year+5]/12
    table[5,6]<-data$exp.food.SS[data$Year==current_year+5]/12
    table[6,6]<-data$exp.transportation.SS[data$Year==current_year+5]/12
    table[7,6]<-data$exp.tech.SS[data$Year==current_year+5]/12
    table[8,6]<-data$exp.misc.SS[data$Year==current_year+5]/12
  }
  
  
  if(horizon==7){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
    table[1,5]<-data$exp.rentormortgage.SS[data$Year==current_year+4]/12
    table[2,5]<-data$exp.utilities.SS[data$Year==current_year+4]/12
    table[3,5]<-data$exp.childcare.SS[data$Year==current_year+4]/12
    table[4,5]<-data$oop.health.family.ALICE[data$Year==current_year+4]/12
    table[5,5]<-data$exp.food.SS[data$Year==current_year+4]/12
    table[6,5]<-data$exp.transportation.SS[data$Year==current_year+4]/12
    table[7,5]<-data$exp.tech.SS[data$Year==current_year+4]/12
    table[8,5]<-data$exp.misc.SS[data$Year==current_year+4]/12
    
    table[1,6]<-data$exp.rentormortgage.SS[data$Year==current_year+5]/12
    table[2,6]<-data$exp.utilities.SS[data$Year==current_year+5]/12
    table[3,6]<-data$exp.childcare.SS[data$Year==current_year+5]/12
    table[4,6]<-data$oop.health.family.ALICE[data$Year==current_year+5]/12
    table[5,6]<-data$exp.food.SS[data$Year==current_year+5]/12
    table[6,6]<-data$exp.transportation.SS[data$Year==current_year+5]/12
    table[7,6]<-data$exp.tech.SS[data$Year==current_year+5]/12
    table[8,6]<-data$exp.misc.SS[data$Year==current_year+5]/12
    
    table[1,7]<-data$exp.rentormortgage.SS[data$Year==current_year+6]/12
    table[2,7]<-data$exp.utilities.SS[data$Year==current_year+6]/12
    table[3,7]<-data$exp.childcare.SS[data$Year==current_year+6]/12
    table[4,7]<-data$oop.health.family.ALICE[data$Year==current_year+6]/12
    table[5,7]<-data$exp.food.SS[data$Year==current_year+6]/12
    table[6,7]<-data$exp.transportation.SS[data$Year==current_year+6]/12
    table[7,7]<-data$exp.tech.SS[data$Year==current_year+6]/12
    table[8,7]<-data$exp.misc.SS[data$Year==current_year+6]/12
    
  }
  
  if(horizon==8){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
    table[1,5]<-data$exp.rentormortgage.SS[data$Year==current_year+4]/12
    table[2,5]<-data$exp.utilities.SS[data$Year==current_year+4]/12
    table[3,5]<-data$exp.childcare.SS[data$Year==current_year+4]/12
    table[4,5]<-data$oop.health.family.ALICE[data$Year==current_year+4]/12
    table[5,5]<-data$exp.food.SS[data$Year==current_year+4]/12
    table[6,5]<-data$exp.transportation.SS[data$Year==current_year+4]/12
    table[7,5]<-data$exp.tech.SS[data$Year==current_year+4]/12
    table[8,5]<-data$exp.misc.SS[data$Year==current_year+4]/12
    
    table[1,6]<-data$exp.rentormortgage.SS[data$Year==current_year+5]/12
    table[2,6]<-data$exp.utilities.SS[data$Year==current_year+5]/12
    table[3,6]<-data$exp.childcare.SS[data$Year==current_year+5]/12
    table[4,6]<-data$oop.health.family.ALICE[data$Year==current_year+5]/12
    table[5,6]<-data$exp.food.SS[data$Year==current_year+5]/12
    table[6,6]<-data$exp.transportation.SS[data$Year==current_year+5]/12
    table[7,6]<-data$exp.tech.SS[data$Year==current_year+5]/12
    table[8,6]<-data$exp.misc.SS[data$Year==current_year+5]/12
    
    table[1,7]<-data$exp.rentormortgage.SS[data$Year==current_year+6]/12
    table[2,7]<-data$exp.utilities.SS[data$Year==current_year+6]/12
    table[3,7]<-data$exp.childcare.SS[data$Year==current_year+6]/12
    table[4,7]<-data$oop.health.family.ALICE[data$Year==current_year+6]/12
    table[5,7]<-data$exp.food.SS[data$Year==current_year+6]/12
    table[6,7]<-data$exp.transportation.SS[data$Year==current_year+6]/12
    table[7,7]<-data$exp.tech.SS[data$Year==current_year+6]/12
    table[8,7]<-data$exp.misc.SS[data$Year==current_year+6]/12
    
    table[1,8]<-data$exp.rentormortgage.SS[data$Year==current_year+7]/12
    table[2,8]<-data$exp.utilities.SS[data$Year==current_year+7]/12
    table[3,8]<-data$exp.childcare.SS[data$Year==current_year+7]/12
    table[4,8]<-data$oop.health.family.ALICE[data$Year==current_year+7]/12
    table[5,8]<-data$exp.food.SS[data$Year==current_year+7]/12
    table[6,8]<-data$exp.transportation.SS[data$Year==current_year+7]/12
    table[7,8]<-data$exp.tech.SS[data$Year==current_year+7]/12
    table[8,8]<-data$exp.misc.SS[data$Year==current_year+7]/12
    
  }
 
  
  
  if(horizon==9){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
    table[1,5]<-data$exp.rentormortgage.SS[data$Year==current_year+4]/12
    table[2,5]<-data$exp.utilities.SS[data$Year==current_year+4]/12
    table[3,5]<-data$exp.childcare.SS[data$Year==current_year+4]/12
    table[4,5]<-data$oop.health.family.ALICE[data$Year==current_year+4]/12
    table[5,5]<-data$exp.food.SS[data$Year==current_year+4]/12
    table[6,5]<-data$exp.transportation.SS[data$Year==current_year+4]/12
    table[7,5]<-data$exp.tech.SS[data$Year==current_year+4]/12
    table[8,5]<-data$exp.misc.SS[data$Year==current_year+4]/12
    
    table[1,6]<-data$exp.rentormortgage.SS[data$Year==current_year+5]/12
    table[2,6]<-data$exp.utilities.SS[data$Year==current_year+5]/12
    table[3,6]<-data$exp.childcare.SS[data$Year==current_year+5]/12
    table[4,6]<-data$oop.health.family.ALICE[data$Year==current_year+5]/12
    table[5,6]<-data$exp.food.SS[data$Year==current_year+5]/12
    table[6,6]<-data$exp.transportation.SS[data$Year==current_year+5]/12
    table[7,6]<-data$exp.tech.SS[data$Year==current_year+5]/12
    table[8,6]<-data$exp.misc.SS[data$Year==current_year+5]/12
    
    table[1,7]<-data$exp.rentormortgage.SS[data$Year==current_year+6]/12
    table[2,7]<-data$exp.utilities.SS[data$Year==current_year+6]/12
    table[3,7]<-data$exp.childcare.SS[data$Year==current_year+6]/12
    table[4,7]<-data$oop.health.family.ALICE[data$Year==current_year+6]/12
    table[5,7]<-data$exp.food.SS[data$Year==current_year+6]/12
    table[6,7]<-data$exp.transportation.SS[data$Year==current_year+6]/12
    table[7,7]<-data$exp.tech.SS[data$Year==current_year+6]/12
    table[8,7]<-data$exp.misc.SS[data$Year==current_year+6]/12
    
    table[1,8]<-data$exp.rentormortgage.SS[data$Year==current_year+7]/12
    table[2,8]<-data$exp.utilities.SS[data$Year==current_year+7]/12
    table[3,8]<-data$exp.childcare.SS[data$Year==current_year+7]/12
    table[4,8]<-data$oop.health.family.ALICE[data$Year==current_year+7]/12
    table[5,8]<-data$exp.food.SS[data$Year==current_year+7]/12
    table[6,8]<-data$exp.transportation.SS[data$Year==current_year+7]/12
    table[7,8]<-data$exp.tech.SS[data$Year==current_year+7]/12
    table[8,8]<-data$exp.misc.SS[data$Year==current_year+7]/12
    
    
    table[1,9]<-data$exp.rentormortgage.SS[data$Year==current_year+8]/12
    table[2,9]<-data$exp.utilities.SS[data$Year==current_year+8]/12
    table[3,9]<-data$exp.childcare.SS[data$Year==current_year+8]/12
    table[4,9]<-data$oop.health.family.ALICE[data$Year==current_year+8]/12
    table[5,9]<-data$exp.food.SS[data$Year==current_year+8]/12
    table[6,9]<-data$exp.transportation.SS[data$Year==current_year+8]/12
    table[7,9]<-data$exp.tech.SS[data$Year==current_year+8]/12
    table[8,9]<-data$exp.misc.SS[data$Year==current_year+8]/12
  }
  
 
  if(horizon==10){
    colnames(table)<-c("Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9", "Year 10")
    table[1,1]<-data$exp.rentormortgage.SS[data$Year==current_year]/12
    table[2,1]<-data$exp.utilities.SS[data$Year==current_year]/12
    table[3,1]<-data$exp.childcare.SS[data$Year==current_year]/12
    table[4,1]<-data$oop.health.family.ALICE[data$Year==current_year]/12
    table[5,1]<-data$exp.food.SS[data$Year==current_year]/12
    table[6,1]<-data$exp.transportation.SS[data$Year==current_year]/12
    table[7,1]<-data$exp.tech.SS[data$Year==current_year]/12
    table[8,1]<-data$exp.misc.SS[data$Year==current_year]/12
    
    table[1,2]<-data$exp.rentormortgage.SS[data$Year==current_year+1]/12
    table[2,2]<-data$exp.utilities.SS[data$Year==current_year+1]/12
    table[3,2]<-data$exp.childcare.SS[data$Year==current_year+1]/12
    table[4,2]<-data$oop.health.family.ALICE[data$Year==current_year+1]/12
    table[5,2]<-data$exp.food.SS[data$Year==current_year+1]/12
    table[6,2]<-data$exp.transportation.SS[data$Year==current_year+1]/12
    table[7,2]<-data$exp.tech.SS[data$Year==current_year+1]/12
    table[8,2]<-data$exp.misc.SS[data$Year==current_year+1]/12
    
    table[1,3]<-data$exp.rentormortgage.SS[data$Year==current_year+2]/12
    table[2,3]<-data$exp.utilities.SS[data$Year==current_year+2]/12
    table[3,3]<-data$exp.childcare.SS[data$Year==current_year+2]/12
    table[4,3]<-data$oop.health.family.ALICE[data$Year==current_year+2]/12
    table[5,3]<-data$exp.food.SS[data$Year==current_year+2]/12
    table[6,3]<-data$exp.transportation.SS[data$Year==current_year+2]/12
    table[7,3]<-data$exp.tech.SS[data$Year==current_year+2]/12
    table[8,3]<-data$exp.misc.SS[data$Year==current_year+2]/12
    
    table[1,4]<-data$exp.rentormortgage.SS[data$Year==current_year+3]/12
    table[2,4]<-data$exp.utilities.SS[data$Year==current_year+3]/12
    table[3,4]<-data$exp.childcare.SS[data$Year==current_year+3]/12
    table[4,4]<-data$oop.health.family.ALICE[data$Year==current_year+3]/12
    table[5,4]<-data$exp.food.SS[data$Year==current_year+3]/12
    table[6,4]<-data$exp.transportation.SS[data$Year==current_year+3]/12
    table[7,4]<-data$exp.tech.SS[data$Year==current_year+3]/12
    table[8,4]<-data$exp.misc.SS[data$Year==current_year+3]/12
    
    table[1,5]<-data$exp.rentormortgage.SS[data$Year==current_year+4]/12
    table[2,5]<-data$exp.utilities.SS[data$Year==current_year+4]/12
    table[3,5]<-data$exp.childcare.SS[data$Year==current_year+4]/12
    table[4,5]<-data$oop.health.family.ALICE[data$Year==current_year+4]/12
    table[5,5]<-data$exp.food.SS[data$Year==current_year+4]/12
    table[6,5]<-data$exp.transportation.SS[data$Year==current_year+4]/12
    table[7,5]<-data$exp.tech.SS[data$Year==current_year+4]/12
    table[8,5]<-data$exp.misc.SS[data$Year==current_year+4]/12
    
    table[1,6]<-data$exp.rentormortgage.SS[data$Year==current_year+5]/12
    table[2,6]<-data$exp.utilities.SS[data$Year==current_year+5]/12
    table[3,6]<-data$exp.childcare.SS[data$Year==current_year+5]/12
    table[4,6]<-data$oop.health.family.ALICE[data$Year==current_year+5]/12
    table[5,6]<-data$exp.food.SS[data$Year==current_year+5]/12
    table[6,6]<-data$exp.transportation.SS[data$Year==current_year+5]/12
    table[7,6]<-data$exp.tech.SS[data$Year==current_year+5]/12
    table[8,6]<-data$exp.misc.SS[data$Year==current_year+5]/12
    
    table[1,7]<-data$exp.rentormortgage.SS[data$Year==current_year+6]/12
    table[2,7]<-data$exp.utilities.SS[data$Year==current_year+6]/12
    table[3,7]<-data$exp.childcare.SS[data$Year==current_year+6]/12
    table[4,7]<-data$oop.health.family.ALICE[data$Year==current_year+6]/12
    table[5,7]<-data$exp.food.SS[data$Year==current_year+6]/12
    table[6,7]<-data$exp.transportation.SS[data$Year==current_year+6]/12
    table[7,7]<-data$exp.tech.SS[data$Year==current_year+6]/12
    table[8,7]<-data$exp.misc.SS[data$Year==current_year+6]/12
    
    table[1,8]<-data$exp.rentormortgage.SS[data$Year==current_year+7]/12
    table[2,8]<-data$exp.utilities.SS[data$Year==current_year+7]/12
    table[3,8]<-data$exp.childcare.SS[data$Year==current_year+7]/12
    table[4,8]<-data$oop.health.family.ALICE[data$Year==current_year+7]/12
    table[5,8]<-data$exp.food.SS[data$Year==current_year+7]/12
    table[6,8]<-data$exp.transportation.SS[data$Year==current_year+7]/12
    table[7,8]<-data$exp.tech.SS[data$Year==current_year+7]/12
    table[8,8]<-data$exp.misc.SS[data$Year==current_year+7]/12
    
    table[1,9]<-data$exp.rentormortgage.SS[data$Year==current_year+8]/12
    table[2,9]<-data$exp.utilities.SS[data$Year==current_year+8]/12
    table[3,9]<-data$exp.childcare.SS[data$Year==current_year+8]/12
    table[4,9]<-data$oop.health.family.ALICE[data$Year==current_year+8]/12
    table[5,9]<-data$exp.food.SS[data$Year==current_year+8]/12
    table[6,9]<-data$exp.transportation.SS[data$Year==current_year+8]/12
    table[7,9]<-data$exp.tech.SS[data$Year==current_year+8]/12
    table[8,9]<-data$exp.misc.SS[data$Year==current_year+8]/12
    
    table[1,10]<-data$exp.rentormortgage.SS[data$Year==current_year+9]/12
    table[2,10]<-data$exp.utilities.SS[data$Year==current_year+9]/12
    table[3,10]<-data$exp.childcare.SS[data$Year==current_year+9]/12
    table[4,10]<-data$oop.health.family.ALICE[data$Year==current_year+9]/12
    table[5,10]<-data$exp.food.SS[data$Year==current_year+9]/12
    table[6,10]<-data$exp.transportation.SS[data$Year==current_year+9]/12
    table[7,10]<-data$exp.tech.SS[data$Year==current_year+9]/12
    table[8,10]<-data$exp.misc.SS[data$Year==current_year+9]/12
    
  }
   
  
  
  table <- format(round(table,0), big.mark=",")
  
 # x <- h4("Health insurance premium is computed for you and varies by the type of health insurance you receive.")
  
#  table <- rbind(table, x)
  
  return(table)
  
  
}


#-----------------------------------------------------------------------
# Budgeting - Total Budget Table
table.Budget<-function(data1, data2, dataInit, selected, horizon, exp_type,inputs){
  

  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: Nothing is selected
 
  validate(
    need(selected != "empty", "Please select a career path to plan for")
  )
  validate(
    need(exp_type != 0, "Expenses Type has not been selected on prior page. Please select one of the Expense Type options.")
  )
  
  validate(
    need(inputs$missing_age!=1, "        ")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "         ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  
  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "        ")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "        ")
    )
    
  }
  
 # dataInit$value.assistance.other <- dataInit$value.assistance.other + dataInit$value.assistance.tax.other
 # data$value.assistance.other <- data$value.assistance.other + data$value.assistance.tax.other
  
  
  
  if(selected=="Career Option 1"){
    data<-data1
  }else if(selected=="Career Option 2"){
    data<-data2
  }
  
 # dataInit$value.assistance.other <- dataInit$value.assistance.other + dataInit$value.assistance.tax.other
 # data$value.assistance.other <- data$value.assistance.other + data$value.assistance.tax.other
  
  
  # Error 2: Career option was not specified
  validate(
    need(!is.na(sum(data$income)), "This career option was not specified at the 'Choose Career' step")
  )
  
 #dataInit$value.assistance.other <- dataInit$value.assistance.other + dataInit$value.assistance.tax.other
 # data$value.assistance.other <- data$value.assistance.other + data$value.assistance.tax.other
  
  table<-data.frame(matrix(0,nrow=7, ncol=horizon+1))
  rownames(table)<-c("+ Income*", "+ Public Assistance",    #"+ Value of Employer Health Insurance", 
                     "- Living Expenses", "- Student Loan Repayments", "- Repayment of Other Loans", "- Out-of-Pocket Tuition", "= Annual Budget")
  
  
  dataInit$expenseOOP <- dataInit$total.expenses - dataInit$value.employerhealthcare
  data$expenseOOP <- data$total.expenses - data$value.employerhealthcare
  
  
  #### HORIZON BUDGET
  
  if(horizon==1){
    colnames(table)<-c("Current Job", "New Path: Year 1")
    
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
  }
  
  if(horizon==2){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
  }
  
  if(horizon==3){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
  }
  
  if(horizon==4){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
  }
  
  if(horizon==5){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
    table[1,6]<-data$income.aftertax.noTC[data$Year==current_year+4]
    table[2,6]<-data$total.transfers[data$Year==current_year+4]
    #table[3,6]<-data$value.employerhealthcare[data$Year==current_year+4]
    table[3,6]<-data$expenseOOP[data$Year==current_year+4]
    table[4,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[5,6]<-data$value.loans[data$Year==current_year+4]
    table[6,6]<-data$value.tuition.net[data$Year==current_year+4]
    table[7,6]<-data$NetResources[data$Year==current_year+4]
    
  }
  
  
  
  if(horizon==6){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
    table[1,6]<-data$income.aftertax.noTC[data$Year==current_year+4]
    table[2,6]<-data$total.transfers[data$Year==current_year+4]
    #table[3,6]<-data$value.employerhealthcare[data$Year==current_year+4]
    table[3,6]<-data$expenseOOP[data$Year==current_year+4]
    table[4,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[5,6]<-data$value.loans[data$Year==current_year+4]
    table[6,6]<-data$value.tuition.net[data$Year==current_year+4]
    table[7,6]<-data$NetResources[data$Year==current_year+4]
    
    table[1,7]<-data$income.aftertax.noTC[data$Year==current_year+5]
    table[2,7]<-data$total.transfers[data$Year==current_year+5]
    #table[3,7]<-data$value.employerhealthcare[data$Year==current_year+5]
    table[3,7]<-data$expenseOOP[data$Year==current_year+5]
    table[4,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[5,7]<-data$value.loans[data$Year==current_year+5]
    table[6,7]<-data$value.tuition.net[data$Year==current_year+5]
    table[7,7]<-data$NetResources[data$Year==current_year+5]
    
  }

  if(horizon==7){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
    table[1,6]<-data$income.aftertax.noTC[data$Year==current_year+4]
    table[2,6]<-data$total.transfers[data$Year==current_year+4]
    #table[3,6]<-data$value.employerhealthcare[data$Year==current_year+4]
    table[3,6]<-data$expenseOOP[data$Year==current_year+4]
    table[4,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[5,6]<-data$value.loans[data$Year==current_year+4]
    table[6,6]<-data$value.tuition.net[data$Year==current_year+4]
    table[7,6]<-data$NetResources[data$Year==current_year+4]
    
    table[1,7]<-data$income.aftertax.noTC[data$Year==current_year+5]
    table[2,7]<-data$total.transfers[data$Year==current_year+5]
    #table[3,7]<-data$value.employerhealthcare[data$Year==current_year+5]
    table[3,7]<-data$expenseOOP[data$Year==current_year+5]
    table[4,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[5,7]<-data$value.loans[data$Year==current_year+5]
    table[6,7]<-data$value.tuition.net[data$Year==current_year+5]
    table[7,7]<-data$NetResources[data$Year==current_year+5]
    
    table[1,8]<-data$income.aftertax.noTC[data$Year==current_year+6]
    table[2,8]<-data$total.transfers[data$Year==current_year+6]
    #table[3,8]<-data$value.employerhealthcare[data$Year==current_year+6]
    table[3,8]<-data$expenseOOP[data$Year==current_year+6]
    table[4,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[5,8]<-data$value.loans[data$Year==current_year+6]
    table[6,8]<-data$value.tuition.net[data$Year==current_year+6]
    table[7,8]<-data$NetResources[data$Year==current_year+6]
    
  }

  if(horizon==8){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
    table[1,6]<-data$income.aftertax.noTC[data$Year==current_year+4]
    table[2,6]<-data$total.transfers[data$Year==current_year+4]
    #table[3,6]<-data$value.employerhealthcare[data$Year==current_year+4]
    table[3,6]<-data$expenseOOP[data$Year==current_year+4]
    table[4,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[5,6]<-data$value.loans[data$Year==current_year+4]
    table[6,6]<-data$value.tuition.net[data$Year==current_year+4]
    table[7,6]<-data$NetResources[data$Year==current_year+4]
    
    table[1,7]<-data$income.aftertax.noTC[data$Year==current_year+5]
    table[2,7]<-data$total.transfers[data$Year==current_year+5]
    #table[3,7]<-data$value.employerhealthcare[data$Year==current_year+5]
    table[3,7]<-data$expenseOOP[data$Year==current_year+5]
    table[4,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[5,7]<-data$value.loans[data$Year==current_year+5]
    table[6,7]<-data$value.tuition.net[data$Year==current_year+5]
    table[7,7]<-data$NetResources[data$Year==current_year+5]
    
    table[1,8]<-data$income.aftertax.noTC[data$Year==current_year+6]
    table[2,8]<-data$total.transfers[data$Year==current_year+6]
    #table[3,8]<-data$value.employerhealthcare[data$Year==current_year+6]
    table[3,8]<-data$expenseOOP[data$Year==current_year+6]
    table[4,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[5,8]<-data$value.loans[data$Year==current_year+6]
    table[6,8]<-data$value.tuition.net[data$Year==current_year+6]
    table[7,8]<-data$NetResources[data$Year==current_year+6]
    
    table[1,9]<-data$income.aftertax.noTC[data$Year==current_year+7]
    table[2,9]<-data$total.transfers[data$Year==current_year+7]
    #table[3,9]<-data$value.employerhealthcare[data$Year==current_year+7]
    table[3,9]<-data$expenseOOP[data$Year==current_year+7]
    table[4,9]<-data$studentLoanRepayment[data$Year==current_year+7]
    table[5,9]<-data$value.loans[data$Year==current_year+7]
    table[6,9]<-data$value.tuition.net[data$Year==current_year+7]
    table[7,9]<-data$NetResources[data$Year==current_year+7]
    
  }
  
  if(horizon==9){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
    table[1,6]<-data$income.aftertax.noTC[data$Year==current_year+4]
    table[2,6]<-data$total.transfers[data$Year==current_year+4]
    #table[3,6]<-data$value.employerhealthcare[data$Year==current_year+4]
    table[3,6]<-data$expenseOOP[data$Year==current_year+4]
    table[4,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[5,6]<-data$value.loans[data$Year==current_year+4]
    table[6,6]<-data$value.tuition.net[data$Year==current_year+4]
    table[7,6]<-data$NetResources[data$Year==current_year+4]
    
    table[1,7]<-data$income.aftertax.noTC[data$Year==current_year+5]
    table[2,7]<-data$total.transfers[data$Year==current_year+5]
    #table[3,7]<-data$value.employerhealthcare[data$Year==current_year+5]
    table[3,7]<-data$expenseOOP[data$Year==current_year+5]
    table[4,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[5,7]<-data$value.loans[data$Year==current_year+5]
    table[6,7]<-data$value.tuition.net[data$Year==current_year+5]
    table[7,7]<-data$NetResources[data$Year==current_year+5]
    
    table[1,8]<-data$income.aftertax.noTC[data$Year==current_year+6]
    table[2,8]<-data$total.transfers[data$Year==current_year+6]
    #table[3,8]<-data$value.employerhealthcare[data$Year==current_year+6]
    table[3,8]<-data$expenseOOP[data$Year==current_year+6]
    table[4,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[5,8]<-data$value.loans[data$Year==current_year+6]
    table[6,8]<-data$value.tuition.net[data$Year==current_year+6]
    table[7,8]<-data$NetResources[data$Year==current_year+6]
    
    table[1,9]<-data$income.aftertax.noTC[data$Year==current_year+7]
    table[2,9]<-data$total.transfers[data$Year==current_year+7]
    #table[3,9]<-data$value.employerhealthcare[data$Year==current_year+7]
    table[3,9]<-data$expenseOOP[data$Year==current_year+7]
    table[4,9]<-data$studentLoanRepayment[data$Year==current_year+7]
    table[5,9]<-data$value.loans[data$Year==current_year+7]
    table[6,9]<-data$value.tuition.net[data$Year==current_year+7]
    table[7,9]<-data$NetResources[data$Year==current_year+7]
    
    table[1,10]<-data$income.aftertax.noTC[data$Year==current_year+8]
    table[2,10]<-data$total.transfers[data$Year==current_year+8]
    #table[3,10]<-data$value.employerhealthcare[data$Year==current_year+8]
    table[3,10]<-data$expenseOOP[data$Year==current_year+8]
    table[4,10]<-data$studentLoanRepayment[data$Year==current_year+8]
    table[5,10]<-data$value.loans[data$Year==current_year+8]
    table[6,10]<-data$value.tuition.net[data$Year==current_year+8]
    table[7,10]<-data$NetResources[data$Year==current_year+8]
    
  }
  
  if(horizon==10){
    colnames(table)<-c("Current Job","New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9", "Year 10")
    table[1,1]<-dataInit$income.aftertax.noTC[dataInit$Year==current_year]
    table[2,1]<-dataInit$total.transfers[dataInit$Year==current_year]
    #table[3,1]<-dataInit$value.employerhealthcare[dataInit$Year==current_year]
    table[3,1]<-dataInit$expenseOOP[dataInit$Year==current_year]
    table[4,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[5,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[6,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    table[7,1]<-dataInit$NetResources[dataInit$Year==current_year]
    
    table[1,2]<-data$income.aftertax.noTC[data$Year==current_year]
    table[2,2]<-data$total.transfers[data$Year==current_year]
    #table[3,2]<-data$value.employerhealthcare[data$Year==current_year]
    table[3,2]<-data$expenseOOP[data$Year==current_year]
    table[4,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[5,2]<-data$value.loans[data$Year==current_year]
    table[6,2]<-data$value.tuition.net[data$Year==current_year]
    table[7,2]<-data$NetResources[data$Year==current_year]
    
    table[1,3]<-data$income.aftertax.noTC[data$Year==current_year+1]
    table[2,3]<-data$total.transfers[data$Year==current_year+1]
    #table[3,3]<-data$value.employerhealthcare[data$Year==current_year+1]
    table[3,3]<-data$expenseOOP[data$Year==current_year+1]
    table[4,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[5,3]<-data$value.loans[data$Year==current_year+1]
    table[6,3]<-data$value.tuition.net[data$Year==current_year+1]
    table[7,3]<-data$NetResources[data$Year==current_year+1]
    
    table[1,4]<-data$income.aftertax.noTC[data$Year==current_year+2]
    table[2,4]<-data$total.transfers[data$Year==current_year+2]
    #table[3,4]<-data$value.employerhealthcare[data$Year==current_year+2]
    table[3,4]<-data$expenseOOP[data$Year==current_year+2]
    table[4,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[5,4]<-data$value.loans[data$Year==current_year+2]
    table[6,4]<-data$value.tuition.net[data$Year==current_year+2]
    table[7,4]<-data$NetResources[data$Year==current_year+2]
    
    table[1,5]<-data$income.aftertax.noTC[data$Year==current_year+3]
    table[2,5]<-data$total.transfers[data$Year==current_year+3]
    #table[3,5]<-data$value.employerhealthcare[data$Year==current_year+3]
    table[3,5]<-data$expenseOOP[data$Year==current_year+3]
    table[4,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[5,5]<-data$value.loans[data$Year==current_year+3]
    table[6,5]<-data$value.tuition.net[data$Year==current_year+3]
    table[7,5]<-data$NetResources[data$Year==current_year+3]
    
    table[1,6]<-data$income.aftertax.noTC[data$Year==current_year+4]
    table[2,6]<-data$total.transfers[data$Year==current_year+4]
    #table[3,6]<-data$value.employerhealthcare[data$Year==current_year+4]
    table[3,6]<-data$expenseOOP[data$Year==current_year+4]
    table[4,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[5,6]<-data$value.loans[data$Year==current_year+4]
    table[6,6]<-data$value.tuition.net[data$Year==current_year+4]
    table[7,6]<-data$NetResources[data$Year==current_year+4]
    
    table[1,7]<-data$income.aftertax.noTC[data$Year==current_year+5]
    table[2,7]<-data$total.transfers[data$Year==current_year+5]
    #table[3,7]<-data$value.employerhealthcare[data$Year==current_year+5]
    table[3,7]<-data$expenseOOP[data$Year==current_year+5]
    table[4,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[5,7]<-data$value.loans[data$Year==current_year+5]
    table[6,7]<-data$value.tuition.net[data$Year==current_year+5]
    table[7,7]<-data$NetResources[data$Year==current_year+5]
    
    table[1,8]<-data$income.aftertax.noTC[data$Year==current_year+6]
    table[2,8]<-data$total.transfers[data$Year==current_year+6]
    #table[3,8]<-data$value.employerhealthcare[data$Year==current_year+6]
    table[3,8]<-data$expenseOOP[data$Year==current_year+6]
    table[4,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[5,8]<-data$value.loans[data$Year==current_year+6]
    table[6,8]<-data$value.tuition.net[data$Year==current_year+6]
    table[7,8]<-data$NetResources[data$Year==current_year+6]
    
    table[1,9]<-data$income.aftertax.noTC[data$Year==current_year+7]
    table[2,9]<-data$total.transfers[data$Year==current_year+7]
    #table[3,9]<-data$value.employerhealthcare[data$Year==current_year+7]
    table[3,9]<-data$expenseOOP[data$Year==current_year+7]
    table[4,9]<-data$studentLoanRepayment[data$Year==current_year+7]
    table[5,9]<-data$value.loans[data$Year==current_year+7]
    table[6,9]<-data$value.tuition.net[data$Year==current_year+7]
    table[7,9]<-data$NetResources[data$Year==current_year+7]
    
    table[1,10]<-data$income.aftertax.noTC[data$Year==current_year+8]
    table[2,10]<-data$total.transfers[data$Year==current_year+8]
    #table[3,10]<-data$value.employerhealthcare[data$Year==current_year+8]
    table[3,10]<-data$expenseOOP[data$Year==current_year+8]
    table[4,10]<-data$studentLoanRepayment[data$Year==current_year+8]
    table[5,10]<-data$value.loans[data$Year==current_year+8]
    table[6,10]<-data$value.tuition.net[data$Year==current_year+8]
    table[7,10]<-data$NetResources[data$Year==current_year+8]
    
    table[1,11]<-data$income.aftertax.noTC[data$Year==current_year+9]
    table[2,11]<-data$total.transfers[data$Year==current_year+9]
    #table[3,11]<-data$value.employerhealthcare[data$Year==current_year+9]
    table[3,11]<-data$expenseOOP[data$Year==current_year+9]
    table[4,11]<-data$studentLoanRepayment[data$Year==current_year+9]
    table[5,11]<-data$value.loans[data$Year==current_year+9]
    table[6,11]<-data$value.tuition.net[data$Year==current_year+9]
    table[7,11]<-data$NetResources[data$Year==current_year+9]
    
  }
  
  table <- format(round(table,0), big.mark=",")
  
  return(table)
  
}

xxxxx <<- 25

#-----------------------------------------------------------------------
# Budgeting - Public Assistance Breakdown Table
table.Transfers<-function(data1, data2, dataInit, selected, horizon, exp_type, inputs, benefitslist){
       
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: Nothing is selected
  validate(
    need(selected != "empty", "Please select a career path to plan for")
  )
  validate(
    need(exp_type != 0, "Expenses Type has not been selected on prior page. Please select one of the Expense Type options.")
  )
  
  validate(
    need(inputs$missing_age!=1, "     ")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "       ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  

  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "        ")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "        ")
    )
    
  }
  
  
  if(selected=="Career Option 1"){
    data<-data1
  }else if(selected=="Career Option 2"){
    data<-data2
  }
  
  
  dataInit$value.assistance.other <- dataInit$value.assistance.other + dataInit$value.assistance.tax.other
  data$value.assistance.other <- data$value.assistance.other + data$value.assistance.tax.other
  if ((dataInit$value.assistance.other[1] > 0) | (sum(data$value.assistance.other) > 0))
    benefitslist <- c(benefitslist,"Wraparound Support")
  
  # Error 2: Career option was not specified
  validate(
    need(!is.na(sum(data$income)), "This career option was not specified at the 'Choose Career' step")
  )
  
  #new method
  
  # remove unneeded programs
  # getnames of variables colnames <- store as array
  # rename housing voucher rap if rap selected
  # create 5 datasets, one each year
  # based on horizon, combine cols 1-2:5 together
  # apply colnames 
  
  ## Rename Factors
  names(data)[names(data)=="value.medicaid.adult"] <- "Medicaid for Adults"
  names(data)[names(data)=="value.medicaid.child"] <- "Medicaid for Children/CHIP"
  names(data)[names(data)=="value.snap"] <- "Supplemental Nutrition Assistance Program (SNAP)"
  names(data)[names(data)=="value.wic"] <- "Women, Infants and Children Nutrition Program (WIC)"
  names(data)[names(data)=="value.cdctc"] <- "Child and Dependent Care Tax Credit (CDCTC)"
  names(data)[names(data)=="value.section8"] <- "Section 8 Housing Voucher"
  if (data$stateAbbrev[1] == "FL") 
    names(data)[names(data)=="value.CCDF"] <- "CCDF/SR Plus"
  else
    names(data)[names(data)=="value.CCDF"] <- "Child Care Subsidy (CCDF)"
  names(data)[names(data)=="value.aca"] <- "Health Insurance Marketplace Subsidy"
  names(data)[names(data)=="value.eitc"] <- "Earned Income Tax Credit (EITC)"
  names(data)[names(data)=="value.ctc"] <- "Child Tax Credit (CTC)"
  names(data)[names(data)=="value.schoolmeals"] <- "Free or Reduced Price School Meals"
  #names(data)[names(data)=="value.liheap"] <- "LIHEAP"
  names(data)[names(data)=="value.HeadStart"] <- "Head Start"
  #names(data)[names(data)=="value.earlyHeadStart"] <- "Early Head Start"
  names(data)[names(data)=="value.PreK"] <- "State-Funded Pre-Kindergarten"
  names(data)[names(data)=="tax.income.fed"] <- "Federal Income Tax"
  names(data)[names(data)=="tax.income.state"] <- "State Income Tax"
  names(data)[names(data)=="tax.FICA"] <- "FICA Tax"
  names(data)[names(data)=="value.tanf"] <- "Temporary Assistance for Needy Families (TANF)"
  names(data)[names(data)=="value.ssi"] <- "Supplemental Security Income (SSI)"
  names(data)[names(data)=="value.ssdi"] <- "Social Security Disability Insurance (SSDI)"
  names(data)[names(data)=="value.hhf"] <- "Career MAP Income Support"
  names(data)[names(data)=="value.dcflex"] <- "DC Flex"
  names(data)[names(data)=="value.assistance.other"] <- "Wraparound Support"
  names(dataInit)[names(dataInit)=="value.medicaid.adult"] <- "Medicaid for Adults"
  names(dataInit)[names(dataInit)=="value.medicaid.child"] <- "Medicaid for Children/CHIP"
  names(dataInit)[names(dataInit)=="value.snap"] <- "Supplemental Nutrition Assistance Program (SNAP)"
  names(dataInit)[names(dataInit)=="value.wic"] <- "Women, Infants and Children Nutrition Program (WIC)"
  names(dataInit)[names(dataInit)=="value.cdctc"] <- "Child and Dependent Care Tax Credit (CDCTC)"
  names(dataInit)[names(dataInit)=="value.section8"] <- "Section 8 Housing Voucher"
  if (dataInit$stateAbbrev[1] == "FL") 
    names(dataInit)[names(dataInit)=="value.CCDF"] <- "CCDF/SR Plus"
  else
    names(dataInit)[names(dataInit)=="value.CCDF"] <- "Child Care Subsidy (CCDF)"
  names(dataInit)[names(dataInit)=="value.aca"] <- "Health Insurance Marketplace Subsidy"
  names(dataInit)[names(dataInit)=="value.eitc"] <- "Earned Income Tax Credit (EITC)"
  names(dataInit)[names(dataInit)=="value.ctc"] <- "Child Tax Credit (CTC)"
  names(dataInit)[names(dataInit)=="value.schoolmeals"] <- "Free or Reduced Price School Meals"
  #names(dataInit)[names(dataInit)=="value.liheap"] <- "LIHEAP"
  names(dataInit)[names(dataInit)=="value.HeadStart"] <- "Head Start"
  #names(dataInit)[names(dataInit)=="value.earlyHeadStart"] <- "Early Head Start"
  names(dataInit)[names(dataInit)=="value.PreK"] <- "State-Funded Pre-Kindergarten"
  names(dataInit)[names(dataInit)=="tax.income.fed"] <- "Federal Income Tax"
  names(dataInit)[names(dataInit)=="tax.income.state"] <- "State Income Tax"
  names(dataInit)[names(dataInit)=="tax.FICA"] <- "FICA Tax"
  names(dataInit)[names(dataInit)=="value.tanf"] <- "Temporary Assistance for Needy Families (TANF)"
  names(dataInit)[names(dataInit)=="value.ssi"] <- "Supplemental Security Income (SSI)"
  names(dataInit)[names(dataInit)=="value.ssdi"] <- "Social Security Disability Insurance (SSDI)"
  names(dataInit)[names(dataInit)=="value.hhf"] <- "Career MAP Income Support"
  names(dataInit)[names(dataInit)=="value.assistance.other"] <- "Wraparound Support"
  names(dataInit)[names(dataInit)=="value.dcflex"] <- "DC Flex"
  if ("Career MAP - Housing" %in% benefitslist){
    names(data)[names(data)=="Section 8 Housing Voucher"] <- "Career MAP - Housing"
    names(dataInit)[names(dataInit)=="Section 8 Housing Voucher"] <- "Career MAP - Housing"
  }
  else if ("FRSP" %in% benefitslist){
    names(data)[names(data)=="Section 8 Housing Voucher"] <- "FRSP"
    names(dataInit)[names(dataInit)=="Section 8 Housing Voucher"] <- "FRSP"
  } 
  else if ("RAP" %in% benefitslist){
    names(data)[names(data)=="Section 8 Housing Voucher"] <- "RAP"
    names(dataInit)[names(dataInit)=="Section 8 Housing Voucher"] <- "RAP"
  }      


  table<-data.frame(matrix(0, nrow=length(benefitslist), ncol=horizon+1))
  
  rownames(table) <- benefitslist
  colnames(table)[1] <- "Current Job"
  colnames(table)[2] <- "New Path: Year 1"
  for (j in 2:horizon){
    colnames(table)[j+1] <- paste("Year", j)
  }
  
  dataInit_selected <- subset(dataInit, select = c(benefitslist, "Year"))  %>%
    filter(Year==current_year) 
  for (i in 1:length(benefitslist)){
    table[i,1] <- dataInit_selected[i]
    data_selected <- subset(data, select = c(benefitslist[i], "year.index")) %>%
      filter(year.index %in% seq(1,horizon))
    table[i,1:horizon+1] <- data_selected[,1]
  }
  
  table <- format(round(table,0), big.mark=",")
  
  return(table)
  
}


#-----------------------------------------------------------------------
# Budgeting - Net Expenses Breakdown Table
table.Expenses<-function(data1, data2, dataInit, selected, horizon, exp_type, expenses_type,inputs){
  
  ########################
  # PRE-PROCESSING
  ########################
  # Error 1: Nothing is selected
  validate(
    need(selected != "empty", "Please select a career path to plan for")
  )
  
  validate(
    need(exp_type != 0, "Expenses Type has not been selected on prior page. Please select one of the Expense Type options.")
  )
  
  
  validate(
    need(inputs$missing_age!=1, "        ")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "        ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )

  
  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "        ")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "        ")
    )
    
  }
  
  if(selected=="Career Option 1"){
    data<-data1
  }else if(selected=="Career Option 2"){
    data<-data2
  }
  
  # Error 2: Career option was not specified
  validate(
    need(!is.na(sum(data$income)), "This career option was not specified at the 'Choose Career' step")
  )
  
  dataInit$netexp.healthcare <- dataInit$netexp.healthcare - dataInit$oop.health.family.ALICE
  data$netexp.healthcare <- data$netexp.healthcare - data$oop.health.family.ALICE
  
  table<-data.frame(matrix(0,nrow=12, ncol=horizon+1))

  rownames(table)<-c("Rent or Mortgage", "Utilities", "Child Care", "Health Insurance Premium","Health Care Out-of-Pocket Costs"
                   , "Food", "Transportation", "Technology", "Other"
                   ,"Student Loan Repayments", "Repayment of Other Loans", "Out-of-Pocket Tuition")
   
  #### HORIZON BUDGET

    if(horizon==1){
    colnames(table)<-c("Current Job", "New Path: Year 1")
   # if(USEALICE==FALSE | expenses_type=="expenses.actual"){
      table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
      table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    #}
    # if(USEALICE==TRUE &  expenses_type=="expenses.default"){
    #   table[1,1]<-dataInit$netexp.housing[dataInit$Year==current_year]
    #   table[2,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    # }
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]

    #if(USEALICE==FALSE | expenses_type=="expenses.actual"){
      table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
      table[2,2]<-data$netexp.utilities[data$Year==current_year]
    #}
    # if(USEALICE==TRUE &  expenses_type=="expenses.default"){
    #   table[1,2]<-data$netexp.housing[data$Year==current_year]
    #   table[2,2]<-data$exp.tech[data$Year==current_year]
    # }
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
  }
  
  if(horizon==2){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2")
    
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]

    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
  }
  
  if(horizon==3){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]

    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
  }
  
  if(horizon==4){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
  }

  if(horizon==5){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
    
    table[1,6]<-data$netexp.rentormortgage[data$Year==current_year+4]
    table[2,6]<-data$netexp.utilities[data$Year==current_year+4]
    table[3,6]<-data$netexp.childcare[data$Year==current_year+4]
    table[4,6]<-data$netexp.healthcare[data$Year==current_year+4]
    table[5,6]<-data$oop.health.family.ALICE[data$Year==current_year+4]
    table[6,6]<-data$netexp.food[data$Year==current_year+4]
    table[7,6]<-data$exp.transportation[data$Year==current_year+4]
    table[8,6]<-data$exp.tech[data$Year==current_year+4]
    table[9,6]<-data$exp.misc[data$Year==current_year+4]
    table[10,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[11,6]<-data$value.loans[data$Year==current_year+4]
    table[12,6]<-data$value.tuition.net[data$Year==current_year+4]
  }
  
  
  if(horizon==6){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
    
    table[1,6]<-data$netexp.rentormortgage[data$Year==current_year+4]
    table[2,6]<-data$netexp.utilities[data$Year==current_year+4]
    table[3,6]<-data$netexp.childcare[data$Year==current_year+4]
    table[4,6]<-data$netexp.healthcare[data$Year==current_year+4]
    table[5,6]<-data$oop.health.family.ALICE[data$Year==current_year+4]
    table[6,6]<-data$netexp.food[data$Year==current_year+4]
    table[7,6]<-data$exp.transportation[data$Year==current_year+4]
    table[8,6]<-data$exp.tech[data$Year==current_year+4]
    table[9,6]<-data$exp.misc[data$Year==current_year+4]
    table[10,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[11,6]<-data$value.loans[data$Year==current_year+4]
    table[12,6]<-data$value.tuition.net[data$Year==current_year+4]
    
    table[1,7]<-data$netexp.rentormortgage[data$Year==current_year+5]
    table[2,7]<-data$netexp.utilities[data$Year==current_year+5]
    table[3,7]<-data$netexp.childcare[data$Year==current_year+5]
    table[4,7]<-data$netexp.healthcare[data$Year==current_year+5]
    table[5,7]<-data$oop.health.family.ALICE[data$Year==current_year+5]
    table[6,7]<-data$netexp.food[data$Year==current_year+5]
    table[7,7]<-data$exp.transportation[data$Year==current_year+5]
    table[8,7]<-data$exp.tech[data$Year==current_year+5]
    table[9,7]<-data$exp.misc[data$Year==current_year+5]
    table[10,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[11,7]<-data$value.loans[data$Year==current_year+5]
    table[12,7]<-data$value.tuition.net[data$Year==current_year+5]
  }
  
  if(horizon==7){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
    
    table[1,6]<-data$netexp.rentormortgage[data$Year==current_year+4]
    table[2,6]<-data$netexp.utilities[data$Year==current_year+4]
    table[3,6]<-data$netexp.childcare[data$Year==current_year+4]
    table[4,6]<-data$netexp.healthcare[data$Year==current_year+4]
    table[5,6]<-data$oop.health.family.ALICE[data$Year==current_year+4]
    table[6,6]<-data$netexp.food[data$Year==current_year+4]
    table[7,6]<-data$exp.transportation[data$Year==current_year+4]
    table[8,6]<-data$exp.tech[data$Year==current_year+4]
    table[9,6]<-data$exp.misc[data$Year==current_year+4]
    table[10,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[11,6]<-data$value.loans[data$Year==current_year+4]
    table[12,6]<-data$value.tuition.net[data$Year==current_year+4]
    
    table[1,7]<-data$netexp.rentormortgage[data$Year==current_year+5]
    table[2,7]<-data$netexp.utilities[data$Year==current_year+5]
    table[3,7]<-data$netexp.childcare[data$Year==current_year+5]
    table[4,7]<-data$netexp.healthcare[data$Year==current_year+5]
    table[5,7]<-data$oop.health.family.ALICE[data$Year==current_year+5]
    table[6,7]<-data$netexp.food[data$Year==current_year+5]
    table[7,7]<-data$exp.transportation[data$Year==current_year+5]
    table[8,7]<-data$exp.tech[data$Year==current_year+5]
    table[9,7]<-data$exp.misc[data$Year==current_year+5]
    table[10,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[11,7]<-data$value.loans[data$Year==current_year+5]
    table[12,7]<-data$value.tuition.net[data$Year==current_year+5]
    
    table[1,8]<-data$netexp.rentormortgage[data$Year==current_year+6]
    table[2,8]<-data$netexp.utilities[data$Year==current_year+6]
    table[3,8]<-data$netexp.childcare[data$Year==current_year+6]
    table[4,8]<-data$netexp.healthcare[data$Year==current_year+6]
    table[5,8]<-data$oop.health.family.ALICE[data$Year==current_year+6]
    table[6,8]<-data$netexp.food[data$Year==current_year+6]
    table[7,8]<-data$exp.transportation[data$Year==current_year+6]
    table[8,8]<-data$exp.tech[data$Year==current_year+6]
    table[9,8]<-data$exp.misc[data$Year==current_year+6]
    table[10,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[11,8]<-data$value.loans[data$Year==current_year+6]
    table[12,8]<-data$value.tuition.net[data$Year==current_year+6]
  }
  
  if(horizon==8){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
    
    table[1,6]<-data$netexp.rentormortgage[data$Year==current_year+4]
    table[2,6]<-data$netexp.utilities[data$Year==current_year+4]
    table[3,6]<-data$netexp.childcare[data$Year==current_year+4]
    table[4,6]<-data$netexp.healthcare[data$Year==current_year+4]
    table[5,6]<-data$oop.health.family.ALICE[data$Year==current_year+4]
    table[6,6]<-data$netexp.food[data$Year==current_year+4]
    table[7,6]<-data$exp.transportation[data$Year==current_year+4]
    table[8,6]<-data$exp.tech[data$Year==current_year+4]
    table[9,6]<-data$exp.misc[data$Year==current_year+4]
    table[10,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[11,6]<-data$value.loans[data$Year==current_year+4]
    table[12,6]<-data$value.tuition.net[data$Year==current_year+4]
    
    table[1,7]<-data$netexp.rentormortgage[data$Year==current_year+5]
    table[2,7]<-data$netexp.utilities[data$Year==current_year+5]
    table[3,7]<-data$netexp.childcare[data$Year==current_year+5]
    table[4,7]<-data$netexp.healthcare[data$Year==current_year+5]
    table[5,7]<-data$oop.health.family.ALICE[data$Year==current_year+5]
    table[6,7]<-data$netexp.food[data$Year==current_year+5]
    table[7,7]<-data$exp.transportation[data$Year==current_year+5]
    table[8,7]<-data$exp.tech[data$Year==current_year+5]
    table[9,7]<-data$exp.misc[data$Year==current_year+5]
    table[10,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[11,7]<-data$value.loans[data$Year==current_year+5]
    table[12,7]<-data$value.tuition.net[data$Year==current_year+5]
    
    table[1,8]<-data$netexp.rentormortgage[data$Year==current_year+6]
    table[2,8]<-data$netexp.utilities[data$Year==current_year+6]
    table[3,8]<-data$netexp.childcare[data$Year==current_year+6]
    table[4,8]<-data$netexp.healthcare[data$Year==current_year+6]
    table[5,8]<-data$oop.health.family.ALICE[data$Year==current_year+6]
    table[6,8]<-data$netexp.food[data$Year==current_year+6]
    table[7,8]<-data$exp.transportation[data$Year==current_year+6]
    table[8,8]<-data$exp.tech[data$Year==current_year+6]
    table[9,8]<-data$exp.misc[data$Year==current_year+6]
    table[10,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[11,8]<-data$value.loans[data$Year==current_year+6]
    table[12,8]<-data$value.tuition.net[data$Year==current_year+6]
    
    table[1,9]<-data$netexp.rentormortgage[data$Year==current_year+7]
    table[2,9]<-data$netexp.utilities[data$Year==current_year+7]
    table[3,9]<-data$netexp.childcare[data$Year==current_year+7]
    table[4,9]<-data$netexp.healthcare[data$Year==current_year+7]
    table[5,9]<-data$oop.health.family.ALICE[data$Year==current_year+7]
    table[6,9]<-data$netexp.food[data$Year==current_year+7]
    table[7,9]<-data$exp.transportation[data$Year==current_year+7]
    table[8,9]<-data$exp.tech[data$Year==current_year+7]
    table[9,9]<-data$exp.misc[data$Year==current_year+7]
    table[10,9]<-data$studentLoanRepayment[data$Year==current_year+7]
    table[11,9]<-data$value.loans[data$Year==current_year+7]
    table[12,9]<-data$value.tuition.net[data$Year==current_year+7]
  }
  
  if(horizon==9){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
    
    table[1,6]<-data$netexp.rentormortgage[data$Year==current_year+4]
    table[2,6]<-data$netexp.utilities[data$Year==current_year+4]
    table[3,6]<-data$netexp.childcare[data$Year==current_year+4]
    table[4,6]<-data$netexp.healthcare[data$Year==current_year+4]
    table[5,6]<-data$oop.health.family.ALICE[data$Year==current_year+4]
    table[6,6]<-data$netexp.food[data$Year==current_year+4]
    table[7,6]<-data$exp.transportation[data$Year==current_year+4]
    table[8,6]<-data$exp.tech[data$Year==current_year+4]
    table[9,6]<-data$exp.misc[data$Year==current_year+4]
    table[10,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[11,6]<-data$value.loans[data$Year==current_year+4]
    table[12,6]<-data$value.tuition.net[data$Year==current_year+4]
    
    table[1,7]<-data$netexp.rentormortgage[data$Year==current_year+5]
    table[2,7]<-data$netexp.utilities[data$Year==current_year+5]
    table[3,7]<-data$netexp.childcare[data$Year==current_year+5]
    table[4,7]<-data$netexp.healthcare[data$Year==current_year+5]
    table[5,7]<-data$oop.health.family.ALICE[data$Year==current_year+5]
    table[6,7]<-data$netexp.food[data$Year==current_year+5]
    table[7,7]<-data$exp.transportation[data$Year==current_year+5]
    table[8,7]<-data$exp.tech[data$Year==current_year+5]
    table[9,7]<-data$exp.misc[data$Year==current_year+5]
    table[10,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[11,7]<-data$value.loans[data$Year==current_year+5]
    table[12,7]<-data$value.tuition.net[data$Year==current_year+5]
    
    table[1,8]<-data$netexp.rentormortgage[data$Year==current_year+6]
    table[2,8]<-data$netexp.utilities[data$Year==current_year+6]
    table[3,8]<-data$netexp.childcare[data$Year==current_year+6]
    table[4,8]<-data$netexp.healthcare[data$Year==current_year+6]
    table[5,8]<-data$oop.health.family.ALICE[data$Year==current_year+6]
    table[6,8]<-data$netexp.food[data$Year==current_year+6]
    table[7,8]<-data$exp.transportation[data$Year==current_year+6]
    table[8,8]<-data$exp.tech[data$Year==current_year+6]
    table[9,8]<-data$exp.misc[data$Year==current_year+6]
    table[10,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[11,8]<-data$value.loans[data$Year==current_year+6]
    table[12,8]<-data$value.tuition.net[data$Year==current_year+6]
    
    table[1,9]<-data$netexp.rentormortgage[data$Year==current_year+7]
    table[2,9]<-data$netexp.utilities[data$Year==current_year+7]
    table[3,9]<-data$netexp.childcare[data$Year==current_year+7]
    table[4,9]<-data$netexp.healthcare[data$Year==current_year+7]
    table[5,9]<-data$oop.health.family.ALICE[data$Year==current_year+7]
    table[6,9]<-data$netexp.food[data$Year==current_year+7]
    table[7,9]<-data$exp.transportation[data$Year==current_year+7]
    table[8,9]<-data$exp.tech[data$Year==current_year+7]
    table[9,9]<-data$exp.misc[data$Year==current_year+7]
    table[10,9]<-data$studentLoanRepayment[data$Year==current_year+7]
    table[11,9]<-data$value.loans[data$Year==current_year+7]
    table[12,9]<-data$value.tuition.net[data$Year==current_year+7]
    
    table[1,10]<-data$netexp.rentormortgage[data$Year==current_year+8]
    table[2,10]<-data$netexp.utilities[data$Year==current_year+8]
    table[3,10]<-data$netexp.childcare[data$Year==current_year+8]
    table[4,10]<-data$netexp.healthcare[data$Year==current_year+8]
    table[5,10]<-data$oop.health.family.ALICE[data$Year==current_year+8]
    table[6,10]<-data$netexp.food[data$Year==current_year+8]
    table[7,10]<-data$exp.transportation[data$Year==current_year+8]
    table[8,10]<-data$exp.tech[data$Year==current_year+8]
    table[9,10]<-data$exp.misc[data$Year==current_year+8]
    table[10,10]<-data$studentLoanRepayment[data$Year==current_year+8]
    table[11,10]<-data$value.loans[data$Year==current_year+8]
    table[12,10]<-data$value.tuition.net[data$Year==current_year+8]
  }
  
  if(horizon==10){
    colnames(table)<-c("Current Job", "New Path: Year 1", "Year 2", "Year 3", "Year 4", "Year 5", "Year 6", "Year 7", "Year 8", "Year 9", "Year 10")
    table[1,1]<-dataInit$netexp.rentormortgage[dataInit$Year==current_year]
    table[2,1]<-dataInit$netexp.utilities[dataInit$Year==current_year]
    table[3,1]<-dataInit$netexp.childcare[dataInit$Year==current_year]
    table[4,1]<-dataInit$netexp.healthcare[dataInit$Year==current_year]
    table[5,1]<-dataInit$oop.health.family.ALICE[dataInit$Year==current_year]
    table[6,1]<-dataInit$netexp.food[dataInit$Year==current_year]
    table[7,1]<-dataInit$exp.transportation[dataInit$Year==current_year]
    table[8,1]<-dataInit$exp.tech[dataInit$Year==current_year]
    table[9,1]<-dataInit$exp.misc[dataInit$Year==current_year]
    table[10,1]<-dataInit$studentLoanRepayment[dataInit$Year==current_year]
    table[11,1]<-dataInit$value.loans[dataInit$Year==current_year]
    table[12,1]<-dataInit$value.tuition.net[dataInit$Year==current_year]
    
    table[1,2]<-data$netexp.rentormortgage[data$Year==current_year]
    table[2,2]<-data$netexp.utilities[data$Year==current_year]
    table[3,2]<-data$netexp.childcare[data$Year==current_year]
    table[4,2]<-data$netexp.healthcare[data$Year==current_year]
    table[5,2]<-data$oop.health.family.ALICE[data$Year==current_year]
    table[6,2]<-data$netexp.food[data$Year==current_year]
    table[7,2]<-data$exp.transportation[data$Year==current_year]
    table[8,2]<-data$exp.tech[data$Year==current_year]
    table[9,2]<-data$exp.misc[data$Year==current_year]
    table[10,2]<-data$studentLoanRepayment[data$Year==current_year]
    table[11,2]<-data$value.loans[data$Year==current_year]
    table[12,2]<-data$value.tuition.net[data$Year==current_year]
    
    table[1,3]<-data$netexp.rentormortgage[data$Year==current_year+1]
    table[2,3]<-data$netexp.utilities[data$Year==current_year+1]
    table[3,3]<-data$netexp.childcare[data$Year==current_year+1]
    table[4,3]<-data$netexp.healthcare[data$Year==current_year+1]
    table[5,3]<-data$oop.health.family.ALICE[data$Year==current_year+1]
    table[6,3]<-data$netexp.food[data$Year==current_year+1]
    table[7,3]<-data$exp.transportation[data$Year==current_year+1]
    table[8,3]<-data$exp.tech[data$Year==current_year+1]
    table[9,3]<-data$exp.misc[data$Year==current_year+1]
    table[10,3]<-data$studentLoanRepayment[data$Year==current_year+1]
    table[11,3]<-data$value.loans[data$Year==current_year+1]
    table[12,3]<-data$value.tuition.net[data$Year==current_year+1]
    
    table[1,4]<-data$netexp.rentormortgage[data$Year==current_year+2]
    table[2,4]<-data$netexp.utilities[data$Year==current_year+2]
    table[3,4]<-data$netexp.childcare[data$Year==current_year+2]
    table[4,4]<-data$netexp.healthcare[data$Year==current_year+2]
    table[5,4]<-data$oop.health.family.ALICE[data$Year==current_year+2]
    table[6,4]<-data$netexp.food[data$Year==current_year+2]
    table[7,4]<-data$exp.transportation[data$Year==current_year+2]
    table[8,4]<-data$exp.tech[data$Year==current_year+2]
    table[9,4]<-data$exp.misc[data$Year==current_year+2]
    table[10,4]<-data$studentLoanRepayment[data$Year==current_year+2]
    table[11,4]<-data$value.loans[data$Year==current_year+2]
    table[12,4]<-data$value.tuition.net[data$Year==current_year+2]
    
    table[1,5]<-data$netexp.rentormortgage[data$Year==current_year+3]
    table[2,5]<-data$netexp.utilities[data$Year==current_year+3]
    table[3,5]<-data$netexp.childcare[data$Year==current_year+3]
    table[4,5]<-data$netexp.healthcare[data$Year==current_year+3]
    table[5,5]<-data$oop.health.family.ALICE[data$Year==current_year+3]
    table[6,5]<-data$netexp.food[data$Year==current_year+3]
    table[7,5]<-data$exp.transportation[data$Year==current_year+3]
    table[8,5]<-data$exp.tech[data$Year==current_year+3]
    table[9,5]<-data$exp.misc[data$Year==current_year+3]
    table[10,5]<-data$studentLoanRepayment[data$Year==current_year+3]
    table[11,5]<-data$value.loans[data$Year==current_year+3]
    table[12,5]<-data$value.tuition.net[data$Year==current_year+3]
    
    table[1,6]<-data$netexp.rentormortgage[data$Year==current_year+4]
    table[2,6]<-data$netexp.utilities[data$Year==current_year+4]
    table[3,6]<-data$netexp.childcare[data$Year==current_year+4]
    table[4,6]<-data$netexp.healthcare[data$Year==current_year+4]
    table[5,6]<-data$oop.health.family.ALICE[data$Year==current_year+4]
    table[6,6]<-data$netexp.food[data$Year==current_year+4]
    table[7,6]<-data$exp.transportation[data$Year==current_year+4]
    table[8,6]<-data$exp.tech[data$Year==current_year+4]
    table[9,6]<-data$exp.misc[data$Year==current_year+4]
    table[10,6]<-data$studentLoanRepayment[data$Year==current_year+4]
    table[11,6]<-data$value.loans[data$Year==current_year+4]
    table[12,6]<-data$value.tuition.net[data$Year==current_year+4]
    
    table[1,7]<-data$netexp.rentormortgage[data$Year==current_year+5]
    table[2,7]<-data$netexp.utilities[data$Year==current_year+5]
    table[3,7]<-data$netexp.childcare[data$Year==current_year+5]
    table[4,7]<-data$netexp.healthcare[data$Year==current_year+5]
    table[5,7]<-data$oop.health.family.ALICE[data$Year==current_year+5]
    table[6,7]<-data$netexp.food[data$Year==current_year+5]
    table[7,7]<-data$exp.transportation[data$Year==current_year+5]
    table[8,7]<-data$exp.tech[data$Year==current_year+5]
    table[9,7]<-data$exp.misc[data$Year==current_year+5]
    table[10,7]<-data$studentLoanRepayment[data$Year==current_year+5]
    table[11,7]<-data$value.loans[data$Year==current_year+5]
    table[12,7]<-data$value.tuition.net[data$Year==current_year+5]
    
    table[1,8]<-data$netexp.rentormortgage[data$Year==current_year+6]
    table[2,8]<-data$netexp.utilities[data$Year==current_year+6]
    table[3,8]<-data$netexp.childcare[data$Year==current_year+6]
    table[4,8]<-data$netexp.healthcare[data$Year==current_year+6]
    table[5,8]<-data$oop.health.family.ALICE[data$Year==current_year+6]
    table[6,8]<-data$netexp.food[data$Year==current_year+6]
    table[7,8]<-data$exp.transportation[data$Year==current_year+6]
    table[8,8]<-data$exp.tech[data$Year==current_year+6]
    table[9,8]<-data$exp.misc[data$Year==current_year+6]
    table[10,8]<-data$studentLoanRepayment[data$Year==current_year+6]
    table[11,8]<-data$value.loans[data$Year==current_year+6]
    table[12,8]<-data$value.tuition.net[data$Year==current_year+6]
    
    table[1,9]<-data$netexp.rentormortgage[data$Year==current_year+7]
    table[2,9]<-data$netexp.utilities[data$Year==current_year+7]
    table[3,9]<-data$netexp.childcare[data$Year==current_year+7]
    table[4,9]<-data$netexp.healthcare[data$Year==current_year+7]
    table[5,9]<-data$oop.health.family.ALICE[data$Year==current_year+7]
    table[6,9]<-data$netexp.food[data$Year==current_year+7]
    table[7,9]<-data$exp.transportation[data$Year==current_year+7]
    table[8,9]<-data$exp.tech[data$Year==current_year+7]
    table[9,9]<-data$exp.misc[data$Year==current_year+7]
    table[10,9]<-data$studentLoanRepayment[data$Year==current_year+7]
    table[11,9]<-data$value.loans[data$Year==current_year+7]
    table[12,9]<-data$value.tuition.net[data$Year==current_year+7]
    
    table[1,10]<-data$netexp.rentormortgage[data$Year==current_year+8]
    table[2,10]<-data$netexp.utilities[data$Year==current_year+8]
    table[3,10]<-data$netexp.childcare[data$Year==current_year+8]
    table[4,10]<-data$netexp.healthcare[data$Year==current_year+8]
    table[5,10]<-data$oop.health.family.ALICE[data$Year==current_year+8]
    table[6,10]<-data$netexp.food[data$Year==current_year+8]
    table[7,10]<-data$exp.transportation[data$Year==current_year+8]
    table[8,10]<-data$exp.tech[data$Year==current_year+8]
    table[9,10]<-data$exp.misc[data$Year==current_year+8]
    table[10,10]<-data$studentLoanRepayment[data$Year==current_year+8]
    table[11,10]<-data$value.loans[data$Year==current_year+8]
    table[12,10]<-data$value.tuition.net[data$Year==current_year+8]
    
    table[1,11]<-data$netexp.rentormortgage[data$Year==current_year+9]
    table[2,11]<-data$netexp.utilities[data$Year==current_year+9]
    table[3,11]<-data$netexp.childcare[data$Year==current_year+9]
    table[4,11]<-data$netexp.healthcare[data$Year==current_year+9]
    table[5,11]<-data$oop.health.family.ALICE[data$Year==current_year+9]
    table[6,11]<-data$netexp.food[data$Year==current_year+9]
    table[7,11]<-data$exp.transportation[data$Year==current_year+9]
    table[8,11]<-data$exp.tech[data$Year==current_year+8]
    table[9,11]<-data$exp.misc[data$Year==current_year+9]
    table[10,11]<-data$studentLoanRepayment[data$Year==current_year+9]
    table[11,11]<-data$value.loans[data$Year==current_year+9]
    table[12,11]<-data$value.tuition.net[data$Year==current_year+9]
  }
  
  
  table <- format(round(table,0), big.mark=",")
  
  return(table)
  
}
  
xxxxx <<- 29

#-----------------------------------------------------------------------
# Store SS Expenses Values to Avoid Override with Custom Values
function.storeSSvalues<-function(data){
  
  data<-data %>% 
    mutate( exp.childcare.SS = exp.childcare
  ,exp.food.SS = exp.food
  ,exp.rentormortgage.SS = exp.rentormortgage
  ,exp.transportation.SS = exp.transportation
  ,exp.misc.SS = exp.misc
  ,exp.utilities.SS = exp.utilities
  ,exp.tech.SS = exp.tech)
  
  #if(USEALICE==FALSE){
  data<-data %>% 
    mutate(total.expenses.SS = exp.childcare.SS+exp.healthcare.SS+exp.food.SS+exp.rentormortgage.SS+
    exp.transportation.SS+exp.misc.SS+exp.utilities.SS+exp.tech.SS)
  #}
  
 # if(USEALICE==TRUE){
  # data<-data %>% 
  #   mutate(exp.tech.SS = exp.tech 
  #          ,exp.housing.SS = exp.housing
  # ,total.expenses.SS = exp.childcare.SS+exp.healthcare.SS+exp.food.SS+exp.housing.SS+
  #   exp.transportation.SS+exp.misc.SS+exp.tech.SS)
  # }
  
  data$SelfSufficiency = data$total.expenses.SS
  

  return(data)
  
}
xxxxx <<- 30

#-----------------------------------------------------------------------
# Calculate DC Flex benefit values
function.DCFlex<-function(data, dcflex_startind){
  #dc_mfi <- read_csv('2024/DC_median_family_income_2024.csv', show_col_types = FALSE)
  
  # DC Flex available for up to 5 years only
  years<-unique(data$Year)
  minYear<-min(years)+dcflex_startind
  dcFlexLength <- 4  # years DC Flex lasts
  data$value.dcflex <- 0
  
  # $8,400 per year up to 5 years if income not being more than 40% of Median Family Income
  #temp <- filter(data, data$Year %in% seq(minYear, minYear+dcFlexLength))
  #fam_size <- ifelse(temp$famsize[1] < dc_mfi$Household_Size[nrow(dc_mfi)], temp$famsize[1], dc_mfi$Household_Size[nrow(dc_mfi)])
  #threshold <- 0.4*dc_mfi$Median_Family_Income[dc_mfi$Household_Size == fam_size]
  #temp$value.dcflex[temp$income <= threshold] <- 8400
  
  # currently $8,400 per year up to 5 years
  subset <- data$Year %in% seq(minYear, minYear+dcFlexLength)
  #data$value.dcflex[subset] <- temp$value.dcflex
  data$value.dcflex[subset] <- 8400
  
  return(data)
}
  
#-----------------------------------------------------------------------
# Text for "My Budget"
textMyBudget <- function(data1, data2, selected, horizon, exp_type,inputs){
  
  validate(
    need(exp_type != 0, "   ")
  )
  
  validate(
    need(selected != "empty", "   ")
  )
  
  validate(
    need(inputs$missing_age!=1, "One or more family member ages are missing. Please include the age(s) of said family member(s).")
  )
  
  validate(
    need(inputs$no_occupations_error!=1, "       ")
  )
  
  validate(
    need(!is.na(inputs$disab.work.exp) & inputs$disab.work.exp>=0, "Please input a non-negative value for amount spent per month on specialized equipment or services that enable household member(s) with disabilities to work.")
  )
  
  
  
  validate(
    need(inputs$ssdi_no_adults ==0, "SSDI has been selected, but none of the adults have a disability.")
  )
  
  validate(
    need(
      inputs$ssi_ssdi_error==0, "If receiving SSI or SSDI, the answer 'Yes' must be selected to the Question 'Does anyone have a disability?'"
    )
  )
  
  validate(
    need(inputs$ssdi_error==0, "SSDI values need to be positive.")
  )
  
  validate(
    need(inputs$disab_error ==0, "If at least one family is categorized as disabled, make sure to correctly select that family member if disabled.")
  )
  
  validate(
    need(inputs$fam_disab_error ==0, "Please select 'Yes' or 'No' for the question 'Does anyone in the home have a disability?'")
  )
  
  
  
  
  if(selected == "Career Option 2"){
    
    validate(
      need(("CareerPath" %in% colnames(data2)), "You have not included a second career to analyze. Please include a second career, or select Career Option 1 above.")
    )
    
  }
  
  if(selected == "Career Option 1"){
    
    validate(
      need(("CareerPath" %in% colnames(data1)), "You have not included a first career to analyze. Please include a first career, or select Career Option 2 above.")
    )
    
  }
  
  
  
  if(selected=="Career Option 1"){
    data<-data1
  }else if(selected=="Career Option 2"){
    data<-data2
  }
  
  netresources<-data$NetResources[1:horizon]
  negative<- netresources<0
  
  if(TRUE %in% negative){
    message<-paste("<font size=\"5\" color=\"#661100\"><b>","In some years you have a budget gap. You can make changes to your career choice, expenses, public assistance, or wraparound support. ","</b></font>")
  }else{
    message<-paste("<font size=\"5\"color=\"##117733\"><b>","You have enough resources to meet your budget in all years.","</b></font>")
  }

  
  return(message)
  
}

# Summary Table
table.Summary <- function(data_1, data_2, dataInit, benefitslist, horizon){
  
  # Career option was not specified
  #validate(
  #  need(!is.na(sum(data$income)), "The career options were not specified at the 'Choose Career' step")
  #)
  
  if (is.null(data_1$occ_title))
    data <- data_2
  else if (is.null(data_2$occ_title))
    data <- data_1
  else
    data <- rbind(data_2, data_1)
  
  dataInit$value.assistance.other <- dataInit$value.assistance.other + dataInit$value.assistance.tax.other
  data$value.assistance.other <- data$value.assistance.other + data$value.assistance.tax.other
  if ((dataInit$value.assistance.other[1] > 0) | (sum(data$value.assistance.other) > 0))
    benefitslist <- c(benefitslist,"Wraparound Support")
  
  
  
  ## Rename Factors
  names(data)[names(data)=="value.medicaid.adult"] <- "Medicaid for Adults"
  names(data)[names(data)=="value.medicaid.child"] <- "Medicaid for Children/CHIP"
  names(data)[names(data)=="value.snap"] <- "Supplemental Nutrition Assistance Program (SNAP)"
  names(data)[names(data)=="value.wic"] <- "Women, Infants and Children Nutrition Program (WIC)"
  names(data)[names(data)=="value.cdctc"] <- "Child and Dependent Care Tax Credit (CDCTC)"
  names(data)[names(data)=="value.section8"] <- "Section 8 Housing Voucher"
  if (data$stateAbbrev[1] == "FL") 
    names(data)[names(data)=="value.CCDF"] <- "CCDF/SR Plus"
  else
    names(data)[names(data)=="value.CCDF"] <- "Child Care Subsidy (CCDF)"
  names(data)[names(data)=="value.aca"] <- "Health Insurance Marketplace Subsidy"
  names(data)[names(data)=="value.eitc"] <- "Earned Income Tax Credit (EITC)"
  names(data)[names(data)=="value.ctc"] <- "Child Tax Credit (CTC)"
  names(data)[names(data)=="value.schoolmeals"] <- "Free or Reduced Price School Meals"
  #names(data)[names(data)=="value.liheap"] <- "LIHEAP"
  names(data)[names(data)=="value.HeadStart"] <- "Head Start"
  #names(data)[names(data)=="value.earlyHeadStart"] <- "Early Head Start"
  names(data)[names(data)=="value.PreK"] <- "State-Funded Pre-Kindergarten"
  names(data)[names(data)=="tax.income.fed"] <- "Federal Income Tax"
  names(data)[names(data)=="tax.income.state"] <- "State Income Tax"
  names(data)[names(data)=="tax.FICA"] <- "FICA Tax"
  names(data)[names(data)=="value.tanf"] <- "Temporary Assistance for Needy Families (TANF)"
  #names(data)[names(data)=="value.FATES"] <- "FATES"
  names(data)[names(data)=="value.ssi"] <- "Supplemental Security Income (SSI)"
  names(data)[names(data)=="value.ssdi"] <- "Social Security Disability Insurance (SSDI)"
  names(data)[names(data)=="value.hhf"] <- "Career MAP Income Support"
  names(data)[names(data)=="value.assistance.other"] <- "Wraparound Support"
  names(dataInit)[names(dataInit)=="value.medicaid.adult"] <- "Medicaid for Adults"
  names(dataInit)[names(dataInit)=="value.medicaid.child"] <- "Medicaid for Children/CHIP"
  names(dataInit)[names(dataInit)=="value.snap"] <- "Supplemental Nutrition Assistance Program (SNAP)"
  names(dataInit)[names(dataInit)=="value.wic"] <- "Women, Infants and Children Nutrition Program (WIC)"
  names(dataInit)[names(dataInit)=="value.cdctc"] <- "Child and Dependent Care Tax Credit (CDCTC)"
  names(dataInit)[names(dataInit)=="value.section8"] <- "Section 8 Housing Voucher"
  if (dataInit$stateAbbrev[1] == "FL") 
    names(dataInit)[names(dataInit)=="value.CCDF"] <- "CCDF/SR Plus"
  else
    names(dataInit)[names(dataInit)=="value.CCDF"] <- "Child Care Subsidy (CCDF)"
  names(dataInit)[names(dataInit)=="value.aca"] <- "Health Insurance Marketplace Subsidy"
  names(dataInit)[names(dataInit)=="value.eitc"] <- "Earned Income Tax Credit (EITC)"
  names(dataInit)[names(dataInit)=="value.ctc"] <- "Child Tax Credit (CTC)"
  names(dataInit)[names(dataInit)=="value.schoolmeals"] <- "Free or Reduced Price School Meals"
  names(dataInit)[names(dataInit)=="value.HeadStart"] <- "Head Start"
  #names(dataInit)[names(dataInit)=="value.earlyHeadStart"] <- "Early Head Start"
  names(dataInit)[names(dataInit)=="value.PreK"] <- "State-Funded Pre-Kindergarten"
  names(dataInit)[names(dataInit)=="tax.income.fed"] <- "Federal Income Tax"
  names(dataInit)[names(dataInit)=="tax.income.state"] <- "State Income Tax"
  names(dataInit)[names(dataInit)=="tax.FICA"] <- "FICA Tax"
  names(dataInit)[names(dataInit)=="value.tanf"] <- "Temporary Assistance for Needy Families (TANF)"
  names(dataInit)[names(dataInit)=="value.ssi"] <- "Supplemental Security Income (SSI)"
  names(dataInit)[names(dataInit)=="value.ssdi"] <- "Social Security Disability Insurance (SSDI)"
  names(dataInit)[names(dataInit)=="value.hhf"] <- "Career MAP Income Support"
  names(dataInit)[names(dataInit)=="value.assistance.other"] <- "Wraparound Support"
  
  if ("Career MAP - Housing" %in% benefitslist){
    names(data)[names(data)=="Section 8 Housing Voucher"] <- "Career MAP - Housing"
    names(dataInit)[names(dataInit)=="Section 8 Housing Voucher"] <- "Career MAP - Housing"
  }
  else if ("FRSP" %in% benefitslist){
    names(data)[names(data)=="Section 8 Housing Voucher"] <- "FRSP"
    names(dataInit)[names(dataInit)=="Section 8 Housing Voucher"] <- "FRSP"
  } 
  else if ("RAP" %in% benefitslist){
    names(data)[names(data)=="Section 8 Housing Voucher"] <- "RAP"
    names(dataInit)[names(dataInit)=="Section 8 Housing Voucher"] <- "RAP"
  }      
  
  names(data)[names(data)=="value.dcflex"] <- "DC Flex"
  
  
  df <- filter(data, data$year.index %in% seq(1,horizon))  %>% 
    subset(select=c("CareerPath","Year","income","AfterTaxIncome","total.transfers","value.employerhealthcare",
                    "total.expenses","NetResources",benefitslist)) 
  df["total.expenses"] <- df["total.expenses"]-df["value.employerhealthcare"]
  df["value.employerhealthcare"] <- NULL 
  
  df1 <- df[,c(1,2)]
  df2 <- df[,-c(1:2)]
  df2 <- format(round(df2,0), big.mark=",")
  
  df <- cbind(df1, df2)
  #for (program in benefitslist) {
  #  if (all(df[program] == 0))
  #    df[program] <- NULL
  #}
  
  names(df)[names(df)=="CareerPath"] <- "Career Path"
  names(df)[names(df)=="income"] <- "Pre-tax Income"
  names(df)[names(df)=="AfterTaxIncome"] <- "+ Take-home Pay"
  names(df)[names(df)=="total.transfers"] <- "+ Public Assistance" 
  names(df)[names(df)=="total.expenses"] <- "- Living Expenses"
  names(df)[names(df)=="NetResources"] <- "= Annual Budget"
  
  
  #summary <- data.frame(matrix(0, nrow=0, ncol=horizon))
  #for (j in 1:horizon) {
  #  colnames(summary)[j] <- paste("Year", j)
  #}
  #careerOptions <- unique(df$CareerPath)
  #for (career in careerOptions) {
  #  df_i = df[df$CareerPath == career,] %>% subset(select=c(-2))
  #  subsummary = transpose(df_i)
  #  names(df_i)[names(df_i)=="CareerPath"] <- "Career Path"
  #  rownames(subsummary) <- colnames(df_i)
  #  for (j in 1:horizon) {
  #    colnames(subsummary)[j] <- paste("Year", j)
  #  }
  #  summary <- rbind(summary, subsummary)
  #}
  
  return(df)
  
}
