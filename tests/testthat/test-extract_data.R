test_that("extract_data() pulls and promotes data correctly", {
    df <- data.frame(c1 = c("X", "Value", "1234.5"), c2 = c("Y", "Value", "6789.1"))
    expect_equivalent(extract_data(df, header_nrow = 2),
                      data.frame(`X Value` = "1234.5", `Y Value` = "6789.1"))
})
