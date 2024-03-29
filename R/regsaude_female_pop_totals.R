#' Health region yearly female population estimates totals
#'
#' This function provides a tibble containing female population estimates for Brazilian health regions totals from 2000 to 2021.
#'
#' @param type character. 'standard' or 'reg_saude_449'
#'
#' The estimates were calculated by DataSUS (Brazilian Ministry of Health), manually downloaded from DataSUS website, and organized as a tibble.
#'
#' \describe{
#'   \item{regsaude}{health region 4 or 5 digits code}
#'   \item{year}{year of the estimative}
#'   \item{pop}{population estimative}
#' }
#'
#' @returns A tibble.
#' @seealso [regsaude_female_pop].
#'
#' @importFrom rlang .data
#' @export

regsaude_female_pop_totals <- function(type = "standard"){

  if(!(type %in% c("standard", "reg_saude_449"))){
    stop("type must be 'standard' or 'reg_saude_449'")
  }

  if(type == "standard"){
    res <- regsaude_female_pop()
  } else if(type == "reg_saude_449"){
    res <- regsaude_female_pop(type = "reg_saude_449")
  }

  res <- res %>%
    dplyr::filter(.data$age_group == "Total") %>%
    dplyr::arrange(.data$regsaude, .data$year)

  return(res)
}
