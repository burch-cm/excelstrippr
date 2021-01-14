test_that("compress_header() combines mutli-line headers", {
    df <- data.frame(c1 = c("X", "Value", "1234.5"), c2 = c("Y", "Value", "123.45"))
    expect_equal(compress_header(df[1:2, ]), c(c1 = "X Value", c2 = "Y Value"))
})

test_that("promote_colnames() promotes a single row to colnames", {
    df <- data.frame(c1 = c("X", "1234.5"), c2 = c("Y", "6789.1"))
    expect_equivalent(promote_colnames(df), data.frame(X = "1234.5", Y = "6789.1"))
})

test_that("promote_colnames() promotes multiline column names", {
    df <- data.frame(c1 = c("X", "Value", "1234.5"), c2 = c("Y", "Value", "6789.1"))
    expect_equivalent(promote_colnames(df, header_nrow = 2),
                      data.frame(`X Value` = "1234.5", `Y Value` = "6789.1"))
})
