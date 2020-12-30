#' Promote Row to Column Names
#'
#' @param .df a data frame
#' @param rownum numeric. The row in the data frame to be promoted to column names
#'
#' @return a data frame with the promoted row as column names
#' @export
#'
#' @examples
#' df <- tribble(~v1,           ~v2,      ~v3,
#'               "X",           "Y",      "Z",
#'               "1234.5", "234.12", "3452.1")
#' promote_colnames(df)
promote_colnames <- function(.df, rownum = 1) {
    .names <- .df[rownum, ]
    colnames(.df) <- .names
    .df[-rownum, ]
}
