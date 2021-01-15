test_that("strip_metadata reads a file appropriately", {
    df <- strip_metadata("./files/example-report.xlsx")
    df2 <- strip_metadata("./files/example-report-multiline-header.xlsx",
                          header_nrow = 2)
    df3 <- strip_metadata("./files/example-report.csv")

    expect_is(df, c("tbl_df", "data.frame"))
    expect_equal(names(df)[1:3], c("Region", "LOB", "CC"))
    expect_equal(names(df2)[1:3], c("Region", "LOB", "Cost Center"))

    expect_error(stip_metadata("./files/example-report"))
    expect_is(strip_metadata("./files/example-ok.xlsx"), c("tbl_df", "data.table"))
})
