#' Extract Data From a Report
#'
#' @param .df a data frame object.
#' @param checkcol numeric. (optional). The column number to check for NA values.
#'     If not specified, extract_data will attempt to guess the appropriate column.
#' @param promote_colnames logical. (optional). Should the first row be promoted
#'     to column names?
#'
#' @return a data frame object.
#' @export
#'
#' @examples
#' df <- readxl::read_excel("./man/example/example-report.xlsx")
#' extract_data(df)
extract_data <- function(.df, checkcol = NA, promote_colnames = TRUE) {
    # count the NA values in each column
    nacount  <- apply(.df, 2, function(x) sum(is.na(x)))
    if (is.na(checkcol)) {
        # assume that data starts on first column with fewest missing values
        checkcol <- names(which.min(nacount))[1]
    }
    # drop any rows which have NA values in the check column
    .df <- tidyr::drop_na(.df, checkcol)
    # drop any columns with only NA values
    .df <- dplyr::select_if(.df, function(x) any(!is.na(x)))
    if (promote_colnames) {
        # promote row to columns names
        .df <- promote_colnames(.df)
    }
    return(.df)
}
