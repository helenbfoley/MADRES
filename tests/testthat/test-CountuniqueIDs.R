test_that("each entry is counted", {
  expect_equal(CountuniqueIDs(c("MAD-2-17-74-00",  "MAD-2-17-115-00", "MAD-1-17-131-01")), 3)
})
