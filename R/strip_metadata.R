#' Strip Report MetaData From Excel File
#'
#' @param from the file path to the excel report.
#' @param promote logical. Should first non-NA row be promoted to column names?
#'     Default tries to make a reasonable determination.
#' @param header_nrow numeric. How many rows does the table header cover? Defaults to 1.
#' @param ... extra parameters to pass to the read_csv and read_excel functions
#'
#' @return a data frame containing the tabular data from the report
#' @export
#'
#' @examples
#' \dontrun{
#' strip_metadata("./man/example/example-report")
#' # specify a particular sheet
#' strip_metadata("my-excel-file.xlsx", sheet = "report summary")
#' }
strip_metadata <- function(from, promote = NA, header_nrow = 1, ...) {

    # load file into tibble based on extension type
    if (grepl("*\\.csv$", from)) {
        .df <- suppressMessages(readr::read_csv(from, col_names = FALSE), ...)
    } else if (grepl("*\\.xls[x]?$", from)) {
        .df <- suppressMessages(readxl::read_excel(from, col_names = FALSE), ...)
    } else {
        stop("File must have the extension .csv or .xls/.xlsx")
    }

    # check to see if column names need to be promoted
    if (is.na(promote)) {
        if (any(grepl("\\.\\.\\.[0-9]+", names(.df))) |
            all(grepl("^X[0-9]+$", names(.df)))) {
            promote = TRUE
        } else {
            promote = FALSE
        }
    }
    .df <- extract_data(.df, promote_colnames = promote, header_nrow = header_nrow)
    return(.df)
}
