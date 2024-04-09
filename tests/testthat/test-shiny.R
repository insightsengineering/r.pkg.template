test_that("The Shiny App returns a proper greeting", {
  library(shinytest2)
  app <- AppDriver$new(
    "shiny-app/",
    load_timeout = 1e5,
    timeout = 1e5,
    seed = 123
  )
  app$get_logs()

  # Set input
  app$set_inputs(name = "john")
  app$click("greet")

  # Get output
  output <- app$get_value(output = "greeting")

  # Assert
  expect_equal(output, "Hello, John")

  # Stop the app
  app$stop()
})
