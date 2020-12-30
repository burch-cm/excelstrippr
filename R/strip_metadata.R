#' Strip Report MetaData From Excel File
#'
#' @param from the file path to the excel report.
#'
#' @return a data frame containing the tabular data from the report
#' @export
#'
#' @examples
#' strip_metadata("./man/example/example-report")
strip_metadata <- function(from) {
    dat <- readxl::read_excel(from, col_names = FALSE)
    dat <- extract_data(dat)
    return(dat)
}
