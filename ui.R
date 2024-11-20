# Define UI navbarPage 
shinyUI(navbarPage(title = "CLIFF", id = "navBar",
                   theme = "style.css", # Load style
                   collapsible = TRUE,
                   inverse = TRUE,
                   fluid = TRUE, 
                   position = "fixed-top",
                   footer = includeHTML("www/include_footer.html"), # Load footer
                   
# Define tab panel 1 - Home                   
                   #-------------------------------------------------------------------------------- 
                   # tab panel 1 - Home 
                   #-------------------------------------------------------------------------------- 
                   tabPanel("Home", 
                            br(),
                            includeHTML("www/home.html"), # Home page - written in HTML
                            tags$head(
                              includeHTML(("www/google-analytics.html")),
                              tags$link(rel = "stylesheet", 
                                        type = "text/css", 
                                        href = "plugins/font-awesome-4.7.0/css/font-awesome.min.css"), # font style
                              tags$link(rel = "icon",  # CLIFF icon
                                        type = "image/png", 
                                        href = "images/LOGO.png")
                            ),
                            # <div style = "position:relative; left:720px; top:2px;">
                            br(),
                            br(),
                            br(),
                            
                            fluidRow(
                              column(3),
                              column(6,
                                     tags$div(align = "center", 
                                              useShinyjs(),
                                              extendShinyjs(text = jscode1, functions = c("next1")),
                                              actionButton("next1","Get Started", color="primary",
                                                           style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                           class="btn btn-primary btn-lg")
                                     )
                              ),
                              column(3)
                            )
                   ),
                   
# Define tab panel 2 - About You                    
                   #-------------------------------------------------------------------------------- 
                   # tab panel 2 - About You
                   #-------------------------------------------------------------------------------- 
                   tabPanel("Client Profile",  icon = icon("angle-double-right", lib = "font-awesome"),
                            tags$div(class = "container",
                                     
                                     br(),      
                                     br(),
                                     br(),      
                                     br(),
                                     
                                     #  tags$div(align = "center",
                                     #           tags$h4("Tell us about yourself. CLIFF uses the information on this page to calculate take-home pay for the careers in your location. CLIFF stores no information you enter."),
                                     #  ),
                                     fluidRow(column(1),column(10,
                                                               includeHTML("www/aboutyou.html"))
                                              ,column(1)), # Home page - written in HTML
                                     
                                     
                                     ######################################
                                     # Profile
                                     ######################################
                                     br(),
                                     #h2("Family Profile", class = "title fit-h1"),
                                     br(),
    # Select state and county  
      #---------------------
                                     # QUESTION
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.1em;",
                                                                            
                                                                            h4(tags$label(`for` = "state", br(), "State of Residency")
                                                                            )
                                                  )))),
                                       column(5,
                                              selectInput("state", label = NULL, # Note: collect state abbreviation
                                                          list("select" = "empty"
                                                               , "Alabama" = "AL"
                                                               , "Alaska" = "AK"
                                                               , "Arizona" = "AZ"
                                                               , "Arkansas" = "AR"
                                                               , "California" = "CA"
                                                               , "Colorado" = "CO"
                                                               , "Connecticut" = "CT"
                                                               , "Delaware" = "DE"
                                                               , "District of Columbia" = "DC"
                                                               , "Florida" = "FL"
                                                               , "Georgia" = "GA" 
                                                               , "Hawaii" = "HI"
                                                               , "Idaho" = "ID"
                                                               , "Illinois" = "IL"
                                                               , "Indiana" = "IN"
                                                               , "Iowa" = "IA"
                                                               , "Kansas" = "KS"
                                                               , "Kentucky" = "KY"
                                                               , "Louisiana" = "LA"
                                                               , "Maine" = "ME"
                                                               , "Maryland" = "MD"
                                                               , "Massachusetts" = "MA"
                                                               , "Michigan" = "MI"
                                                               , "Minnesota" = "MN"
                                                               , "Mississippi" = "MS"
                                                               , "Missouri" = "MO"
                                                               , "Montana" = "MT"
                                                               , "Nebraska" = "NE"
                                                               , "Nevada" = "NV"
                                                               , "New Hampshire" = "NH"
                                                               , "New Jersey" = "NJ"
                                                               , "New Mexico" = "NM"
                                                               , "New York" = "NY"
                                                               , "North Carolina" = "NC"
                                                               , "North Dakota" = "ND"
                                                               , "Ohio" = "OH"
                                                               , "Oklahoma" = "OK"
                                                               , "Oregon" = "OR"
                                                               , "Pennsylvania" = "PA"
                                                               , "Rhode Island" = "RI"
                                                               , "South Carolina" = "SC"
                                                               , "South Dakota" = "SD"
                                                               , "Tennessee" = "TN"
                                                               , "Texas" = "TX"
                                                               , "Utah" = "UT"
                                                               , "Vermont" = "VT"
                                                               , "Virginia" = "VA"
                                                               , "Washington" = "WA"
                                                               , "West Virginia" = "WV"
                                                               , "Wisconsin" = "WI"
                                                               , "Wyoming" = "WY"
                                                          ), selectize=FALSE, selected = "empty"))
                                     ),
                                     
                                     #---------------------
                                     # QUESTION
                                     #br(),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition= "input.state != 'empty' & input.state != 'CT' & input.state != 'MA' & input.state != 'ME' & input.state != 'NH' & input.state != 'RI' & input.state != 'VT' & input.state != 'AK' & input.state != 'LA'",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.8em;",
                                                                                             
                                                                                             h4(tags$label(`for` = "county_main", br(), "County of Residency")
                                                                                             )
                                                                   )))),
                                              conditionalPanel(condition="input.state == 'CT' | input.state == 'MA' | input.state == 'ME' | input.state == 'NH' | input.state == 'RI' | input.state == 'VT' ",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.8em;",
                                                                                             
                                                                                             h4(tags$label(`for` = "county_main", br(), "Town of Residency")
                                                                                             )
                                                                   )))),
                                              conditionalPanel(condition="input.state == 'AK'",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.8em;",
                                                                                             
                                                                                             h4(tags$label(`for` = "county_main", br(), "Borough of Residency")
                                                                                             )
                                                                   )))),
                                              conditionalPanel(condition="input.state == 'LA'",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.8em;",
                                                                                             
                                                                                             h4(tags$label(`for` = "county_main", br(), "Parish of Residency")
                                                                                             )
                                                                   ))))
                                       ),
                                       column(5, 
                                              
                                              conditionalPanel(condition = "input.state != 'empty'",
                                                               selectizeInput("county_main", 
                                                                              label = NULL, choices = NULL, options = list(placeholder = 'select'
                                                                                                                           ,onInitialize = I('function() { this.setValue(""); }')
                                                                              ))
                                              )
                                       )
                                     ),
                                     
                                     
    # Inputs for spouse/partner                                       
                                     #---------------------
                                     # QUESTION
                                     #br(),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.5em;",
                                                                            
                                                                            h4(tags$label(`for` = "partnered", br(), "Living with spouse or partner?")
                                                                            )
                                                  )))),
                                       column(5,
                                              radioButtons("partnered", label = NULL,
                                                           list(#" " = "empty",
                                                             "No" = "No",
                                                             "Yes" = "Yes")
                                                           , selected = "No"))
                                     ),
                                     #br(),
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='Yes'",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "marital_status", br(), "Married?")
                                                                                             )
                                                                   ))))
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='Yes'",
                                                               radioButtons("marital_status", label = NULL,
                                                                            list(#" " = "empty",
                                                                              "No" = "No",
                                                                              "Yes" = "Yes")
                                                                            , selected = "No"))
                                       )
                                     ),
    # Inputs for family size, disability                                 
                                     #---------------------
                                     # QUESTION
                                     #br(),
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.5em;", 
                                                                            
                                                                            h4(tags$label(`for` = "other_family", br(), "Living with any other family members?")
                                                                            )
                                                  ))),      
                                              
                                              #h4("Do any other family members live with you?"),
                                              tags$div(div(style="margin-top:-1.5em;", 
                                                           h6("Include adults and children")
                                              ))
                                       ),
                                       column(5,
                                              radioButtons("other_family", label = NULL,
                                                           list(#" " = "empty",
                                                             "No" = "No",
                                                             "Yes" = "Yes")
                                                           , selected = "No" ))
                                     ),
                                     
                                     #br(),
                                     
                                     fluidRow(
                                       column(4, offset = 3,
                                              conditionalPanel(condition="input.other_family=='Yes'",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.2em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "num_other_family", br(), "How many?")
                                                                                             )
                                                                   )))
                                              ),  
                                              #  h4("How many?"))
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.other_family=='Yes'",
                                                               numericInput("num_other_family", value = NA, label = NULL, min=0,max=10))
                                       )
                                     ),
                                     
                                     #br(),
    # Inputs for monthly Income of all other family members if no disability in the household                                  
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="(input.partnered=='Yes' | input.other_family=='Yes') & input.fam_disab == 'No'",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "otherfamily_earnings", 
                                                                                                           br(), "Monthly earnings of spouse/partner and other family members")
                                                                                             )
                                                                   ))),
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Include adults and children")
                                                               ))
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="(input.partnered=='Yes' | input.other_family=='Yes') & input.fam_disab == 'No'",
                                                               numericInput("otherfamily_earnings", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     
                                     # UNCOMMENT WHEN DISABILITY IS ADDED
                                     conditionalPanel(condition="input.state != 'AL'",
                                     fluidRow(
                                       column(5, offset = 2,
                                              
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.3em;",
                                                                            
                                                                            h4(tags$label(`for` = "fam_disab",
                                                                                          br(), "Does anyone in the home have a disability?")
                                                                            )
                                                  ))),
                                       ),
                                       column(5,
                                              radioButtons("fam_disab", label = NULL,
                                                           list("No" = "No",
                                                                "Yes" = "Yes"),
                                                           selected = "No")
                                       )
                                     )
                                     ),
                                     
                                     
                                     br(),
                                     hr(),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.1em;", 
                                                                            
                                                                            h4(tags$label(`for` = "age", 
                                                                                          br(), "Age")
                                                                            )
                                                  )))
                                       )
                                       
                                       , column(5,
                                                numericInput("age", label="Age of First Adult (19-64)", value=25, min=19, max=64)
                                                
                                                # UNCOMMENT WHEN DISABILITY IS ADDED
                                                , conditionalPanel("input.fam_disab=='Yes'",
                                                                   radioButtons("disab", label="Disabled?",
                                                                                list("No"="No",
                                                                                     "Yes"="Yes"),
                                                                                selected="No"),
                                                                   radioButtons("blind", label="Legally Blind?",
                                                                                list("No"="No",
                                                                                     "Yes"="Yes"),
                                                                                selected="No")
                                                                   
                                                )
                                       ),
                                     ),
                                     
                                     fluidRow(
                                       column(12, offset = 3,
                                              h4(span(textOutput("message_adult_age"), style="color:red")))
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered == 'Yes'",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_partner", 
                                                                                                           br(), "Age of spouse or partner")
                                                                                             )
                                                                   )))
                                              )
                                       )
                                       
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.partnered == 'Yes'",
                                                                 numericInput("age_partner", value = 25, label = NULL, min=19, max=99)
                                                                 
                
                                                                 ,conditionalPanel(condition="input.fam_disab == 'Yes'",
                                                                                   radioButtons("disab_partner", label="Disabled?",
                                                                                                list("No"="No",
                                                                                                     "Yes"="Yes"),
                                                                                                selected="No"),
                                                                                   radioButtons("blind_partner", label="Legally Blind?",
                                                                                                list("No"="No",
                                                                                                     "Yes"="Yes"),
                                                                                                selected="No"))
                                                                 
                                                )
                                       )
                                       
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered == 'Yes' & input.fam_disab == 'Yes' & input.age_partner>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "spouse_earnings", 
                                                                                                           br(), "Monthly earnings of spouse/partner")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.fam_disab == 'Yes' & input.age_partner>18",
                                                               numericInput("spouse_earnings", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 0",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_1", 
                                                                                                           br(), "Age of first other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               ))
                                              )
                                              
                                       )
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 0",
                                                                 numericInput("age_family_1", value = 0, label = NULL, min=0)
                                                                 
                                                                 ,conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                   radioButtons("disab1", label="Disabled?",
                                                                                                list("No"="No",
                                                                                                     "Yes"="Yes"),
                                                                                                selected="No"),
                                                                                   conditionalPanel(condition="input.other_family=='Yes' & input.age_family_1 >= 18",
                                                                                                    radioButtons("blind_1", label="Legally Blind?",
                                                                                                                 list("No"="No",
                                                                                                                      "Yes"="Yes"),
                                                                                                                 selected="No")))
                                                                 
                                                )
                                       )
                                       
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_1>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "third_adult_earnings_1", 
                                                                                                           br(), "Monthly earnings of first other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_1>18",
                                                               numericInput("third_adult_earnings_1", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_1>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "second_adult_earnings", 
                                                                                                           br(), "Monthly earnings of first other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_1>18",
                                                               numericInput("second_adult_earnings", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     
                                     
                                     
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 1",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_2", 
                                                                                                           br(), "Age of second other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                              
                                       ) 
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 1",
                                                                 numericInput("age_family_2", value = 0, label = NULL, min=0)
                                                                 
                                                                 ,conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                   radioButtons("disab2", label="Disabled?",
                                                                                                list("No"="No",
                                                                                                     "Yes"="Yes"),
                                                                                                selected="No"),
                                                                                   conditionalPanel(condition="input.other_family=='Yes' & input.age_family_2 >= 18",
                                                                                                    radioButtons("blind_2", label="Legally Blind?",
                                                                                                                 list("No"="No",
                                                                                                                      "Yes"="Yes"),
                                                                                                                 selected="No")))
                                                )
                                       )
                                       
                                     ),
                                     
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_2>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "fourth_adult_earnings_1", 
                                                                                                           br(), "Monthly earnings of second other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_2>18",
                                                               numericInput("fourth_adult_earnings_1", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_2>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "third_adult_earnings_2", 
                                                                                                           br(), "Monthly earnings of second other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_2>18",
                                                               numericInput("third_adult_earnings_2", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 2",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_3", 
                                                                                                           br(), "Age of third other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       )
                                       
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 2",
                                                                 numericInput("age_family_3", value = 0, label = NULL, min=0)
                                                                 
                                                                 , conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                    radioButtons("disab3", label="Disabled?",
                                                                                                 list("No"="No",
                                                                                                      "Yes"="Yes"),
                                                                                                 selected="No"),
                                                                                    conditionalPanel(condition="input.other_family=='Yes' & input.age_family_3 >= 18",
                                                                                                     radioButtons("blind_3", label="Legally Blind?",
                                                                                                                  list("No"="No",
                                                                                                                       "Yes"="Yes"),
                                                                                                                  selected="No")))
                                                                 
                                                )
                                       )
                                       
                                     ),
                                     
                                     
                                     
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_3>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "fifth_adult_earnings_1", 
                                                                                                           br(), "Monthly earnings of third other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_3>18",
                                                               numericInput("fifth_adult_earnings_1", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_3>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "fourth_adult_earnings_2", 
                                                                                                           br(), "Monthly earnings of third other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_3>18",
                                                               numericInput("fourth_adult_earnings_2", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     
                                     
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 3",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_4", 
                                                                                                           br(), "Age of fourth other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       )
                                       
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 3",
                                                                 numericInput("age_family_4", value = 0, label = NULL, min=0)
                                                                 
                                                                 , conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                    radioButtons("disab4", label="Disabled?",
                                                                                                 list("No"="No",
                                                                                                      "Yes"="Yes"),
                                                                                                 selected="No"),
                                                                                    conditionalPanel(condition="input.other_family=='Yes' & input.age_family_4 >= 18",
                                                                                                     radioButtons("blind_4", label="Legally Blind?",
                                                                                                                  list("No"="No",
                                                                                                                       "Yes"="Yes"),
                                                                                                                  selected="No")))
                                                                 
                                                )
                                       )
                                       
                                     ),
                                     
                                     
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_4>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "sixth_adult_earnings_1", 
                                                                                                           br(), "Monthly earnings of fourth other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='Yes' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_4>18",
                                                               numericInput("sixth_adult_earnings_1", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_4>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "fifth_adult_earnings_2", 
                                                                                                           br(), "Monthly earnings of fourth other adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_4>18",
                                                               numericInput("fifth_adult_earnings_2", value=0, label = NULL, min=0))
                                       )
                                     ),
                                     
                                     
                                     
                                     
                                     
                                     
                                    
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 4",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_5", 
                                                                                                           br(), "Age of fifth other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       ) 
                                       
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 4",
                                                                 numericInput("age_family_5", value = 0, label = NULL, min=0)
                                                                 
                                                                 ,conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                   radioButtons("disab5", label="Disabled?",
                                                                                                list("No"="No",
                                                                                                     "Yes"="Yes"),
                                                                                                selected="No"),
                                                                                   conditionalPanel(condition="input.other_family=='Yes' & input.age_family_5 >= 18",
                                                                                                    radioButtons("blind_5", label="Legally Blind?",
                                                                                                                 list("No"="No",
                                                                                                                      "Yes"="Yes"),
                                                                                                                 selected="No")))
                                                                 
                                                )
                                       )
                                       
                                     ),
               
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_5>18",
                                                               
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.3em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "sixth_adult_earnings_2", 
                                                                                                           br(), "Monthly earnings of fifth adult")
                                                                                             )
                                                                   )))
                                                               
                                                               # h4("Monthly earnings of your spouse/partner and other family members"),
                                                               
                                              )
                                       ),
                                       column(5,
                                              conditionalPanel(condition="input.partnered=='No' & input.other_family=='Yes' & input.fam_disab == 'Yes' & input.age_family_5>18",
                                                               numericInput("sixth_adult_earnings_2", value=0, label = NULL, min=0))
                                       )
                                     ),          
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 5",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_6", 
                                                                                                           br(), "Age of fifth other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       )
                                       
                                       ,column(5,
                                               conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 5",
                                                                numericInput("age_family_6", value = 0, label = NULL, min=0)
                                                                
                                                                ,conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                  radioButtons("disab6", label="Disabled?",
                                                                                               list("No"="No",
                                                                                                    "Yes"="Yes"),
                                                                                               selected="No"),
                                                                                  conditionalPanel(condition="input.other_family=='Yes' & input.age_family_6 >= 18",
                                                                                                   radioButtons("blind_6", label="Legally Blind?",
                                                                                                                list("No"="No",
                                                                                                                     "Yes"="Yes"),
                                                                                                                selected="No")))
                                                                
                                               )
                                       )
                                       
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 6",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_7", 
                                                                                                           br(), "Age of seventh other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       ) 
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 6",
                                                                 numericInput("age_family_7", value = 0, label = NULL, min=0)
                                                                 
                                                                 , conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                    radioButtons("disab7", label="Disabled?",
                                                                                                 list("No"="No",
                                                                                                      "Yes"="Yes"),
                                                                                                 selected="No"),
                                                                                    conditionalPanel(condition="input.other_family=='Yes' & input.age_family_7 >= 18",
                                                                                                     radioButtons("blind_7", label="Legally Blind?",
                                                                                                                  list("No"="No",
                                                                                                                       "Yes"="Yes"),
                                                                                                                  selected="No")))
                                                                 
                                                )
                                       )
                                       
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 7",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_8", 
                                                                                                           br(), "Age of eighth other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       )
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 7",
                                                                 numericInput("age_family_8", value = 0, label = NULL, min=0)
                                                                 
                                                                 , conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                    radioButtons("disab8", label="Disabled?",
                                                                                                 list("No"="No",
                                                                                                      "Yes"="Yes"),
                                                                                                 selected="No"),
                                                                                    conditionalPanel(condition="input.other_family=='Yes' & input.age_family_8 >= 18",
                                                                                                     radioButtons("blind_8", label="Legally Blind?",
                                                                                                                  list("No"="No",
                                                                                                                       "Yes"="Yes"),
                                                                                                                  selected="No")))
                                                                 
                                                )
                                       )
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 8",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_9", 
                                                                                                           br(), "Age of ninth other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       )
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 8",
                                                                 numericInput("age_family_9", value = 0, label = NULL, min=0)
                                                                 
                                                                 
                                                                 , conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                    radioButtons("disab9", label="Disabled?",
                                                                                                 list("No"="No",
                                                                                                      "Yes"="Yes"),
                                                                                                 selected="No"),
                                                                                    conditionalPanel(condition="input.other_family=='Yes' & input.age_family_9 >= 18",
                                                                                                     radioButtons("blind_9", label="Legally Blind?",
                                                                                                                  list("No"="No",
                                                                                                                       "Yes"="Yes"),
                                                                                                                  selected="No")))
                                                                 
                                                )
                                       )
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 9",
                                                               tags$form(
                                                                 class="form-horizontal",
                                                                 
                                                                 tags$div(
                                                                   class="form-group",   div(style="margin-top:-1.5em;", 
                                                                                             
                                                                                             h4(tags$label(`for` = "age_family_10", 
                                                                                                           br(), "Age of tenth other family member")
                                                                                             )
                                                                   ))),
                                                               tags$div(div(style="margin-top:-1.5em;", 
                                                                            h6("Enter 0 for children younger than 1")
                                                               )))
                                       )
                                       
                                       , column(5,
                                                conditionalPanel(condition="input.other_family=='Yes' & input.num_other_family > 9",
                                                                 numericInput("age_family_10", value = 0, label = NULL, min=0)
                                                                 
                                                                 , conditionalPanel(condition="input.fam_disab =='Yes'",
                                                                                    radioButtons("disab10", label="Disabled?",
                                                                                                 list("No"="No",
                                                                                                      "Yes"="Yes"),
                                                                                                 selected="No"),
                                                                                    conditionalPanel(condition="input.other_family=='Yes' & input.age_family_10 >= 18",
                                                                                                     radioButtons("blind_10", label="Legally Blind?",
                                                                                                                  list("No"="No",
                                                                                                                       "Yes"="Yes"),
                                                                                                                  selected="No")))
                                                                 
                                                )
                                       )
                                     ),
                                     
                                     
                                     
                                     br(),
                                     tags$div(align = "center",
                                              tags$h2("Client's Current Job"),
                                              tags$h5("CLIFF Planner needs this information to calculate the current year budget."),
                                     ),
                                     br(),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.5em;", 
                                                                            
                                                                            h4(tags$label(`for` = "startingWage_c", 
                                                                                          br(), "Current hourly wage")
                                                                            )
                                                  ))
                                              )
                                              
                                              # h4("Current hourly wage")
                                       ),
                                       column(5,
                                              numericInput("startingWage_c", value=0, label = NULL, min=0)
                                       ),
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.5em;", 
                                                                            
                                                                            h4(tags$label(`for` = "current_hours", 
                                                                                          br(), "Current hours per week")
                                                                            )
                                                  )))
                                              #  h4("Current hours per week")
                                       ),
                                       column(5, 
                                              numericInput("current_hours", value=0, label = NULL, min=0)
                                       ),
                                     ),
                                     
                                     fluidRow(
                                       column(5, offset = 2,
                                              tags$form(
                                                class="form-horizontal",
                                                
                                                tags$div(
                                                  class="form-group",   div(style="margin-top:-1.3em;", 
                                                                            
                                                                            h4(tags$label(`for` = "include_health_insurance_init", 
                                                                                          br(), "Receives employer-provided health insurance?")
                                                                            )
                                                  ))
                                                #  h4("Current hours per week")
                                              )),
                                       column(5, 
                                              selectInput("include_health_insurance_init", label = NULL,
                                                          list(#" " = "empty",
                                                            "Yes" = "Yes"
                                                            , "No" = "No"), selected = "No")
                                       ),
                                     ),
                                     
                                     
                                     
                                     
                                     #fluidRow(
                                     #  column(12, offset=5,
                                     #         conditionalPanel(condition = "input.age < 0 | input.age > 99
                                     # | input.age_partner < 0 | input.age_partner > 99
                                     # | input.age_family_1 < 0 | input.age_family_1 > 99
                                     # | input.age_family_2 < 0 | input.age_family_2 > 99
                                     # | input.age_family_3 < 0 | input.age_family_3 > 99
                                     # | input.age_family_4 < 0 | input.age_family_4 > 99
                                     # | input.age_family_5 < 0 | input.age_family_5 > 99
                                     # | input.age_family_6 < 0 | input.age_family_6 > 99
                                     # | input.age_family_7 < 0 | input.age_family_7 > 99
                                     # | input.age_family_8 < 0 | input.age_family_8 > 99
                                     # | input.age_family_9 < 0 | input.age_family_8 > 99
                                     # | input.age_family_10 < 0 | input.age_family_10 > 99",
                                     #                          h4(span(textOutput("error_family_age"), style="color:red"))
                                     #         ))),
                                     
                                     
                                     
                                     #---------------------
                                     # QUESTION
                                     #br(),
                                     #fluidRow(
                                     #    column(5, offset = 2,
                                     #           h4("Is any of the following true for you or any of your family members?")),
                                     #    column(5,
                                     #           checkboxInput("disqualified1", "Has a disability", FALSE)
                                     #           ,checkboxInput("disqualified2", "Is homeless", FALSE)
                                     #           ,checkboxInput("disqualified3", "Formerly incarcerated", FALSE)
                                     #           ,checkboxInput("disqualified4", "Lives on Native Land", FALSE)
                                     #           ,checkboxInput("disqualified5", "Not a U.S. citizen", FALSE)
                                     #           ,checkboxInput("disqualified6", "Veteran or in the military", FALSE))
                                     #),
                                     #fluidRow(
                                     #    column(12, offset=0,
                                     #           conditionalPanel(condition = "input.disqualified1==true | input.disqualified2==true
                                     #                          | input.disqualified3==true | input.disqualified4==true
                                     #                          | input.disqualified5==true | input.disqualified6==true",
                                     #                            tags$div(align = "center", 
                                     #                         h4("You can use this tool for career path planning but not for government assistance calculations.")           
                                     #                            )
                                     #    
                                     #           ))),
                                     
                                     
                                     br(),
                                     
                                     fluidRow(
                                       column(3),
                                       column(6,
                                              tags$div(align = "center", 
                                                       useShinyjs(),
                                                       extendShinyjs(text = jscode2, functions = c("next2")),
                                                       actionButton("next2","Next >> Choose A Career", 
                                                                    style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                    class="btn btn-primary btn-lg"),
                                                       h4(span(strong(textOutput("error_info_1"), style="color:red")))
                                              )
                                       ),
                                       column(3)
                                     ),
                                     
                                     #,tags$script('
                                     #    pressedKeyCount = 0;
                                     #    $(document).on("keydown", function (e) {
                                     #    if(e.keyCode == 37 | e.keyCode == 39){
                                     #       Shiny.onInputChange("pressedKey1", pressedKeyCount++);
                                     #       Shiny.onInputChange("pressedKeyId_1", e.which);
                                     #        $(document).load().scrollTop(0);
                                     #    }
                                     #    });'
                                     #                         
                                     #                  )
                            )
                   ),
                   
                   
                   #-------------------------------------------------------------------------------- 
                   # tab panel 3 - Choose A Career
                   #-------------------------------------------------------------------------------- 
                   tabPanel("Choose A Career", icon = icon("angle-double-right", lib = "font-awesome"),
                            tags$div(class = "container",
                                     br(),      
                                     br(),
                                     br(),      
                                     br(),
                                     
                                     ##      tags$div(align = "center",
                                     ###              tags$h4("You can compare up to two careers, or compare your career choice to your current job or a near-minimum wage job."),
                                     #   ),
                                     
                                     fluidRow(column(1),column(10,
                                                               includeHTML("www/choosecareers.html"))
                                              ,column(1)), # Home page - written in HTML
                                     
                                     
                                     br(),
                                     
                                     
                                     br(),
                                     
                                     
                                     ######################################
                                     # Career Option 1
                                     ######################################
                                     
                                     tags$div(align = "center",
                                              tags$div(
                                                class="form-group",   #div(style="margin-top:-1.1em;" ,
                                                
                                                tags$h2(tags$label(`for` = "type_career_1", 
                                                                   br(), "Career Option 1")
                                                )
                                                #  )
                                              )
                                              #tags$h2("Career Option 1")
                                              
                                              
                                     ),
                                     br(),
                                     #zyx <<- 12,              
                                     tags$div(align = "center",
                                              selectInput("type_career_1", label = NULL, # Note: collect state abbreviation
                                                          list("--- Add ---" = "empty",
                                                               "Near-minimum wage job" = "default"
                                                               ,"Current job" = "current"
                                                               , "Create career path" = "custom"
                                                          ), selected = "empty")
                                     ),
                                     #zyx <<- 121, 
                                     conditionalPanel(condition = "input.type_career_1== 'current'",
                                                      br(),
                                                      #     h5(align = "center","We need to ask a few more questions about your current job. What is your occupation and how many years of experience do you have in that job?"),
                                                      tags$div(align="center",
                                                               includeHTML("www/currentjob.html")),
                                                      br(),  
                                                      br(),
                                                      fluidRow(
                                                        column(1),
                                                        column(3, offset=1,
                                                               
                                                               #  zyx <<- 122, 
                                                               h4("Optional Occupation Filters:"),
                                                               h6("These filters will reduce the size of the occupation list below."),
                                                               #hr(),
                                                               selectInput("industry_c", "Show selected broad occupation groups",
                                                                           list("All" = "",
                                                                                "Architecture and Engineering Occupations",
                                                                                "Arts, Design, Entertainment, Sports, and Media Occupations",
                                                                                "Building and Grounds Cleaning and Maintenance Occupations",
                                                                                "Business and Financial Operations Occupations",
                                                                                "Community and Social Service Occupations",
                                                                                "Computer and Mathematical Occupations",
                                                                                "Construction and Extraction Occupations",
                                                                                "Educational Instruction and Library Occupations",
                                                                                "Farming, Fishing, and Forestry Occupations",
                                                                                "Food Preparation and Serving Related Occupations",
                                                                                "Healthcare Practitioners and Technical Occupations",
                                                                                "Healthcare Support Occupations",
                                                                                "Installation, Maintenance, and Repair Occupations",
                                                                                "Legal Occupations",
                                                                                "Life, Physical, and Social Science Occupations",
                                                                                "Management Occupations",
                                                                                "Office and Administrative Support Occupations",
                                                                                "Personal Care and Service Occupations",
                                                                                "Production Occupations",
                                                                                "Protective Service Occupations",
                                                                                "Sales and Related Occupations",
                                                                                "Transportation and Material Moving Occupations"
                                                                           ), multiple=TRUE, selected = NULL),
                                                               
                                                               hr(),
                                                               #  zyx <<- 123, 
                                                               selectizeInput("occupation1_current", "Occupation", 
                                                                              choices = NULL, options = list(placeholder = 'select'
                                                                                                             ,onInitialize = I('function() { this.setValue(""); }')
                                                                              )),
                                                               
                                                               br(),
                                                               bsCollapse(id = "collapseExample1", multiple = TRUE,
                                                                          bsCollapsePanel("Don't see an occupation?" 
                                                                                          
                                                                                          ,h5("If an occupation is missing, try searching by keyword on ", (strong(tags$u(tags$a(href="https://www.mynextmove.org/",target="_blank","mynextmove.org")))), " to get the official BLS occupation name.")
                                                                          )
                                                                          
                                                                          
                                                               ),
                                                               
                                                               
                                                               br(),
                                                               selectInput("include_health_insurance_c", "Does this job provide health insurance?",
                                                                           list(#" " = "empty",
                                                                             "Yes" = "Yes"
                                                                             , "No" = "No"), selected = "No"),
                                                        ),
                                                        
                                                        br(),
                                                        br(),
                                                        
                                                        column(1),
                                                        column(6, offset=0,

                                                               
                                                               fluidRow(
                                                                 column(2),
                                                                 column(4,
                                                                        tags$form(
                                                                          class="form-horizontal",
                                                                          
                                                                          tags$div(
                                                                            class="form-group",   div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                      
                                                                                                      p(tags$label(`for` = "experience_c", 
                                                                                                                   br(), "Years of experience in current job")
                                                                                                      )
                                                                            ))
                                                                        )
                                                                 ),
                                                                 column(3,
                                                                        #textInput("degree_title", label=NULL, value=NULL)
                                                                        numericInput("experience_c", value = 0, label=NULL, min=0)
                                                                 )
                                                               ))
                                                      )
                                     ),
                                     
                                     ############################################################################################################################################################################################################################
                                     
                                     conditionalPanel(condition = "input.type_career_1== 'custom'",
                                                      
                                                      br(),
                                                      
                                                      fluidRow(
                                                        column(1),
                                                        column(3, offset=1,
                                                               #tags$div(align = "center",
                                                               #          tags$h4("Choose Career"),
                                                               #          br(),
                                                               #),
                                                               #  zyx <<- 14,
                                                               h4("Optional Occupation Filters:"),
                                                               h6("These filters will reduce the size of the occupation list below."),
                                                               #hr(),
                                                               checkboxInput("filterMedian1", strong("Filter on jobs that pay above the area median wage"), FALSE),
                                                               
                                                               selectInput("industry_1", "Filter by broad occupation group",
                                                                           list("All" = "",
                                                                                "Architecture and Engineering Occupations",
                                                                                "Arts, Design, Entertainment, Sports, and Media Occupations",
                                                                                "Building and Grounds Cleaning and Maintenance Occupations",
                                                                                "Business and Financial Operations Occupations",
                                                                                "Community and Social Service Occupations",
                                                                                "Computer and Mathematical Occupations",
                                                                                "Construction and Extraction Occupations",
                                                                                "Educational Instruction and Library Occupations",
                                                                                "Farming, Fishing, and Forestry Occupations",
                                                                                "Food Preparation and Serving Related Occupations",
                                                                                "Healthcare Practitioners and Technical Occupations",
                                                                                "Healthcare Support Occupations",
                                                                                "Installation, Maintenance, and Repair Occupations",
                                                                                "Legal Occupations",
                                                                                "Life, Physical, and Social Science Occupations",
                                                                                "Management Occupations",
                                                                                "Office and Administrative Support Occupations",
                                                                                "Personal Care and Service Occupations",
                                                                                "Production Occupations",
                                                                                "Protective Service Occupations",
                                                                                "Sales and Related Occupations",
                                                                                "Transportation and Material Moving Occupations"
                                                                           ), multiple=TRUE, selected = NULL),
                                                               
                                                               hr(),
                                                               
                                                               selectizeInput("occupation1", "Occupation", 
                                                                              choices = NULL, options = list(placeholder = 'select'
                                                                                                             ,onInitialize = I('function() { this.setValue(""); }')
                                                                              )),
                                                               
                                                               br(),
                                                               bsCollapse(id = "collapseExample2", multiple = TRUE,
                                                                         bsCollapsePanel("Don't see an occupation?" 
                                                                                          
                                                                                          ,h5("If an occupation is missing, try searching by keyword on ", (strong(tags$u(tags$a(href="https://www.mynextmove.org/",target="_blank","mynextmove.org")))), " to get the official BLS name.")
                                                                          )
                                                                          
                                                                          
                                                               ),
                                                               br(),
                                                               
                                                               
                                                               selectInput("include_health_insurance_1", "Will this job provide health insurance?",
                                                                           list(#" " = "empty",
                                                                             "Yes" = "Yes"
                                                                             , "No" = "No"), selected = "No"),
                                                               
                                                               radioButtons("overrideWage_1", "Is the starting hourly wage known?",
                                                                            list(#" " = "empty",
                                                                              "Yes" = "Yes"
                                                                              , "No" = "No"), selected = "No", inline=T),
                                                               
                                                               conditionalPanel(condition = "input.overrideWage_1=='Yes'",
                                                                                numericInput("startingWage_1", value = NA, label="Starting Wage", min=0, width='60%') 
                                                               )
                                                        ),  
                                                        
                                                        column(1),
                                                        column(6, offset=0,
                                                               
                                                               fluidRow(
                                                                 column(2),
                                                                 column(8,
                                                                        tags$form(
                                                                          class="form-horizontal",
                                                                          
                                                                          tags$div(
                                                                            class="form-group",   div(style="margin-right:1.0em;", 
                                                                                                      
                                                                                                      p(tags$label(`for` = "edu_req_1", 
                                                                                                                   br(), "Does obtaining this job require additional training or education?")
                                                                                                      )
                                                                            ))
                                                                        ))
                                                               ),
                                                               
                                                               fluidRow(
                                                                 column(2),
                                                                 column(8,
                                                                        tags$div(div(style="margin-top:-2.0em;", 
                                                                                     radioButtons("edu_req_1", label = NULL,
                                                                                                  list(#" " = "empty",
                                                                                                    "No" = "no",
                                                                                                    "Yes - enter custom training duration, cost, and grant value" = "yes_custom"
                                                                                                  )
                                                                                                  , selected = "yes_custom", inline=F)
                                                                        )))
                                                                 
                                                               ),
                                                               
                                                               conditionalPanel(condition="input.edu_req_1=='yes_typical' | input.edu_req_1=='yes_custom'" ,
                                                                                
                                                                                conditionalPanel(condition="input.edu_req_1=='yes_custom'",
                                                                                                 br(),
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          strong(p("Duration of schooling")),
                                                                                                          br()
                                                                                                   ),
                                                                                                   
                                                                                                   
                                                                                                   column(3,
                                                                                                          numericInput("schooling_years_1", value = 0, label=NULL, min=0, width='60%'),
                                                                                                          numericInput("schooling_months_1", value = 0, label=NULL, min=0, width='60%')
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          tags$form(
                                                                                                            class="form-horizontal",
                                                                                                            
                                                                                                            tags$div(
                                                                                                              class="form-group",   div(style="margin-top:-1.1em; margin-left:-2.5em",
                                                                                                                                        
                                                                                                                                        p(tags$label(`for` = "schooling_years_1", 
                                                                                                                                                     br(), "year(s)")
                                                                                                                                        )
                                                                                                              ))
                                                                                                          ),
                                                                                                          br(),
                                                                                                          tags$form(
                                                                                                            class="form-horizontal",
                                                                                                            
                                                                                                            tags$div(
                                                                                                              class="form-group",   div(style="margin-top:-2.8em; margin-left:-2.5em",
                                                                                                                                        
                                                                                                                                        p(tags$label(`for` = "schooling_months_1", 
                                                                                                                                                     br(), "month(s)")
                                                                                                                                        )
                                                                                                              ))
                                                                                                          )
                                                                                                   )
                                                                                                 ),
                                                                                                 
                                                                                                 
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.1em;" ,
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "tuition_fees_1", 
                                                                                                                                                   br(), "Total tuition and fees")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          numericInput("tuition_fees_1", value = 0, label=NULL, min=0)
                                                                                                   )
                                                                                                 ),
                                                                                                 
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.1em;" ,
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "Grants_1", 
                                                                                                                                                   br(), "Total grants")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          numericInput("Grants_1", value = 0, label=NULL, min=0)
                                                                                                   )
                                                                                                 ),
                                                                                                 
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-0.9em;" ,
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "loans_1", 
                                                                                                                                                   br(), "Total student loans")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          numericInput("loans_1", value = 0, label=NULL, min=0)
                                                                                                   )
                                                                                                 )
                                                                                ),
                                                                                
                                                                                br(),
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  column(8,
                                                                                         strong(p("Will the client work during their studies?")))
                                                                                  
                                                                                  
                                                                                ),
                                                                                
                                                                                fluidRow(
                                                                                  
                                                                                  column(2),
                                                                                  
                                                                                  column(8,
                                                                                         radioButtons("work_inschool_1", label = NULL,
                                                                                                      list(#" " = "empty",
                                                                                                        "No" = "no",
                                                                                                        "Yes" = "yes"
                                                                                                      )
                                                                                                      , selected = "no", inline=T)
                                                                                  )
                                                                                  
                                                                                ),
                                                                                
                                                                                br(),
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_1=='yes'",
                                                                                                          numericInput("hours_inschool_1", label=NULL, value=20, min=0)
                                                                                         )
                                                                                  ),
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_1=='yes'",
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.2em; margin-left:-1em",
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "hours_inschool_1", 
                                                                                                                                                   br(), "hours per week")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                         )
                                                                                  )
                                                                                ),
                                                                                
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  
                                                                                  
                                                                                  
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_1=='yes'",
                                                                                                          numericInput("wage_inschool_1", label=NULL, value=0, min=0)
                                                                                         )
                                                                                  ),
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_1=='yes'",
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.2em; margin-left:-1em",
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "wage_inschool_1", 
                                                                                                                                                   br(), " per hour")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                         )
                                                                                  )
                                                                                ),
                                                                                
                                                                                br(),
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  
                                                                                  column(8,
                                                                                         conditionalPanel(condition = "input.work_inschool_1=='yes'"
                                                                                                          , strong(p("Will the client receive employer-provided health insurance during their studies?"))
                                                                                                          , radioButtons("health_insurance_inschool_1", label=NULL,
                                                                                                                         list("No" = "no"
                                                                                                                              ,"Yes" = "yes"
                                                                                                                              )
                                                                                                                         , selected = "no", inline = T)
                                                                                                          )
                                                                                         )
                                                                                ),
                                                                                
                                                                               
                                                               ),
                                                               
                                                               
                                                               
                                                               
                                                        )
                                                        
                                                      )),
                                     
                                     ######################################
                                     # Career Option 2
                                     ######################################
                                     #hr(),
                                     #hr(),
                                     br(),
                                     br(),
                                     tags$div(align = "center",
                                              tags$div(
                                                class="form-group",   #div(style="margin-top:-1.1em;" ,
                                                
                                                tags$h2(tags$label(`for` = "type_career_2", 
                                                                   br(), "Career Option 2")
                                                )
                                                #  )
                                              )
                                              #tags$h2("Career Option 1")
                                              
                                              
                                     ),
                                     br(),
                                     #br(),
                                     tags$div(align = "center",
                                              selectInput("type_career_2", label = NULL, # Note: collect state abbreviation
                                                          list("--- Add ---" = "empty",
                                                               #"Add your current job" = "current"
                                                               "Create career path" = "custom"
                                                          ), selected = "empty")
                                     ),
                                     
                                     conditionalPanel(condition = "input.type_career_2== 'custom'",
                                                      br(),
                                                      fluidRow(
                                                        column(1),
                                                        column(3, offset=1,
                                                               
                                                               h4("Optional Occupation Filters:"),
                                                               h6("These filters will reduce the size of the occupation list below."),
                                                               #hr(),
                                                               checkboxInput("filterMedian2", strong("Filter on jobs that pay above the area median wage"), FALSE),
                                                               
                                                               selectInput("industry_2", "Filter by broad occupation group",
                                                                           list("All" = "",
                                                                                "Architecture and Engineering Occupations",
                                                                                "Arts, Design, Entertainment, Sports, and Media Occupations",
                                                                                "Building and Grounds Cleaning and Maintenance Occupations",
                                                                                "Business and Financial Operations Occupations",
                                                                                "Community and Social Service Occupations",
                                                                                "Computer and Mathematical Occupations",
                                                                                "Construction and Extraction Occupations",
                                                                                "Educational Instruction and Library Occupations",
                                                                                "Farming, Fishing, and Forestry Occupations",
                                                                                "Food Preparation and Serving Related Occupations",
                                                                                "Healthcare Practitioners and Technical Occupations",
                                                                                "Healthcare Support Occupations",
                                                                                "Installation, Maintenance, and Repair Occupations",
                                                                                "Legal Occupations",
                                                                                "Life, Physical, and Social Science Occupations",
                                                                                "Management Occupations",
                                                                                "Office and Administrative Support Occupations",
                                                                                "Personal Care and Service Occupations",
                                                                                "Production Occupations",
                                                                                "Protective Service Occupations",
                                                                                "Sales and Related Occupations",
                                                                                "Transportation and Material Moving Occupations"
                                                                           ), multiple=TRUE, selected = NULL),
                                                               
                                                               
                                                               hr(),
                                                               
                                                               
                                                               selectizeInput("occupation2", "Occupation", 
                                                                              choices = NULL, options = list(placeholder = 'select'
                                                                                                             ,onInitialize = I('function() { this.setValue(""); }')
                                                                              )),
                                                               
                                                               br(),
                                                               bsCollapse(id = "collapseExample1", multiple = TRUE,
                                                                          bsCollapsePanel("Don't see an occupation?" 
                                                                                          
                                                                                          ,h5("If an occupation is missing, try searching by keyword on ", (strong(tags$u(tags$a(href="https://www.mynextmove.org/",target="_blank","mynextmove.org")))), " to get the BLS official occupation name.")
                                                                          )
                                                                          
                                                                          
                                                               ),
                                                               br(),
                                                               
                                                               
                                                               selectInput("include_health_insurance_2", "Will this job provide health insurance?",
                                                                           list(#" " = "empty",
                                                                             "Yes" = "Yes"
                                                                             , "No" = "No"), selected = "No"),
                                                               
                                                               radioButtons("overrideWage_2", "Is the starting hourly wage known?",
                                                                            list(#" " = "empty",
                                                                              "Yes" = "Yes"
                                                                              , "No" = "No"), selected = "No", inline=T),
                                                               
                                                               conditionalPanel(condition = "input.overrideWage_2=='Yes'",
                                                                                numericInput("startingWage_2", value = NA, label="Starting Wage", min=0, width='60%') 
                                                               )
                                                        ),  
                                                        
                                                        column(1),
                                                        column(6, offset=0,
                                                               fluidRow(
                                                                 column(2),
                                                                 column(8,
                                                                        tags$form(
                                                                          class="form-horizontal",
                                                                          
                                                                          tags$div(
                                                                            class="form-group",   div(style="margin-right:1.0em;", 
                                                                                                      
                                                                                                      p(tags$label(`for` = "edu_req_2", 
                                                                                                                   br(), "Does obtaining this job require additional training or education?")
                                                                                                      )
                                                                            ))
                                                                        ))
                                                               ),
                                                               
                                                               fluidRow(
                                                                 column(2),
                                                                 column(8,
                                                                        tags$div(div(style="margin-top:-2.0em;", 
                                                                                     radioButtons("edu_req_2", label = NULL,
                                                                                                  list(#" " = "empty",
                                                                                                    "No" = "no",
                                                                                                    "Yes - enter custom training duration, cost, and grant value" = "yes_custom"
                                                                                                  )
                                                                                                  , selected = "yes_custom", inline=F)
                                                                        )))
                                                                 
                                                               ),
                                                               
                                                               conditionalPanel(condition="input.edu_req_2=='yes_typical' | input.edu_req_2=='yes_custom'" ,
                                                                                
                                                                                conditionalPanel(condition="input.edu_req_2=='yes_custom'",
                                                                                                 br(),
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          strong(p("Duration of schooling")),
                                                                                                          br()
                                                                                                   ),
                                                                                                   
                                                                                                   
                                                                                                   column(3,
                                                                                                          numericInput("schooling_years_2", value = 0, label=NULL, min=0, width='60%'),
                                                                                                          numericInput("schooling_months_2", value = 0, label=NULL, min=0, width='60%')
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          tags$form(
                                                                                                            class="form-horizontal",
                                                                                                            
                                                                                                            tags$div(
                                                                                                              class="form-group",   div(style="margin-top:-1.1em; margin-left:-2.5em",
                                                                                                                                        
                                                                                                                                        p(tags$label(`for` = "schooling_years_2", 
                                                                                                                                                     br(), "years")
                                                                                                                                        )
                                                                                                              ))
                                                                                                          ),
                                                                                                          br(),
                                                                                                          tags$form(
                                                                                                            class="form-horizontal",
                                                                                                            
                                                                                                            tags$div(
                                                                                                              class="form-group",   div(style="margin-top:-2.8em; margin-left:-2.5em",
                                                                                                                                        
                                                                                                                                        p(tags$label(`for` = "schooling_months_2", 
                                                                                                                                                     br(), "months")
                                                                                                                                        )
                                                                                                              ))
                                                                                                          )
                                                                                                   )
                                                                                                 ),
                                                                                                 
                                                                                                 
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.1em;" ,
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "tuition_fees_2", 
                                                                                                                                                   br(), "Total tuition and fees")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          numericInput("tuition_fees_2", value = 0, label=NULL, min=0)
                                                                                                   )
                                                                                                 ),
                                                                                                 
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.1em;" ,
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "Grants_2", 
                                                                                                                                                   br(), "Total grants")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          numericInput("Grants_2", value = 0, label=NULL, min=0)
                                                                                                   )
                                                                                                 ),
                                                                                                 
                                                                                                 fluidRow(
                                                                                                   column(2),
                                                                                                   column(4,
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-0.9em;" ,
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "loans_2", 
                                                                                                                                                   br(), "Total student loans")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                                   ),
                                                                                                   column(3,
                                                                                                          numericInput("loans_2", value = 0, label=NULL, min=0)
                                                                                                   )
                                                                                                 )),
                                                                                
                                                                                br(),
                                                                                fluidRow(
                                                                                  
                                                                                  column(2),
                                                                                  
                                                                                  column(8,
                                                                                         radioButtons("work_inschool_2", label = "Will the client work during their studies?",
                                                                                                      list(#" " = "empty",
                                                                                                        "No" = "no",
                                                                                                        "Yes" = "yes"
                                                                                                      )
                                                                                                      , selected = "no", inline=T)
                                                                                  )
                                                                                  
                                                                                ),
                                                                                
                                                                                
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_2=='yes'",
                                                                                                          numericInput("hours_inschool_2", label=NULL, value=20, min=0)
                                                                                         )
                                                                                  ),
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_2=='yes'",
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.2em; margin-left:-1em",
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "hours_inschool_2", 
                                                                                                                                                   br(), "hours per week")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                         )
                                                                                  )
                                                                                ),
                                                                                
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  
                                                                                  
                                                                                  
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_2=='yes'",
                                                                                                          numericInput("wage_inschool_2", label=NULL, value=0, min=0)
                                                                                         )
                                                                                  ),
                                                                                  column(3,
                                                                                         conditionalPanel(condition = "input.work_inschool_2=='yes'",
                                                                                                          tags$div(
                                                                                                            class="form-group",   div(style="margin-top:-1.2em; margin-left:-1em",
                                                                                                                                      
                                                                                                                                      p(tags$label(`for` = "wage_inschool_2", 
                                                                                                                                                   br(), " per hour")
                                                                                                                                      )
                                                                                                            )
                                                                                                          )
                                                                                         )
                                                                                  )
                                                                                ),
                                                                                
                                                                                br(),
                                                                                fluidRow(
                                                                                  column(2),
                                                                                  
                                                                                  column(8,
                                                                                         conditionalPanel(condition = "input.work_inschool_2=='yes'"
                                                                                                          , strong(p("Will client receive employer-provided health insurance during their studies?"))
                                                                                                          , radioButtons("health_insurance_inschool_2", label=NULL,
                                                                                                                         list("No" = "no"
                                                                                                                              ,"Yes" = "yes"
                                                                                                                         )
                                                                                                                         , selected = "no", inline = T)
                                                                                         )
                                                                                  )
                                                                                ),
                                                                                
                                                               )
                                                               )
                                                        
                                                      )),
                                     br(),
                                     br(),
                                     
                                     fluidRow(
                                       column(4,
                                              tags$div(align = "center", 
                                                       useShinyjs(),
                                                       extendShinyjs(text = jscodeback1, functions = c("back1")),
                                                       actionButton("back1","Back << Client Profile", 
                                                                    style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                    class="btn btn-primary btn-lg")
                                              )
                                       ),
                                       column(4,
                                              tags$div(align = "center", 
                                                       useShinyjs(),
                                                       h4(span(strong(textOutput("error_info_2"), style="color:red")))
                                              )
                                       ),
                                       column(4,
                                              tags$div(align = "center", 
                                                       useShinyjs(),
                                                       extendShinyjs(text = jscode3, functions = c("next3")),
                                                       actionButton("next3","Next >> Compare Careers", 
                                                                    style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                    class="btn btn-primary btn-lg")
                                              )
                                       )
                                     ),
                                     
                                     #                         ,   tags$script('
                                     #    pressedKeyCount = 0;
                                     #    $(document).on("keydown", function (e) {
                                     #    if(e.keyCode == 37 | e.keyCode == 39){
                                     #       Shiny.onInputChange("pressedKey2", pressedKeyCount++);
                                     #       Shiny.onInputChange("pressedKeyId_2", e.which);
                                     #    }
                                     #    });'
                                     #                            )
                            )),
                   
                   
                   #-------------------------------------------------------------------------------- 
                   # tab panel 4 - Compare Careers
                   #-------------------------------------------------------------------------------- 
                   tabPanel("Compare Careers", icon = icon("angle-double-right", lib = "font-awesome"),
                            
                            tags$style(HTML("
    .tabbable > .nav > li > a                  {background-color: rgb(130,130,130);  color:rgb(255,255,255)}
    .tabbable > .nav > li[class=active] > a[data-value='Career Option 1'] {background-color: rgb(60,60,60); color: rgb(255,255,255); height: 45PX; width: 170PX}
    .tabbable > .nav > li[class=active] > a[data-value='Career Option 2'] {background-color: rgb(60,60,60); color: rgb(255,255,255); height: 45PX; width: 170PX}
    ")),
                            
                            tags$div(class = "container",
                                     br(),
                                     br(),
                                     br(),
                                     br(),
                                     #      tags$div(align = "center",
                                     #               tags$h4("Click 'Calculate Results' to see how your career choices compare.")
                                     #               ,h4("To save these results hit CTRL+P on your keyboard (COMMAND+P on Mac) and print to PDF."),
                                     #      ),
                                     includeHTML("www/compare1.html"), # Home page - written in HTML
                                     includeHTML("www/compare2.html"),
                                     
                                     
                                     br(),
                                     
                                     tags$div(align = "center",
                                              actionButton("getresults","Calculate Results", 
                                                           style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                           class="btn btn-primary btn-lg")
                                     )
                                     ,br()
                                     ,conditionalPanel(condition = "input.getresults>0", 
                                                       
                                                       #Title: Lifetime Income for Each Career
                                                      fluidRow(column(1),column(10,
                                                                                 includeHTML("www/comparecareers1.html")),column(1)
                                                       )
                                                       
                                                       ,br()
                                                       ,tags$div(align = "center"
                                                                 , withSpinner(plotlyOutput('income.lifetime', width = 720, height = 334),type=2))
                                                       ,br()
                                                      ,br()
                                                      ,br()
                                                       # Title: PROJECTED INCOME ALONG SELECTED CAREER PATH   
                                                       ,fluidRow(column(1),column(10,
                                                                                  includeHTML("www/comparecareers2.html")),column(1)
                                                       )          
                                                       ,br()
                                                       ,br()
                                                       ,tags$div(align = "center"
                                                                 , withSpinner(plotlyOutput('income.gross', width = 880, height = 377),type=2))
                                                       ,br()
                                                       ,br()
                                                       
                                                       #      Title: THE MINIMUM HOUSEHOLD BUDGET
                                                       ,fluidRow(column(1),column(10,
                                                                                  includeHTML("www/comparecareers3.html")),column(1)
                                                       )
                                                       ,br() 
                                                       ,br()    
                                                      ,tags$div(align = "center"
                                                                ,withSpinner(plotlyOutput('after.tax.self.sufficiency_1', width = 880, height = 377),type=2))
                                                      ,br()
                                                      ,br()
                                                      #     ,h3("What's Included in the Self Sufficiency Target?")
                                                      #    ,br()
                                                      #       ,h4("The Minimum Household Budget includes seven basic expenses: childcare, food, health insurance, housing, transportation, utilities, and other expenses. These expenses change with time and depend on factors like the number and ages of children, and geographic differences in cost of living.")
                                                      ,fluidRow(column(1),column(10,
                                                                                 includeHTML("www/comparecareers4.html")),column(1)
                                                      )
                                                      ,br()    
                                                      ,br()
                                                      ,tags$div(align = "center"
                                                                ,plotlyOutput('expenses.breakdown_1', width = 880, height = 377))
                                                      
                                                      ,br()
                                                      ,br()
                                                      ,br()
                                                      ,br()
                                                       ,fluidRow(
                                                         column(4,
                                                                tags$div(align = "center", 
                                                                         useShinyjs(),
                                                                         extendShinyjs(text = jscodeback2, functions = c("back2")),
                                                                         actionButton("back2","Back << Client Profile", 
                                                                                      style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                      class="btn btn-primary btn-lg")
                                                                )
                                                         ),
                                                         column(4
                                                         ),
                                                         column(4,
                                                                tags$div(align = "center", 
                                                                         useShinyjs(),
                                                                         extendShinyjs(text = jscode4, functions = c("next4")),
                                                                         actionButton("next4","Next >> Create a Budget", 
                                                                                      style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                      class="btn btn-primary btn-lg")
                                                                )
                                                         )
                                                       )
                                                       
                                                       ,br()
                                                       #                                ,tags$script('
                                                       #  pressedKeyCount = 0;
                                                       #  $(document).on("keydown", function (e) {
                                                       #  if(e.keyCode == 37 | e.keyCode == 39){
                                                       #     Shiny.onInputChange("pressedKey3", pressedKeyCount++);
                                                       #     Shiny.onInputChange("pressedKeyId_3", e.which);
                                                       #     $(document).load().scrollTop(0);
                                                       #  }
                                                       #  });'
                                                       #                                )
                                                       
                                                       
                                                       
                                     )
                            )
                   ),
                   
                   
                   #-------------------------------------------------------------------------------- 
                   # tab panel 5 - Create a Budget
                   #--------------------------------------------------------------------------------
                   tabPanel("Create a Budget",  icon = icon("angle-double-right", lib = "font-awesome"),
                            
                            tags$style(HTML("
    .tabbable > .nav > li > a                  {background-color: rgb(130,130,130);  color:rgb(255,255,255)}
    .tabbable > .nav > li[class=active] > a[data-value='1 - Income and Assets'] {background-color: rgb(60,60,60); color: rgb(255,255,255); height: 45PX; width: 190PX}
    .tabbable > .nav > li[class=active] > a[data-value='2 - Public Assistance'] {background-color: rgb(60,60,60); color: rgb(255,255,255); height: 45PX; width: 190PX}
    .tabbable > .nav > li[class=active] > a[data-value='3 - Expenses'] {background-color: rgb(60,60,60); color: rgb(255,255,255); height: 45PX; width: 190PX}
    .tabbable > .nav > li[class=active] > a[data-value='4 - Budget'] {background-color: rgb(60,60,60); color: rgb(255,255,255); height: 45PX; width: 190PX}")),
                            
                            tags$div(class = "container",
                                     
                                     br(),      
                                     br(),
                                     br(),      
                                     br(),
                                     
                                     #     tags$div(align = "center",
                                     #              tags$h4("Complete the information on each of the tabs below to plan your path to financial stability.")
                                     #             ,h4("To save these results hit CTRL+P on your keyboard (COMMAND+P on Mac) and print to PDF."),
                                     #    ),
                                     includeHTML("www/budget1.html"),
                                     includeHTML("www/budget2.html"),
                                     
                                     br(),      
                                     br(),
                                     
                                     ######################################
                                     # Budgeting: Income & Assets
                                     ######################################
                                     tabsetPanel(id = "main",
                                                 tabPanel("1 - Income and Assets", 
                                                          tags$div(class = "container",
                                                                   
                                                                   br(),      
                                                                   br(),
                                                                   
                                                                   tags$div(align = "center",
                                                                            tags$h4("Please list income and assets. The information on this page will help screen for public assistance eligibility by program. Please be as accurate and thorough as possible. No information is stored. "),
                                                                   ),
                                                                   
                                                                   br(),
                                                                   h2("Income", class = "title fit-h1"),
                                                                   br(),
                                                                   
                                                                   
                                                                   #---------------------
                                                                   # QUESTION
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            tags$form(
                                                                              class="form-horizontal",
                                                                              
                                                                              tags$div(
                                                                                class="form-group",   div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                          
                                                                                                          h4(tags$label(`for` = "child_support_income", 
                                                                                                                        br(), "Monthly income from child support")
                                                                                                          )
                                                                                )
                                                                              )
                                                                            )
                                                                            #h4("Monthly income from child support")
                                                                     ),
                                                                     column(5,
                                                                            numericInput("child_support_income", value=0, label = NULL, min=0))
                                                                   ),
                                                                   
                                                                   
                                                                   #---------------------
                                                                   # QUESTION
                                                                   br(),
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            tags$form(
                                                                              class="form-horizontal",
                                                                              
                                                                              tags$div(
                                                                                class="form-group",   div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                          
                                                                                                          h4(tags$label(`for` = "investment_income", 
                                                                                                                        br(), "Monthly income from investments")
                                                                                                          )
                                                                                )
                                                                              )
                                                                            ),
                                                                            # h4("Monthly income from investments"),
                                                                            tags$div(style="margin-top:-1.5em;", 
                                                                                     h6("For example, from stocks or bonds"))
                                                                     ),
                                                                     column(5,
                                                                            numericInput("investment_income", value=0, label = NULL, min=0))
                                                                   ),
                                                                   
                                                                   
                                                                   fluidRow(
                                                                     column(12, offset=6,
                                                                            conditionalPanel(condition = "input.other_income < 0 | input.child_support_income < 0
                                                          | input.otherfamily_earnings < 0 | input.investment_income < 0"
                                                                                             ,
                                                                                             
                                                                                             
                                                                                             h4(span(textOutput("error_other_income"), style="color:red")),
                                                                                             br(),
                                                                                             br()
                                                                            ))
                                                                   ),
                                                                   
                                                                   ######################################
                                                                   # Assets
                                                                   ######################################
                                                                   hr(),
                                                                   hr(),
                                                                   h2("Assets", class = "title fit-h1"),
                                                                   br(),
                                                                   
                                                                   #---------------------
                                                                   # QUESTION
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            tags$form(
                                                                              class="form-horizontal",
                                                                              
                                                                              tags$div(
                                                                                class="form-group",   div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                          
                                                                                                          h4(tags$label(`for` = "checking_account", 
                                                                                                                        br(), "Bank accounts (checking and savings)")
                                                                                                          )
                                                                                )
                                                                              )
                                                                            ),
                                                                            # h4("Bank accounts (checking and savings)"),
                                                                            tags$div(style="margin-top:-1.5em;", 
                                                                                     
                                                                                     h6("Do not include any retirement savings (such as IRA or 401k)")
                                                                            )),
                                                                     column(5,
                                                                            numericInput("checking_account", value=0, label = NULL, min=0))
                                                                   ),
                                                                   
                                                                   #---------------------
                                                                   # QUESTION  <--- i dont think we need this after all. 
                                                                   # br(),
                                                                   # fluidRow(
                                                                   #   column(5, offset = 2,
                                                                   #          h4("Do you have any retirement savings?"),
                                                                   #          h6("For example, IRA or 401K")),
                                                                   #   column(5,
                                                                   #          radioButtons("retirement_account", label = NULL,
                                                                   #                       list(#" " = "empty",
                                                                   #                         "No" = "No",
                                                                   #                         "Yes" = "Yes")
                                                                   #                       , selected = "No" ))
                                                                   # ),
                                                                   
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,h4("401K"))
                                                                     ),
                                                                     column(5,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'",
                                                                                             numericInput("four01_K", label = NULL, value=0,min=0))
                                                                     )
                                                                   ),
                                                                   
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,h4("Traditional IRA"))
                                                                     ),
                                                                     column(5,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,numericInput("traditional_ira", label = NULL, value=0,min=0))
                                                                     )
                                                                   ),
                                                                   
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,h4("Roth IRA"))
                                                                     ),
                                                                     column(5,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,numericInput("roth_ira", label = NULL, value=0,min=0))
                                                                     )
                                                                   ),
                                                                   
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,h4("Annuities"))
                                                                     ),
                                                                     column(5,
                                                                            conditionalPanel(condition="input.retirement_account=='Yes'"
                                                                                             ,numericInput("other_retirement", label = NULL, value=0,min=0))
                                                                     )
                                                                   ),
                                                                   
                                                                   br(),
                                                                   br(),
                                                                   
                                                                   
                                                                   fluidRow(
                                                                     column(3,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     extendShinyjs(text = jscodeback3, functions = c("back3")),
                                                                                     actionButton("back3"," Back << Budget Career Move", 
                                                                                                  style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                                  class="btn btn-primary btn-lg")
                                                                            )
                                                                     ),
                                                                     column(6, 
                                                                            conditionalPanel(condition = "input.checking_account < 0 | input.savings_account < 0
                                                          | input.individual_stocks < 0 | input.individual_bonds < 0
                                                          | input.mutual_funds < 0 | input.money_market < 0
                                                  | input.other_assets < 0 | input.other_savings < 0
                                                  | input.four01_K < 0  | input.traditional_ira < 0 | input.roth_ira < 0
                                                  | input.other_retirement < 0"
                                                                                             ,
                                                                                             
                                                                                             #br(),
                                                                                             h4(span(textOutput("error_assets"), style="color:red")),
                                                                                             #br(),
                                                                                             #br()
                                                                            )),
                                                                     column(3,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     extendShinyjs(text = jscode5, functions = c("next5")),
                                                                                     actionButton("next5","Next >> Public Assistance", 
                                                                                                  style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                                  class="btn btn-primary btn-lg")
                                                                            )
                                                                     )
                                                                   )
                                                                   
                                                                   
                                                          )
                                                          
                                                 ),
                                                 
                                                 
                                                 tabPanel("2 - Public Assistance",
                                                          tags$div(class = "container",
                                                                   
                                                                   br(),      
                                                                   br(),
                                                                   
                                                                   fluidRow(column(1),column(10,   includeHTML("www/publicassistance.html")), column(1))
                                                                   ,br()
                                                                   ,fluidRow(column(1),column(10,   includeHTML("www/checkboxes.html")),column(1))
                                                                   ,br()
                                                                   
                                                                   ,br()
                                                                   #source: https://www.healthcare.gov/medicaid-chip-program-names/ & kaiser for CHIP
                                                                   ,checkboxInput("medicaid_adults", strong("Medicaid for Adults"), FALSE)
                                                                   
                                                                   , conditionalPanel(condition = "input.state=='AZ'"
                                                                                      ,h6("Arizona Health Care Cost Containment System (AHCCCS)")) 
                                                                   , conditionalPanel(condition = "input.state=='AK'"
                                                                                      ,h6("DenaliCare")) 
                                                                   
                                                                   , conditionalPanel(condition = "input.state=='CA'"
                                                                                      ,h6("Medi-Cal")) 
                                                                   , conditionalPanel(condition = "input.state=='CO'"
                                                                                      ,h6("Health First Colorado")) 
                                                                   , conditionalPanel(condition = "input.state=='CT'"
                                                                                      ,h6("HuskyHealth")) 
                                                                   , conditionalPanel(condition = "input.state=='DE'"
                                                                                      ,h6("Delaware Medical Assistance Program")) 
                                                                   , conditionalPanel(condition = "input.state=='FL'"
                                                                                      ,h6("Statewide Medicaid Managed Care Program")) 
                                                                   , conditionalPanel(condition = "input.state=='GA'"
                                                                                      ,h6("Georgia Medical Assistance")) 
                                                                   , conditionalPanel(condition = "input.state=='HI'"
                                                                                      ,h6("MedQuest")) 
                                                                   , conditionalPanel(condition = "input.state=='IL'"
                                                                                      ,h6("Medical Assistance Program")) 
                                                                   , conditionalPanel(condition = "input.state=='IN'"
                                                                                      ,h6("Hoosier Healthwise Hoosier Care Connect M.E.D. Works Health Indiana Plan (HIP) Traditional Medicaid")) 
                                                                   , conditionalPanel(condition = "input.state=='IA'"
                                                                                      ,h6("IA Health Link")) 
                                                                   , conditionalPanel(condition = "input.state=='KS'"
                                                                                      ,h6("KanCare Medical Assistance Program")) 
                                                                   , conditionalPanel(condition = "input.state=='LA'"
                                                                                      ,h6("Bayou Health HealthyLouisiana")) 
                                                                   , conditionalPanel(condition = "input.state=='ME'"
                                                                                      ,h6("MaineCare")) 
                                                                   , conditionalPanel(condition = "input.state=='MD'"
                                                                                      ,h6("Medical Assistance")) 
                                                                   , conditionalPanel(condition = "input.state=='MA'"
                                                                                      ,h6("MassHealth")) 
                                                                   , conditionalPanel(condition = "input.state=='MI'"
                                                                                      ,h6("Medical Assistance")) 
                                                                   , conditionalPanel(condition = "input.state=='MN'"
                                                                                      ,h6("Medical Assistance (MA) / MinnesotaCare")) 
                                                                   , conditionalPanel(condition = "input.state=='MS'"
                                                                                      ,h6("Mississippi Coordinated Access Network (MississippiCAN)")) 
                                                                   , conditionalPanel(condition = "input.state=='MO'"
                                                                                      ,h6("MO HealthNet")) 
                                                                   , conditionalPanel(condition = "input.state=='NE'"
                                                                                      ,h6("ACCESSNebraska")) 
                                                                   , conditionalPanel(condition = "input.state=='NJ'"
                                                                                      ,h6("New Jersey FamilyCare")) 
                                                                   , conditionalPanel(condition = "input.state=='NM'"
                                                                                      ,h6("Centennial Care")) 
                                                                   , conditionalPanel(condition = "input.state=='NY'"
                                                                                      ,h6("Medicaid Managed Care")) 
                                                                   , conditionalPanel(condition = "input.state=='NC'"
                                                                                      ,h6("Division of Medical Assistance (DMA)")) 
                                                                   , conditionalPanel(condition = "input.state=='ND'"
                                                                                      ,h6("North Dakota Medicaid Expansion Program")) 
                                                                   , conditionalPanel(condition = "input.state=='OK'"
                                                                                      ,h6("SoonerCare")) 
                                                                   , conditionalPanel(condition = "input.state=='OR'"
                                                                                      ,h6("Oregon Health Plan")) 
                                                                   , conditionalPanel(condition = "input.state=='PA'"
                                                                                      ,h6("Medical Assistance (MA)")) 
                                                                   , conditionalPanel(condition = "input.state=='RI'"
                                                                                      ,h6("RI Medical Assistance Program")) 
                                                                   , conditionalPanel(condition = "input.state=='SC'"
                                                                                      ,h6("Healthy Connections")) 
                                                                   , conditionalPanel(condition = "input.state=='TN'"
                                                                                      ,h6("TennCare")) 
                                                                   , conditionalPanel(condition = "input.state=='VT'"
                                                                                      ,h6("Green Mountain Care")) 
                                                                   , conditionalPanel(condition = "input.state=='WA'"
                                                                                      ,h6("Apple Health")) 
                                                                   , conditionalPanel(condition = "input.state=='DC'"
                                                                                      ,h6("Healthy Families")) 
                                                                   , conditionalPanel(condition = "input.state=='WI'"
                                                                                      ,h6("ForwardHealth / BadgerCare")) 
                                                                   , conditionalPanel(condition = "input.state=='WY'"
                                                                                      ,h6('Healthy Families')) 
                                                                   
                                                                   # UNCOMMENT WHEN DISABILITY IS ADDED
                                                                   ,fluidRow(
                                                                     column(11, offset=1, conditionalPanel(condition = "input.fam_disab=='Yes' & input.medicaid_adults==true"
                                                                                                          , checkboxInput("prev_ssi", "Has anyone in the home ever received SSI?", FALSE)
                                                                     )))
                                                                   
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,fluidRow(
                                                                     column(12,offset=0, checkboxInput("medicaid_child", strong("Medicaid for Children/Children's Health Insurance (CHIP)"), FALSE)
                                                                   , conditionalPanel(condition = "input.state=='AL'", h6("ALL Kids"))
                                                                   , conditionalPanel(condition = "input.state=='AK'", h6("Denali Kidcare"))
                                                                   , conditionalPanel(condition = "input.state=='AZ'", h6("KidsCare"))
                                                                   , conditionalPanel(condition = "input.state=='AR'", h6("ARKids First"))
                                                                   , conditionalPanel(condition = "input.state=='CA'", h6("Healthy Families"))
                                                                   , conditionalPanel(condition = "input.state=='CO'", h6("Child Health Plan Plus (CHP+)"))
                                                                   , conditionalPanel(condition = "input.state=='CT'", h6("HUSKY (Part B)"))
                                                                   , conditionalPanel(condition = "input.state=='DE'", h6("Healthly Children"))
                                                                   , conditionalPanel(condition = "input.state=='DC'", h6("DC Healthy Families"))
                                                                   , conditionalPanel(condition = "input.state=='FL'", h6("Florida KidCare"))
                                                                   , conditionalPanel(condition = "input.state=='GA'", h6("PeachCare for Kids"))
                                                                   , conditionalPanel(condition = "input.state=='HI'", h6("QUEST"))
                                                                   , conditionalPanel(condition = "input.state=='ID'", h6("Idaho Health Plan"))
                                                                   , conditionalPanel(condition = "input.state=='IL'", h6("ALL Kids"))
                                                                   , conditionalPanel(condition = "input.state=='IN'", h6("Hoosier Healthwise"))
                                                                   , conditionalPanel(condition = "input.state=='IA'", h6("Healthy and Well Kids in Iowa (Hawk-I)"))
                                                                   , conditionalPanel(condition = "input.state=='KS'", h6("Healthwave"))
                                                                   , conditionalPanel(condition = "input.state=='KY'", h6("KCHIP (Kentucky Children's Health Insurance Program)"))
                                                                   , conditionalPanel(condition = "input.state=='LA'", h6("LaCHIP"))
                                                                   , conditionalPanel(condition = "input.state=='ME'", h6("MaineCare"))
                                                                   , conditionalPanel(condition = "input.state=='MD'", h6("Maryland Children's Health Program (MCHP)"))
                                                                   , conditionalPanel(condition = "input.state=='MA'", h6("MassHealth"))
                                                                   , conditionalPanel(condition = "input.state=='MI'", h6("MIChild"))
                                                                   , conditionalPanel(condition = "input.state=='MN'", h6("MinnesotaCare"))
                                                                   , conditionalPanel(condition = "input.state=='MO'", h6("MO HealthNet for Kids"))
                                                                   , conditionalPanel(condition = "input.state=='MT'", h6("Healthy Montana Kids"))
                                                                   , conditionalPanel(condition = "input.state=='NE'", h6("Kids Connection"))
                                                                   , conditionalPanel(condition = "input.state=='NV'", h6("Nevada Check Up"))
                                                                   , conditionalPanel(condition = "input.state=='NH'", h6("Healthy Kids"))
                                                                   , conditionalPanel(condition = "input.state=='NJ'", h6("NJ Family Care"))
                                                                   , conditionalPanel(condition = "input.state=='NM'", h6("New Mexikids/MexiTeens"))
                                                                   , conditionalPanel(condition = "input.state=='NY'", h6("Child Health Plus (CHPlus)"))
                                                                   , conditionalPanel(condition = "input.state=='NC'", h6("NC Health Choice for Children (NCHC)"))
                                                                   , conditionalPanel(condition = "input.state=='ND'", h6("Healthy Steps"))
                                                                   , conditionalPanel(condition = "input.state=='OH'", h6("Healthy Start"))
                                                                   , conditionalPanel(condition = "input.state=='OK'", h6("SoonerCare"))
                                                                   , conditionalPanel(condition = "input.state=='OR'", h6("Healthy Kids"))
                                                                   , conditionalPanel(condition = "input.state=='RI'", h6("Rite Care"))
                                                                   , conditionalPanel(condition = "input.state=='SC'", h6("Healthy Connections Kids"))
                                                                   , conditionalPanel(condition = "input.state=='TN'", h6("CoverKids"))
                                                                   , conditionalPanel(condition = "input.state=='VT'", h6("Dr. Dynasaur"))
                                                                   , conditionalPanel(condition = "input.state=='VA'", h6("Family Access to Medical Insurance Security (FAMIS)"))
                                                                   , conditionalPanel(condition = "input.state=='WA'", h6("Apple Health for Kids"))
                                                                   , conditionalPanel(condition = "input.state=='WI'", h6("BadgerCare Plus"))
                                                                   , conditionalPanel(condition = "input.state=='WY'", h6("KidCare CHIP"))
                                                                    ))
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("aca", strong("Health Insurance Marketplace Subsidies"), FALSE)
                                                                   
                                                                   ,br()
                                                                   
                                                                   # If we HAVE TANF for a selected state
                                                                   
                                                            
                                                                                     , checkboxInput("tanf", strong("TANF"), FALSE)
                                                                                     , h6("Temporary Assistance for Needy Families")
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("snap", strong("SNAP"), FALSE)
                                                                   ,h6("Supplemental Nutrition Assistance Program")
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("wic", strong("WIC"), FALSE)
                                                                   ,h6("Special Supplemental Nutrition Program for Women, Infants, and Children")
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("schoolMeals", strong("Free or Reduced Price School Meals"), FALSE)
                                                                   ,h6("School Breakfast and National School Lunch Programs")
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("eitc", strong("EITC"), FALSE)
                                                                   ,h6("Earned Income Tax Credit")
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("ctc", strong("CTC"), FALSE)
                                                                   ,h6("Child Tax Credit")
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,checkboxInput("cdctc", strong("CDCTC"), FALSE)
                                                                   ,h6("Child and Dependent Care Tax Credit")
                                                                   
                                                                   ,br()
                                                                   
                                                                   # If we HAVE CCDF for a selected state
                                                                   
                                                                   ,fluidRow(
                                                                     column(11, offset = 0, checkboxInput("ccdf", strong("Subsidized Childcare"), FALSE) 
                                                                            , conditionalPanel(condition = "input.state=='AL'", h6("Alabama Child Care Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='AK'", h6("PASS Program"))
                                                                            , conditionalPanel(condition = "input.state=='AZ'", h6("Child Care Assistance Program"))
                                                                            # , conditionalPanel(condition = "input.state=='AR'", h6("ARKids First"))
                                                                            , conditionalPanel(condition = "input.state=='CA'", h6("California Alternative Payment Programs"))
                                                                            , conditionalPanel(condition = "input.state=='CO'", h6("Colorado Child Care Assistance Program (CCCAP)"))
                                                                            , conditionalPanel(condition = "input.state=='CT'", h6("Care 4 Kids"))
                                                                            , conditionalPanel(condition = "input.state=='DE'", h6("Purchase of Care"))
                                                                            # , conditionalPanel(condition = "input.state=='DC'", h6("DC Healthy Families"))
                                                                            , conditionalPanel(condition = "input.state=='FL'", h6("School Readiness Program"))
                                                                            , conditionalPanel(condition = "input.state=='GA'", h6("Childcare and Parent Services (CAPS)"))
                                                                            , conditionalPanel(condition = "input.state=='HI'", h6("Child Care Connection Hawaii"))
                                                                            , conditionalPanel(condition = "input.state=='ID'", h6("Idaho Child Care Program (ICCP)"))
                                                                            , conditionalPanel(condition = "input.state=='IL'", h6("Child Care Assistance Program (CCAP)"))
                                                                            , conditionalPanel(condition = "input.state=='IN'", h6("The CCDF Voucher Program"))
                                                                            , conditionalPanel(condition = "input.state=='IA'", h6("Child Care Assistance (CCA)"))
                                                                            , conditionalPanel(condition = "input.state=='KS'", h6("Child Care Subsidy"))
                                                                            , conditionalPanel(condition = "input.state=='KY'", h6("Child Care Assistance Program for Families"))
                                                                            , conditionalPanel(condition = "input.state=='LA'", h6("Child Care Assistance Program (CCAP)"))
                                                                            , conditionalPanel(condition = "input.state=='ME'", h6("Child Care Subsidy Program (CCSP)"))
                                                                            , conditionalPanel(condition = "input.state=='MD'", h6("Child Care Scholarship Program"))
                                                                            , conditionalPanel(condition = "input.state=='MA'", h6("Early Education and Care Financial Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='MI'", h6("Child Development and Care (CDC)"))
                                                                            , conditionalPanel(condition = "input.state=='MN'", h6("Basic Sliding Fee Program"))
                                                                            , conditionalPanel(condition = "input.state=='MS'", h6("Child Care Payment Program"))
                                                                            
                                                                            , conditionalPanel(condition = "input.state=='MO'", h6("Child Care Subsidy Program"))
                                                                            , conditionalPanel(condition = "input.state=='MT'", h6("Best Beginnings Child Care Scholarship Program"))
                                                                            , conditionalPanel(condition = "input.state=='NE'", h6("Child Care Subsidy Program"))
                                                                            , conditionalPanel(condition = "input.state=='NV'", h6("Child Care Subsidy Program"))
                                                                            , conditionalPanel(condition = "input.state=='NH'", h6("NH Child Care Scholarship"))
                                                                            , conditionalPanel(condition = "input.state=='NJ'", h6("Child Care Assistance Program"))
                                                                            , conditionalPanel(condition = "input.state=='NM'", h6("Child Care Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='NY'", h6("Child Care Subsidy Program"))
                                                                            , conditionalPanel(condition = "input.state=='NC'", h6("Subsidized Child Care Assistance (SCCA) Program"))
                                                                            , conditionalPanel(condition = "input.state=='ND'", h6("Child Care Assistance Program"))
                                                                            , conditionalPanel(condition = "input.state=='OH'", h6("Child Care Voucher Program"))
                                                                            , conditionalPanel(condition = "input.state=='OK'", h6("Child Care Subsidy"))
                                                                            , conditionalPanel(condition = "input.state=='OR'", h6("Employment-Related Day Care (ERDC)"))
                                                                            , conditionalPanel(condition = "input.state=='PA'", h6("Child Care Works Subsidized Child Care"))
                                                                            
                                                                            , conditionalPanel(condition = "input.state=='RI'", h6("Child Care Assistance Program"))
                                                                            , conditionalPanel(condition = "input.state=='SC'", h6("SC Voucher Program"))
                                                                            , conditionalPanel(condition = "input.state=='SD'", h6("Child Care Assistance Program"))
                                                                            
                                                                            , conditionalPanel(condition = "input.state=='TN'", h6("Child Care Payment Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='TX'", h6("Workforce Solutions Child Care"))
                                                                            , conditionalPanel(condition = "input.state=='UT'", h6("Child Care Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='VT'", h6("Child Care Financial Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='VA'", h6("Child Care Assistance"))
                                                                            , conditionalPanel(condition = "input.state=='WA'", h6("Working Connections Child Care (WCCC)"))
                                                                            , conditionalPanel(condition = "input.state=='WV'", h6("Child Care Services"))
                                                                            , conditionalPanel(condition = "input.state=='WI'", h6("Wisconsin Shares Child Care"))
                                                                            , conditionalPanel(condition = "input.state=='WY'", h6("Child Care Subsidy Program"))
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                            
                                                                     )
                                                                     
                                                                     ,column(11,offset=0, conditionalPanel(condition = "input.ccdf==true & input.state=='FL' & (input.county_main=='Martin County' | input.county_main=='St. Lucie County')"
                                                                                                          , checkboxInput("fates", strong("This program includes FATES"), FALSE)))
                                                                     
                                                                   )
                                                                   
                                                                   
                                                                   # #initial vs cont.
                                                                   ,fluidRow(
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ccdf==true"
                                                                                                           , checkboxInput("ccdf_cont", "My child(ren) are NOT currently enrolled*", FALSE)
                                                                                                           , h6("*If this box is checked, we estimate enroll eligibility in this program.")))
                                                                   )
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,fluidRow(
                                                                     column(11, offset = 0 ,checkboxInput("prek", strong("State-Funded Pre-Kindergarten"), FALSE) )
                                                                     
                                                                   ) 
                                                                   
                                                                   ,br() 
                                                                   ,fluidRow(
                                                                     column(11, offset = 0 ,checkboxInput("head_start", strong("Head Start or Early Head Start"), FALSE) )
                                                                   ) 
                                                                   
                                                                   # #initial vs cont.
                                                                   ,fluidRow(
                                                                     column(11, offset=1, conditionalPanel(condition = "input.head_start==true"
                                                                                                          , checkboxInput("headstart_cont", "My child(ren) are NOT currently enrolled in Head Start*", FALSE)
                                                                                                          , checkboxInput("earlyheadstart_cont", "My child(ren) are NOT currently enrolled in Early Head Start*", FALSE)
                                                                                                          , h6("*If this box is checked, we estimate enroll eligibility in this program.")))
                                                                   )
                                                                   ,br()
                                                                   
                                                                   ,fluidRow(
                                                                     column(11,offset=0, checkboxInput("section8", strong("Section 8 Housing Voucher"), FALSE))
                                                                     
                                                                     # #initial vs cont.
                                                                     # ,column(6, offset=0, conditionalPanel(condition = "input.section8==true"
                                                                     #                   , checkboxInput("section8_cont", strong("Currently enrolled?"), FALSE)))
                                                                   )
                                                                   
                                                                   ,br()
                                                                   
                                                                   ,conditionalPanel(condition = "input.state=='DC'"
                                                                                     ,checkboxInput("frsp", strong("Family Re-Housing Stabilization Program (FRSP)"), FALSE)
                                                                                     ,br()
                                                                   )
                                                                   
                                                                   
                                                                   ,conditionalPanel(condition = "input.state=='DC'"
                                                                                     ,checkboxInput("careerMap", strong("I am a Career MAP Participant"), FALSE)
                                                                                     
                                                                                     ,br()
                                                                   )
                                                                   
                                                                   
                                                                   ,conditionalPanel(condition = "input.state=='DC' & ((input.frsp == true & input.section8 == true)
                                                                                    | (input.careerMap == true & input.section8 == true) | (input.frsp == true & input.careerMap == true))",
                                                                                     h4(span(textOutput("error_frsp"), style="color:red"))
                                                                                     ,br()
                                                                   )
                                                                   
                                                                   #f  ,br()
                                                                   
                                                                   #special programs for some areas
                                                                   
                                                                   , conditionalPanel(condition = "input.state=='CT' & input.section8 != true"
                                                                                      , checkboxInput("rap", strong("CT Rental Assistance Program*"), FALSE))
                                                                   , conditionalPanel(condition = "input.state=='CT' & input.section8 != true"
                                                                                      ,h6("*Only check this box if enrolled in this program. Eligibility rules for new participants are not included yet. Do not select if you have already selected Section 8 Housing Voucher.")) 
                                                                   
                                                                   
                                                                   # UNCOMMENT WHEN DISABILITY IS ADDED
                                                                   ,fluidRow(
                                                                     column(11, offset = 0 ,
                                                                            conditionalPanel(condition="input.fam_disab=='Yes' & input.state != 'AL'", checkboxInput("ssdi", strong("SSDI"), FALSE),
                                                                                             h6("Social Security Disability Insurance")
                                                                            ))
                                                                   )
                                                                    
                                                                   ,fluidRow( # need conditions for when partnered == Yes & No
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true"
                                                                                                           , numericInput("ssdiPIA1", label="Amount receiving ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     ),
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='Yes' & input.age_partner>=18"
                                                                                                           , numericInput("ssdiPIA2_partnered", label="Amount spouse or partner receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     ),
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='No' & input.age_family_1>18"
                                                                                                           , numericInput("ssdiPIA2", label="Amount second adult receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,     
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='Yes' & input.age_family_1>18"
                                                                                                           , numericInput("ssdiPIA3_partnered", label="Amount third adult receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='No' & input.age_family_2>18"
                                                                                                           , numericInput("ssdiPIA3", label="Amount third another adult receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='Yes' & input.age_family_2>18"
                                                                                                           , numericInput("ssdiPIA4_partnered", label="Amount third fourth receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='No' & input.age_family_3>18"
                                                                                                           , numericInput("ssdiPIA4", label="Amount third fourth adult receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='Yes' & input.age_family_3>18"
                                                                                                           , numericInput("ssdiPIA5_partnered", label="Amount fifth fourth receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='No' & input.age_family_4>18"
                                                                                                           , numericInput("ssdiPIA5", label="Amount fifth fourth adult receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='Yes' & input.age_family_4>18"
                                                                                                           , numericInput("ssdiPIA6_partnered", label="Amount sixth fourth receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                     ,
                                                                     column(11, offset=1, conditionalPanel(condition = "input.ssdi==true & input.partnered=='No' & input.age_family_5>18"
                                                                                                           , numericInput("ssdiPIA6", label="Amount sixth fourth adult receives ($) per month in SSDI payments",value=0, min=0, max=10000, step=100)
                                                                                                           ,h6("Do not include auxiliary benefits that are for children, spouses, or other family members"))
                                                                     )
                                                                   )
                                                                   
                                                                   ,br()
                                                                   ,fluidRow(
                                                                     column(4, offset = 0 ,
                                                                            conditionalPanel(condition="input.fam_disab=='Yes' & input.state!='AL'", checkboxInput("ssi", strong("SSI"), FALSE),
                                                                                             h6("Supplemental Security Income")
                                                                                             
                                                                                             ,conditionalPanel(condition = "input.fam_disab=='Yes'",
                                                                                                               
                                                                                                               h6("Note: Many types of income are assumed to be $0 for the purposes of calculating SSI. See FAQ tab for details.")
                                                                                                               
                                                                                             ),
                                                                            ))
                                                                   )
                                                                   
                                                                   ,fluidRow(
                                                                     column(11, offset = 1, conditionalPanel(condition = "input.ssi==true"
                                                                                                             , numericInput("disab.work.exp", label="Amount spent ($) per month on specialized equipment or services that enable household member(s) with disabilities to work",value=0, min=0, max=10000))
                                                                     )
                                                                   )
                                                                   
                                                                   #,checkboxInput("tanf", strong("Cash Assistance (TANF)"), TRUE)
                                                                   ,br()
                                                                   #  ,h5("*If you require the use of a keyboard, click the spacebar to check each box.")
                                                                   ,br()
                                                                   ,br()
                                                                   
                                                                   ,br()
                                                                   #,checkboxInput("liheap", strong("Energy Assistance (LIHEAP)"), TRUE)
                                                                   
                                                                   
                                                                   
                                                                   ,fluidRow(
                                                                     column(4,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     extendShinyjs(text = jscodeback4, functions = c("back4")),
                                                                                     actionButton("back4"," Back << Income and Assets", 
                                                                                                  style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                                  class="btn btn-primary btn-lg")
                                                                            )
                                                                     ),
                                                                     column(4),
                                                                     column(4,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     extendShinyjs(text = jscode6, functions = c("next6")),
                                                                                     actionButton("next6","Next >> Expenses", 
                                                                                                  style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                                  class="btn btn-primary btn-lg")
                                                                            )
                                                                     )
                                                                   )
                                                                   
                                                          )
                                                          
                                                 ),
                                                 
                                                 ######################################
                                                 # Expenses
                                                 ######################################
                                                 tabPanel("3 - Expenses",
                                                          
                                                          tags$div(class = "container",
                                                                   
                                                                   br(),      
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            tags$form(
                                                                              class="form-horizontal",
                                                                              
                                                                              tags$div(
                                                                                class="form-group",  div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                         
                                                                                                         h4(tags$label(`for` = "horizon", 
                                                                                                                       br(), "How many years to plan for?")
                                                                                                         )
                                                                                )
                                                                              )
                                                                            ),
                                                                            #   h4("How many years do you want to plan for?"),
                                                                            tags$div(style="margin-top:-1.5em;", 
                                                                                     
                                                                                     h6("We recommend 3-5 years.")
                                                                            )),
                                                                     column(5, 
                                                                            numericInput("horizon", value = 5, label = NULL,min=1,max = 10))
                                                                   ),
                                                                   
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     column(5, offset = 2,
                                                                            tags$form(
                                                                              class="form-horizontal",
                                                                              
                                                                              tags$div(
                                                                                class="form-group",   div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                          
                                                                                                          h4(tags$label(`for` = "expenses_type", 
                                                                                                                        br(), "What expenses to use?")
                                                                                                          )
                                                                                )
                                                                              )
                                                                            )
                                                                     ),
                                                                     #h4("What expenses do you want to use?")),
                                                                     column(5,
                                                                            selectInput("expenses_type", label = NULL, # Note: collect state abbreviation
                                                                                        list("----------------- Select -----------------" = "empty",
                                                                                             "Minimum Household Budget" = "expenses.default",
                                                                                             "Client's actual expenses (recommended)" = "expenses.actual"
                                                                                        ), selected = "empty"))
                                                                   ),
                                                                   
                                                                   br(),
                                                                   
                                                                   conditionalPanel(condition="input.expenses_type=='expenses.default'",
                                                                                    tags$div(align = "center",
                                                                                             fluidRow(column(1),
                                                                                                      column(10,includeHTML("www/expenses1.html"))
                                                                                                      ,column(1))
                                                                                             #                         , h4("Your budget in each year will be calculated using typical", strong("monthly"), "expenses shown below.")
                                                                                             ,br()
                                                                                             ,br()
                                                                                             , withSpinner(tableOutput('table.DefaultExpenses'),type=2)
                                                                                            
                                                                                    )              
                                                                   ),
                                                                   tags$form(
                                                                     class="form-horizontal",
                                                                     
                                                                     tags$div(
                                                                       class="form-group",   div(style="margin-left:3.0em;", 
                                                                   conditionalPanel(condition="input.expenses_type=='expenses.default'",
                                                                   fluidRow(
                                                                     column(1),
                                                                     
                                                                     column(2, h5(strong("Health Insurance Premium:"))
                                                                     ),
                                                                     column(8, h5(strong("Health insurance premium is computed for you and varies by the type of health insurance you receive."))
                                                                     ),
                                                                     column(1)
                                                                   )
                                                                   )
                                                                   )
                                                                   )
                                                                   ),
                                                                   
                                                                    
                                                                   conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                    #                   tags$div(align = "center"
                                                                                    #                             , h4("For each year enter your typical", strong("monthly"), "expenses.")
                                                                                    #              )          
                                                                                    fluidRow(column(1),
                                                                                                column(10,includeHTML("www/expenses2.html"))
                                                                                             ,column(1))
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==1",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Total Rent BEFORE housing subsidy discount."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.1", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                       fluidRow(
                                                                                                         column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                         ),
                                                                                                         column(10, h4("Health insurance premium is computed for you and varies by the type of health insurance you receive.")
                                                                                                         )
                                                                                                       ),
                                                                                                     
                                                                                                
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              fluidRow(column(1),
                                                                                                                       column(10,includeHTML("www/expenses3.html"))
                                                                                                                       ,column(1))
                                                                                                              #                h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              fluidRow(column(1),
                                                                                                                       column(10,includeHTML("www/expenses4.html"))
                                                                                                                       ,column(1))
                                                                                                              
                                                                                                              #             h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     fluidRow(column(1),
                                                                                                              column(10,includeHTML("www/expenses5.html"))
                                                                                                              ,column(1)),
                                                                                                     
                                                                                                     #                                                 
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, 
                                                                                                              h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, 
                                                                                                              h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.1", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                    ),
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==2",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.2", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.2", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     
                                                                                                  
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                          fluidRow(
                                                                                                             column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                             ),
                                                                                                             column(10, h4("Health insurance premium is computed for you and varies by the type of health insurance you receive.")
                                                                                                             )
                                                                                                           ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc")
                                                                                                     ),
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.2", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.2", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                    ),
                                                                                    
                                                                   ),
                                                                   
                                                                   
                                                                   conditionalPanel(condition="input.horizon==3",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.3", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.3", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.3", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                       
                                                                                                     ),
                                                                                                     
                                                                                                            fluidRow(
                                                                                                              column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                             ),
                                                                                                             column(10, h4("Health insurance premium is computed for you and varies by the type of health insurance you receive.")
                                                                                                             )
                                                                                                           ),
                                                                                                     
                                                                                                    
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.3", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.3", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    ),
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   
                                                                   
                                                                   conditionalPanel(condition="input.horizon==4",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.4", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.4", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.4", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.4", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                       
                                                                                                     ),
                                                                                                         fluidRow(
                                                                                                           column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                           ),
                                                                                                          column(10, h4("Health insurance premium is computed for you and varies by the type of health insurance you receive.")
                                                                                                          )
                                                                                                        ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                 
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.4", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.4", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    ),
                                                                                    
                                                                   ),
                                                                   
                                                                   
                                                                   conditionalPanel(condition="input.horizon==5",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.5", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.5", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.5", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.5", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year5.5", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                    
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                       
                                                                                                     ), 
                                                                                                         fluidRow(
                                                                                                          column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                          ),
                                                                                                          column(10, h4("Health insurance premium is computed for you and varies by the type of health insurance you receive.")
                                                                                                         )
                                                                                                       ),
                                                                                                     
                                                                                                     
                                                                                                 
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual' ",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")),
                                                                                                       column(2,numericInput("exp.misc.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.5", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year5.5", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    )
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==6",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.6", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6"),
                                                                                                              numericInput("exp.rentormortgage.year6.6", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                              
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.6", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year6.6", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 1")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 2")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 3")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 4")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 5")
                                                                                                                        )
                                                                                                                      ),
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.6", value=0,label = NULL, min=0)
                                                                                                                               
                                                                                                                               ,h5("Year 6")
                                                                                                                               ,numericInput("exp.childcare.year6.6", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.6", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.6", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.6", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year5.6", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.6", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year6.6", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                       fluidRow(
                                                                                                         column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                         ),
                                                                                                         column(10, 
                                                                                                               h4("Health insurance premium is computed for you and varies by the type of health insurance you receive."),
                                                                                                                br()
                                                                                                        )
                                                                                                      ),
                                                                                                     
                                                                                                     
                                                                                                  
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.6", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.food.year6.6", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.6", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.transportation.year6.6", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.6", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.tech.year6.6", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual' ",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")),
                                                                                                       column(2,numericInput("exp.misc.year1.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year5.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year6.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year5.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year6.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year5.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year6.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.6", value=0,label = NULL, min=0), 
                                                                                                              numericInput("assistance.tax.year6.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.6", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year5.6", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                       # , column(2,numericInput("assistance.tax.year6.6", value=0,label = NULL, min=0)
                                                                                                       #  )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    )
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==7",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.7", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6"),
                                                                                                              numericInput("exp.rentormortgage.year6.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                              
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.7", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7"),
                                                                                                              numericInput("exp.rentormortgage.year7.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.7", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year6.7", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.7", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year7.7", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 1")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 2")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 3")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 4")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 5")
                                                                                                                        )
                                                                                                                      ),
                                                                                                                      
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.7", value=0,label = NULL, min=0)
                                                                                                                               
                                                                                                                               ,h5("Year 6")
                                                                                                                               ,numericInput("exp.childcare.year6.7", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.7", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 7")
                                                                                                                               ,numericInput("exp.childcare.year7.7", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.7", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.7", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year5.7", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Healthcare Insurance, Out-of-Pocket Costs")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.7", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year6.7", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.7", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year7.7", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                       fluidRow(
                                                                                                         column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                         ),
                                                                                                         column(10, 
                                                                                                                h4("Health insurance premium is computed for you and varies by the type of health insurance you receive."),
                                                                                                                br()
                                                                                                         )
                                                                                                       ),
                                                                                                     
                                                                                                   
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.7", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.food.year6.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.7", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.food.year7.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.7", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.transportation.year6.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.7", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.transportation.year7.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.7", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.tech.year6.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.7", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.transportation.year7.7", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual' ",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")),
                                                                                                       column(2,numericInput("exp.misc.year1.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year5.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year6.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year7.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year5.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year6.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year7.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year5.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year6.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year7.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.7", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year6.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.7", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year7.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.7", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year5.7", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                       
                                                                                                       
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    )
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==8",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.8", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6"),
                                                                                                              numericInput("exp.rentormortgage.year6.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                              
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7"),
                                                                                                              numericInput("exp.rentormortgage.year7.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8"),
                                                                                                              numericInput("exp.rentormortgage.year8.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.8", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year6.8", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.8", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year7.8", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.8", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 8")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year8.8", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 1")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 2")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 3")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 4")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 5")
                                                                                                                        )
                                                                                                                      ),
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.8", value=0,label = NULL, min=0)
                                                                                                                               
                                                                                                                               ,h5("Year 6")
                                                                                                                               ,numericInput("exp.childcare.year6.8", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.8", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 7")
                                                                                                                               ,numericInput("exp.childcare.year7.8", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.8", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 8")
                                                                                                                               ,numericInput("exp.childcare.year8.8", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.8", value=0,label = NULL, min=0)
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year5.8", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.8", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year6.8", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.8", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year7.8", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.8", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 8")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year8.8", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                        fluidRow(
                                                                                                           column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                           ),
                                                                                                           column(10, 
                                                                                                                  h4("Health insurance premium is computed for you and varies by the type of health insurance you receive."),
                                                                                                                  br()
                                                                                                           )
                                                                                                         ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                 
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.8", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.food.year6.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.food.year7.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.food.year8.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.8", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.transportation.year6.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.transportation.year7.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.transportation.year8.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.8", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.tech.year6.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.tech.year7.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.8", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.tech.year8.8", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual' ",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")),
                                                                                                       column(2,numericInput("exp.misc.year1.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year5.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year6.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year7.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year8.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year5.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year6.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year7.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year8.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year5.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year6.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year7.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year8.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.8", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year6.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.8", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year7.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.8", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year8.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.8", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year5.8", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    )
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==9",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.9", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6"),
                                                                                                              numericInput("exp.rentormortgage.year6.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                              
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7"),
                                                                                                              numericInput("exp.rentormortgage.year7.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8"),
                                                                                                              numericInput("exp.rentormortgage.year8.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9"),
                                                                                                              numericInput("exp.rentormortgage.year9.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.9", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year6.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.9", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year7.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.9", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 8")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year8.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.9", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 9")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year9.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 1")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 2")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 3")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 4")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 5")
                                                                                                                        )
                                                                                                                      ),
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.9", value=0,label = NULL, min=0)
                                                                                                                               
                                                                                                                               ,h5("Year 6")
                                                                                                                               ,numericInput("exp.childcare.year6.9", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.9", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 7")
                                                                                                                               ,numericInput("exp.childcare.year7.9", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.9", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 8")
                                                                                                                               ,numericInput("exp.childcare.year8.9", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.9", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 9")
                                                                                                                               ,numericInput("exp.childcare.year9.9", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year5.9", value=0,label = NULL, min=0)
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.9", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year6.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.9", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year7.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.9", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 8")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year8.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.9", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 9")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year9.9", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                            fluidRow(
                                                                                                              column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                               ),
                                                                                                               column(10, 
                                                                                                                      h4("Health insurance premium is computed for you and varies by the type of health insurance you receive."),
                                                                                                                      br()
                                                                                                              )
                                                                                                             ),
                                                                                                     
                                                                                                    
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.9", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.food.year6.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.food.year7.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.food.year8.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9")
                                                                                                              ,numericInput("exp.food.year9.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.9", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.transportation.year6.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.transportation.year7.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.transportation.year8.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9")
                                                                                                              ,numericInput("exp.transportation.year9.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.9", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.tech.year6.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.tech.year7.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.tech.year8.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.9", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9")
                                                                                                              ,numericInput("exp.tech.year9.9", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual' ",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")),
                                                                                                       column(2,numericInput("exp.misc.year1.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year5.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year6.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year7.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year8.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year9.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year5.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year6.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year7.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year8.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year9.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year5.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year6.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year7.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year8.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year9.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.9", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year6.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.9", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year7.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.9", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year8.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.9", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year9.9", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year5.9", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    )
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   conditionalPanel(condition="input.horizon==10",
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.actual'",
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Rent or Mortgage"),
                                                                                                              conditionalPanel(condition = "input.section8==true", h6("Input total rent including the value of the housing voucher."))
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year1.10", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6"),
                                                                                                              numericInput("exp.rentormortgage.year6.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                              
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year2.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7"),
                                                                                                              numericInput("exp.rentormortgage.year7.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year3.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8"),
                                                                                                              numericInput("exp.rentormortgage.year8.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year4.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9"),
                                                                                                              numericInput("exp.rentormortgage.year9.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.rentormortgage.year5.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 10"),
                                                                                                              numericInput("exp.rentormortgage.year10.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Utilities")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year1.10", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year6.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year2.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year7.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year3.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 8")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year8.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year4.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 9")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year9.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.utilities.year5.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 10")
                                                                                                              ,
                                                                                                              numericInput("exp.utilities.year10.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==false & input.head_start==false",
                                                                                                                      
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 1")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 2")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 3")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 4")
                                                                                                                        ),
                                                                                                                        column(2,h5("Year 5")
                                                                                                                        )
                                                                                                                      ),
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year1.10", value=0,label = NULL, min=0)
                                                                                                                               
                                                                                                                               ,h5("Year 6")
                                                                                                                               ,numericInput("exp.childcare.year6.10", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year2.10", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 7")
                                                                                                                               ,numericInput("exp.childcare.year7.10", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year3.10", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 8")
                                                                                                                               ,numericInput("exp.childcare.year8.10", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year4.10", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 9")
                                                                                                                               ,numericInput("exp.childcare.year9.10", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        ),
                                                                                                                        column(2,numericInput("exp.childcare.year5.10", value=0,label = NULL, min=0)
                                                                                                                               ,h5("Year 10")
                                                                                                                               ,numericInput("exp.childcare.year10.10", value=0,label = NULL, min=0)
                                                                                                                               ,br()
                                                                                                                        )
                                                                                                                      )),
                                                                                                     
                                                                                                     conditionalPanel(condition = "input.ccdf==true | input.head_start==true",
                                                                                                                      fluidRow(
                                                                                                                        column(2, offset = 0, h4("Child Care")
                                                                                                                        ),
                                                                                                                        column(10, h4("Child care costs are computed if 'Subsidized Childcare' or 'Head Start/Early Head Start' is selected.")
                                                                                                                        )
                                                                                                                      )),
                                                                                                     br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Health Care, Out-of-Pocket Costs*")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year1.10", value=0,label = NULL, min=0),
                                                                                                              
                                                                                                              h5("Year 6")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year6.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year2.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 7")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year7.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year3.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 8")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year8.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year4.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 9")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year9.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.oop.year5.10", value=0,label = NULL, min=0)
                                                                                                              ,
                                                                                                              
                                                                                                              h5("Year 10")
                                                                                                              ,
                                                                                                              numericInput("exp.oop.year10.10", value=0,label = NULL, min=0),
                                                                                                              br()
                                                                                                       )
                                                                                                     ),
                                                                                                         fluidRow(
                                                                                                           column(2, offset = 0, h4("Health Insurance Premium")
                                                                                                             ),
                                                                                                            column(10, 
                                                                                                                   h4("Health insurance premium is computed for you and varies by the type of health insurance you receive."),
                                                                                                                   br()
                                                                                                            )
                                                                                                         ),
                                                                                                     
                                                                                                     
                                                                                                   
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Food")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year1.10", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.food.year6.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year2.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.food.year7.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year3.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.food.year8.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year4.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9")
                                                                                                              ,numericInput("exp.food.year9.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.food.year5.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 10")
                                                                                                              ,numericInput("exp.food.year10.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Transportation")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year1.10", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.transportation.year6.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year2.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.transportation.year7.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year3.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.transportation.year8.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year4.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9")
                                                                                                              ,numericInput("exp.transportation.year9.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.transportation.year5.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 10")
                                                                                                              ,numericInput("exp.transportation.year10.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("")
                                                                                                       ),
                                                                                                       column(2,h5("Year 1")
                                                                                                       ),
                                                                                                       column(2,h5("Year 2")
                                                                                                       ),
                                                                                                       column(2,h5("Year 3")
                                                                                                       ),
                                                                                                       column(2,h5("Year 4")
                                                                                                       ),
                                                                                                       column(2,h5("Year 5")
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Technology")
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year1.10", value=0,label = NULL, min=0)
                                                                                                              
                                                                                                              ,h5("Year 6")
                                                                                                              ,numericInput("exp.tech.year6.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year2.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 7")
                                                                                                              ,numericInput("exp.tech.year7.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year3.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 8")
                                                                                                              ,numericInput("exp.tech.year8.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year4.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 9")
                                                                                                              ,numericInput("exp.tech.year9.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.tech.year5.10", value=0,label = NULL, min=0)
                                                                                                              ,h5("Year 10")
                                                                                                              ,numericInput("exp.tech.year10.10", value=0,label = NULL, min=0)
                                                                                                              ,br()
                                                                                                       )
                                                                                                     )),
                                                                                    
                                                                                    conditionalPanel(condition="input.expenses_type=='expenses.default' | input.expenses_type=='expenses.actual' ",
                                                                                                     
                                                                                                     hr(),
                                                                                                     hr(),
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Other Expenses", class = "title fit-h1"),
                                                                                                              h4("See FAQ for what expenses to include here"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Typical Monthly Expense")),
                                                                                                       column(2,numericInput("exp.misc.year1.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year2.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year3.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year4.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year5.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year6.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year7.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year8.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year9.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("exp.misc.year10.10", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     tags$div(align = "center",
                                                                                                              h2("Repayments of Current Debt", class = "title fit-h1"),
                                                                                                              h4("Enter typical", strong("monthly"), "repayments of loans, credit cards, etc"),
                                                                                                     )
                                                                                                     ,br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Total Monthly Payments")
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year1.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year2.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year3.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year4.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year5.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year6.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year7.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year8.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year9.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("loans.year10.10", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     h2("Wraparound or Other Support", class = "title fit-h1"),
                                                                                                     h4("Enter the average amount", strong("per month"),". Wraparound support is money given to anyone in the family.", align = "center"),
                                                                                                     
                                                                                                     
                                                                                                     #---------------------
                                                                                                     # QUESTION
                                                                                                     br(),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Non-Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year1.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year2.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year3.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year4.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year5.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year6.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year7.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year8.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year9.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.year10.10", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     ),
                                                                                                     
                                                                                                     fluidRow(
                                                                                                       column(2, offset = 0, h4("Taxable Assistance")
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year1.10", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year6.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year2.10", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year7.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year3.10", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year8.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year4.10", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year9.10", value=0,label = NULL, min=0)
                                                                                                       ),
                                                                                                       column(2,numericInput("assistance.tax.year5.10", value=0,label = NULL, min=0),
                                                                                                              numericInput("assistance.tax.year10.10", value=0,label = NULL, min=0)
                                                                                                       )
                                                                                                     )
                                                                                                     
                                                                                                     
                                                                                                     
                                                                                    )
                                                                                    
                                                                                    
                                                                                    
                                                                                    
                                                                   ),
                                                                   
                                                                   
                                                                   
                                                                   
                                                                   
                                                                   br(),
                                                                   br(),
                                                                   br(),
                                                                   br(),
                                                                   br(),
                                                                   
                                                                   fluidRow(
                                                                     
                                                                     column(4,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     extendShinyjs(text = jscodeback5, functions = c("back5")),
                                                                                     actionButton("back5"," Back << Public Assistance", 
                                                                                                  style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                                  class="btn btn-primary btn-lg")
                                                                            )
                                                                     ),
                                                                     column(4,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     h4(span(strong(textOutput("error_info_3"), style="color:red")))
                                                                            )
                                                                     ),
                                                                     column(4,
                                                                            tags$div(align = "center", 
                                                                                     useShinyjs(),
                                                                                     extendShinyjs(text = jscode7, functions = c("next7")),
                                                                                     actionButton("next7","Next >> My Budget", 
                                                                                                  style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                                  class="btn btn-primary btn-lg")
                                                                            )
                                                                     )
                                                                   ),
                                                                   conditionalPanel(condition="input.expenses_type=='expenses.actual' | input.expenses_type == 'expenses.default'",
                                                                   br(),
                                                                   br(),
                                                                   br(),
                                                                   h6(strong("* 'Out-of-Pocket Costs' include co-pays and medical services, prescription drugs, and medical supplies not covered by health insurance."))
                                                                   ) 
                                                          )
                                                             
                                                 ),
                                                 
                                                 ######################################
                                                 # My Budget
                                                 ######################################
                                                 tabPanel("4 - Budget",
                                                          
                                                          tags$div(class = "container",
                                                                   
                                                                              br()
                                                                   ,h3("Choose between Career Option 1 and Career Option 2")
                                                                   ,br()
                                                                   ,fluidRow(
                                                                     column(5, offset = 2,
                                                                            tags$form(
                                                                              class="form-horizontal",
                                                                              
                                                                              tags$div(
                                                                                class="form-group",   div(style="margin-top:-1.5em; margin-right:1.0em;", 
                                                                                                          
                                                                                                          h4(tags$label(`for` = "career_plan", 
                                                                                                                        br(), "Select a career for which to plan:")
                                                                                                          )
                                                                                )
                                                                              )
                                                                            )),
                                                                     
                                                                     #     h4("What career do you want to plan for?")),
                                                                     column(5,
                                                                            selectInput("career_plan", label = NULL, # Note: collect state abbreviation
                                                                                        list(" " = "empty",
                                                                                             "Career Option 1" = "Career Option 1"
                                                                                             , "Career Option 2" = "Career Option 2"
                                                                                        ), selected = "empty"))
                                                                   ),
                                                                   
                                                                   br()
                                                                   
                                                                   ,tags$div(align = "center",
                                                                             h4(span(strong(textOutput("error_info_4"), style="color:red"))),
                                                                             actionButton("calculateBudget","Calculate Budget", 
                                                                                          style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                          class="btn btn-primary btn-lg")
                                                                   )
                                                                   
                                                          ),
                                                          
                                                          br(),
                                                          
                                                          
                                                          conditionalPanel(condition = "input.calculateBudget>0", 
                                                                           br(),      
                                                                           br(),
                                                                           br(),
                                                                           #  tags$div(align = "center",
                                                                           #            tags$h4("The chart and table below estimate your budget using the information about expenses and public assistance you provided. If the line is below zero, this means that you don't have enough income to cover all your expenses."),
                                                                           #   )
                                                                           fluidRow(column(1),column(10,includeHTML("www/mybudget1.html")),column(1)),
                                                                           
                                                                           br(),      
                                                                           br(),
                                                                           tags$div(align = "center",h4(strong(textOutput('textCareerOption'))))
                                                                           
                                                                           ,br()
                                                                           ,tags$div(align = "center"
                                                                                     , htmlOutput('textMyBudget'))
                                                                           ,br()
                                                                           ,br()
                                                                           ,tags$div(align = "center"
                                                                                     , withSpinner(plotlyOutput('net.res.budget', width = 1000, height = 420),type=2))
                                                                           ,br()
                                                                           ,br()
                                                                           ,tags$div(align = "center"
                                                                                     , tableOutput('table.Budget'))
                                                                           
                                                                           ,tags$div(align = "center",
                                                                           h6(span(strong("*Income includes after-tax wage income for the entire household, plus any wraparound support, child support, and investment income.")))
                                                                           )
                                                          
                                                                           ,br()
                                                                           ,br()
                                                                           ,tags$div(align = "center",
                                                                                     includeHTML("www/mybudget2.html")
                                                                                     ,br() 
                                                                                     ,br()
                                                                                     #                 , tags$h4("The chart and table below reflect the programs that you selected on the prior page. You may be eligible for other programs.")
                                                                                     , withSpinner(plotlyOutput('transfers.budget', width = 1000, height = 420),type=2))
                                                                           ,br()
                                                                           ,br()
                                                                           ,tags$div(align = "center"
                                                                                     , tableOutput('table.Transfers'))
                                                                           ,br()
                                                                           ,br()
                                                                           
                                                                           
                                                                           ,tags$div(align = "center"
                                                                                     ,    fluidRow(column(1),column(10,includeHTML("www/mybudget3.html")),column(1))
                                                                                     
                                                                                     #            , tags$h4("The chart and table below show your out-of-pocket expenses after any reductions due to receipt of public assistance.")
                                                                                     ,br()
                                                                                     ,br()
                                                                                     , withSpinner(plotlyOutput('expenses.budget', width = 1000, height = 420),type=2))
                                                                           ,br()
                                                                           ,br()
                                                                           ,tags$div(align = "center"
                                                                                     , tableOutput('table.Expenses'))
                                                                           
                                                                           
                                                          ),
                                                          
                                                          br(),
                                                          br(),
                                                          br(),
                                                          br(),
                                                          br(),
                                                          
                                                          tags$div(align = "center", 
                                                                   useShinyjs(),
                                                                   extendShinyjs(text = jscodeback6, functions = c("back6")),
                                                                   actionButton("back6"," Back << Expenses", 
                                                                                style="background-color: rgb(20,68,104); border-color: rgb(20,68,104)",
                                                                                class="btn btn-primary btn-lg")
                                                          )
                                                          
                                                 )  # END OF INNER TAB PANEL
                                                 
                                     )
                            ),
                            
                            
                            
                            tags$script(" $(document).ready(function () {
         $('#navBar a[data-toggle=\"tab\"]').bind('click', function (e) {
               $(document).load().scrollTop(0);
               
               });

               });"),
                            
                            
                            tags$style(
                              HTML(".shiny-notification {
             position:fixed;
             top: calc(50%);
             left: calc(25%);
             }
             "
                              )
                            ),
                            
                            tags$style(
                              HTML(".shiny-notification {
              height: 70px;
              width: 500px;
             
            }
           "
                              )),
                            tags$head(tags$style(HTML(".shiny-output-error-validation{color: red; font-size:24px; }")))
                            
                            
                   ),
                   
                   #-------------------------------------------------------------------------------- 
                   # tab panel  - FAQ 
                   #-------------------------------------------------------------------------------- 
                   #-------------------------------------------------------------------------------- 
                   tabPanel("FAQ"
                            ,br()
                       
                            ,br()
                            ,includeHTML("www/FAQ1.html")         
                            ,br()
                            ,br()                   
                            , h2("Methodology")
                            , br()
                            ,includeHTML("www/FAQ2.html")         
                            
                            ,br()
                            ,br()     
                            ,br()
                            ,h2("Programs and Tax Credits")
                            ,br()
                            ,includeHTML("www/FAQ3.html")  
                            
                            
                            
                            
                   ) # END OF OUTER TAB PANEL
                   
                   
))