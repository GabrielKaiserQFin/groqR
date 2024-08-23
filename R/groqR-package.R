# A Coding Assistant using the Groq API
#' @keywords internal
"_PACKAGE"

######################################## .
#############  Important:  #############
######################################## .
# set R_LIBS_USER and R_PROFILE_USER as enviromental user variable

# Set params if necessary
if (any(Sys.getenv(c(
  "GROQ_model", "GROQ_systemRole", "GROQ_API_KEY",
  "GROQ_maxTokens", "GROQ_temperature", "GROQ_top_p",
  "GROQ_returnType"
)) == "")) {
  shiny::shinyApp(ui = ui, server = server)
}
