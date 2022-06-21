test_that("each entry is counted", {
  expect_equal(CountuniqueChildren(c("MAD-2-18-72-00",  "MAD-2-19-335-00", "MAD-1-20-465-01")), 1)
})
