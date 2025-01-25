

shinyServer(function(input, output, session) {


  ###################################################################################
  # NEXT/BACK BUTTONS
  ###################################################################################



  observeEvent(input$next1, {
    js$next1();
    updateNavbarPage(session, "navBar", selected = "Client Profile")
  })

  observeEvent(input$next2, {
    js$next2();
    updateNavbarPage(session, "navBar", selected = "Choose A Career")
  })

  observeEvent(input$next3, {
    js$next3();
    updateNavbarPage(session, "navBar", selected = "Compare Careers")
  })

  observeEvent(input$next4, {
    js$next4();
    updateNavbarPage(session, "navBar", selected = "Create a Budget")
  })

  observeEvent(input$next5, {
    js$next5();
    updateNavbarPage(session, "main", selected = "2 - Public Assistance")
  })

  observeEvent(input$next6, {
    js$next6();
    updateNavbarPage(session, "main", selected = "3 - Expenses")
  })

  observeEvent(input$next7, {
    js$next7();
    updateNavbarPage(session, "main", selected = "4 - Budget")
  })

  observeEvent(input$back1, {
    js$back1();
    updateNavbarPage(session, "navBar", selected = "Client Profile")
  })

  observeEvent(input$back2, {
    js$back2();
    updateNavbarPage(session, "navBar", selected = "Choose A Career")
  })

  observeEvent(input$back3, {
    js$back3();
    updateNavbarPage(session, "navBar", selected = "Compare Careers")
  })

  observeEvent(input$back4, {
    js$back4();
    updateNavbarPage(session, "main", selected = "1 - Income and Assets")
  })

  observeEvent(input$back5, {
    js$back5();
    updateNavbarPage(session, "main", selected = "2 - Public Assistance")
  })

  observeEvent(input$back6, {
    js$back6();
    updateNavbarPage(session, "main", selected = "3 - Expenses")
  })


  ###################################################################################
  # ERROR MESSAGES
  ###################################################################################
  output$message_adult_age <- renderText({
    if (input$age < 19 | input$age > 64) {
      error_adult_age <- "Error: age of the first adult must be between 19 and 64."
    } else {
      error_adult_age <- ""
    }
  })
  
  output$error_age <- renderText({
    "Error: age cannot be negative or exceed 99"
  })

  output$error_frsp <- renderText({
    "Warning: Section 8, FRSP, CareerMAP and DC Flex are mutually exclusive programs. Please select one program."
  })

  output$error_family_age <- renderText({
    "Error: age of family members cannot be negative or exceed 99"
  })

  output$error_jobs <- renderText({
    "Error: number of jobs cannot be negative or exceed 3"
  })

  output$error_wage_hours <- renderText({
    "Error: income / hours cannot be negative "
  })

  output$error_other_income <- renderText({
    "Error: one of more levels of income are negative"
  })

  output$error_assets <- renderText({
    "Error: one of more levels of assets are negative"
  })

  output$error_schooling <- renderText({
    "Error: duration of schooling (years and/ or months) is negative "
  })

  output$error_tuition <- renderText({
    "Error: tuition and fees is negative "
  })

  output$error_grants <- renderText({
    "Error: grants total is negative "
  })

  output$error_part_time <- renderText({
    "Error: part time work hours are negative "
  })

  output$error_career_start <- renderText({
    "Error: start of career is either negative or before start of schooling "
  })

  output$error_career_end <- renderText({
    "Error: end of career is either negative or prior to start of career "
  })

  output$error_start_schooling <- renderText({
    "Error: start of schooling is negative "
  })

  output$error_info_1 <- renderText({
    "Fill in all inputs to continue"
  })

  output$error_info_2 <- renderText({
    "Select at least one career option to continue"
  })

  output$error_info_3 <- renderText({
    "Specify expenses to continue"
  })

  output$error_info_4 <- renderText({
    "Select what career to plan for to continue"
  })


  output$net_resources_text_1 <- renderText({
    "Please complete the 'Client Profile', 'Compare Careers' and 'Expenses' sections first."
  })

  output$net_resources_text_2 <- renderText({
    "      "
  })



  # Update County List
  updateCounty <- reactive({ # React if one of these inputs is updated
    list(input$state)
  })

  observeEvent(updateCounty(),{
    state<-isolate(as.character(input$state))
    updateSelectizeInput(session, 'county_main',
                         choices = sort(area_county_town[area_county_town$stateabbrev == state, county_town_BLSname]),
                         #server = TRUE,
                         selected = character(0)
    )
  })


  # Update Current Occupation
  updateOccCurrent <- reactive({ # React if one of these inputs is updated
    list(input$industry_c, input$state, input$county_main)
  })

  observeEvent(updateOccCurrent(),{

    # Filter on industry
    industry_list <- isolate(input$industry_c)
    if(is.null(industry_list)){industry_list <- unique(occ_area$occsoc2_name)}
    
    # new wage projection
    area_code <- area_county_town$area[area_county_town$stateabbrev==input$state & area_county_town$county_town_BLSname==input$county_main]
    selected_occ1 <- occ_area[area %in% area_code & occsoc2_name %in% industry_list]
    

    # Update current occupation
    updateSelectizeInput(session, 'occupation1_current',
                         choices = sort(unique(selected_occ1$occsoc_name)),
                         #server = TRUE,
                         selected = character(0))

  })



  # Update Occupation 2
  updateOcc1 <- reactive({ # React if one of these inputs is updated
    list(input$industry_1, input$state, input$county_main, input$filterMedian1)
  })

  observeEvent(updateOcc1(),{

    # Filter on industry
    industry_list<-isolate(input$industry_1)
    if(is.null(industry_list)){industry_list<-unique(occ_area$occsoc2_name)}

    # new wage projection
    area_code <- area_county_town$area[area_county_town$stateabbrev==input$state & area_county_town$county_town_BLSname==input$county_main]
    selected_occ1 <- occ_area[area %in% area_code & occsoc2_name %in% industry_list]
    
    # Filter on occupation type
    filterMedian1<-isolate(input$filterMedian1) 
    
    
    if(filterMedian1==TRUE){occ_types<-c(1)} else{occ_types<-unique(occ_area$occ_type)}

    # Update current occupation
    updateSelectizeInput(session, 'occupation1',
                         choices = sort(selected_occ1[occ_type %in% occ_types, occsoc_name]),
                         #server = TRUE,
                         selected = character(0))
  })



  # Update Occupation 2
  updateOcc2 <- reactive({ # React if one of these inputs is updated
    list(input$industry_2, input$state, input$county_main, input$filterMedian2)
  })

  observeEvent(updateOcc2(),{

    # Filter on industry
    industry_list<-isolate(input$industry_2)
    if(is.null(industry_list)){industry_list<-unique(occ_area$occsoc2_name)}
    
    # new wage projection
    area_code <- area_county_town$area[area_county_town$stateabbrev==input$state & area_county_town$county_town_BLSname==input$county_main]
    selected_occ2 <- occ_area[area %in% area_code & occsoc2_name %in% industry_list]
    
    # Filter on occupation type
    filterMedian2<-isolate(input$filterMedian2)
    if(filterMedian2==TRUE){occ_types<-c(1)} else{occ_types<-unique(occ_area$occ_type)}

    # Update current occupation
    updateSelectizeInput(session, 'occupation2',
                         choices = sort(selected_occ2[occ_type %in% occ_types, occsoc_name]),
                         #server = TRUE,
                         selected = character(0))
  })

  updateOccList <- reactive({ # React if one of these inputs is updated
    list(input$type_career_1, input$type_career_2, input$industry_c, input$industry_1, input$industry_2)
  })



  ######################################################
  # GENERAL ERRORS
  #####################################################


  toListen2 <- reactive({ # React if one of these inputs is updated
    list(input$state,input$county_main,
         input$partnered, input$age, input$marital_status, input$age_partner, input$other_family,
         input$num_other_family, input$age_family_1, input$age_family_2, input$age_family_3,
         input$age_family_4, input$age_family_5, input$age_family_6, input$age_family_7, input$age_family_8,
         input$age_family_9, input$age_family_10

         # UNCOMMENT ONCE DISABILITY IS ADDED
         , input$disab, input$disab_partner, input$disab_1, input$disab_2,
         input$disab_3, input$disab_4, input$disab_5, input$disab_6, input$disab_7, input$disab_8, input$disab_9,
         input$disab_10, input$blind, input$blind_partner, input$blind_1, input$blind_2, input$blind_3, input$blind_4,
         input$blind_5, input$blind_6, input$blind_7, input$blind_8, input$blind_9, input$blind_10, input$fam_disab

    )
  }) # ER 8.12.22: maybe prev_ssi needs to be included

  toListen3 <- reactive({ # React if one of these inputs is updated
    list(input$type_career_1,
         input$type_career_2)
  })

  toListen4 <- reactive({ # React if one of these inputs is updated
    list(input$expenses_type
    )
  })

  toListen5 <- reactive({ # React if one of these inputs is updated
    list(input$career_plan
    )
  })



  # observeEvent(toListen2(),{})
  observeEvent(toListen2(),{



    state <- NA
    countyortownName <- NA



    state<-isolate(as.character(input$state))

    countyortownName<-isolate(input$county_main)

    age <- isolate(as.character(input$age))
    age_1<-isolate(as.character(input$age_family_1))
    age_2<-isolate(as.character(input$age_family_2))
    age_3<-isolate(as.character(input$age_family_3))
    age_4<-isolate(as.character(input$age_family_4))
    age_5<-isolate(as.character(input$age_family_5))
    age_6<-isolate(as.character(input$age_family_6))
    age_7<-isolate(as.character(input$age_family_7))
    age_8<-isolate(as.character(input$age_family_8))
    age_9<-isolate(as.character(input$age_family_9))
    age_10<-isolate(as.character(input$age_family_10))
    age_partner<-isolate(as.character(input$age_partner))
    marital_status <- isolate(as.character(input$marital_status))


    num_family <- as.numeric(input$num_other_family)

    # UNCOMMENT ONCE DISABILITY IS ADDED
    disab <- isolate(as.character(input$disab))
    disab_partner <- isolate(as.character(input$disab_partner))
    disab1 <- isolate(as.character(input$disab1))
    disab2 <- isolate(as.character(input$disab2))
    disab3 <- isolate(as.character(input$disab3))
    disab4 <- isolate(as.character(input$disab4))
    disab5 <- isolate(as.character(input$disab5))
    disab6 <- isolate(as.character(input$disab6))
    disab7 <- isolate(as.character(input$disab7))
    disab8 <- isolate(as.character(input$disab8))
    disab9 <- isolate(as.character(input$disab9))
    disab10 <- isolate(as.character(input$disab10))

    blind <- isolate(as.character(input$blind))
    blind_partner <- isolate(as.character(input$blind_partner))
    blind1 <- isolate(as.character(input$blind_1))
    blind2 <- isolate(as.character(input$blind_2))
    blind3 <- isolate(as.character(input$blind_3))
    blind4 <- isolate(as.character(input$blind_4))
    blind5 <- isolate(as.character(input$blind_5))
    blind6 <- isolate(as.character(input$blind_6))
    blind7 <- isolate(as.character(input$blind_7))
    blind8 <- isolate(as.character(input$blind_8))
    blind9 <- isolate(as.character(input$blind_9))
    blind10 <- isolate(as.character(input$blind_10))


    fam_disab <- isolate(as.character(input$fam_disab))

    if(state == "AL"){
      fam_disab <- "No"
      disab <- "No"
      disab_partner <- "No"
      disab1 <- "No"
      disab2 <- "No"
      disab3 <- "No"
      disab4 <- "No"
      disab5 <- "No"
      disab6 <- "No"
      disab7 <- "No"
      disab8 <- "No"
      disab9 <- "No"
      disab10 <- "No"
      blind <- "No"
      blind_partner <- "No"
      blind1 <- "No"
      blind2 <- "No"
      blind3 <- "No"
      blind4 <- "No"
      blind5 <- "No"
      blind6 <- "No"
      blind7 <- "No"
      blind8 <- "No"
      blind9 <- "No"
      blind10 <- "No"
    }




    if(!is.na(num_family) & num_family == 1){
      age <- age
      age_partner <- NA
      age_1 <- NA
      age_2 <- NA
      age_3 <- NA
      age_4 <- NA
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA

    }else if(!is.na(num_family) & num_family == 2){
      age <- age
      age_partner <- age_partner
      age_1 <- NA
      age_2 <- NA
      age_3 <- NA
      age_4 <- NA
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA

    }else if(!is.na(num_family) & num_family == 3){
      age <- age
      age_partner <- age_partner

      age_1 <- age_1
      age_2 <- NA
      age_3 <- NA
      age_4 <- NA
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 4){
      age <- age
      age_partner <- age_partner

      age_1 <- age_1
      age_2 <- age_2
      age_3 <- NA
      age_4 <- NA
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA

    }else if(!is.na(num_family) & num_family == 5){
      age <- age
      age_partner <- age_partner

      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- NA
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 6){
      age <- age
      age_partner <- age_partner

      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 7){
      age <- age
      age_partner <- age_partner

      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- age_5
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 8){
      age <- age
      age_partner <- age_partner
      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- age_5
      age_6 <- age_6
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 9){
      age <- age
      age_partner <- age_partner
      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- age_5
      age_6 <- age_6
      age_7 <- age_7
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 10){
      age <- age
      age_partner <- age_partner
      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- age_5
      age_6 <- age_6
      age_7 <- age_7
      age_8 <- age_8
      age_9 <- NA
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 11){
      age <- age
      age_partner <- age_partner
      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- age_5
      age_6 <- age_6
      age_7 <- age_7
      age_8 <- age_8
      age_9 <- age_9
      age_10 <- NA


    }else if(!is.na(num_family) & num_family == 12){
      age <- age
      age_partner <- age_partner
      age_1 <- age_1
      age_2 <- age_2
      age_3 <- age_3
      age_4 <- age_4
      age_5 <- age_5
      age_6 <- age_6
      age_7 <- age_7
      age_8 <- age_8
      age_9 <- age_9
      age_10 <- age_10

    }else if(is.na(num_family) | num_family ==0){
      age <- NA
      age_partner <- NA

      age_1 <- NA
      age_2 <- NA
      age_3 <- NA
      age_4 <- NA
      age_5 <- NA
      age_6 <- NA
      age_7 <- NA
      age_8 <- NA
      age_9 <- NA
      age_10 <- NA



    }


    family_num <- c(age_1, age_2, age_3, age_4, age_5, age_6, age_7, age_8, age_9, age_10)

    family_num <- family_num[!is.na(family_num)]

    length_family <- as.numeric(length(family_num))

    # NAVIGATION ERROR MESSAGE 1: "About You"
    observe({
      shinyjs::show("next2")

      if(input$state == "empty"
         | countyortownName==""
         | is.na(input$age) | (input$age < 19) | (input$age > 64)
         | (input$partnered != "No" & is.na(input$age_partner))
         | (input$other_family == "Yes" & is.na(input$num_other_family))
         | (input$other_family == "Yes" & !is.na(input$num_other_family) & is.na(length_family))
         | is.na(input$otherfamily_earnings)
         | (input$other_family == "Yes" & input$num_other_family == 1 & is.na(input$age_family_1))
         | (input$other_family == "Yes" & input$num_other_family == 2 & (is.na(input$age_family_1) | is.na(input$age_family_2)))
         | (input$other_family == "Yes" & input$num_other_family == 3 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3)))
         | (input$other_family == "Yes" & input$num_other_family == 4 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4)))
         | (input$other_family == "Yes" & input$num_other_family == 5 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5)))
         | (input$other_family == "Yes" & input$num_other_family == 6 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6)))
         | (input$other_family == "Yes" & input$num_other_family == 7 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7)))
         | (input$other_family == "Yes" & input$num_other_family == 8 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8)))
         | (input$other_family == "Yes" & input$num_other_family == 9 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8) | is.na(input$age_family_9)))
         | (input$other_family == "Yes" & input$num_other_family == 10 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8) | is.na(input$age_family_9) | is.na(input$age_family_10)))
      )
      shinyjs::hide("next2")
      else
        shinyjs::show("next2")
    })

    observe({

      shinyjs::hide("error_info_1")

      if(input$state == "empty"
         | countyortownName==""
         | is.na(input$age)
         | (input$partnered != "No" & is.na(input$age_partner))
         | (input$other_family == "Yes" & is.na(input$num_other_family))
         | (input$other_family == "Yes" & !is.na(input$num_other_family) & is.na(length_family))
         | is.na(input$otherfamily_earnings)
         | (input$other_family == "Yes" & input$num_other_family == 1 & is.na(input$age_family_1))
         | (input$other_family == "Yes" & input$num_other_family == 2 & (is.na(input$age_family_1) | is.na(input$age_family_2)))
         | (input$other_family == "Yes" & input$num_other_family == 3 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3)))
         | (input$other_family == "Yes" & input$num_other_family == 4 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4)))
         | (input$other_family == "Yes" & input$num_other_family == 5 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5)))
         | (input$other_family == "Yes" & input$num_other_family == 6 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6)))
         | (input$other_family == "Yes" & input$num_other_family == 7 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7)))
         | (input$other_family == "Yes" & input$num_other_family == 8 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8)))
         | (input$other_family == "Yes" & input$num_other_family == 9 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8) | is.na(input$age_family_9)))
         | (input$other_family == "Yes" & input$num_other_family == 10 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8) | is.na(input$age_family_9) | is.na(input$age_family_10)))
      )
      shinyjs::show("error_info_1")
      else
        shinyjs::hide("error_info_1")
    })
  })


  # NAVIGATION ERROR MESSAGE 2: "Choose A Career"
  observeEvent(toListen3(),{

    observe({
      shinyjs::show("next3")

      if( input$type_career_1=="empty" & input$type_career_2=="empty")
        shinyjs::hide("next3")
      else
        shinyjs::show("next3")
    })

    observe({
      shinyjs::hide("error_info_2")

      if(input$type_career_1=="empty" & input$type_career_2=="empty"
      )
        shinyjs::show("error_info_2")
      else
        shinyjs::hide("error_info_2")
    })

  })


  # NAVIGATION ERROR MESSAGE 4: "3 - Expenses"
  observeEvent(toListen4(),{

    observe({
      shinyjs::show("next7")

      if(input$expenses_type=="empty")
        shinyjs::hide("next7")
      else
        shinyjs::show("next7")
    })

    observe({
      shinyjs::hide("error_info_3")

      if(input$expenses_type=="empty"
      )
        shinyjs::show("error_info_3")
      else
        shinyjs::hide("error_info_3")
    })

  })

  # NAVIGATION ERROR MESSAGE 5: "4 - Expenses"
  observeEvent(toListen5(),{

    observe({
      shinyjs::show("calculateBudget")

      if( input$career_plan=="empty")
        shinyjs::hide("calculateBudget")
      else
        shinyjs::show("calculateBudget")
    })

    observe({
      shinyjs::hide("error_info_4")

      if(input$career_plan=="empty")
        shinyjs::show("error_info_4")
      else
        shinyjs::hide("error_info_4")
    })

  })



  #--------------------------------------------------------------------------------------------------------------------
  # MAIN PART OF THE CODE
  #--------------------------------------------------------------------------------------------------------------------

  toListen <- reactive({ # Recalculate if "Get Results" or "Calculate Budgets" are clicked
    list(input$getresults, input$calculateBudget)
  })


  toListen_main <- reactive({ # Recalculate if "Get Results" or "Calculate Budgets" are clicked
    list(input$main)
  })


  observeEvent(toListen(),{



    #input
    if(input$getresults>0){


      # data <- NA
      #data_init <- NA
      # countyortownName <- NA
      # stateAbbrev <- "AL"
      # income <- 0
      ###########################################################################################
      # READ-IN INPUTS
      ###########################################################################################

      inputs<-list() # Initialize list for Benefits Calculator Inputs

      #---------------------------------------------------------
      # Geographics
      #---------------------------------------------------------
      inputs$stateAbbrev<-isolate(as.character(input$state))
      state<-isolate(as.character(input$state))
      inputs$countyortownName<-isolate(input$county_main)
      BLSregion <- paste0(inputs$countyortownName, ", ",inputs$stateAbbrev)
      city_name <- area_county_town$county_town_name[area_county_town$stateabbrev==state & area_county_town$county_town_BLSname==input$county_main]
      region <- as.character(paste(city_name, state, sep=", ", collapse = NULL))
      inputs$cityName <- region
      inputs$cityCode <- area_county_town$area[area_county_town$stateabbrev==state & area_county_town$county_town_BLSname==input$county_main]
      
      #---------------------------------------------------------------------------
      # Demographics
      #---------------------------------------------------------------------------

      num_other_family <- isolate(as.numeric(input$num_other_family))
      other_family <- isolate(as.character(input$other_family))
      partnered<-isolate(as.character(input$partnered))

      # UNCOMMENT WHEN DISABILITY IS ADDED
      disab<-isolate(as.character(input$disab))
      disab_partner<-isolate(as.character(input$disab_partner))
      disab1<-isolate(as.character(input$disab1))
      disab2<-isolate(as.character(input$disab2))
      disab3<-isolate(as.character(input$disab3))
      disab4<-isolate(as.character(input$disab4))
      disab5<-isolate(as.character(input$disab5))
      disab6<-isolate(as.character(input$disab6))
      disab7<-isolate(as.character(input$disab7))
      disab8<-isolate(as.character(input$disab8))
      disab9<-isolate(as.character(input$disab9))
      disab10<-isolate(as.character(input$disab10))
      blind<-isolate(as.character(input$blind))
      blind_partner<-isolate(as.character(input$blind_partner))
      blind1<-isolate(as.character(input$blind_1))
      blind2<-isolate(as.character(input$blind_2))
      blind3<-isolate(as.character(input$blind_3))
      blind4<-isolate(as.character(input$blind_4))
      blind5<-isolate(as.character(input$blind_5))
      blind6<-isolate(as.character(input$blind_6))
      blind7<-isolate(as.character(input$blind_7))
      blind8<-isolate(as.character(input$blind_8))
      blind9<-isolate(as.character(input$blind_9))
      blind10<-isolate(as.character(input$blind_10))
      fam_disab <- isolate(as.character(input$fam_disab))

      if(state == "AL"){
        disab<-"No"
      disab_partner<-"No"
      disab1<-"No"
      disab2<-"No"
      disab3<-"No"
      disab4<-"No"
      disab5<-"No"
      disab6<-"No"
      disab7<-"No"
      disab8<-"No"
      disab9<-"No"
      disab10<-"No"
      blind<-"No"
      blind_partner<-"No"
      blind1<-"No"
      blind2<-"No"
      blind3<-"No"
      blind4<-"No"
      blind5<-"No"
      blind6<-"No"
      blind7<-"No"
      blind8<-"No"
      blind9<-"No"
      blind10<-"No"
      fam_disab <- "No"
      }



      disab_error <- 0
      if(fam_disab == "Yes" &
         disab1 == "No" &
         disab2 == "No" &
         disab3 == "No" &
         disab4 == "No"&
         disab5 == "No" &
         disab6 == "No" &
         disab7 == "No" &
         disab8 == "No" &
         disab9 == "No" &
         disab10 == "No" &
         disab == "No" &
         disab_partner == "No"){
        disab_error <- 1
      }else{
        disab_error <- 0
      }
      inputs$disab_error <- disab_error


      # Initialize
      # fam_disab <- "No"
      # prev_ssi <- FALSE
      inputs$startDisability1<-0
      inputs$startDisability2<-0
      inputs$startDisability3<-0
      inputs$startDisability4<-0
      inputs$startDisability5<-0
      inputs$startDisability6<-0
      inputs$startDisability7<-0
      inputs$startDisability8<-0
      inputs$startDisability9<-0
      inputs$startDisability10<-0
      inputs$startDisability11<-0
      inputs$startDisability12<-0

      inputs$startBlind1<-0
      inputs$startBlind2<-0
      inputs$startBlind3<-0
      inputs$startBlind4<-0
      inputs$startBlind5<-0
      inputs$startBlind6<-0
      inputs$startBlind7<-0
      inputs$startBlind8<-0
      inputs$startBlind9<-0
      inputs$startBlind10<-0
      inputs$startBlind11<-0
      inputs$startBlind12<-0

      # Age
      # Includes logic that overrides age to NA if user switches from "with other family memebers" to "without..", but doesn't change the age back to NA
      numkids <- 0
      inputs$startAgePerson1<-isolate(as.numeric(input$age))
      if(partnered=="Yes"){inputs$startAgePerson2<-isolate(as.numeric(input$age_partner))}else{inputs$startAgePerson2<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=1){
        inputs$startAgePerson3 <- isolate(as.numeric(input$age_family_1))
        if(inputs$startAgePerson3 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson3<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=2){
        inputs$startAgePerson4 <- isolate(as.numeric(input$age_family_2))
        if(inputs$startAgePerson4 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson4<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=3){
        inputs$startAgePerson5 <- isolate(as.numeric(input$age_family_3))
        if(inputs$startAgePerson5 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson5<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=4){
        inputs$startAgePerson6 <- isolate(as.numeric(input$age_family_4))
        if(inputs$startAgePerson6 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson6<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=5){
        inputs$startAgePerson7 <- isolate(as.numeric(input$age_family_5))
        if(inputs$startAgePerson7 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson7<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=6){
        inputs$startAgePerson8 <- isolate(as.numeric(input$age_family_6))
        if(inputs$startAgePerson8 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson8<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=7){
        inputs$startAgePerson9 <- isolate(as.numeric(input$age_family_7))
        if(inputs$startAgePerson9 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson9<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=8){
        inputs$startAgePerson10 <- isolate(as.numeric(input$age_family_8))
        if(inputs$startAgePerson10 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson10<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=9){
        inputs$startAgePerson11 <- isolate(as.numeric(input$age_family_9))
        if(inputs$startAgePerson11 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson11<-NA}
      if(other_family=="Yes" & !is.na(num_other_family) & num_other_family>=10){
        inputs$startAgePerson12 <- isolate(as.numeric(input$age_family_10))
        if(inputs$startAgePerson12 < 19) numkids <- numkids+1 }
      else{inputs$startAgePerson12<-NA}

      # disability
      # Includes logic that overrides disability to 0 if user switches from "with other family memebers" to "without..", but doesn't change the age back to NA
      if(fam_disab=="Yes" & disab=="Yes"){inputs$startDisability1<-1}else{inputs$startDisability1<-0}

      if(fam_disab=="Yes" & partnered=="Yes" & disab_partner=="Yes"){inputs$startDisability2<-1}else{inputs$startDisablity2<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & disab1=="Yes" & !is.na(num_other_family) & num_other_family>=1){inputs$startDisability3<-1}else{inputs$startDisability3<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & disab2=="Yes" & !is.na(num_other_family) & num_other_family>=2){inputs$startDisability4<-1}else{inputs$startDisability4<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & disab3=="Yes" & !is.na(num_other_family) & num_other_family>=3){inputs$startDisability5<-1}else{inputs$startDisability5<-0}

      if(fam_disab=="Yes" & other_family=="Yes" & disab4=="Yes" & !is.na(num_other_family) & num_other_family>=4){inputs$startDisability6<-1}else{inputs$startDisability6<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & disab5=="Yes" & !is.na(num_other_family) & num_other_family>=5){inputs$startDisability7<-1}else{inputs$startDisability7<-0}

      if(fam_disab=="Yes" & other_family=="Yes" & disab6=="Yes" & !is.na(num_other_family) & num_other_family>=6){inputs$startDisability8<-1}else{inputs$startDisability8<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & disab7=="Yes" & !is.na(num_other_family) & num_other_family>=7){inputs$startDisability9<-1}else{inputs$startDisability9<-0}

      if(fam_disab=="Yes" & other_family=="Yes" & disab8=="Yes" & !is.na(num_other_family) & num_other_family>=8){inputs$startDisability10<-1}else{inputs$startDisability10<-0}

      if(fam_disab=="Yes" & other_family=="Yes" & disab9=="Yes" & !is.na(num_other_family) & num_other_family>=9){inputs$startDisability11<-1}else{inputs$startDisability11<-0}

      if(fam_disab=="Yes" & other_family=="Yes" & disab10=="Yes" & !is.na(num_other_family) & num_other_family>=10){inputs$startDisability12<-1}else{inputs$startDisability12<-0}



      # blind
      # Includes logic that overrides blind to 0 if user switches from "with other family memebers" to "without..", but doesn't change the age back to NA
      if(fam_disab=="Yes" & blind=="Yes"){inputs$startBlind1<-1}else{inputs$startBlind1<-0}
      if(fam_disab=="Yes" & partnered=="Yes" & blind_partner=="Yes"){inputs$startBlind2<-1}else{inputs$startBlind2<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind1=="Yes" & !is.na(num_other_family) & num_other_family>=1){inputs$startBlind3<-1}else{inputs$startBlind3<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind2=="Yes" & !is.na(num_other_family) & num_other_family>=2){inputs$startBlind4<-1}else{inputs$startBlind4<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind3=="Yes" & !is.na(num_other_family) & num_other_family>=3){inputs$startBlind5<-1}else{inputs$startBlind5<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind4=="Yes" & !is.na(num_other_family) & num_other_family>=4){inputs$startBlind6<-1}else{inputs$startBlind6<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind5=="Yes" & !is.na(num_other_family) & num_other_family>=5){inputs$startBlind7<-1}else{inputs$startBlind7<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind6=="Yes" & !is.na(num_other_family) & num_other_family>=6){inputs$startBlind8<-1}else{inputs$startBlind8<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind7=="Yes" & !is.na(num_other_family) & num_other_family>=7){inputs$startBlind9<-1}else{inputs$startBlind9<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind8=="Yes" & !is.na(num_other_family) & num_other_family>=8){inputs$startBlind10<-1}else{inputs$startBlind10<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind9=="Yes" & !is.na(num_other_family) & num_other_family>=9){inputs$startBlind11<-1}else{inputs$startBlind11<-0}
      if(fam_disab=="Yes" & other_family=="Yes" & blind10=="Yes" & !is.na(num_other_family) & num_other_family>=10){inputs$startBlind12<-1}else{inputs$startBlind12<-0}


      # Tax Filing Status
      # 1 - single
      # 2 - married filing jointly
      # 3 - Heads of Household
      # 4 - Married Filing Separately
      marital_status <- "No"
      if (input$partnered=="Yes")
        marital_status<-isolate(as.character(input$marital_status))
      if(marital_status=="No"){
        if(numkids == 0) inputs$FilingStatus <- 1
        else inputs$FilingStatus <- 3
        inputs$married<-0
      }else if(marital_status=="Yes"){
        inputs$FilingStatus<-2
        inputs$married<-1
      }

      #if(partnered == "No"){
      #  inputs$married <- 0
      #  inputs$FilingStatus<-1
      #  marital_status <- "No"
      #}


      startingWage_c<-isolate(as.numeric(input$startingWage_c))
      current_hours<-isolate(as.numeric(input$current_hours))

      # Finances
      #---------------------------------------------------------------------------
      # Vehicle
      #value_vehicle_1<-isolate(input$value_vehicle_1)
      #owe_vehicle_1<-isolate(input$owe_vehicle_1)
      #value_vehicle_2<-isolate(input$value_vehicle_2)
      #owe_vehicle_2<-isolate(input$owe_vehicle_2)

      # Assets
      checking_account<-isolate(input$checking_account)

      inputs$ownorrent<-"rent"

      inputs$assets.cash<-checking_account
      inputs$assets.car1<-0

      inputs$income.investment<-isolate(as.numeric(input$investment_income))

      inputs$income.child_support<-isolate(as.numeric(input$child_support_income))
      inputs$income.gift<-0
      inputs$income.otherfamily <- 0
      inputs$numworkingadults <- 1
      inputs$income2_disab <- 0
      inputs$income3_disab <- 0
      inputs$income4_disab <- 0
      inputs$income5_disab <- 0
      inputs$income6_disab <- 0



     if((partnered == "Yes" | other_family == "Yes")& fam_disab == "No"){
         inputs$income.otherfamily<-isolate(as.numeric(input$otherfamily_earnings))*12
         if(inputs$income.otherfamily > 0){
           inputs$numworkingadults <- 2
         }else{
           inputs$numworkingadults <- 1
         }
     }

     if(fam_disab == "Yes" & other_family == "Yes"){
        if(partnered == "Yes"){

          inputs$income2_disab <- isolate(as.numeric(input$spouse_earnings))*12
          if(!is.na(inputs$startAgePerson3) & inputs$startAgePerson3 > 18){
          inputs$income3_disab <- isolate(as.numeric(input$third_adult_earnings_1))*12
          }
          if(!is.na(inputs$startAgePerson4) & inputs$startAgePerson4 > 18){
          inputs$income4_disab <- isolate(as.numeric(input$fourth_adult_earnings_1))*12
          }
          if(!is.na(inputs$startAgePerson5) & inputs$startAgePerson5 > 18){
          inputs$income5_disab <- isolate(as.numeric(input$fifth_adult_earnings_1))*12
          }
          if(!is.na(inputs$startAgePerson6) & inputs$startAgePerson6 > 18){
          inputs$income6_disab <- isolate(as.numeric(input$sixth_adult_earnings_1))*12
          }


        }else{
          if(!is.na(inputs$startAgePerson3) & inputs$startAgePerson3 > 18){
          inputs$income2_disab <- isolate(as.numeric(input$second_adult_earnings))*12
          }
          if(!is.na(inputs$startAgePerson4) & inputs$startAgePerson4 > 18){
          inputs$income3_disab <- isolate(as.numeric(input$third_adult_earnings_2))*12
          }
          if(!is.na(inputs$startAgePerson5) & inputs$startAgePerson5 > 18){
          inputs$income4_disab <- isolate(as.numeric(input$fourth_adult_earnings_2))*12
          }
          if(!is.na(inputs$startAgePerson6) & inputs$startAgePerson6 > 18){
          inputs$income5_disab <- isolate(as.numeric(input$fifth_adult_earnings_2))*12
          }
          if(!is.na(inputs$startAgePerson7) & inputs$startAgePerson7 > 18){
          inputs$income6_disab <- isolate(as.numeric(input$sixth_adult_earnings_2))*12
          }

             }

      }




      if(is.na(inputs$income2_disab) | inputs$income2_disab < 0){
        inputs$income2_disab <- 0
      }

      if(is.na(inputs$income3_disab) | inputs$income3_disab < 0){
        inputs$income3_disab <- 0
      }

      if(is.na(inputs$income4_disab) | inputs$income4_disab < 0){
        inputs$income4_disab <- 0
      }

      if(is.na(inputs$income5_disab) | inputs$income5_disab < 0){
        inputs$income5_disab <- 0
      }

      if(is.na(inputs$income6_disab) | inputs$income6_disab < 0){
        inputs$income6_disab <- 0
      }


      #---------------------------------------------------------------------------
      # Career Paths - Set Up All Inputs Conditional on User's Choices
      #---------------------------------------------------------------------------
      inputs_check <<- inputs

      inputs$type_career_1<-isolate(input$type_career_1)
      inputs$type_career_2<-isolate(input$type_career_2)


      # User chooses default near minimum wage job
      if(inputs$type_career_1=="default"){
        #inputs$choiceOccupation_1 <- "Counter Attendants, Cafeteria, Food Concession, and Coffee Shop"
        inputs$choiceOccupation_1 <- "Cashiers"

        # Health Insurance
        inputs$choiceOccupation.empl_healthcare_1<-0

        inputs$startingWage_1<-NA
        inputs$experience_1<-0

        inputs$tuition_fees_1<-0
        inputs$Grants_1<-0
        inputs$loans_1<-0

        inputs$hours_inschool_1<-0
        inputs$wage_inschool_1<-0

        inputs$educationDuration_1<-0
        inputs$schooling_years_1<-0
        inputs$schooling_months_1<-0

      }

      # Health Insurance - client profile page
      include_health_insurance_init<-isolate(as.character(input$include_health_insurance_init))

      if(include_health_insurance_init=="Yes"){
        inputs$choiceOccupation.empl_healthcare_init<-1
      }else if(include_health_insurance_init=="No"){
        inputs$choiceOccupation.empl_healthcare_init<-0
      }



      if(inputs$type_career_1=="current"){

        # Occupation of Interest
        inputs$choiceOccupation_1<-isolate(as.character(input$occupation1_current))

        # Health Insurance - for current job as a career path
        include_health_insurance_c<-isolate(as.character(input$include_health_insurance_c))

        if(include_health_insurance_c=="Yes"){
          inputs$choiceOccupation.empl_healthcare_1<-1
        }else if(include_health_insurance_c=="No"){
          inputs$choiceOccupation.empl_healthcare_1<-0
        }


        inputs$tuition_fees_1<-0
        inputs$Grants_1<-0
        inputs$loans_1<-0

        inputs$startingWage_1<-as.numeric(isolate(input$startingWage_c))
        inputs$experience_1<-as.numeric(isolate(input$experience_c))

        inputs$hours_inschool_1<-0
        inputs$wage_inschool_1<-0

        inputs$educationDuration_1<-0
        inputs$schooling_years_1<-0
        inputs$schooling_months_1<-0

      }

      # User adds cutom career for Option 1
      if(inputs$type_career_1=="custom"){

        # Occupation of Interest
        inputs$choiceOccupation_1 <- isolate(as.character(input$occupation1))

        # Health insurance
        include_health_insurance_1<-isolate(as.character(input$include_health_insurance_1)) # empl insurance will begin in first year of new job
        health_insurance_inschool_1<-isolate(as.character(input$health_insurance_inschool_1)) # continue empl insurance during schooling


        if(include_health_insurance_1=="Yes"){
          inputs$choiceOccupation.empl_healthcare_1<-1
        }else if(include_health_insurance_1=="No"){
          inputs$choiceOccupation.empl_healthcare_1<-0
        }

        if(health_insurance_inschool_1=="yes"){
          inputs$inschool.cont.empl_healthcare_1<-1
        }else if(health_insurance_inschool_1=="no"){
          inputs$inschool.cont.empl_healthcare_1<-0
        }

        inputs$overrideWage_1<-as.character(isolate(input$overrideWage_1))
        if(inputs$overrideWage_1 == "Yes"){
        inputs$startingWage_1<-as.numeric(isolate(input$startingWage_1))
        }else{
          inputs$startingWage_1 <- NA
        }
        inputs$experience_1<-0

        # Duration of education/Work part-time
        edu_req_1<-isolate(input$edu_req_1)
        work_inschool_1<-isolate(input$work_inschool_1)

        # No education
        if(edu_req_1=="no"){
          inputs$hours_inschool_1<-0
          inputs$wage_inschool_1<-0

          inputs$educationDuration_1<-0
          inputs$educationDuration_1<-0
          inputs$schooling_years_1<-0
          inputs$schooling_months_1<-0

          # Schooling costs
          inputs$tuition_fees_1<-0
          inputs$Grants_1<-0
          inputs$loans_1<-0


        }

        # Education + no work
        if(edu_req_1=="yes_custom" & work_inschool_1=="no"){
          inputs$hours_inschool_1<-0
          inputs$wage_inschool_1<-0

          inputs$schooling_years_1<-isolate(as.numeric(input$schooling_years_1))
          inputs$schooling_months_1<-isolate(as.numeric(input$schooling_months_1))

          if(inputs$schooling_months_1>0){
            inputs$educationDuration_1<-inputs$schooling_years_1+1
          }else if(inputs$schooling_months_1==0){
            inputs$educationDuration_1<-inputs$schooling_years_1
          }

          # Schooling costs
          inputs$tuition_fees_1<-isolate(as.numeric(input$tuition_fees_1))
          inputs$Grants_1<-isolate(as.numeric(input$Grants_1))
          inputs$loans_1<-isolate(as.numeric(input$loans_1))
        }

        # Education + work
        if(edu_req_1=="yes_custom" & work_inschool_1=="yes"){
          inputs$hours_inschool_1<-isolate(input$hours_inschool_1)
          inputs$wage_inschool_1<-isolate(input$wage_inschool_1)

          inputs$schooling_years_1<-isolate(as.numeric(input$schooling_years_1))
          inputs$schooling_months_1<-isolate(as.numeric(input$schooling_months_1))

          if(inputs$schooling_months_1>0){
            inputs$educationDuration_1<-inputs$schooling_years_1+1
          }else if(inputs$schooling_months_1==0){
            inputs$educationDuration_1<-inputs$schooling_years_1
          }

          # Schooling costs
          inputs$tuition_fees_1<-isolate(as.numeric(input$tuition_fees_1))
          inputs$Grants_1<-isolate(as.numeric(input$Grants_1))
          inputs$loans_1<-isolate(as.numeric(input$loans_1))
        }

      }

      # User adds cutom career for Option 2
      if(inputs$type_career_2=="custom"){

        # Occupation of Interest
        inputs$choiceOccupation_2 <- isolate(as.character(input$occupation2))

        # Health insurance
        include_health_insurance_2<-isolate(as.character(input$include_health_insurance_2)) # empl insurance will begin in first year of new job
        health_insurance_inschool_2<-isolate(as.character(input$health_insurance_inschool_2)) # continue empl insurance during schooling


        if(include_health_insurance_2=="Yes"){
          inputs$choiceOccupation.empl_healthcare_2<-1
        }else if(include_health_insurance_2=="No"){
          inputs$choiceOccupation.empl_healthcare_2<-0
        }

        if(health_insurance_inschool_2=="yes"){
          inputs$inschool.cont.empl_healthcare_2<-1
        }else if(health_insurance_inschool_2=="no"){
          inputs$inschool.cont.empl_healthcare_2<-0
        }

        inputs$overrideWage_2<-as.character(isolate(input$overrideWage_2))
        if(inputs$overrideWage_2 == "Yes"){
        inputs$startingWage_2<-as.numeric(isolate(input$startingWage_2))
        }else{
          inputs$startingWage_2<-NA
        }
        inputs$experience_2<-0

        # Duration of education/Work part-time
        edu_req_2<-isolate(input$edu_req_2)
        work_inschool_2<-isolate(input$work_inschool_2)

        # No education
        if(edu_req_2=="no"){
          inputs$hours_inschool_2<-0
          inputs$wage_inschool_2<-0

          inputs$educationDuration_2<-0
          inputs$schooling_years_2<-0
          inputs$schooling_months_2<-0

          # Schooling costs
          inputs$tuition_fees_2<-0
          inputs$Grants_2<-0
          inputs$loans_2<-0
        }

        # Education + no work
        if(edu_req_2=="yes_custom" & work_inschool_2=="no"){
          inputs$hours_inschool_2<-0
          inputs$wage_inschool_2<-0

          inputs$schooling_years_2<-isolate(as.numeric(input$schooling_years_2))
          inputs$schooling_months_2<-isolate(as.numeric(input$schooling_months_2))

          if(inputs$schooling_months_2>0){
            inputs$educationDuration_2<-inputs$schooling_years_2+1
          }else if(inputs$schooling_months_2==0){
            inputs$educationDuration_2<-inputs$schooling_years_2
          }

          # Schooling costs
          inputs$tuition_fees_2<-isolate(as.numeric(input$tuition_fees_2))
          inputs$Grants_2<-isolate(as.numeric(input$Grants_2))
          inputs$loans_2<-isolate(as.numeric(input$loans_2))
        }

        # Education + work
        if(edu_req_2=="yes_custom" & work_inschool_2=="yes"){
          inputs$hours_inschool_2<-isolate(input$hours_inschool_2)
          inputs$wage_inschool_2<-isolate(input$wage_inschool_2)

          inputs$schooling_years_2<-isolate(as.numeric(input$schooling_years_2))
          inputs$schooling_months_2<-isolate(as.numeric(input$schooling_months_2))

          if(inputs$schooling_months_2>0){
            inputs$educationDuration_2<-inputs$schooling_years_2+1
          }else if(inputs$schooling_months_2==0){
            inputs$educationDuration_2<-inputs$schooling_years_2
          }

          # Schooling costs
          inputs$tuition_fees_2<-isolate(as.numeric(input$tuition_fees_2))
          inputs$Grants_2<-isolate(as.numeric(input$Grants_2))
          inputs$loans_2<-isolate(as.numeric(input$loans_2))
        }

      }

      # If none selected default to "empty"
      if(inputs$type_career_1=="empty"){
        inputs$choiceOccupation_1 <- "empty"
      }

      if(inputs$type_career_2=="empty"){
        inputs$choiceOccupation_2 <- "empty"
      }

      inputs$no_occupations_error <- 0
      if(inputs$type_career_1=="empty" & inputs$type_career_2=="empty"){

        inputs$type_career_1 <- "default"
        #inputs$choiceOccupation_1 <- "Counter Attendants, Cafeteria, Food Concession, and Coffee Shop"
        inputs$choiceOccupation_1 <- "Cashiers"

        # Health Insurance
        inputs$choiceOccupation.empl_healthcare_1<-0
        inputs$inschool.cont.empl_healthcare_1<-0

        inputs$startingWage_1<-NA
        inputs$experience_1<-0

        inputs$tuition_fees_1<-0
        inputs$Grants_1<-0
        inputs$loans_1<-0

        inputs$hours_inschool_1<-0
        inputs$wage_inschool_1<-0

        inputs$educationDuration_1<-0
        inputs$schooling_years_1<-0
        inputs$schooling_months_1<-0

        inputs$no_occupations_error <- 1
      }


      inputs2 <<- inputs
      #---------------------------------------------------------------------------
      # Public Assistance Programs
      #---------------------------------------------------------------------------
      benefitslist<-c()
      programs.section8 <- FALSE
      programs.rap <- FALSE 
      programs.frsp <- FALSE
      programs.careermap <- FALSE
      frsp_share<-0
      
      #programs.healthcare<-isolate(as.logical(input$healthcare))
      programs.medicaid_adults<-isolate(as.logical(input$medicaid_adults))
      if (programs.medicaid_adults)
        benefitslist<-c(benefitslist,"Medicaid for Adults")
      programs.medicaid_child<-isolate(as.logical(input$medicaid_child))
      if (programs.medicaid_child)
        benefitslist<-c(benefitslist,"Medicaid for Children/CHIP")
      programs.aca<-isolate(as.logical(input$aca))
      if (programs.aca)
        benefitslist<-c(benefitslist,"Health Insurance Marketplace Subsidy")
      programs.snap<-isolate(as.logical(input$snap))
      if (programs.snap)
        benefitslist<-c(benefitslist,"Supplemental Nutrition Assistance Program (SNAP)")
      programs.schoolMeals<-isolate(as.logical(input$schoolMeals))
      if (programs.schoolMeals)
        benefitslist<-c(benefitslist,"Free or Reduced Price School Meals")
      programs.wic<-isolate(as.logical(input$wic))
      if (programs.wic)
        benefitslist<-c(benefitslist,"Women, Infants and Children Nutrition Program (WIC)")
      programs.ccdf<-isolate(as.logical(input$ccdf))
      if (programs.ccdf) {
        if (inputs$stateAbbrev == "FL")
          benefitslist<-c(benefitslist,"CCDF/SR Plus")
        else
          benefitslist<-c(benefitslist,"Child Care Subsidy (CCDF)")
      }
      programs.ccdf_cont<-isolate(as.logical(input$ccdf_cont))
      programs.fates<-FALSE 
      programs.head_start<-isolate(as.logical(input$head_start))
      if (programs.head_start)
        benefitslist<-c(benefitslist,"Head Start")
      programs.prek<-isolate(as.logical(input$prek))
      if (programs.prek)
        benefitslist<-c(benefitslist,"State-Funded Pre-Kindergarten")
      programs.eitc<-isolate(as.logical(input$eitc))
      if (programs.eitc)
        benefitslist<-c(benefitslist,"Earned Income Tax Credit (EITC)")
      programs.ctc<-isolate(as.logical(input$ctc))
      if (programs.ctc)
        benefitslist<-c(benefitslist,"Child Tax Credit (CTC)")
      programs.cdctc<-isolate(as.logical(input$cdctc))
      if (programs.cdctc)
        benefitslist<-c(benefitslist,"Child and Dependent Care Tax Credit (CDCTC)")
      programs.section8<-isolate(as.logical(input$section8))
      programs.section8_cont<-isolate(as.logical(input$section8_cont))
      programs.tanf<-isolate(as.logical(input$tanf))
      if (programs.tanf)
        benefitslist<-c(benefitslist,"Temporary Assistance for Needy Families (TANF)")
    #  if(state != 'AL'){
      programs.ssdi<-isolate(as.logical(input$ssdi))
      if (programs.ssdi)
        benefitslist<-c(benefitslist,"Social Security Disability Insurance (SSDI)")
      programs.ssi<-isolate(as.logical(input$ssi))
      if (programs.ssi)
        benefitslist<-c(benefitslist,"Supplemental Security Income (SSI)")
    #  }else{
     #   programs.ssdi <- FALSE
    #    programs.ssi <- FALSE
    #  }
      
      if(state == "CT"){
        programs.rap <- isolate(as.logical(input$rap))
        if (programs.rap == TRUE & programs.section8 == TRUE){
          programs.section8 <- TRUE
          programs.rap <- FALSE
        }
      }
      
      if(state == "DC"){
        frsp<<-isolate(as.logical(input$frsp)) # FRSP Participation (participants pay 40% of their income towards rent) - ER 9/20/23: DC changed the program so that FRSP share is not 30%
        careerMap<<-isolate(as.logical(input$careerMap)) # Career Map Participation (participants pay 30% of their income towards rent)
        if(careerMap==TRUE & frsp==FALSE){ # If Career MAP is choosen, then set FRSP to true and share of income paid towards rent to 30%
          programs.frsp<-TRUE
          programs.careermap<-TRUE
          frsp_share<-0.3 # Assume Career MAP share of 30%
          programs.section8<-FALSE
        }


        if(careerMap==FALSE & frsp==TRUE){ # If FRSP is chosen, then set FRSP to true and share of income paid towards rent to 40%; ER 9/20/23: DC changed the program so that FRSP share is not 30%
          programs.frsp<-TRUE
          frsp_share<-0.3
        }

        if(careerMap==TRUE & frsp==TRUE){ # If both set to true - user error. Assume Career MAP
          programs.frsp<-TRUE
          programs.careermap<-TRUE
          frsp_share<-0.3 # Assume Career MAP share of 30%
          programs.section8<-FALSE
        }

        if(careerMap==FALSE & frsp==FALSE){ # If both set to false, then no program is applied
          programs.frsp<-FALSE
          frsp_share<-0
        }


        if(frsp==TRUE & programs.section8 == TRUE){ # These programs are mutually exclusive
          programs.frsp <- TRUE
          programs.section8<-FALSE
        }
      }
      
      if (programs.section8)
        benefitslist<-c(benefitslist,"Section 8 Housing Voucher")
      else if (programs.rap)
        benefitslist<-c(benefitslist,"RAP")
      else if (programs.careermap)
        benefitslist<-c(benefitslist,"Career MAP - Housing","Career MAP Income Support")
      else if (programs.frsp)
        benefitslist<-c(benefitslist,"FRSP")
      
      # Initial/Continuous Eligibility
      contelig.headstart <- isolate(as.logical(input$headstart_cont))
      contelig.earlyheadstart <- isolate(as.logical(input$earlyheadstart_cont))
      contelig.ccdf <- isolate(as.logical(input$ccdf_cont))

        # Disability amounts/Medicaid Interaction
      inputs$ssdiPIA1<-isolate(as.numeric(input$ssdiPIA1))

      if(partnered == "No"){
      inputs$ssdiPIA2<-isolate(as.numeric(input$ssdiPIA2))
      inputs$ssdiPIA3<-isolate(as.numeric(input$ssdiPIA3))
      inputs$ssdiPIA4<-isolate(as.numeric(input$ssdiPIA4))
      inputs$ssdiPIA5<-isolate(as.numeric(input$ssdiPIA5))
      inputs$ssdiPIA6<-isolate(as.numeric(input$ssdiPIA6))
      }else{
        inputs$ssdiPIA2<-isolate(as.numeric(input$ssdiPIA2_partnered))
        inputs$ssdiPIA3<-isolate(as.numeric(input$ssdiPIA3_partnered))
        inputs$ssdiPIA4<-isolate(as.numeric(input$ssdiPIA4_partnered))
        inputs$ssdiPIA5<-isolate(as.numeric(input$ssdiPIA5_partnered))
        inputs$ssdiPIA6<-isolate(as.numeric(input$ssdiPIA6_partnered))
      }

      if(state == "AL"){
        inputs$ssdiPIA1 <- 0
        inputs$ssdiPIA2 <- 0
        inputs$ssdiPIA3 <- 0
        inputs$ssdiPIA4 <- 0
        inputs$ssdiPIA5 <- 0
        inputs$ssdiPIA6 <- 0
      }


      inputs$disab.work.exp<-isolate(as.numeric(input$disab.work.exp))
      inputs$prev_ssi <- isolate(as.logical(input$prev_ssi))

      # inputs$ssdiPIA1 <- 0
      # inputs$ssdiPIA2 <- 0
      # inputs$ssdiPIA3 <- 0
      # inputs$ssdiPIA4 <- 0
      # inputs$ssdiPIA5 <- 0
      # inputs$ssdiPIA6 <- 0
      # inputs$disab.work.exp <- 0
      # inputs$prev_ssi <- FALSE

      # UNCOMMENT WHEN DISABILITY IS ADDED
      disab<-isolate(as.character(input$disab))
      disab_partner<-isolate(as.character(input$disab_partner))
      disab1<-isolate(as.character(input$disab1))
      disab2<-isolate(as.character(input$disab2))
      disab3<-isolate(as.character(input$disab3))
      disab4<-isolate(as.character(input$disab4))
      disab5<-isolate(as.character(input$disab5))
      disab6<-isolate(as.character(input$disab6))
      disab7<-isolate(as.character(input$disab7))
      disab8<-isolate(as.character(input$disab8))
      disab9<-isolate(as.character(input$disab9))
      disab10<-isolate(as.character(input$disab10))




      if(state == 'AL'){
        fam_disab <- "No"
        inputs$prev_ssi <- "No"
        programs.ssdi <- FALSE
        programs.ssi <- FALSE
        inputs$ssdiPIA1 <- 0
        inputs$ssdiPIA2 <- 0
        inputs$ssdiPIA3 <- 0
        inputs$ssdiPIA4 <- 0
        inputs$ssdiPIA5 <- 0
        inputs$ssdiPIA6 <- 0

      }



      inputs$ssi_ssdi_error <- 0

      if(fam_disab == "No" & (programs.ssdi == TRUE | programs.ssi == TRUE)){
        inputs$ssi_ssdi_error <- 1
      }else{
        inputs$ssi_ssdi_error <- 0
      }


      if(is.na(inputs$ssdiPIA1) | (programs.ssdi == TRUE & inputs$ssdiPIA1< 0) | (programs.ssdi==FALSE & inputs$ssdiPIA1< 0)){
        ssdi_error_1 <- 1
        inputs$ssdiPIA1<-0
      }else{
        ssdi_error_1 <- 0
      }

      if(is.na(inputs$ssdiPIA1) | (programs.ssdi == TRUE & inputs$ssdiPIA2< 0) | (programs.ssdi==FALSE & inputs$ssdiPIA2< 0)){
        ssdi_error_2 <- 1
        inputs$ssdiPIA2<-0
      }else{
        ssdi_error_2 <- 0
      }

      if(is.na(inputs$ssdiPIA1) | (programs.ssdi == TRUE & inputs$ssdiPIA3< 0) | (programs.ssdi==FALSE & inputs$ssdiPIA3< 0)){
        ssdi_error_3 <- 1
        inputs$ssdiPIA3<-0
      }else{
        ssdi_error_3 <- 0
      }

      if(is.na(inputs$ssdiPIA1) | (programs.ssdi == TRUE & inputs$ssdiPIA4< 0) | (programs.ssdi==FALSE & inputs$ssdiPIA4< 0)){
        ssdi_error_4 <- 1
        inputs$ssdiPIA4<-0
      }else{
        ssdi_error_4 <- 0
      }

      if(is.na(inputs$ssdiPIA1) | (programs.ssdi == TRUE & inputs$ssdiPIA5< 0) | (programs.ssdi==FALSE & inputs$ssdiPIA5< 0)){
        ssdi_error_5 <- 1
        inputs$ssdiPIA5<-0
      }else{
        ssdi_error_5 <- 0
      }

      if(is.na(inputs$ssdiPIA1) | (programs.ssdi == TRUE & inputs$ssdiPIA6< 0) | (programs.ssdi==FALSE & inputs$ssdiPIA6< 0)){
        ssdi_error_6 <- 1
        inputs$ssdiPIA6<-0
      }else{
        ssdi_error_6 <- 0
      }

      inputs$ssdi_error <- 0
      if(ssdi_error_1 == 1 | ssdi_error_2 == 1 |ssdi_error_3 == 1 |ssdi_error_4 == 1 | ssdi_error_5 == 1 | ssdi_error_6 == 1){
        inputs$ssdi_error <- 1
      }else{
        inputs$ssdi_error <- 0
      }



      inputs$ssdi_no_adults <- 0


      if(programs.ssdi == TRUE & fam_disab=="Yes"){

        if(partnered == "Yes" & disab == "No" & disab_partner == "No" & disab1 == "No" & disab2 == "No" & disab3 == "No" & disab4 == "No"){
          #if(d)
          inputs$ssdi_no_adults <- 1
        }else if(partnered == "No" & disab == "No" & disab1 == "No" & disab2 == "No" & disab3 == "No" & disab4 == "No" & disab5 == "No"){
          inputs$ssdi_no_adults <- 1
        }else{
          inputs$ssdi_no_adults <- 0
        }

      }



      if(isolate(as.logical(input$prev_ssi))==TRUE){
        inputs$prev_ssi<-1
      }else
      {inputs$prev_ssi<-0}

      inputs$xyz <- 0
      if((programs.ssdi == TRUE) & ((inputs$ssdiPIA1==0 & inputs$ssdiPIA2==0 & inputs$ssdiPIA3==0 & inputs$ssdiPIA4==0 & inputs$ssdiPIA5==0 & inputs$ssdiPIA6==0) | is.na(sum(inputs$ssdiPIA1, inputs$ssdiPIA2, inputs$ssdiPIA3, inputs$ssdiPIA4, inputs$ssdiPIA5, inputs$ssdiPIA6)))){
        inputs$xyz <- 1
      }

      inputs$xyz <- 0


      fam_disab_error <- 0
      if(fam_disab=="empty"){
        fam_disab_error <- 1
        fam_disab <- "No"
      }else{
        fam_disab_error <- 0
      }

      inputs$fam_disab_error <- fam_disab_error


      # Reverse the logical conditions
      if(contelig.headstart==TRUE){contelig.headstart<-FALSE}else if(contelig.headstart==FALSE){contelig.headstart<-TRUE} # box is checked so apply initial eligibility rules
      if(contelig.earlyheadstart==TRUE){contelig.earlyheadstart<-FALSE}else if(contelig.earlyheadstart==FALSE){contelig.earlyheadstart<-TRUE}
      if(contelig.ccdf==TRUE){contelig.ccdf<-FALSE}else if(contelig.ccdf==FALSE){contelig.ccdf<-TRUE}


      #---------------------------------------------------------------------------
      # Additional Assistance
      #---------------------------------------------------------------------------
      assistance.list<-list()

      ###########################
      # Cash
      ##########################

      # Horizon = 10
      assistance.list$assistance.year1.10<-isolate(as.numeric(input$assistance.year1.10))*12
      assistance.list$assistance.year2.10<-isolate(as.numeric(input$assistance.year2.10))*12
      assistance.list$assistance.year3.10<-isolate(as.numeric(input$assistance.year3.10))*12
      assistance.list$assistance.year4.10<-isolate(as.numeric(input$assistance.year4.10))*12
      assistance.list$assistance.year5.10<-isolate(as.numeric(input$assistance.year5.10))*12
      assistance.list$assistance.year6.10<-isolate(as.numeric(input$assistance.year6.10))*12
      assistance.list$assistance.year7.10<-isolate(as.numeric(input$assistance.year7.10))*12
      assistance.list$assistance.year8.10<-isolate(as.numeric(input$assistance.year8.10))*12
      assistance.list$assistance.year9.10<-isolate(as.numeric(input$assistance.year9.10))*12
      assistance.list$assistance.year10.10<-isolate(as.numeric(input$assistance.year10.10))*12

      # Horizon = 9
      assistance.list$assistance.year1.9<-isolate(as.numeric(input$assistance.year1.9))*12
      assistance.list$assistance.year2.9<-isolate(as.numeric(input$assistance.year2.9))*12
      assistance.list$assistance.year3.9<-isolate(as.numeric(input$assistance.year3.9))*12
      assistance.list$assistance.year4.9<-isolate(as.numeric(input$assistance.year4.9))*12
      assistance.list$assistance.year5.9<-isolate(as.numeric(input$assistance.year5.9))*12
      assistance.list$assistance.year6.9<-isolate(as.numeric(input$assistance.year6.9))*12
      assistance.list$assistance.year7.9<-isolate(as.numeric(input$assistance.year7.9))*12
      assistance.list$assistance.year8.9<-isolate(as.numeric(input$assistance.year8.9))*12
      assistance.list$assistance.year9.9<-isolate(as.numeric(input$assistance.year9.9))*12

      # Horizon = 8
      assistance.list$assistance.year1.8<-isolate(as.numeric(input$assistance.year1.8))*12
      assistance.list$assistance.year2.8<-isolate(as.numeric(input$assistance.year2.8))*12
      assistance.list$assistance.year3.8<-isolate(as.numeric(input$assistance.year3.8))*12
      assistance.list$assistance.year4.8<-isolate(as.numeric(input$assistance.year4.8))*12
      assistance.list$assistance.year5.8<-isolate(as.numeric(input$assistance.year5.8))*12
      assistance.list$assistance.year6.8<-isolate(as.numeric(input$assistance.year6.8))*12
      assistance.list$assistance.year7.8<-isolate(as.numeric(input$assistance.year7.8))*12
      assistance.list$assistance.year8.8<-isolate(as.numeric(input$assistance.year8.8))*12

      # Horizon = 7
      assistance.list$assistance.year1.7<-isolate(as.numeric(input$assistance.year1.7))*12
      assistance.list$assistance.year2.7<-isolate(as.numeric(input$assistance.year2.7))*12
      assistance.list$assistance.year3.7<-isolate(as.numeric(input$assistance.year3.7))*12
      assistance.list$assistance.year4.7<-isolate(as.numeric(input$assistance.year4.7))*12
      assistance.list$assistance.year5.7<-isolate(as.numeric(input$assistance.year5.7))*12
      assistance.list$assistance.year6.7<-isolate(as.numeric(input$assistance.year6.7))*12
      assistance.list$assistance.year7.7<-isolate(as.numeric(input$assistance.year7.7))*12

      # Horizon = 6
      assistance.list$assistance.year1.6<-isolate(as.numeric(input$assistance.year1.6))*12
      assistance.list$assistance.year2.6<-isolate(as.numeric(input$assistance.year2.6))*12
      assistance.list$assistance.year3.6<-isolate(as.numeric(input$assistance.year3.6))*12
      assistance.list$assistance.year4.6<-isolate(as.numeric(input$assistance.year4.6))*12
      assistance.list$assistance.year5.6<-isolate(as.numeric(input$assistance.year5.6))*12
      assistance.list$assistance.year6.6<-isolate(as.numeric(input$assistance.year6.6))*12

      # Horizon = 5
      assistance.list$assistance.year1.5<-isolate(as.numeric(input$assistance.year1.5))*12
      assistance.list$assistance.year2.5<-isolate(as.numeric(input$assistance.year2.5))*12
      assistance.list$assistance.year3.5<-isolate(as.numeric(input$assistance.year3.5))*12
      assistance.list$assistance.year4.5<-isolate(as.numeric(input$assistance.year4.5))*12
      assistance.list$assistance.year5.5<-isolate(as.numeric(input$assistance.year5.5))*12

      # Horizon = 4
      assistance.list$assistance.year1.4<-isolate(as.numeric(input$assistance.year1.4))*12
      assistance.list$assistance.year2.4<-isolate(as.numeric(input$assistance.year2.4))*12
      assistance.list$assistance.year3.4<-isolate(as.numeric(input$assistance.year3.4))*12
      assistance.list$assistance.year4.4<-isolate(as.numeric(input$assistance.year4.4))*12

      # Horizon = 3
      assistance.list$assistance.year1.3<-isolate(as.numeric(input$assistance.year1.3))*12
      assistance.list$assistance.year2.3<-isolate(as.numeric(input$assistance.year2.3))*12
      assistance.list$assistance.year3.3<-isolate(as.numeric(input$assistance.year3.3))*12

      # Horizon = 2
      assistance.list$assistance.year1.2<-isolate(as.numeric(input$assistance.year1.2))*12
      assistance.list$assistance.year2.2<-isolate(as.numeric(input$assistance.year2.2))*12

      # Horizon = 1
      assistance.list$assistance.year1.1<-isolate(as.numeric(input$assistance.year1.1))*12

      assistance.tax.list<-list()




      # Horizon = 10
      assistance.tax.list$assistance.tax.year1.10<-isolate(as.numeric(input$assistance.tax.year1.10))*12
      assistance.tax.list$assistance.tax.year2.10<-isolate(as.numeric(input$assistance.tax.year2.10))*12
      assistance.tax.list$assistance.tax.year3.10<-isolate(as.numeric(input$assistance.tax.year3.10))*12
      assistance.tax.list$assistance.tax.year4.10<-isolate(as.numeric(input$assistance.tax.year4.10))*12
      assistance.tax.list$assistance.tax.year5.10<-isolate(as.numeric(input$assistance.tax.year5.10))*12
      assistance.tax.list$assistance.tax.year6.10<-isolate(as.numeric(input$assistance.tax.year6.10))*12
      assistance.tax.list$assistance.tax.year7.10<-isolate(as.numeric(input$assistance.tax.year7.10))*12
      assistance.tax.list$assistance.tax.year8.10<-isolate(as.numeric(input$assistance.tax.year8.10))*12
      assistance.tax.list$assistance.tax.year9.10<-isolate(as.numeric(input$assistance.tax.year9.10))*12
      assistance.tax.list$assistance.tax.year10.10<-isolate(as.numeric(input$assistance.tax.year10.10))*12

      # Horizon = 9
      assistance.tax.list$assistance.tax.year1.9<-isolate(as.numeric(input$assistance.tax.year1.9))*12
      assistance.tax.list$assistance.tax.year2.9<-isolate(as.numeric(input$assistance.tax.year2.9))*12
      assistance.tax.list$assistance.tax.year3.9<-isolate(as.numeric(input$assistance.tax.year3.9))*12
      assistance.tax.list$assistance.tax.year4.9<-isolate(as.numeric(input$assistance.tax.year4.9))*12
      assistance.tax.list$assistance.tax.year5.9<-isolate(as.numeric(input$assistance.tax.year5.9))*12
      assistance.tax.list$assistance.tax.year6.9<-isolate(as.numeric(input$assistance.tax.year6.9))*12
      assistance.tax.list$assistance.tax.year7.9<-isolate(as.numeric(input$assistance.tax.year7.9))*12
      assistance.tax.list$assistance.tax.year8.9<-isolate(as.numeric(input$assistance.tax.year8.9))*12
      assistance.tax.list$assistance.tax.year9.9<-isolate(as.numeric(input$assistance.tax.year9.9))*12

      # Horizon = 8
      assistance.tax.list$assistance.tax.year1.8<-isolate(as.numeric(input$assistance.tax.year1.8))*12
      assistance.tax.list$assistance.tax.year2.8<-isolate(as.numeric(input$assistance.tax.year2.8))*12
      assistance.tax.list$assistance.tax.year3.8<-isolate(as.numeric(input$assistance.tax.year3.8))*12
      assistance.tax.list$assistance.tax.year4.8<-isolate(as.numeric(input$assistance.tax.year4.8))*12
      assistance.tax.list$assistance.tax.year5.8<-isolate(as.numeric(input$assistance.tax.year5.8))*12
      assistance.tax.list$assistance.tax.year6.8<-isolate(as.numeric(input$assistance.tax.year6.8))*12
      assistance.tax.list$assistance.tax.year7.8<-isolate(as.numeric(input$assistance.tax.year7.8))*12
      assistance.tax.list$assistance.tax.year8.8<-isolate(as.numeric(input$assistance.tax.year8.8))*12

      # Horizon = 7
      assistance.tax.list$assistance.tax.year1.7<-isolate(as.numeric(input$assistance.tax.year1.7))*12
      assistance.tax.list$assistance.tax.year2.7<-isolate(as.numeric(input$assistance.tax.year2.7))*12
      assistance.tax.list$assistance.tax.year3.7<-isolate(as.numeric(input$assistance.tax.year3.7))*12
      assistance.tax.list$assistance.tax.year4.7<-isolate(as.numeric(input$assistance.tax.year4.7))*12
      assistance.tax.list$assistance.tax.year5.7<-isolate(as.numeric(input$assistance.tax.year5.7))*12
      assistance.tax.list$assistance.tax.year6.7<-isolate(as.numeric(input$assistance.tax.year6.7))*12
      assistance.tax.list$assistance.tax.year7.7<-isolate(as.numeric(input$assistance.tax.year7.7))*12

      # Horizon = 6
      assistance.tax.list$assistance.tax.year1.6<-isolate(as.numeric(input$assistance.tax.year1.6))*12
      assistance.tax.list$assistance.tax.year2.6<-isolate(as.numeric(input$assistance.tax.year2.6))*12
      assistance.tax.list$assistance.tax.year3.6<-isolate(as.numeric(input$assistance.tax.year3.6))*12
      assistance.tax.list$assistance.tax.year4.6<-isolate(as.numeric(input$assistance.tax.year4.6))*12
      assistance.tax.list$assistance.tax.year5.6<-isolate(as.numeric(input$assistance.tax.year5.6))*12
      assistance.tax.list$assistance.tax.year6.6<-isolate(as.numeric(input$assistance.tax.year6.6))*12

      # Horizon = 5
      assistance.tax.list$assistance.tax.year1.5<-isolate(as.numeric(input$assistance.tax.year1.5))*12
      assistance.tax.list$assistance.tax.year2.5<-isolate(as.numeric(input$assistance.tax.year2.5))*12
      assistance.tax.list$assistance.tax.year3.5<-isolate(as.numeric(input$assistance.tax.year3.5))*12
      assistance.tax.list$assistance.tax.year4.5<-isolate(as.numeric(input$assistance.tax.year4.5))*12
      assistance.tax.list$assistance.tax.year5.5<-isolate(as.numeric(input$assistance.tax.year5.5))*12

      # Horizon = 4
      assistance.tax.list$assistance.tax.year1.4<-isolate(as.numeric(input$assistance.tax.year1.4))*12
      assistance.tax.list$assistance.tax.year2.4<-isolate(as.numeric(input$assistance.tax.year2.4))*12
      assistance.tax.list$assistance.tax.year3.4<-isolate(as.numeric(input$assistance.tax.year3.4))*12
      assistance.tax.list$assistance.tax.year4.4<-isolate(as.numeric(input$assistance.tax.year4.4))*12

      # Horizon = 3
      assistance.tax.list$assistance.tax.year1.3<-isolate(as.numeric(input$assistance.tax.year1.3))*12
      assistance.tax.list$assistance.tax.year2.3<-isolate(as.numeric(input$assistance.tax.year2.3))*12
      assistance.tax.list$assistance.tax.year3.3<-isolate(as.numeric(input$assistance.tax.year3.3))*12

      # Horizon = 2
      assistance.tax.list$assistance.tax.year1.2<-isolate(as.numeric(input$assistance.tax.year1.2))*12
      assistance.tax.list$assistance.tax.year2.2<-isolate(as.numeric(input$assistance.tax.year2.2))*12

      # Horizon = 1
      assistance.tax.list$assistance.tax.year1.1<-isolate(as.numeric(input$assistance.tax.year1.1))*12

       #---------------------------------------------------------------------------
      # Custom Expenses    ################# ADD EXP.TECH TO EACH HORIZON############################################
      #---------------------------------------------------------------------------
      expenses.list<-list()

      # Horizon = 10
      expenses.list$exp.rentormortgage.year1.10<-isolate(as.numeric(input$exp.rentormortgage.year1.10))*12
      expenses.list$exp.rentormortgage.year2.10<-isolate(as.numeric(input$exp.rentormortgage.year2.10))*12
      expenses.list$exp.rentormortgage.year3.10<-isolate(as.numeric(input$exp.rentormortgage.year3.10))*12
      expenses.list$exp.rentormortgage.year4.10<-isolate(as.numeric(input$exp.rentormortgage.year4.10))*12
      expenses.list$exp.rentormortgage.year5.10<-isolate(as.numeric(input$exp.rentormortgage.year5.10))*12
      expenses.list$exp.rentormortgage.year6.10<-isolate(as.numeric(input$exp.rentormortgage.year6.10))*12
      expenses.list$exp.rentormortgage.year7.10<-isolate(as.numeric(input$exp.rentormortgage.year7.10))*12
      expenses.list$exp.rentormortgage.year8.10<-isolate(as.numeric(input$exp.rentormortgage.year8.10))*12
      expenses.list$exp.rentormortgage.year9.10<-isolate(as.numeric(input$exp.rentormortgage.year9.10))*12
      expenses.list$exp.rentormortgage.year10.10<-isolate(as.numeric(input$exp.rentormortgage.year10.10))*12

      expenses.list$exp.utilities.year1.10<-isolate(as.numeric(input$exp.utilities.year1.10))*12
      expenses.list$exp.utilities.year2.10<-isolate(as.numeric(input$exp.utilities.year2.10))*12
      expenses.list$exp.utilities.year3.10<-isolate(as.numeric(input$exp.utilities.year3.10))*12
      expenses.list$exp.utilities.year4.10<-isolate(as.numeric(input$exp.utilities.year4.10))*12
      expenses.list$exp.utilities.year5.10<-isolate(as.numeric(input$exp.utilities.year5.10))*12
      expenses.list$exp.utilities.year6.10<-isolate(as.numeric(input$exp.utilities.year6.10))*12
      expenses.list$exp.utilities.year7.10<-isolate(as.numeric(input$exp.utilities.year7.10))*12
      expenses.list$exp.utilities.year8.10<-isolate(as.numeric(input$exp.utilities.year8.10))*12
      expenses.list$exp.utilities.year9.10<-isolate(as.numeric(input$exp.utilities.year9.10))*12
      expenses.list$exp.utilities.year10.10<-isolate(as.numeric(input$exp.utilities.year10.10))*12

      expenses.list$exp.childcare.year1.10<-isolate(as.numeric(input$exp.childcare.year1.10))*12
      expenses.list$exp.childcare.year2.10<-isolate(as.numeric(input$exp.childcare.year2.10))*12
      expenses.list$exp.childcare.year3.10<-isolate(as.numeric(input$exp.childcare.year3.10))*12
      expenses.list$exp.childcare.year4.10<-isolate(as.numeric(input$exp.childcare.year4.10))*12
      expenses.list$exp.childcare.year5.10<-isolate(as.numeric(input$exp.childcare.year5.10))*12
      expenses.list$exp.childcare.year6.10<-isolate(as.numeric(input$exp.childcare.year6.10))*12
      expenses.list$exp.childcare.year7.10<-isolate(as.numeric(input$exp.childcare.year7.10))*12
      expenses.list$exp.childcare.year8.10<-isolate(as.numeric(input$exp.childcare.year8.10))*12
      expenses.list$exp.childcare.year9.10<-isolate(as.numeric(input$exp.childcare.year9.10))*12
      expenses.list$exp.childcare.year10.10<-isolate(as.numeric(input$exp.childcare.year10.10))*12

      expenses.list$exp.oop.year1.10<-isolate(as.numeric(input$exp.oop.year1.10))*12
      expenses.list$exp.oop.year2.10<-isolate(as.numeric(input$exp.oop.year2.10))*12
      expenses.list$exp.oop.year3.10<-isolate(as.numeric(input$exp.oop.year3.10))*12
      expenses.list$exp.oop.year4.10<-isolate(as.numeric(input$exp.oop.year4.10))*12
      expenses.list$exp.oop.year5.10<-isolate(as.numeric(input$exp.oop.year5.10))*12
      expenses.list$exp.oop.year6.10<-isolate(as.numeric(input$exp.oop.year6.10))*12
      expenses.list$exp.oop.year7.10<-isolate(as.numeric(input$exp.oop.year7.10))*12
      expenses.list$exp.oop.year8.10<-isolate(as.numeric(input$exp.oop.year8.10))*12
      expenses.list$exp.oop.year9.10<-isolate(as.numeric(input$exp.oop.year9.10))*12
      expenses.list$exp.oop.year10.10<-isolate(as.numeric(input$exp.oop.year10.10))*12

      expenses.list$exp.food.year1.10<-isolate(as.numeric(input$exp.food.year1.10))*12
      expenses.list$exp.food.year2.10<-isolate(as.numeric(input$exp.food.year2.10))*12
      expenses.list$exp.food.year3.10<-isolate(as.numeric(input$exp.food.year3.10))*12
      expenses.list$exp.food.year4.10<-isolate(as.numeric(input$exp.food.year4.10))*12
      expenses.list$exp.food.year5.10<-isolate(as.numeric(input$exp.food.year5.10))*12
      expenses.list$exp.food.year6.10<-isolate(as.numeric(input$exp.food.year6.10))*12
      expenses.list$exp.food.year7.10<-isolate(as.numeric(input$exp.food.year7.10))*12
      expenses.list$exp.food.year8.10<-isolate(as.numeric(input$exp.food.year8.10))*12
      expenses.list$exp.food.year9.10<-isolate(as.numeric(input$exp.food.year9.10))*12
      expenses.list$exp.food.year10.10<-isolate(as.numeric(input$exp.food.year10.10))*12

      expenses.list$exp.transportation.year1.10<-isolate(as.numeric(input$exp.transportation.year1.10))*12
      expenses.list$exp.transportation.year2.10<-isolate(as.numeric(input$exp.transportation.year2.10))*12
      expenses.list$exp.transportation.year3.10<-isolate(as.numeric(input$exp.transportation.year3.10))*12
      expenses.list$exp.transportation.year4.10<-isolate(as.numeric(input$exp.transportation.year4.10))*12
      expenses.list$exp.transportation.year5.10<-isolate(as.numeric(input$exp.transportation.year5.10))*12
      expenses.list$exp.transportation.year6.10<-isolate(as.numeric(input$exp.transportation.year6.10))*12
      expenses.list$exp.transportation.year7.10<-isolate(as.numeric(input$exp.transportation.year7.10))*12
      expenses.list$exp.transportation.year8.10<-isolate(as.numeric(input$exp.transportation.year8.10))*12
      expenses.list$exp.transportation.year9.10<-isolate(as.numeric(input$exp.transportation.year9.10))*12
      expenses.list$exp.transportation.year10.10<-isolate(as.numeric(input$exp.transportation.year10.10))*12

      expenses.list$exp.tech.year1.10<-isolate(as.numeric(input$exp.tech.year1.10))*12
      expenses.list$exp.tech.year2.10<-isolate(as.numeric(input$exp.tech.year2.10))*12
      expenses.list$exp.tech.year3.10<-isolate(as.numeric(input$exp.tech.year3.10))*12
      expenses.list$exp.tech.year4.10<-isolate(as.numeric(input$exp.tech.year4.10))*12
      expenses.list$exp.tech.year5.10<-isolate(as.numeric(input$exp.tech.year5.10))*12
      expenses.list$exp.tech.year6.10<-isolate(as.numeric(input$exp.tech.year6.10))*12
      expenses.list$exp.tech.year7.10<-isolate(as.numeric(input$exp.tech.year7.10))*12
      expenses.list$exp.tech.year8.10<-isolate(as.numeric(input$exp.tech.year8.10))*12
      expenses.list$exp.tech.year9.10<-isolate(as.numeric(input$exp.tech.year9.10))*12
      expenses.list$exp.tech.year10.10<-isolate(as.numeric(input$exp.tech.year10.10))*12

      expenses.list$exp.misc.year1.10<-isolate(as.numeric(input$exp.misc.year1.10))*12
      expenses.list$exp.misc.year2.10<-isolate(as.numeric(input$exp.misc.year2.10))*12
      expenses.list$exp.misc.year3.10<-isolate(as.numeric(input$exp.misc.year3.10))*12
      expenses.list$exp.misc.year4.10<-isolate(as.numeric(input$exp.misc.year4.10))*12
      expenses.list$exp.misc.year5.10<-isolate(as.numeric(input$exp.misc.year5.10))*12
      expenses.list$exp.misc.year6.10<-isolate(as.numeric(input$exp.misc.year6.10))*12
      expenses.list$exp.misc.year7.10<-isolate(as.numeric(input$exp.misc.year7.10))*12
      expenses.list$exp.misc.year8.10<-isolate(as.numeric(input$exp.misc.year8.10))*12
      expenses.list$exp.misc.year9.10<-isolate(as.numeric(input$exp.misc.year9.10))*12
      expenses.list$exp.misc.year10.10<-isolate(as.numeric(input$exp.misc.year10.10))*12

      expenses.list$loans.year1.10<-isolate(as.numeric(input$loans.year1.10))*12
      expenses.list$loans.year2.10<-isolate(as.numeric(input$loans.year2.10))*12
      expenses.list$loans.year3.10<-isolate(as.numeric(input$loans.year3.10))*12
      expenses.list$loans.year4.10<-isolate(as.numeric(input$loans.year4.10))*12
      expenses.list$loans.year5.10<-isolate(as.numeric(input$loans.year5.10))*12

      expenses.list$loans.year6.10<-isolate(as.numeric(input$loans.year6.10))*12
      expenses.list$loans.year7.10<-isolate(as.numeric(input$loans.year7.10))*12
      expenses.list$loans.year8.10<-isolate(as.numeric(input$loans.year8.10))*12
      expenses.list$loans.year9.10<-isolate(as.numeric(input$loans.year9.10))*12
      expenses.list$loans.year10.10<-isolate(as.numeric(input$loans.year10.10))*12

      # Horizon = 9
      expenses.list$exp.rentormortgage.year1.9<-isolate(as.numeric(input$exp.rentormortgage.year1.9))*12
      expenses.list$exp.rentormortgage.year2.9<-isolate(as.numeric(input$exp.rentormortgage.year2.9))*12
      expenses.list$exp.rentormortgage.year3.9<-isolate(as.numeric(input$exp.rentormortgage.year3.9))*12
      expenses.list$exp.rentormortgage.year4.9<-isolate(as.numeric(input$exp.rentormortgage.year4.9))*12
      expenses.list$exp.rentormortgage.year5.9<-isolate(as.numeric(input$exp.rentormortgage.year5.9))*12
      expenses.list$exp.rentormortgage.year6.9<-isolate(as.numeric(input$exp.rentormortgage.year6.9))*12
      expenses.list$exp.rentormortgage.year7.9<-isolate(as.numeric(input$exp.rentormortgage.year7.9))*12
      expenses.list$exp.rentormortgage.year8.9<-isolate(as.numeric(input$exp.rentormortgage.year8.9))*12
      expenses.list$exp.rentormortgage.year9.9<-isolate(as.numeric(input$exp.rentormortgage.year9.9))*12

      expenses.list$exp.utilities.year1.9<-isolate(as.numeric(input$exp.utilities.year1.9))*12
      expenses.list$exp.utilities.year2.9<-isolate(as.numeric(input$exp.utilities.year2.9))*12
      expenses.list$exp.utilities.year3.9<-isolate(as.numeric(input$exp.utilities.year3.9))*12
      expenses.list$exp.utilities.year4.9<-isolate(as.numeric(input$exp.utilities.year4.9))*12
      expenses.list$exp.utilities.year5.9<-isolate(as.numeric(input$exp.utilities.year5.9))*12
      expenses.list$exp.utilities.year6.9<-isolate(as.numeric(input$exp.utilities.year6.9))*12
      expenses.list$exp.utilities.year7.9<-isolate(as.numeric(input$exp.utilities.year7.9))*12
      expenses.list$exp.utilities.year8.9<-isolate(as.numeric(input$exp.utilities.year8.9))*12
      expenses.list$exp.utilities.year9.9<-isolate(as.numeric(input$exp.utilities.year9.9))*12

      expenses.list$exp.childcare.year1.9<-isolate(as.numeric(input$exp.childcare.year1.9))*12
      expenses.list$exp.childcare.year2.9<-isolate(as.numeric(input$exp.childcare.year2.9))*12
      expenses.list$exp.childcare.year3.9<-isolate(as.numeric(input$exp.childcare.year3.9))*12
      expenses.list$exp.childcare.year4.9<-isolate(as.numeric(input$exp.childcare.year4.9))*12
      expenses.list$exp.childcare.year5.9<-isolate(as.numeric(input$exp.childcare.year5.9))*12
      expenses.list$exp.childcare.year6.9<-isolate(as.numeric(input$exp.childcare.year6.9))*12
      expenses.list$exp.childcare.year7.9<-isolate(as.numeric(input$exp.childcare.year7.9))*12
      expenses.list$exp.childcare.year8.9<-isolate(as.numeric(input$exp.childcare.year8.9))*12
      expenses.list$exp.childcare.year9.9<-isolate(as.numeric(input$exp.childcare.year9.9))*12

      expenses.list$exp.oop.year1.9<-isolate(as.numeric(input$exp.oop.year1.9))*12
      expenses.list$exp.oop.year2.9<-isolate(as.numeric(input$exp.oop.year2.9))*12
      expenses.list$exp.oop.year3.9<-isolate(as.numeric(input$exp.oop.year3.9))*12
      expenses.list$exp.oop.year4.9<-isolate(as.numeric(input$exp.oop.year4.9))*12
      expenses.list$exp.oop.year5.9<-isolate(as.numeric(input$exp.oop.year5.9))*12
      expenses.list$exp.oop.year6.9<-isolate(as.numeric(input$exp.oop.year6.9))*12
      expenses.list$exp.oop.year7.9<-isolate(as.numeric(input$exp.oop.year7.9))*12
      expenses.list$exp.oop.year8.9<-isolate(as.numeric(input$exp.oop.year8.9))*12
      expenses.list$exp.oop.year9.9<-isolate(as.numeric(input$exp.oop.year9.9))*12

      expenses.list$exp.food.year1.9<-isolate(as.numeric(input$exp.food.year1.9))*12
      expenses.list$exp.food.year2.9<-isolate(as.numeric(input$exp.food.year2.9))*12
      expenses.list$exp.food.year3.9<-isolate(as.numeric(input$exp.food.year3.9))*12
      expenses.list$exp.food.year4.9<-isolate(as.numeric(input$exp.food.year4.9))*12
      expenses.list$exp.food.year5.9<-isolate(as.numeric(input$exp.food.year5.9))*12
      expenses.list$exp.food.year6.9<-isolate(as.numeric(input$exp.food.year6.9))*12
      expenses.list$exp.food.year7.9<-isolate(as.numeric(input$exp.food.year7.9))*12
      expenses.list$exp.food.year8.9<-isolate(as.numeric(input$exp.food.year8.9))*12
      expenses.list$exp.food.year9.9<-isolate(as.numeric(input$exp.food.year9.9))*12

      expenses.list$exp.transportation.year1.9<-isolate(as.numeric(input$exp.transportation.year1.9))*12
      expenses.list$exp.transportation.year2.9<-isolate(as.numeric(input$exp.transportation.year2.9))*12
      expenses.list$exp.transportation.year3.9<-isolate(as.numeric(input$exp.transportation.year3.9))*12
      expenses.list$exp.transportation.year4.9<-isolate(as.numeric(input$exp.transportation.year4.9))*12
      expenses.list$exp.transportation.year5.9<-isolate(as.numeric(input$exp.transportation.year5.9))*12
      expenses.list$exp.transportation.year6.9<-isolate(as.numeric(input$exp.transportation.year6.9))*12
      expenses.list$exp.transportation.year7.9<-isolate(as.numeric(input$exp.transportation.year7.9))*12
      expenses.list$exp.transportation.year8.9<-isolate(as.numeric(input$exp.transportation.year8.9))*12
      expenses.list$exp.transportation.year9.9<-isolate(as.numeric(input$exp.transportation.year9.9))*12

      expenses.list$exp.tech.year1.9<-isolate(as.numeric(input$exp.tech.year1.9))*12
      expenses.list$exp.tech.year2.9<-isolate(as.numeric(input$exp.tech.year2.9))*12
      expenses.list$exp.tech.year3.9<-isolate(as.numeric(input$exp.tech.year3.9))*12
      expenses.list$exp.tech.year4.9<-isolate(as.numeric(input$exp.tech.year4.9))*12
      expenses.list$exp.tech.year5.9<-isolate(as.numeric(input$exp.tech.year5.9))*12
      expenses.list$exp.tech.year6.9<-isolate(as.numeric(input$exp.tech.year6.9))*12
      expenses.list$exp.tech.year7.9<-isolate(as.numeric(input$exp.tech.year7.9))*12
      expenses.list$exp.tech.year8.9<-isolate(as.numeric(input$exp.tech.year8.9))*12
      expenses.list$exp.tech.year9.9<-isolate(as.numeric(input$exp.tech.year9.9))*12

      expenses.list$exp.misc.year1.9<-isolate(as.numeric(input$exp.misc.year1.9))*12
      expenses.list$exp.misc.year2.9<-isolate(as.numeric(input$exp.misc.year2.9))*12
      expenses.list$exp.misc.year3.9<-isolate(as.numeric(input$exp.misc.year3.9))*12
      expenses.list$exp.misc.year4.9<-isolate(as.numeric(input$exp.misc.year4.9))*12
      expenses.list$exp.misc.year5.9<-isolate(as.numeric(input$exp.misc.year5.9))*12
      expenses.list$exp.misc.year6.9<-isolate(as.numeric(input$exp.misc.year6.9))*12
      expenses.list$exp.misc.year7.9<-isolate(as.numeric(input$exp.misc.year7.9))*12
      expenses.list$exp.misc.year8.9<-isolate(as.numeric(input$exp.misc.year8.9))*12
      expenses.list$exp.misc.year9.9<-isolate(as.numeric(input$exp.misc.year9.9))*12

      expenses.list$loans.year1.9<-isolate(as.numeric(input$loans.year1.9))*12
      expenses.list$loans.year2.9<-isolate(as.numeric(input$loans.year2.9))*12
      expenses.list$loans.year3.9<-isolate(as.numeric(input$loans.year3.9))*12
      expenses.list$loans.year4.9<-isolate(as.numeric(input$loans.year4.9))*12
      expenses.list$loans.year5.9<-isolate(as.numeric(input$loans.year5.9))*12

      expenses.list$loans.year6.9<-isolate(as.numeric(input$loans.year6.9))*12
      expenses.list$loans.year7.9<-isolate(as.numeric(input$loans.year7.9))*12
      expenses.list$loans.year8.9<-isolate(as.numeric(input$loans.year8.9))*12
      expenses.list$loans.year9.9<-isolate(as.numeric(input$loans.year9.9))*12

      # Horizon = 8
      expenses.list$exp.rentormortgage.year1.8<-isolate(as.numeric(input$exp.rentormortgage.year1.8))*12
      expenses.list$exp.rentormortgage.year2.8<-isolate(as.numeric(input$exp.rentormortgage.year2.8))*12
      expenses.list$exp.rentormortgage.year3.8<-isolate(as.numeric(input$exp.rentormortgage.year3.8))*12
      expenses.list$exp.rentormortgage.year4.8<-isolate(as.numeric(input$exp.rentormortgage.year4.8))*12
      expenses.list$exp.rentormortgage.year5.8<-isolate(as.numeric(input$exp.rentormortgage.year5.8))*12
      expenses.list$exp.rentormortgage.year6.8<-isolate(as.numeric(input$exp.rentormortgage.year6.8))*12
      expenses.list$exp.rentormortgage.year7.8<-isolate(as.numeric(input$exp.rentormortgage.year7.8))*12
      expenses.list$exp.rentormortgage.year8.8<-isolate(as.numeric(input$exp.rentormortgage.year8.8))*12

      expenses.list$exp.utilities.year1.8<-isolate(as.numeric(input$exp.utilities.year1.8))*12
      expenses.list$exp.utilities.year2.8<-isolate(as.numeric(input$exp.utilities.year2.8))*12
      expenses.list$exp.utilities.year3.8<-isolate(as.numeric(input$exp.utilities.year3.8))*12
      expenses.list$exp.utilities.year4.8<-isolate(as.numeric(input$exp.utilities.year4.8))*12
      expenses.list$exp.utilities.year5.8<-isolate(as.numeric(input$exp.utilities.year5.8))*12
      expenses.list$exp.utilities.year6.8<-isolate(as.numeric(input$exp.utilities.year6.8))*12
      expenses.list$exp.utilities.year7.8<-isolate(as.numeric(input$exp.utilities.year7.8))*12
      expenses.list$exp.utilities.year8.8<-isolate(as.numeric(input$exp.utilities.year8.8))*12

      expenses.list$exp.childcare.year1.8<-isolate(as.numeric(input$exp.childcare.year1.8))*12
      expenses.list$exp.childcare.year2.8<-isolate(as.numeric(input$exp.childcare.year2.8))*12
      expenses.list$exp.childcare.year3.8<-isolate(as.numeric(input$exp.childcare.year3.8))*12
      expenses.list$exp.childcare.year4.8<-isolate(as.numeric(input$exp.childcare.year4.8))*12
      expenses.list$exp.childcare.year5.8<-isolate(as.numeric(input$exp.childcare.year5.8))*12
      expenses.list$exp.childcare.year6.8<-isolate(as.numeric(input$exp.childcare.year6.8))*12
      expenses.list$exp.childcare.year7.8<-isolate(as.numeric(input$exp.childcare.year7.8))*12
      expenses.list$exp.childcare.year8.8<-isolate(as.numeric(input$exp.childcare.year8.8))*12

      expenses.list$exp.oop.year1.8<-isolate(as.numeric(input$exp.oop.year1.8))*12
      expenses.list$exp.oop.year2.8<-isolate(as.numeric(input$exp.oop.year2.8))*12
      expenses.list$exp.oop.year3.8<-isolate(as.numeric(input$exp.oop.year3.8))*12
      expenses.list$exp.oop.year4.8<-isolate(as.numeric(input$exp.oop.year4.8))*12
      expenses.list$exp.oop.year5.8<-isolate(as.numeric(input$exp.oop.year5.8))*12
      expenses.list$exp.oop.year6.8<-isolate(as.numeric(input$exp.oop.year6.8))*12
      expenses.list$exp.oop.year7.8<-isolate(as.numeric(input$exp.oop.year7.8))*12
      expenses.list$exp.oop.year8.8<-isolate(as.numeric(input$exp.oop.year8.8))*12

      expenses.list$exp.food.year1.8<-isolate(as.numeric(input$exp.food.year1.8))*12
      expenses.list$exp.food.year2.8<-isolate(as.numeric(input$exp.food.year2.8))*12
      expenses.list$exp.food.year3.8<-isolate(as.numeric(input$exp.food.year3.8))*12
      expenses.list$exp.food.year4.8<-isolate(as.numeric(input$exp.food.year4.8))*12
      expenses.list$exp.food.year5.8<-isolate(as.numeric(input$exp.food.year5.8))*12
      expenses.list$exp.food.year6.8<-isolate(as.numeric(input$exp.food.year6.8))*12
      expenses.list$exp.food.year7.8<-isolate(as.numeric(input$exp.food.year7.8))*12
      expenses.list$exp.food.year8.8<-isolate(as.numeric(input$exp.food.year8.8))*12

      expenses.list$exp.transportation.year1.8<-isolate(as.numeric(input$exp.transportation.year1.8))*12
      expenses.list$exp.transportation.year2.8<-isolate(as.numeric(input$exp.transportation.year2.8))*12
      expenses.list$exp.transportation.year3.8<-isolate(as.numeric(input$exp.transportation.year3.8))*12
      expenses.list$exp.transportation.year4.8<-isolate(as.numeric(input$exp.transportation.year4.8))*12
      expenses.list$exp.transportation.year5.8<-isolate(as.numeric(input$exp.transportation.year5.8))*12
      expenses.list$exp.transportation.year6.8<-isolate(as.numeric(input$exp.transportation.year6.8))*12
      expenses.list$exp.transportation.year7.8<-isolate(as.numeric(input$exp.transportation.year7.8))*12
      expenses.list$exp.transportation.year8.8<-isolate(as.numeric(input$exp.transportation.year8.8))*12

      expenses.list$exp.tech.year1.8<-isolate(as.numeric(input$exp.tech.year1.8))*12
      expenses.list$exp.tech.year2.8<-isolate(as.numeric(input$exp.tech.year2.8))*12
      expenses.list$exp.tech.year3.8<-isolate(as.numeric(input$exp.tech.year3.8))*12
      expenses.list$exp.tech.year4.8<-isolate(as.numeric(input$exp.tech.year4.8))*12
      expenses.list$exp.tech.year5.8<-isolate(as.numeric(input$exp.tech.year5.8))*12
      expenses.list$exp.tech.year6.8<-isolate(as.numeric(input$exp.tech.year6.8))*12
      expenses.list$exp.tech.year7.8<-isolate(as.numeric(input$exp.tech.year7.8))*12
      expenses.list$exp.tech.year8.8<-isolate(as.numeric(input$exp.tech.year8.8))*12

      expenses.list$exp.misc.year1.8<-isolate(as.numeric(input$exp.misc.year1.8))*12
      expenses.list$exp.misc.year2.8<-isolate(as.numeric(input$exp.misc.year2.8))*12
      expenses.list$exp.misc.year3.8<-isolate(as.numeric(input$exp.misc.year3.8))*12
      expenses.list$exp.misc.year4.8<-isolate(as.numeric(input$exp.misc.year4.8))*12
      expenses.list$exp.misc.year5.8<-isolate(as.numeric(input$exp.misc.year5.8))*12
      expenses.list$exp.misc.year6.8<-isolate(as.numeric(input$exp.misc.year6.8))*12
      expenses.list$exp.misc.year7.8<-isolate(as.numeric(input$exp.misc.year7.8))*12
      expenses.list$exp.misc.year8.8<-isolate(as.numeric(input$exp.misc.year8.8))*12

      expenses.list$loans.year1.8<-isolate(as.numeric(input$loans.year1.8))*12
      expenses.list$loans.year2.8<-isolate(as.numeric(input$loans.year2.8))*12
      expenses.list$loans.year3.8<-isolate(as.numeric(input$loans.year3.8))*12
      expenses.list$loans.year4.8<-isolate(as.numeric(input$loans.year4.8))*12
      expenses.list$loans.year5.8<-isolate(as.numeric(input$loans.year5.8))*12

      expenses.list$loans.year6.8<-isolate(as.numeric(input$loans.year6.8))*12
      expenses.list$loans.year7.8<-isolate(as.numeric(input$loans.year7.8))*12
      expenses.list$loans.year8.8<-isolate(as.numeric(input$loans.year8.8))*12

      # Horizon = 7
      expenses.list$exp.rentormortgage.year1.7<-isolate(as.numeric(input$exp.rentormortgage.year1.7))*12
      expenses.list$exp.rentormortgage.year2.7<-isolate(as.numeric(input$exp.rentormortgage.year2.7))*12
      expenses.list$exp.rentormortgage.year3.7<-isolate(as.numeric(input$exp.rentormortgage.year3.7))*12
      expenses.list$exp.rentormortgage.year4.7<-isolate(as.numeric(input$exp.rentormortgage.year4.7))*12
      expenses.list$exp.rentormortgage.year5.7<-isolate(as.numeric(input$exp.rentormortgage.year5.7))*12
      expenses.list$exp.rentormortgage.year6.7<-isolate(as.numeric(input$exp.rentormortgage.year6.7))*12
      expenses.list$exp.rentormortgage.year7.7<-isolate(as.numeric(input$exp.rentormortgage.year7.7))*12

      expenses.list$exp.utilities.year1.7<-isolate(as.numeric(input$exp.utilities.year1.7))*12
      expenses.list$exp.utilities.year2.7<-isolate(as.numeric(input$exp.utilities.year2.7))*12
      expenses.list$exp.utilities.year3.7<-isolate(as.numeric(input$exp.utilities.year3.7))*12
      expenses.list$exp.utilities.year4.7<-isolate(as.numeric(input$exp.utilities.year4.7))*12
      expenses.list$exp.utilities.year5.7<-isolate(as.numeric(input$exp.utilities.year5.7))*12
      expenses.list$exp.utilities.year6.7<-isolate(as.numeric(input$exp.utilities.year6.7))*12
      expenses.list$exp.utilities.year7.7<-isolate(as.numeric(input$exp.utilities.year7.7))*12

      expenses.list$exp.childcare.year1.7<-isolate(as.numeric(input$exp.childcare.year1.7))*12
      expenses.list$exp.childcare.year2.7<-isolate(as.numeric(input$exp.childcare.year2.7))*12
      expenses.list$exp.childcare.year3.7<-isolate(as.numeric(input$exp.childcare.year3.7))*12
      expenses.list$exp.childcare.year4.7<-isolate(as.numeric(input$exp.childcare.year4.7))*12
      expenses.list$exp.childcare.year5.7<-isolate(as.numeric(input$exp.childcare.year5.7))*12
      expenses.list$exp.childcare.year6.7<-isolate(as.numeric(input$exp.childcare.year6.7))*12
      expenses.list$exp.childcare.year7.7<-isolate(as.numeric(input$exp.childcare.year7.7))*12

      expenses.list$exp.oop.year1.7<-isolate(as.numeric(input$exp.oop.year1.7))*12
      expenses.list$exp.oop.year2.7<-isolate(as.numeric(input$exp.oop.year2.7))*12
      expenses.list$exp.oop.year3.7<-isolate(as.numeric(input$exp.oop.year3.7))*12
      expenses.list$exp.oop.year4.7<-isolate(as.numeric(input$exp.oop.year4.7))*12
      expenses.list$exp.oop.year5.7<-isolate(as.numeric(input$exp.oop.year5.7))*12
      expenses.list$exp.oop.year6.7<-isolate(as.numeric(input$exp.oop.year6.7))*12
      expenses.list$exp.oop.year7.7<-isolate(as.numeric(input$exp.oop.year7.7))*12

      expenses.list$exp.food.year1.7<-isolate(as.numeric(input$exp.food.year1.7))*12
      expenses.list$exp.food.year2.7<-isolate(as.numeric(input$exp.food.year2.7))*12
      expenses.list$exp.food.year3.7<-isolate(as.numeric(input$exp.food.year3.7))*12
      expenses.list$exp.food.year4.7<-isolate(as.numeric(input$exp.food.year4.7))*12
      expenses.list$exp.food.year5.7<-isolate(as.numeric(input$exp.food.year5.7))*12
      expenses.list$exp.food.year6.7<-isolate(as.numeric(input$exp.food.year6.7))*12
      expenses.list$exp.food.year7.7<-isolate(as.numeric(input$exp.food.year7.7))*12

      expenses.list$exp.transportation.year1.7<-isolate(as.numeric(input$exp.transportation.year1.7))*12
      expenses.list$exp.transportation.year2.7<-isolate(as.numeric(input$exp.transportation.year2.7))*12
      expenses.list$exp.transportation.year3.7<-isolate(as.numeric(input$exp.transportation.year3.7))*12
      expenses.list$exp.transportation.year4.7<-isolate(as.numeric(input$exp.transportation.year4.7))*12
      expenses.list$exp.transportation.year5.7<-isolate(as.numeric(input$exp.transportation.year5.7))*12
      expenses.list$exp.transportation.year6.7<-isolate(as.numeric(input$exp.transportation.year6.7))*12
      expenses.list$exp.transportation.year7.7<-isolate(as.numeric(input$exp.transportation.year7.7))*12

      expenses.list$exp.tech.year1.7<-isolate(as.numeric(input$exp.tech.year1.7))*12
      expenses.list$exp.tech.year2.7<-isolate(as.numeric(input$exp.tech.year2.7))*12
      expenses.list$exp.tech.year3.7<-isolate(as.numeric(input$exp.tech.year3.7))*12
      expenses.list$exp.tech.year4.7<-isolate(as.numeric(input$exp.tech.year4.7))*12
      expenses.list$exp.tech.year5.7<-isolate(as.numeric(input$exp.tech.year5.7))*12
      expenses.list$exp.tech.year6.7<-isolate(as.numeric(input$exp.tech.year6.7))*12
      expenses.list$exp.tech.year7.7<-isolate(as.numeric(input$exp.tech.year7.7))*12

      expenses.list$exp.misc.year1.7<-isolate(as.numeric(input$exp.misc.year1.7))*12
      expenses.list$exp.misc.year2.7<-isolate(as.numeric(input$exp.misc.year2.7))*12
      expenses.list$exp.misc.year3.7<-isolate(as.numeric(input$exp.misc.year3.7))*12
      expenses.list$exp.misc.year4.7<-isolate(as.numeric(input$exp.misc.year4.7))*12
      expenses.list$exp.misc.year5.7<-isolate(as.numeric(input$exp.misc.year5.7))*12
      expenses.list$exp.misc.year6.7<-isolate(as.numeric(input$exp.misc.year6.7))*12
      expenses.list$exp.misc.year7.7<-isolate(as.numeric(input$exp.misc.year7.7))*12

      expenses.list$loans.year1.7<-isolate(as.numeric(input$loans.year1.7))*12
      expenses.list$loans.year2.7<-isolate(as.numeric(input$loans.year2.7))*12
      expenses.list$loans.year3.7<-isolate(as.numeric(input$loans.year3.7))*12
      expenses.list$loans.year4.7<-isolate(as.numeric(input$loans.year4.7))*12
      expenses.list$loans.year5.7<-isolate(as.numeric(input$loans.year5.7))*12
      expenses.list$loans.year6.7<-isolate(as.numeric(input$loans.year6.7))*12
      expenses.list$loans.year7.7<-isolate(as.numeric(input$loans.year7.7))*12

      # Horizon = 6
      expenses.list$exp.rentormortgage.year1.6<-isolate(as.numeric(input$exp.rentormortgage.year1.6))*12
      expenses.list$exp.rentormortgage.year2.6<-isolate(as.numeric(input$exp.rentormortgage.year2.6))*12
      expenses.list$exp.rentormortgage.year3.6<-isolate(as.numeric(input$exp.rentormortgage.year3.6))*12
      expenses.list$exp.rentormortgage.year4.6<-isolate(as.numeric(input$exp.rentormortgage.year4.6))*12
      expenses.list$exp.rentormortgage.year5.6<-isolate(as.numeric(input$exp.rentormortgage.year5.6))*12
      expenses.list$exp.rentormortgage.year6.6<-isolate(as.numeric(input$exp.rentormortgage.year6.6))*12

      expenses.list$exp.utilities.year1.6<-isolate(as.numeric(input$exp.utilities.year1.6))*12
      expenses.list$exp.utilities.year2.6<-isolate(as.numeric(input$exp.utilities.year2.6))*12
      expenses.list$exp.utilities.year3.6<-isolate(as.numeric(input$exp.utilities.year3.6))*12
      expenses.list$exp.utilities.year4.6<-isolate(as.numeric(input$exp.utilities.year4.6))*12
      expenses.list$exp.utilities.year5.6<-isolate(as.numeric(input$exp.utilities.year5.6))*12
      expenses.list$exp.utilities.year6.6<-isolate(as.numeric(input$exp.utilities.year6.6))*12

      expenses.list$exp.childcare.year1.6<-isolate(as.numeric(input$exp.childcare.year1.6))*12
      expenses.list$exp.childcare.year2.6<-isolate(as.numeric(input$exp.childcare.year2.6))*12
      expenses.list$exp.childcare.year3.6<-isolate(as.numeric(input$exp.childcare.year3.6))*12
      expenses.list$exp.childcare.year4.6<-isolate(as.numeric(input$exp.childcare.year4.6))*12
      expenses.list$exp.childcare.year5.6<-isolate(as.numeric(input$exp.childcare.year5.6))*12
      expenses.list$exp.childcare.year6.6<-isolate(as.numeric(input$exp.childcare.year6.6))*12

      expenses.list$exp.oop.year1.6<-isolate(as.numeric(input$exp.oop.year1.6))*12
      expenses.list$exp.oop.year2.6<-isolate(as.numeric(input$exp.oop.year2.6))*12
      expenses.list$exp.oop.year3.6<-isolate(as.numeric(input$exp.oop.year3.6))*12
      expenses.list$exp.oop.year4.6<-isolate(as.numeric(input$exp.oop.year4.6))*12
      expenses.list$exp.oop.year5.6<-isolate(as.numeric(input$exp.oop.year5.6))*12
      expenses.list$exp.oop.year6.6<-isolate(as.numeric(input$exp.oop.year6.6))*12

      expenses.list$exp.food.year1.6<-isolate(as.numeric(input$exp.food.year1.6))*12
      expenses.list$exp.food.year2.6<-isolate(as.numeric(input$exp.food.year2.6))*12
      expenses.list$exp.food.year3.6<-isolate(as.numeric(input$exp.food.year3.6))*12
      expenses.list$exp.food.year4.6<-isolate(as.numeric(input$exp.food.year4.6))*12
      expenses.list$exp.food.year5.6<-isolate(as.numeric(input$exp.food.year5.6))*12
      expenses.list$exp.food.year6.6<-isolate(as.numeric(input$exp.food.year6.6))*12

      expenses.list$exp.transportation.year1.6<-isolate(as.numeric(input$exp.transportation.year1.6))*12
      expenses.list$exp.transportation.year2.6<-isolate(as.numeric(input$exp.transportation.year2.6))*12
      expenses.list$exp.transportation.year3.6<-isolate(as.numeric(input$exp.transportation.year3.6))*12
      expenses.list$exp.transportation.year4.6<-isolate(as.numeric(input$exp.transportation.year4.6))*12
      expenses.list$exp.transportation.year5.6<-isolate(as.numeric(input$exp.transportation.year5.6))*12
      expenses.list$exp.transportation.year6.6<-isolate(as.numeric(input$exp.transportation.year6.6))*12

      expenses.list$exp.tech.year1.6<-isolate(as.numeric(input$exp.tech.year1.6))*12
      expenses.list$exp.tech.year2.6<-isolate(as.numeric(input$exp.tech.year2.6))*12
      expenses.list$exp.tech.year3.6<-isolate(as.numeric(input$exp.tech.year3.6))*12
      expenses.list$exp.tech.year4.6<-isolate(as.numeric(input$exp.tech.year4.6))*12
      expenses.list$exp.tech.year5.6<-isolate(as.numeric(input$exp.tech.year5.6))*12
      expenses.list$exp.tech.year6.6<-isolate(as.numeric(input$exp.tech.year6.6))*12

      expenses.list$exp.misc.year1.6<-isolate(as.numeric(input$exp.misc.year1.6))*12
      expenses.list$exp.misc.year2.6<-isolate(as.numeric(input$exp.misc.year2.6))*12
      expenses.list$exp.misc.year3.6<-isolate(as.numeric(input$exp.misc.year3.6))*12
      expenses.list$exp.misc.year4.6<-isolate(as.numeric(input$exp.misc.year4.6))*12
      expenses.list$exp.misc.year5.6<-isolate(as.numeric(input$exp.misc.year5.6))*12
      expenses.list$exp.misc.year6.6<-isolate(as.numeric(input$exp.misc.year6.6))*12

      expenses.list$loans.year1.6<-isolate(as.numeric(input$loans.year1.6))*12
      expenses.list$loans.year2.6<-isolate(as.numeric(input$loans.year2.6))*12
      expenses.list$loans.year3.6<-isolate(as.numeric(input$loans.year3.6))*12
      expenses.list$loans.year4.6<-isolate(as.numeric(input$loans.year4.6))*12
      expenses.list$loans.year5.6<-isolate(as.numeric(input$loans.year5.6))*12
      expenses.list$loans.year6.6<-isolate(as.numeric(input$loans.year6.6))*12


      # Horizon = 5
      expenses.list$exp.rentormortgage.year1.5<-isolate(as.numeric(input$exp.rentormortgage.year1.5))*12
      expenses.list$exp.rentormortgage.year2.5<-isolate(as.numeric(input$exp.rentormortgage.year2.5))*12
      expenses.list$exp.rentormortgage.year3.5<-isolate(as.numeric(input$exp.rentormortgage.year3.5))*12
      expenses.list$exp.rentormortgage.year4.5<-isolate(as.numeric(input$exp.rentormortgage.year4.5))*12
      expenses.list$exp.rentormortgage.year5.5<-isolate(as.numeric(input$exp.rentormortgage.year5.5))*12

      expenses.list$exp.utilities.year1.5<-isolate(as.numeric(input$exp.utilities.year1.5))*12
      expenses.list$exp.utilities.year2.5<-isolate(as.numeric(input$exp.utilities.year2.5))*12
      expenses.list$exp.utilities.year3.5<-isolate(as.numeric(input$exp.utilities.year3.5))*12
      expenses.list$exp.utilities.year4.5<-isolate(as.numeric(input$exp.utilities.year4.5))*12
      expenses.list$exp.utilities.year5.5<-isolate(as.numeric(input$exp.utilities.year5.5))*12

      expenses.list$exp.childcare.year1.5<-isolate(as.numeric(input$exp.childcare.year1.5))*12
      expenses.list$exp.childcare.year2.5<-isolate(as.numeric(input$exp.childcare.year2.5))*12
      expenses.list$exp.childcare.year3.5<-isolate(as.numeric(input$exp.childcare.year3.5))*12
      expenses.list$exp.childcare.year4.5<-isolate(as.numeric(input$exp.childcare.year4.5))*12
      expenses.list$exp.childcare.year5.5<-isolate(as.numeric(input$exp.childcare.year5.5))*12

      expenses.list$exp.oop.year1.5<-isolate(as.numeric(input$exp.oop.year1.5))*12
      expenses.list$exp.oop.year2.5<-isolate(as.numeric(input$exp.oop.year2.5))*12
      expenses.list$exp.oop.year3.5<-isolate(as.numeric(input$exp.oop.year3.5))*12
      expenses.list$exp.oop.year4.5<-isolate(as.numeric(input$exp.oop.year4.5))*12
      expenses.list$exp.oop.year5.5<-isolate(as.numeric(input$exp.oop.year5.5))*12

      expenses.list$exp.food.year1.5<-isolate(as.numeric(input$exp.food.year1.5))*12
      expenses.list$exp.food.year2.5<-isolate(as.numeric(input$exp.food.year2.5))*12
      expenses.list$exp.food.year3.5<-isolate(as.numeric(input$exp.food.year3.5))*12
      expenses.list$exp.food.year4.5<-isolate(as.numeric(input$exp.food.year4.5))*12
      expenses.list$exp.food.year5.5<-isolate(as.numeric(input$exp.food.year5.5))*12

      expenses.list$exp.transportation.year1.5<-isolate(as.numeric(input$exp.transportation.year1.5))*12
      expenses.list$exp.transportation.year2.5<-isolate(as.numeric(input$exp.transportation.year2.5))*12
      expenses.list$exp.transportation.year3.5<-isolate(as.numeric(input$exp.transportation.year3.5))*12
      expenses.list$exp.transportation.year4.5<-isolate(as.numeric(input$exp.transportation.year4.5))*12
      expenses.list$exp.transportation.year5.5<-isolate(as.numeric(input$exp.transportation.year5.5))*12

      expenses.list$exp.tech.year1.5<-isolate(as.numeric(input$exp.tech.year1.5))*12
      expenses.list$exp.tech.year2.5<-isolate(as.numeric(input$exp.tech.year2.5))*12
      expenses.list$exp.tech.year3.5<-isolate(as.numeric(input$exp.tech.year3.5))*12
      expenses.list$exp.tech.year4.5<-isolate(as.numeric(input$exp.tech.year4.5))*12
      expenses.list$exp.tech.year5.5<-isolate(as.numeric(input$exp.tech.year5.5))*12

      expenses.list$exp.misc.year1.5<-isolate(as.numeric(input$exp.misc.year1.5))*12
      expenses.list$exp.misc.year2.5<-isolate(as.numeric(input$exp.misc.year2.5))*12
      expenses.list$exp.misc.year3.5<-isolate(as.numeric(input$exp.misc.year3.5))*12
      expenses.list$exp.misc.year4.5<-isolate(as.numeric(input$exp.misc.year4.5))*12
      expenses.list$exp.misc.year5.5<-isolate(as.numeric(input$exp.misc.year5.5))*12

      expenses.list$loans.year1.5<-isolate(as.numeric(input$loans.year1.5))*12
      expenses.list$loans.year2.5<-isolate(as.numeric(input$loans.year2.5))*12
      expenses.list$loans.year3.5<-isolate(as.numeric(input$loans.year3.5))*12
      expenses.list$loans.year4.5<-isolate(as.numeric(input$loans.year4.5))*12
      expenses.list$loans.year5.5<-isolate(as.numeric(input$loans.year5.5))*12

      # Horizon = 4
      expenses.list$exp.rentormortgage.year1.4<-isolate(as.numeric(input$exp.rentormortgage.year1.4))*12
      expenses.list$exp.rentormortgage.year2.4<-isolate(as.numeric(input$exp.rentormortgage.year2.4))*12
      expenses.list$exp.rentormortgage.year3.4<-isolate(as.numeric(input$exp.rentormortgage.year3.4))*12
      expenses.list$exp.rentormortgage.year4.4<-isolate(as.numeric(input$exp.rentormortgage.year4.4))*12

      expenses.list$exp.utilities.year1.4<-isolate(as.numeric(input$exp.utilities.year1.4))*12
      expenses.list$exp.utilities.year2.4<-isolate(as.numeric(input$exp.utilities.year2.4))*12
      expenses.list$exp.utilities.year3.4<-isolate(as.numeric(input$exp.utilities.year3.4))*12
      expenses.list$exp.utilities.year4.4<-isolate(as.numeric(input$exp.utilities.year4.4))*12

      expenses.list$exp.childcare.year1.4<-isolate(as.numeric(input$exp.childcare.year1.4))*12
      expenses.list$exp.childcare.year2.4<-isolate(as.numeric(input$exp.childcare.year2.4))*12
      expenses.list$exp.childcare.year3.4<-isolate(as.numeric(input$exp.childcare.year3.4))*12
      expenses.list$exp.childcare.year4.4<-isolate(as.numeric(input$exp.childcare.year4.4))*12

      expenses.list$exp.oop.year1.4<-isolate(as.numeric(input$exp.oop.year1.4))*12
      expenses.list$exp.oop.year2.4<-isolate(as.numeric(input$exp.oop.year2.4))*12
      expenses.list$exp.oop.year3.4<-isolate(as.numeric(input$exp.oop.year3.4))*12
      expenses.list$exp.oop.year4.4<-isolate(as.numeric(input$exp.oop.year4.4))*12

      expenses.list$exp.food.year1.4<-isolate(as.numeric(input$exp.food.year1.4))*12
      expenses.list$exp.food.year2.4<-isolate(as.numeric(input$exp.food.year2.4))*12
      expenses.list$exp.food.year3.4<-isolate(as.numeric(input$exp.food.year3.4))*12
      expenses.list$exp.food.year4.4<-isolate(as.numeric(input$exp.food.year4.4))*12

      expenses.list$exp.transportation.year1.4<-isolate(as.numeric(input$exp.transportation.year1.4))*12
      expenses.list$exp.transportation.year2.4<-isolate(as.numeric(input$exp.transportation.year2.4))*12
      expenses.list$exp.transportation.year3.4<-isolate(as.numeric(input$exp.transportation.year3.4))*12
      expenses.list$exp.transportation.year4.4<-isolate(as.numeric(input$exp.transportation.year4.4))*12

      expenses.list$exp.tech.year1.4<-isolate(as.numeric(input$exp.tech.year1.4))*12
      expenses.list$exp.tech.year2.4<-isolate(as.numeric(input$exp.tech.year2.4))*12
      expenses.list$exp.tech.year3.4<-isolate(as.numeric(input$exp.tech.year3.4))*12
      expenses.list$exp.tech.year4.4<-isolate(as.numeric(input$exp.tech.year4.4))*12

      expenses.list$exp.misc.year1.4<-isolate(as.numeric(input$exp.misc.year1.4))*12
      expenses.list$exp.misc.year2.4<-isolate(as.numeric(input$exp.misc.year2.4))*12
      expenses.list$exp.misc.year3.4<-isolate(as.numeric(input$exp.misc.year3.4))*12
      expenses.list$exp.misc.year4.4<-isolate(as.numeric(input$exp.misc.year4.4))*12

      expenses.list$loans.year1.4<-isolate(as.numeric(input$loans.year1.4))*12
      expenses.list$loans.year2.4<-isolate(as.numeric(input$loans.year2.4))*12
      expenses.list$loans.year3.4<-isolate(as.numeric(input$loans.year3.4))*12
      expenses.list$loans.year4.4<-isolate(as.numeric(input$loans.year4.4))*12


      # Horizon = 3
      expenses.list$exp.rentormortgage.year1.3<-isolate(as.numeric(input$exp.rentormortgage.year1.3))*12
      expenses.list$exp.rentormortgage.year2.3<-isolate(as.numeric(input$exp.rentormortgage.year2.3))*12
      expenses.list$exp.rentormortgage.year3.3<-isolate(as.numeric(input$exp.rentormortgage.year3.3))*12

      expenses.list$exp.utilities.year1.3<-isolate(as.numeric(input$exp.utilities.year1.3))*12
      expenses.list$exp.utilities.year2.3<-isolate(as.numeric(input$exp.utilities.year2.3))*12
      expenses.list$exp.utilities.year3.3<-isolate(as.numeric(input$exp.utilities.year3.3))*12

      expenses.list$exp.childcare.year1.3<-isolate(as.numeric(input$exp.childcare.year1.3))*12
      expenses.list$exp.childcare.year2.3<-isolate(as.numeric(input$exp.childcare.year2.3))*12
      expenses.list$exp.childcare.year3.3<-isolate(as.numeric(input$exp.childcare.year3.3))*12

      expenses.list$exp.oop.year1.3<-isolate(as.numeric(input$exp.oop.year1.3))*12
      expenses.list$exp.oop.year2.3<-isolate(as.numeric(input$exp.oop.year2.3))*12
      expenses.list$exp.oop.year3.3<-isolate(as.numeric(input$exp.oop.year3.3))*12

      expenses.list$exp.food.year1.3<-isolate(as.numeric(input$exp.food.year1.3))*12
      expenses.list$exp.food.year2.3<-isolate(as.numeric(input$exp.food.year2.3))*12
      expenses.list$exp.food.year3.3<-isolate(as.numeric(input$exp.food.year3.3))*12

      expenses.list$exp.transportation.year1.3<-isolate(as.numeric(input$exp.transportation.year1.3))*12
      expenses.list$exp.transportation.year2.3<-isolate(as.numeric(input$exp.transportation.year2.3))*12
      expenses.list$exp.transportation.year3.3<-isolate(as.numeric(input$exp.transportation.year3.3))*12

      expenses.list$exp.tech.year1.3<-isolate(as.numeric(input$exp.tech.year1.3))*12
      expenses.list$exp.tech.year2.3<-isolate(as.numeric(input$exp.tech.year2.3))*12
      expenses.list$exp.tech.year3.3<-isolate(as.numeric(input$exp.tech.year3.3))*12

      expenses.list$exp.misc.year1.3<-isolate(as.numeric(input$exp.misc.year1.3))*12
      expenses.list$exp.misc.year2.3<-isolate(as.numeric(input$exp.misc.year2.3))*12
      expenses.list$exp.misc.year3.3<-isolate(as.numeric(input$exp.misc.year3.3))*12

      expenses.list$loans.year1.3<-isolate(as.numeric(input$loans.year1.3))*12
      expenses.list$loans.year2.3<-isolate(as.numeric(input$loans.year2.3))*12
      expenses.list$loans.year3.3<-isolate(as.numeric(input$loans.year3.3))*12

      # Horizon = 2
      expenses.list$exp.rentormortgage.year1.2<-isolate(as.numeric(input$exp.rentormortgage.year1.2))*12
      expenses.list$exp.rentormortgage.year2.2<-isolate(as.numeric(input$exp.rentormortgage.year2.2))*12

      expenses.list$exp.utilities.year1.2<-isolate(as.numeric(input$exp.utilities.year1.2))*12
      expenses.list$exp.utilities.year2.2<-isolate(as.numeric(input$exp.utilities.year2.2))*12

      expenses.list$exp.childcare.year1.2<-isolate(as.numeric(input$exp.childcare.year1.2))*12
      expenses.list$exp.childcare.year2.2<-isolate(as.numeric(input$exp.childcare.year2.2))*12

      expenses.list$exp.oop.year1.2<-isolate(as.numeric(input$exp.oop.year1.2))*12
      expenses.list$exp.oop.year2.2<-isolate(as.numeric(input$exp.oop.year2.2))*12


      expenses.list$exp.food.year1.2<-isolate(as.numeric(input$exp.food.year1.2))*12
      expenses.list$exp.food.year2.2<-isolate(as.numeric(input$exp.food.year2.2))*12

      expenses.list$exp.transportation.year1.2<-isolate(as.numeric(input$exp.transportation.year1.2))*12
      expenses.list$exp.transportation.year2.2<-isolate(as.numeric(input$exp.transportation.year2.2))*12

      expenses.list$exp.tech.year1.2<-isolate(as.numeric(input$exp.tech.year1.2))*12
      expenses.list$exp.tech.year2.2<-isolate(as.numeric(input$exp.tech.year2.2))*12

      expenses.list$exp.misc.year1.2<-isolate(as.numeric(input$exp.misc.year1.2))*12
      expenses.list$exp.misc.year2.2<-isolate(as.numeric(input$exp.misc.year2.2))*12

      expenses.list$loans.year1.2<-isolate(as.numeric(input$loans.year1.2))*12
      expenses.list$loans.year2.2<-isolate(as.numeric(input$loans.year2.2))*12

      # Horizon = 1
      expenses.list$exp.rentormortgage.year1.1<-isolate(as.numeric(input$exp.rentormortgage.year1.1))*12

      expenses.list$exp.utilities.year1.1<-isolate(as.numeric(input$exp.utilities.year1.1))*12

      expenses.list$exp.childcare.year1.1<-isolate(as.numeric(input$exp.childcare.year1.1))*12

      expenses.list$exp.oop.year1.1<-isolate(as.numeric(input$exp.oop.year1.1))*12

      expenses.list$exp.food.year1.1<-isolate(as.numeric(input$exp.food.year1.1))*12

      expenses.list$exp.transportation.year1.1<-isolate(as.numeric(input$exp.transportation.year1.1))*12

      expenses.list$exp.tech.year1.1<-isolate(as.numeric(input$exp.tech.year1.1))*12

      expenses.list$exp.misc.year1.1<-isolate(as.numeric(input$exp.misc.year1.1))*12

      expenses.list$loans.year1.1<-isolate(as.numeric(input$loans.year1.1))*12


      ##########################################################################################
      # CALCULATIONS
      ###########################################################################################

      inputs <<- inputs


      # Create data for different combinations
      data<-expand.grid(Year = years
                        , careerpathID = c(1,2)     # Two IDs to compare on the same chart
                        , countyortownName = inputs$countyortownName
                        , stateAbbrev = inputs$stateAbbrev
                        , cityCode = inputs$cityCode
                        , agePerson1 = inputs$startAgePerson1
                        , agePerson2 = inputs$startAgePerson2
                        , agePerson3 = inputs$startAgePerson3
                        , agePerson4 = inputs$startAgePerson4
                        , agePerson5 = inputs$startAgePerson5
                        , agePerson6 = inputs$startAgePerson6
                        , agePerson7 = inputs$startAgePerson7
                        , agePerson8 = inputs$startAgePerson8
                        , agePerson9 = inputs$startAgePerson9
                        , agePerson10 = inputs$startAgePerson10
                        , agePerson11 = inputs$startAgePerson11
                        , agePerson12 = inputs$startAgePerson12
                        , disability1 = inputs$startDisability1
                        , disability2 = inputs$startDisability2
                        , disability3 = inputs$startDisability3
                        , disability4 = inputs$startDisability4
                        , disability5 = inputs$startDisability5
                        , disability6 = inputs$startDisability6
                        , disability7 = inputs$startDisability7
                        , disability8 = inputs$startDisability8
                        , disability9 = inputs$startDisability9
                        , disability10 = inputs$startDisability10
                        , disability11 = inputs$startDisability11
                        , disability12 = inputs$startDisability12
                        , ssdiPIA1 = inputs$ssdiPIA1
                        , ssdiPIA2 = inputs$ssdiPIA2
                        , ssdiPIA3 = inputs$ssdiPIA3
                        , ssdiPIA4 = inputs$ssdiPIA4
                        , ssdiPIA5 = inputs$ssdiPIA5
                        , ssdiPIA6 = inputs$ssdiPIA6
                        , disab.work.exp = inputs$disab.work.exp
                        , prev_ssi = inputs$prev_ssi
                        , blind1 = inputs$startBlind1
                        , blind2 = inputs$startBlind2
                        , blind3 = inputs$startBlind3
                        , blind4 = inputs$startBlind4
                        , blind5 = inputs$startBlind5
                        , blind6 = inputs$startBlind6
                        , blind7 = inputs$startBlind7
                        , blind8 = inputs$startBlind8
                        , blind9 = inputs$startBlind9
                        , blind10 = inputs$startBlind10
                        , blind11 = inputs$startBlind11
                        , blind12 = inputs$startBlind12
                        , FilingStatus = inputs$FilingStatus ############ ER: SWITHC FOR MARRIED
                        , married = inputs$married
                        , income = 0 # initialize income
                        , income1 = 0
                        , income2 = 0
                        , income3 = 0
                        , income4 = 0
                        , income5 = 0
                        , income6 = 0
                        , income7 = 0
                        , income8 = 0
                        , income9 = 0
                        , income10 = 0
                        , income11 = 0
                        , income12 = 0

      )



      data$ruleYear<-ruleYear
      data$Year<-as.numeric(data$Year)

      # Project future age depending on the year and starting age
      data<-data %>%
        mutate(agePerson1 = agePerson1+(Year-current_year)
               ,agePerson2 = agePerson2+(Year-current_year)
               ,agePerson3 = agePerson3+(Year-current_year)
               ,agePerson4 = agePerson4+(Year-current_year)
               ,agePerson5 = agePerson5+(Year-current_year)
               ,agePerson6 = agePerson6+(Year-current_year)
               ,agePerson7 = agePerson7+(Year-current_year)
               ,agePerson8 = agePerson8+(Year-current_year)
               ,agePerson9 = agePerson9+(Year-current_year)
               ,agePerson10 = agePerson10+(Year-current_year)
               ,agePerson11 = agePerson11+(Year-current_year)
               ,agePerson12 = agePerson12+(Year-current_year)) %>%

        # Make sure that adults do not "leave the house"
        # Person 1 and 2 are main user and partner - never leave the house. Only children leave the house
        mutate( agePerson3=case_when(agePerson3>=child.leaves.house & inputs$startAgePerson3<=18 ~ NA_real_, TRUE ~ agePerson3) # child.leaves.house is in global.R
                ,agePerson4=case_when(agePerson4>=child.leaves.house & inputs$startAgePerson4<=18 ~ NA_real_, TRUE ~ agePerson4)
                ,agePerson5=case_when(agePerson5>=child.leaves.house & inputs$startAgePerson5<=18 ~ NA_real_, TRUE ~ agePerson5)
                ,agePerson6=case_when(agePerson6>=child.leaves.house & inputs$startAgePerson6<=18 ~ NA_real_, TRUE ~ agePerson6)
                ,agePerson7=case_when(agePerson7>=child.leaves.house & inputs$startAgePerson7<=18 ~ NA_real_, TRUE ~ agePerson7)
                ,agePerson8=case_when(agePerson8>=child.leaves.house & inputs$startAgePerson8<=18 ~ NA_real_, TRUE ~ agePerson8)
                ,agePerson9=case_when(agePerson9>=child.leaves.house & inputs$startAgePerson9<=18 ~ NA_real_, TRUE ~ agePerson9)
                ,agePerson10=case_when(agePerson10>=child.leaves.house & inputs$startAgePerson10<=18 ~ NA_real_, TRUE ~ agePerson10)
                ,agePerson11=case_when(agePerson11>=child.leaves.house & inputs$startAgePerson11<=18 ~ NA_real_, TRUE ~ agePerson11)
                ,agePerson12=case_when(agePerson12>=child.leaves.house & inputs$startAgePerson12<=18 ~ NA_real_, TRUE ~ agePerson12)) %>%

        mutate(year.index = Year-current_year+1)

      data <- data[data$agePerson1 < 65,]


      # Map state Abbrev to StateFIPS and county of choice to MSA for the wage growth projections
      # data<-data %>%
      #   left_join(table.statemap, by="stateAbbrev") %>%
      #   left_join(table.msamap, by=c("stateAbbrev", "countyortownName"))

      # Generate Other Income and Assets Variables
      data<-data %>%
        mutate( value.loans = 0
                , value.tuition = 0
                , value.grants = 0
                , value.loans.student = 0
                , value.assistance.other = 0
                , value.assistance.tax.other = 0
                , assets.cash = inputs$assets.cash
                , assets.car1 = inputs$assets.car1
                , totalassets = assets.car1 + assets.cash
                , income.investment = inputs$income.investment
                , income.gift = inputs$income.gift
                , income.otherfamily = inputs$income.otherfamily
                , income.child_support = inputs$income.child_support
                , numworkingadults = inputs$numworkingadults
                , income2_disab = inputs$income2_disab
                , income3_disab = inputs$income3_disab
                , income4_disab = inputs$income4_disab
                , income5_disab = inputs$income5_disab
                , income6_disab = inputs$income6_disab
        )


      data<-function.InitialTransformations(data) # Create core variables


      #data <- function.createData(data)

      # Separate into two datasets

      data_1 <- data[data$careerpathID==1,]
      data_2 <- data[data$careerpathID==2,]
      inputs <<- inputs


      #---------------------------------------------------------------------------
      # Construct Data for Career Option 1
      #---------------------------------------------------------------------------
      if(inputs$choiceOccupation_1 != "empty"){

        if(inputs$type_career_1=="custom" | inputs$type_career_1 == "current"){
          data_1$lag <- 1
        }else{
          data_1$lag <- 0
        }

        data_1<-constructCareerPath.planner(data_1 # Function found in wage_projection.R
                                          , choiceOccupation = inputs$choiceOccupation_1
                                          , choiceOccupation.empl_healthcare = inputs$choiceOccupation.empl_healthcare_1
                                          , inschool.cont.empl_healthcare = inputs$inschool.cont.empl_healthcare_1
                                          , choiceExperience = inputs$experience_1
                                          , choiceStartingWage = inputs$startingWage_1
                                          , choiceEducationDuration = inputs$educationDuration_1
                                          , choiceHoursSchool = inputs$hours_inschool_1
                                          , choiceWagesSchool = inputs$wage_inschool_1
                                          , eduDurationYears = inputs$schooling_years_1
                                          , eduDurationMonths = inputs$schooling_months_1)

        if(inputs$type_career_1 == "current"){
          data_1$hours <- current_hours*52
        }

        data_1<-function.projectWages.planner(data_1)  # Wage growth projection: produces NAs if wage data doesn't exist

        data_1$disab.income <- data_1$income2_disab + data_1$income3_disab + data_1$income4_disab + data_1$income5_disab + data_1$income6_disab
        # Generate Individual VS Family income
        data_1<-data_1 %>%
          mutate(income_ind = income
                 ,income = income_ind+income.otherfamily+income.investment+income.child_support+disab.income
                 ,income1 = income_ind
                 ,income2 = case_when(numadults>=2 ~ income.otherfamily/(numadults-1), TRUE~0) # Distribute other fam income among adults other than main user
                 ,income3 = case_when(numadults>=3 ~ income.otherfamily/(numadults-1), TRUE~0) # When expanding fam sizes add to this section
                 ,income4 = case_when(numadults>=4 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income5 = case_when(numadults>=5 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income6 = case_when(numadults>=6 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income7 = case_when(numadults>=7 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income8 = case_when(numadults>=8 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income9 = case_when(numadults>=9 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income10 = case_when(numadults>=10 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income11 = case_when(numadults>=11 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income12 = case_when(numadults>=12 ~ income.otherfamily/(numadults-1), TRUE~0)
          )

        if(fam_disab == "Yes"){
          data_1$income2 <- data_1$income2_disab
          data_1$income3 <- data_1$income3_disab
          data_1$income4 <- data_1$income4_disab
          data_1$income5 <- data_1$income5_disab
          data_1$income6 <- data_1$income6_disab

        }

        # Rename Cashiers into Near-Minimum Wage Job
        if(inputs$type_career_1 == "default"){data_1$CareerPath[data_1$CareerPath == "Cashiers"] <- "Near-Minimum Wage job"}

        # Add "1-" to deal with potential selection of two occupations with the same name
        data_1$CareerPath<-paste0("1 - ", data_1$CareerPath)



      }


       #---------------------------------------------------------------------------
      # Construct Data for Career Option 2
      #---------------------------------------------------------------------------
      if(inputs$choiceOccupation_2 != "empty"){



        if(inputs$type_career_2=="custom" | inputs$type_career_2 == "current"){ # ER: second condition not needed - we don't give option to choose current
          data_2$lag <- 1
        }else{
          data_2$lag <- 0
        }

       # data2pre<<-data_2
        data_2<-constructCareerPath.planner(data_2
                                          , choiceOccupation = inputs$choiceOccupation_2
                                          , choiceOccupation.empl_healthcare = inputs$choiceOccupation.empl_healthcare_2
                                          , inschool.cont.empl_healthcare = inputs$inschool.cont.empl_healthcare_2
                                          , choiceExperience = inputs$experience_2
                                          , choiceStartingWage = inputs$startingWage_2
                                          , choiceEducationDuration = inputs$educationDuration_2
                                          , choiceHoursSchool = inputs$hours_inschool_2
                                          , choiceWagesSchool = inputs$wage_inschool_2
                                          , eduDurationYears = inputs$schooling_years_2
                                          , eduDurationMonths = inputs$schooling_months_2)

          #note this function is in Dropbox\WorkForceDevProj\Documentation\Wage Growth\programs\wage_projection.R
        if(inputs$type_career_2 == "current"){
          data_2$hours <- current_hours*52
        }

        #   data2_post<<-data_2

        data_2<-function.projectWages.planner(data_2)  # Wage growth projection: produces NAs if wage data doesn't exist
        
        data_2$disab.income <- data_2$income2_disab + data_2$income3_disab + data_2$income4_disab + data_2$income5_disab + data_2$income6_disab

           # Generate Individual VS Family income
        data_2<-data_2 %>%
          mutate(income_ind = income
                 ,income = income_ind+income.otherfamily+income.investment+income.child_support+disab.income
                 ,income1 = income_ind
                 ,income2 = case_when(numadults>=2 ~ income.otherfamily/(numadults-1), TRUE~0) # Distribute other fam income among adults other than main user
                 ,income3 = case_when(numadults>=3 ~ income.otherfamily/(numadults-1), TRUE~0) # When expanding fam sizes add to this section
                 ,income4 = case_when(numadults>=4 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income5 = case_when(numadults>=5 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income6 = case_when(numadults>=6 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income7 = case_when(numadults>=7 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income8 = case_when(numadults>=8 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income9 = case_when(numadults>=9 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income10 = case_when(numadults>=10 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income11 = case_when(numadults>=11 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income12 = case_when(numadults>=12 ~ income.otherfamily/(numadults-1), TRUE~0)

          )

        if(fam_disab == "Yes"){
          data_2$income2 <- data_2$income2_disab
          data_2$income3 <- data_2$income3_disab
          data_2$income4 <- data_2$income4_disab
          data_2$income5 <- data_2$income5_disab
          data_2$income6 <- data_2$income6_disab

        }

        # Add "2-" to deal with potential selection of two occupations with the same name
        data_2$CareerPath<-paste0("2 - ", data_2$CareerPath)


        data_2_check <<- data_2
      }

      # Create "Initial" Data
      if(inputs$choiceOccupation_1 != "empty"){
        # Create initial point
        data_init<-data_1[1,]


        data_init$disab.income <- data_init$income2_disab + data_init$income3_disab + data_init$income4_disab + data_init$income5_disab + data_init$income6_disab



        data_init<-data_init %>%
          mutate(income_ind = startingWage_c*current_hours*52,
                 income = income_ind+income.otherfamily+income.investment+income.child_support+disab.income,
                 income1 = income_ind,
                 income2 = case_when(numadults>=2 ~ income.otherfamily/(numadults-1), TRUE~0), # Distribute other fam income among adults other than main user
                 income3 = case_when(numadults>=3 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income4 = case_when(numadults>=4 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income5 = case_when(numadults>=5 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income6 = case_when(numadults>=6 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income7 = case_when(numadults>=7 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income8 = case_when(numadults>=8 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income9 = case_when(numadults>=9 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income10 = case_when(numadults>=10 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income11 = case_when(numadults>=11 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income12 = case_when(numadults>=12 ~ income.otherfamily/(numadults-1), TRUE~0)# When expanding fam sizes add to this section
                 ,empl_healthcare=inputs$choiceOccupation.empl_healthcare_init)

        if(fam_disab == "Yes"){
          data_init$income2 <- data_init$income2_disab
          data_init$income3 <- data_init$income3_disab
          data_init$income4 <- data_init$income4_disab
          data_init$income5 <- data_init$income5_disab
          data_init$income6 <- data_init$income6_disab

        }
      }





      if(inputs$choiceOccupation_1 == "empty" & inputs$choiceOccupation_2 != "empty"){
        # Create initial point
        data_init<-data_2[1,]

        data_init$disab.income <- data_init$income2_disab + data_init$income3_disab + data_init$income4_disab + data_init$income5_disab + data_init$income6_disab


        data_init<-data_init %>%
          mutate(income_ind = startingWage_c*current_hours*52,
                 income = income_ind+income.otherfamily+income.investment+income.child_support+disab.income,
                 income1 = income_ind,
                 income2 = case_when(numadults>=2 ~ income.otherfamily/(numadults-1), TRUE~0), # Distribute other fam income among adults other than main user
                 income3 = case_when(numadults>=3 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income4 = case_when(numadults>=4 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income5 = case_when(numadults>=5 ~ income.otherfamily/(numadults-1), TRUE~0),
                 income6 = case_when(numadults>=6 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income7 = case_when(numadults>=7 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income8 = case_when(numadults>=8 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income9 = case_when(numadults>=9 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income10 = case_when(numadults>=10 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income11 = case_when(numadults>=11 ~ income.otherfamily/(numadults-1), TRUE~0)
                 ,income12 = case_when(numadults>=12 ~ income.otherfamily/(numadults-1), TRUE~0)# When expanding fam sizes add to this section
                 ,empl_healthcare=inputs$choiceOccupation.empl_healthcare_init)


        if(fam_disab == "Yes"){
          data_init$income2 <- data_init$income2_disab
          data_init$income3 <- data_init$income3_disab
          data_init$income4 <- data_init$income4_disab
          data_init$income5 <- data_init$income5_disab
          data_init$income6 <- data_init$income6_disab

        }

      }



      ###########################################################################################
      # APPLY BENEFITS CALCULATIONS & PLOT CHARTS
      ###########################################################################################

      #---------------------------------------------------------
      # Initial Point
      #---------------------------------------------------------
      #create lag of income for tax credits calculations
      data_init<-as.data.table(data_init)
      data_init[, income_tm12:=c(income[1], income[-.N]), by=countyortownName]
      data_init<-as.data.frame(data_init)

      # Run Benefits Calculator
      data_init<-BenefitsCalculator.ALICEExpenses(data_init)

      # Store SS values for plotting
      data_init<-function.storeSSvalues(data_init)

      # Input costs of tuition and grants
      data_init<-overrideTuition(data_init, 0, 0, 0, 0)

      # Input student loans
      data_init<-overrideStudentLoans(data_init, 0, 0)

      # Override expenses (If "Actual" expenses type is selected)
      if(input$getresults>0 & input$calculateBudget>0 & input$expenses_type=="expenses.actual"){
        inputs$horizon<-isolate(as.numeric(input$horizon))
        data_init<-overrideExpenses.Actual.init(data=data_init, expenses.list, inputs$horizon, childcare1 = programs.ccdf, childcare2= programs.head_start)
      }

      # Override expenses (If "Self-Sufficiency" expenses type is selected)
      if(input$getresults>0 & input$calculateBudget>0 & input$expenses_type=="expenses.default"){
        inputs$horizon<-isolate(as.numeric(input$horizon))
        data_init<-overrideExpenses.SS.init(data=data_init, expenses.list, inputs$horizon)
      }

      inputs <<- inputs

      data_init<-BenefitsCalculator.OtherBenefits(data_init, APPLY_TANF=programs.tanf, APPLY_SSDI=programs.ssdi, APPLY_SSI=programs.ssi)
      data_init<-BenefitsCalculator.Childcare(data_init, APPLY_CHILDCARE, APPLY_HEADSTART=programs.head_start, APPLY_PREK=programs.prek, APPLY_CCDF=programs.ccdf, APPLY_FATES=programs.fates, contelig.ccdf = `contelig.ccdf`,contelig.headstart = `contelig.headstart`, contelig.earlyheadstart = `contelig.earlyheadstart`) #option to add APPLY_FATES
      data_init<-BenefitsCalculator.Healthcare(data_init, APPLY_HEALTHCARE=TRUE, APPLY_MEDICAID_ADULT = programs.medicaid_adults, APPLY_MEDICAID_CHILD = programs.medicaid_child, APPLY_ACA = programs.aca)
      data_init<-BenefitsCalculator.FoodandHousing(data_init, APPLY_SECTION8=programs.section8, APPLY_LIHEAP, APPLY_SNAP=programs.snap, APPLY_SLP=programs.schoolMeals, APPLY_WIC=programs.wic, APPLY_RAP=programs.rap, APPLY_FRSP = programs.frsp, frsp_share = `frsp_share`, CareerMAP = programs.careermap) # OPTION TO END WITH APPLY_RAP

      data_earned_init <- data_init
      data_earned_init$income <- data_earned_init$income - data_earned_init$income.investment - data_earned_init$income.child_support
      data_earned_init$income.investment <- 0
      data_earned_init$income.child_support <- 0
      data_earned_init$income.gift <- 0
      
      data_init<-BenefitsCalculator.TaxesandTaxCredits(data_init, APPLY_EITC=programs.eitc, APPLY_CTC=programs.ctc, APPLY_CDCTC=programs.cdctc)
      data_earned_init<-BenefitsCalculator.TaxesandTaxCredits(data_earned_init, APPLY_EITC=programs.eitc, APPLY_CTC=programs.ctc, APPLY_CDCTC=programs.cdctc)
      
      data_init<-data_init %>% # Generate individual-level after-tax income
        mutate(income.aftertax.noTC_ind=case_when(income_ind-(tax.income.fed+tax.income.state+tax.FICA)>0 ~ income_ind-(tax.income.fed+tax.income.state+tax.FICA), TRUE ~0))

      data_init$value.hhf<-0 # iniial value of Cash Hold Harmless Fund
      
      data_init<-function.createVars.CLIFF(data_init)
      data_earned_init <- function.createVars.CLIFF(data_earned_init)
      
      #data_init$total.transfers <- data_init$total.transfers + data_init$value.section8


    #  data_init$NetResources <- data_init$NetResources + data_init$value.section8

      
      data_init$taxedEarnedIncomeOnly <- data_earned_init$income.aftertax.noTC
      

      data_initial <<- data_init


      #write.csv(data_init, file="data_init.csv")

      #---------------------------------------------------------
      # Career Choice 1
      #---------------------------------------------------------
      # Run this code only if option is specified and data exists
      if(!is.na(sum(data_1$income)) & inputs$choiceOccupation_1 !="empty"){



        #create lag of income for tax credits calculations
        data_1<-as.data.table(data_1)
        data_1[, income_tm12:=c(income[1], income[-.N]), by=countyortownName]
        data_1<-as.data.frame(data_1)

        # Run Benefits Calculator
        data_1<-BenefitsCalculator.ALICEExpenses(data_1)

            # Store SS values for plotting
        data_1<-function.storeSSvalues(data_1)

          # Input costs of tuition and grants
        data_1<-overrideTuition(data_1, inputs$tuition_fees_1, inputs$Grants_1, inputs$loans_1, inputs$educationDuration_1)


        # Input student loans
        data_1<-overrideStudentLoans(data_1, inputs$loans_1, inputs$educationDuration_1)


        # Override expenses (If "Actual" expenses type is selected)
        if(input$getresults>0 & input$calculateBudget>0 & input$expenses_type=="expenses.actual"){
          inputs$horizon<-isolate(as.numeric(input$horizon))
          data_1<-overrideExpenses.Actual(data_1, expenses.list, horizon=inputs$horizon, childcare1 = programs.ccdf, childcare2= programs.head_start)
        }


        data_uno <<- data_1
        expenses.list <<- expenses.list

        # # Override expenses (If "Self-Sufficiency" | "ALICE" expenses type is selected)
        if(input$getresults>0 & input$calculateBudget>0 & input$expenses_type=="expenses.default"){
          inputs$horizon<-isolate(as.numeric(input$horizon))
          data_1<-overrideExpenses.SS(data_1, expenses.list, horizon=inputs$horizon)
        }


        # Add asset mapping
        if(input$getresults>0 & input$calculateBudget>0){
              inputs$horizon<-isolate(as.numeric(input$horizon))
              data_1<-addAssetMapping(data_1, assistance.list, horizon=inputs$horizon)
              data_1$income.gift<-data_1$value.assistance.other
              data_1<-addAssetMappingTax(data_1, assistance.tax.list, horizon=inputs$horizon)
             # data_1$income<-data_1$income + data_1$value.assistance.tax.other
              }



        data_1<-BenefitsCalculator.OtherBenefits(data_1, APPLY_TANF=programs.tanf, APPLY_SSDI=programs.ssdi, APPLY_SSI=programs.ssi)
        data_1<-BenefitsCalculator.Childcare(data_1, APPLY_CHILDCARE, APPLY_HEADSTART=programs.head_start, APPLY_PREK=programs.prek, APPLY_CCDF=programs.ccdf, APPLY_FATES=programs.fates, contelig.ccdf = `contelig.ccdf`,contelig.headstart = `contelig.headstart`, contelig.earlyheadstart = `contelig.earlyheadstart`) #option to add APPLY_FATES
        data_1<-BenefitsCalculator.Healthcare(data_1, APPLY_HEALTHCARE=TRUE, APPLY_MEDICAID_ADULT = programs.medicaid_adults, APPLY_MEDICAID_CHILD = programs.medicaid_child, APPLY_ACA = programs.aca)
        data_1<-BenefitsCalculator.FoodandHousing(data_1, APPLY_SECTION8=programs.section8, APPLY_LIHEAP, APPLY_SNAP=programs.snap, APPLY_SLP=programs.schoolMeals, APPLY_WIC=programs.wic, APPLY_RAP=programs.rap, APPLY_FRSP = programs.frsp, frsp_share = `frsp_share`, CareerMAP = programs.careermap) # OPTION TO END WITH APPLY_RAP
       
        data_earned_1 <- data_1
        data_earned_1$income <- data_earned_1$income - data_earned_1$income.investment - data_earned_1$income.child_support
        data_earned_1$income.investment <- 0
        data_earned_1$income.child_support <- 0
        data_earned_1$income.gift <- 0
        
        if(input$getresults>0 & input$calculateBudget>0){
          
          data_1$income<-data_1$income + data_1$value.assistance.tax.other
        }
        
        
         data_1<-BenefitsCalculator.TaxesandTaxCredits(data_1, APPLY_EITC=programs.eitc, APPLY_CTC=programs.ctc, APPLY_CDCTC=programs.cdctc)
         data_earned_1<-BenefitsCalculator.TaxesandTaxCredits(data_earned_1, APPLY_EITC=programs.eitc, APPLY_CTC=programs.ctc, APPLY_CDCTC=programs.cdctc)


        data_1<-data_1 %>% # Generate individual-level after-tax income
          mutate(income.aftertax.noTC_ind=case_when(income_ind-(tax.income.fed+tax.income.state+tax.FICA)>0 ~ income_ind-(tax.income.fed+tax.income.state+tax.FICA), TRUE ~0))

        data_1$value.hhf <- 0
        data_earned_1$value.hhf <- 0

        if(careerMap==TRUE){
          data_1<-function.careerMap(data_1, data_init)
        }else{data_1$value.hhf<-0}

        
        data_1<-function.createVars.CLIFF(data_1)
        data_earned_1 <- function.createVars.CLIFF(data_earned_1)
        data_1$taxedEarnedIncomeOnly <- data_earned_1$income.aftertax.noTC #- (data_earned_1$income.gift+data_earned_1$income.investment+data_earned_1$income.child_support)

        data_1$total.transfers <- data_1$total.transfers + data_1$value.hhf #+ data_1$value.section8
        data_1$NetResources <- data_1$NetResources + data_1$value.hhf #+ data_1$value.section8

        data_one <<- data_1 # output data to global environment

      }

      if(!is.na(sum(data_2$income)) & inputs$choiceOccupation_2 !="empty"){




        #create lag of income for tax credits calculations
        data_2<-as.data.table(data_2)
        data_2[, income_tm12:=c(income[1], income[-.N]), by=countyortownName]
        data_2<-as.data.frame(data_2)



        # Run Benefits Calculator
        data_2<-BenefitsCalculator.ALICEExpenses(data_2)

        # Store SS values for plotting
        data_2<-function.storeSSvalues(data_2)

        # Input costs of tuition and grants
        data_2<-overrideTuition(data_2, inputs$tuition_fees_2, inputs$Grants_2, inputs$loans_2, inputs$educationDuration_2)

        # Input student loans
        data_2<-overrideStudentLoans(data_2, inputs$loans_2, inputs$educationDuration_2)



        # Override expenses (If "Actual" expenses type is selected)
        if(input$getresults>0 & input$calculateBudget>0 & input$expenses_type=="expenses.actual"){
          inputs$horizon<-isolate(as.numeric(input$horizon))
          data_2<-overrideExpenses.Actual(data_2, expenses.list, horizon=inputs$horizon, childcare1 = programs.ccdf, childcare2 = programs.head_start)
        }

        # Override expenses (If "Self-Sufficiency" expenses type is selected)
        if(input$getresults>0 & input$calculateBudget>0 & input$expenses_type=="expenses.default"){
          inputs$horizon<-isolate(as.numeric(input$horizon))
          data_2<-overrideExpenses.SS(data_2, expenses.list, horizon=inputs$horizon)
        }

        # Add asset mapping
        if(input$getresults>0 & input$calculateBudget>0 ){
          inputs$horizon<-isolate(as.numeric(input$horizon))
          data_2<-addAssetMapping(data_2, assistance.list,  horizon=inputs$horizon)
          data_2$income.gift<-data_2$value.assistance.other
          data_2<-addAssetMappingTax(data_2, assistance.tax.list, horizon=inputs$horizon)
        #  data_2$income<-data_2$income + data_2$value.assistance.tax.other

        }


        data_2<-BenefitsCalculator.OtherBenefits(data_2, APPLY_TANF=programs.tanf, APPLY_SSDI=programs.ssdi, APPLY_SSI=programs.ssi)
        data_2<-BenefitsCalculator.Childcare(data_2, APPLY_CHILDCARE, APPLY_HEADSTART=programs.head_start, APPLY_PREK=programs.prek, APPLY_CCDF=programs.ccdf, APPLY_FATES=programs.fates, contelig.ccdf = `contelig.ccdf`, contelig.headstart = `contelig.headstart`, contelig.earlyheadstart = `contelig.earlyheadstart`) #option to add APPLY_FATES
        data_2<-BenefitsCalculator.Healthcare(data_2, APPLY_HEALTHCARE=TRUE, APPLY_MEDICAID_ADULT = programs.medicaid_adults, APPLY_MEDICAID_CHILD = programs.medicaid_child, APPLY_ACA = programs.aca)
        data_2<-BenefitsCalculator.FoodandHousing(data_2, APPLY_SECTION8=programs.section8, APPLY_LIHEAP, APPLY_SNAP=programs.snap, APPLY_SLP=programs.schoolMeals, APPLY_WIC=programs.wic, APPLY_RAP=programs.rap, APPLY_FRSP = programs.frsp, frsp_share = `frsp_share`, CareerMAP = programs.careermap) # OPTION TO END WITH APPLY_RAP
       
        
        # This dataset is created so that we can calculated taxedEarnedIncomeOnly
        data_earned_2 <- data_2
        data_earned_2$income <- data_earned_2$income - data_earned_2$income.investment - data_earned_2$income.child_support
        data_earned_2$income.investment <- 0
        data_earned_2$income.child_support <- 0
        data_earned_2$income.gift <- 0
        
        data_earned_2 <<- data_earned_2 
        
        
        
        if(input$getresults>0 & input$calculateBudget>0 ){
            data_2$income<-data_2$income + data_2$value.assistance.tax.other
          
        }
        
        
         data_2<-BenefitsCalculator.TaxesandTaxCredits(data_2, APPLY_EITC=programs.eitc, APPLY_CTC=programs.ctc, APPLY_CDCTC=programs.cdctc)
         data_earned_2<-BenefitsCalculator.TaxesandTaxCredits(data_earned_2, APPLY_EITC=programs.eitc, APPLY_CTC=programs.ctc, APPLY_CDCTC=programs.cdctc)

        
         
        data_2<-data_2 %>% # Generate individual-level after-tax income
          mutate(income.aftertax.noTC_ind=case_when(income_ind-(tax.income.fed+tax.income.state+tax.FICA)>0 ~ income_ind-(tax.income.fed+tax.income.state+tax.FICA), TRUE ~0))

        # # Override expenses
        # if(input$getresults>0 & input$calculateBudget>0 ){
        #   inputs$horizon<-isolate(as.numeric(input$horizon))
        #   data_2<-addAssetMapping(data_2, assistance.list,  horizon=inputs$horizon)
        # }

        data_2$value.hhf <- 0
        data_earned_2$value.hhf <- 0


        if(careerMap==TRUE){
          data_2<-function.careerMap(data_2, data_init)
        }else{data_2$value.hhf<-0}


        data_2<-function.createVars.CLIFF(data_2)
        data_earned_2 <- function.createVars.CLIFF(data_earned_2)
        data_2$taxedEarnedIncomeOnly <- data_earned_2$income.aftertax.noTC #- (data_earned_2$income.gift+data_earned_2$income.investment+data_earned_2$income.child_support)
        
        TEIO <<- data_2$taxedEarnedIncomeOnly

        data_2$total.transfers <- data_2$total.transfers + data_2$value.hhf #+ data_2$value.section8
        data_2$NetResources <- data_2$NetResources + data_2$value.hhf #+ data_2$value.section8

        data_two <<- data_2 # output to global environment

      }


      ##############################################################################
      # Generate charts for "Compare Careers"


      missing_age <- 0

      if(is.na(input$age)
         | (input$partnered != "No" & is.na(input$age_partner))
         | (input$other_family == "Yes" & input$num_other_family == 1 & is.na(input$age_family_1))
         | (input$other_family == "Yes" & input$num_other_family == 2 & (is.na(input$age_family_1) | is.na(input$age_family_2)))
         | (input$other_family == "Yes" & input$num_other_family == 3 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3)))
         | (input$other_family == "Yes" & input$num_other_family == 4 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4)))
         | (input$other_family == "Yes" & input$num_other_family == 5 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5)))
         | (input$other_family == "Yes" & input$num_other_family == 6 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6)))
         | (input$other_family == "Yes" & input$num_other_family == 7 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7)))
         | (input$other_family == "Yes" & input$num_other_family == 8 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8)))
         | (input$other_family == "Yes" & input$num_other_family == 9 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8) | is.na(input$age_family_9)))
         | (input$other_family == "Yes" & input$num_other_family == 10 & (is.na(input$age_family_1) | is.na(input$age_family_2) | is.na(input$age_family_3) | is.na(input$age_family_4) | is.na(input$age_family_5) | is.na(input$age_family_6) | is.na(input$age_family_7) | is.na(input$age_family_8) | is.na(input$age_family_9) | is.na(input$age_family_10)))

      ){
        missing_age <- 1
      }else{
        missing_age <- 0
      }

      inputs$missing_age <- missing_age


      exp_type <- 0
      expenses_type <- isolate(as.character(input$expenses_type))
      if(input$expenses_type != "empty"){
        exp_type <- 1
      }


      #-------------------------------
      # Chart 1: Lifetime Income Bar Charts
      output$income.lifetime<- renderPlotly({



      print(c)
        income.life.values(data_1, data_2, BLSregion, inputs)
        
      }
      #, width = 800, height = 371
      )


   #   observeEvent(toListen_main(),{

    #    if(input$getresults>0 & input$navBar == "Create a Budget" & input$main == "4 - Budget" & input$expenses_type != "empty"){

  #        output$net.res.life.values<- renderPlotly({



   #         net.res.life.values(data_1, data_2, inputs)
   #       })


   #       output$net.resources<- renderPlotly({


  #          net.resources(data_1, data_2, data_init, inputs$countyortownName, inputs)
   #       })
   #     }
   #   })

      # #-------------------------------
      # # Chart 2: After-Tax Income
      # output$after.tax_1<- renderPlotly({
      #   after.tax.values(data_1, data_2, inputs$countyortownName, inputs)
      # }
      # #, width = 1100, height = 371
      # )

      #-------------------------------
      # Chart 2: Income Before Taxes
      output$income.gross<- renderPlotly({
        income.gross(data_1, data_2, data_init, inputs$countyortownName, inputs)
      }
      #, width = 1100, height = 371
      )

      #-------------------------------
      # Chart 3: Self-Sufficiency line
      output$after.tax.self.sufficiency_1<- renderPlotly({
        after.tax.self.sufficiency.values(data_1, data_2, data_init, inputs$countyortownName, inputs)
      }
      #, width = 1100, height = 371
      )

      #-------------------------------
      # Chart 4: Expenses Breakdown
      output$expenses.breakdown_1<- renderPlotly({
        expenses.breakdown.values(data_1, data_2, inputs$countyortownName, inputs)
      }
      #, width = 1100, height = 421
      )


      #-------------------------------
      # Default SS Expenses
      observeEvent(input$horizon, { # Make it reactive to the change in horizon

        inputs$horizon<-isolate(as.numeric(input$horizon))

        output$table.DefaultExpenses<- renderTable({
          table.DefaultExpenses(data_1, horizon=inputs$horizon,inputs)
        }, rownames = TRUE, colnames = TRUE, bordered = TRUE, width = '80%', spacing = "l", align = 'l', digits = 0)

      })

      updateActionButton(session, "getresults", label = "Recalculate Results")

    }


    ##############################################################################
    # Generate output for "Create a Budget"

    if(input$getresults>0 & input$calculateBudget>0){ # Only of "Show My Budget" buttong is clicked

      inputs$career_plan<-isolate(as.character(input$career_plan))
      inputs$horizon<-isolate(as.numeric(input$horizon))

      # output values to global environment for checking
      data_one <<- data_1
      data_two <<- data_2
      data_initial <<- data_init
      inputs <<- inputs
      exp_type <<- exp_type
      career_plan <<- inputs$career_plan
      horizon <<- inputs$horizon
      
      output$textCareerOption <- renderText({
        if (input$career_plan == "Career Option 1")
          paste0("The results below are for Career Option 1 - ", inputs$choiceOccupation_1)
        else if (input$career_plan == "Career Option 2")
          paste0("The results below are for Career Option 2 - ", inputs$choiceOccupation_2)
      })
      
      #-------------------------------
      # Table 1: Total Budget
      output$table.Budget<- renderTable({
        validate(
          need(inputs$xyz==0, " ")
        )

        table.Budget(data_1, data_2, data_init, selected=inputs$career_plan, horizon=inputs$horizon, exp_type,inputs)
      }, rownames = TRUE, colnames = TRUE, bordered = TRUE, width = '80%', spacing = "l", align = 'l', digits = 0)

      #-------------------------------
      # Table 2: Public Assistance decomposition
      output$table.Transfers<- renderTable({
        validate(
          need(inputs$xyz==0, " ")
        )

        table.Transfers(data_1, data_2, data_init, selected=inputs$career_plan, horizon=inputs$horizon, exp_type, inputs, benefitslist)
      }, rownames = TRUE, colnames = TRUE, bordered = TRUE, width = '80%', spacing = "l", align = 'l', digits = 0)

      #-------------------------------
      # Table 3: Expenses decomposition
      output$table.Expenses<- renderTable({
        validate(
          need(inputs$xyz==0," ")
        )

        table.Expenses(data_1, data_2, data_init, selected=inputs$career_plan, horizon=inputs$horizon, exp_type, expenses_type,inputs)
      }, rownames = TRUE, colnames = TRUE, bordered = TRUE, width = '80%', spacing = "l", align = 'l', digits = 0)

      #-------------------------------
      # Chart 1: Budget
      output$net.res.budget<- renderPlotly({
        validate(
          need(inputs$xyz==0, "Please enter a valid SSDI amount.")
        )

        net.res.budget.values(data_1, data_2,data_init, selected=inputs$career_plan, horizon=inputs$horizon, exp_type,inputs)
      }
      #, width = 837, height = 477
      )

      #-------------------------------
      # Chart 2: Public Assistance
      output$transfers.budget<- renderPlotly({
        validate(
          need(inputs$xyz==0, " ")
        )

        transfers.budget.values(data_1, data_2, data_init, selected=inputs$career_plan, horizon=inputs$horizon, exp_type, inputs, benefitslist)
      }
      #, width = 837, height = 477
      )

      #-------------------------------
      # Chart 3: Expenses
      output$expenses.budget<- renderPlotly({
        validate(
          need(inputs$xyz==0, " ")
        )

        expenses.budget.values(data_1, data_2, data_init, selected=inputs$career_plan, horizon=inputs$horizon, exp_type, expenses_type,inputs)
      }
      #, width = 837, height = 477
      )

      #-------------------------------
      # Text for "My Budget"
      output$textMyBudget <- renderText({
        textMyBudget(data_1, data_2, selected=inputs$career_plan, horizon=inputs$horizon, exp_type,inputs)
      })

      updateActionButton(session, "calculateBudget", label = "Recalculate My Budget")

      # table for screen reader    
      srtablehorizon <- 10
      results_table <- table.Summary(rbind(data_2, data_1), data_init, benefitslist, srtablehorizon)
      
      # download results table for screen reader
      output$print1 <- downloadHandler(
        
        filename = function(){
          paste0("DataTables", "_ScreenReader.xlsx")
        },
        #filename = "CLIFF_Dashboard_Results_Summary.xlsx",
        content = function(file){
          # save(data, file=file)
          # write.xlsx(data, file=file)
          require(openxlsx)
          #list_datasets <- list("Annual Results" = data_1, "Cross Section Results" = csdata_1, "Data Dictionary" = Data_Dictionary)
          write.xlsx(results_table, file=file)
          
        }
        
      )

    }

  }, ignoreInit = TRUE)  # ignoreInit option allows to avoid initializing collection of inputs before observeEvent


}
)
