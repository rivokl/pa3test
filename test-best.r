
## test_that (Wickham) unit test - Programming Assignment 3, Part 1

library("testthat")
context("Finding the best hospital in a state")

test_that("verify the state and outcome validation works", {
  expect_error(best("BB", "heart attack"), "invalid state")
  expect_error(best("NY", "hert attack" ), "invalid outcome")
})

test_that("find the hospital with the 'best' 30 day mortality rate", {
  expect_equal(best("TX", "heart attack" ), "CYPRESS FAIRBANKS MEDICAL CENTER")
  expect_equal(best("TX", "heart failure"), "FORT DUNCAN MEDICAL CENTER"      )
  expect_equal(best("MD", "heart attack" ), "JOHNS HOPKINS HOSPITAL, THE"     )
})

test_that("compare best with the expected submit script output", {
  expect_equal(best("SC", "heart attack"), "MUSC MEDICAL CENTER"      )
  expect_equal(best("NY", "pneumonia"   ), "MAIMONIDES MEDICAL CENTER")
  expect_error(best("NN", "pneumonia"   ))
})

test_that("handling ties (alphabetical order)", {
  expect_equal(best("SD", "heart failure"),
               "AVERA HEART HOSPITAL OF SOUTH DAKOTA LLC")
  expect_equal(best("WI", "heart failure"), "AURORA ST LUKES MEDICAL CENTER")
  expect_equal(best("MA", "pneumonia"), "FALMOUTH HOSPITAL")
})
