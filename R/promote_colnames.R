#' Compress Column Names
#'
#' @param header_rows numeric. The number of rows that the column names span.
#'
#' @return a character vector of collapsed column names
compress_header <- function(header_rows) {
    txt <- apply(X = header_rows, MARGIN = 2, FUN = function(x) paste(x, collapse = " "))
    txt <- gsub(" NA$", "", trimws(txt))
    txt <- gsub(" +", " ", txt)
    return(txt)
}

#' Promote Rows to Column Names
#'
#' @param header_start numeric. The first row of the column headers to be promoted.
#' @param header_nrow numeric. The number of rows the column headers span. Defaults to 1.
#' @param .df a data frame
#'
#' @return a data frame with the promoted row as column names
#' @export
#'
#' @examples
#' df <- data.frame(v1 = c("X", "123.45"), v2 = c("Y", "345.67"))
#' promote_colnames(df)
#' df2 <- data.frame(v1 = c("X", "Value", "123.45"), v2 = c("Y", "Value", "345.67"))
#' promote_colnames(df2, header_nrow = 2)
promote_colnames <- function(.df, header_start = 1, header_nrow = 1) {
    .names <- compress_header(.df[header_start:(header_start + header_nrow-1), ])
    colnames(.df) <- .names
    .df[-(header_start:(header_start + header_nrow-1)), ]
}

