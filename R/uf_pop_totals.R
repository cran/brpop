#' UF yearly population totals
#'
#' This function provides a tibble containing total population estimates for Brazilian UFs ("Unidades Federativas") totals.
#'
#' @param source character. `datasus` for Brazilian Health Ministry old estimates (2000 to 2021), `datasus2024` for Brazilian Health Ministry new estimates (2000 to 2024), `ufrn` for UFRN-DEM-LEPP estimates (2010 to 2030), or `ibge` for IBGE estimates (2000 to 2022).
#'
#' @returns A tibble.
#' @seealso [datasus_mun_male_pop], [datasus_mun_female_pop], [ufrn_mun_male_pop], [ufrn_mun_female_pop], [ibge_pop].
#'
#' @importFrom rlang .data
#' @export

uf_pop_totals <- function(source = "datasus"){
  # Assertions
  checkmate::assert_choice(x = source, choices = c("datasus", "ufrn", "ibge", "datasus2024"))

  # Estimates source
  if(source == "datasus"){
    mun_male_pop <- datasus_mun_male_pop()
    mun_female_pop <- datasus_mun_female_pop()
  } else if(source == "ufrn"){
    mun_male_pop <- ufrn_mun_male_pop()
    mun_female_pop <- ufrn_mun_female_pop()
  } else if(source == "datasus2024"){
    mun_male_pop <- datasus2024_mun_male_pop()
    mun_female_pop <- datasus2024_mun_female_pop()
  }

  if(source == "datasus" | source == "datasus2024" | source == "ufrn"){
    res <- dplyr::bind_rows(mun_male_pop, mun_female_pop) %>%
      dplyr::filter(.data$age_group == "Total") %>%
      dplyr::mutate(uf = substr(.data$code_muni, 0, 2)) %>%
      dtplyr::lazy_dt() %>%
      dplyr::group_by(.data$uf, .data$year) %>%
      dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
      dplyr::ungroup() %>%
      dplyr::arrange(.data$uf, .data$year, .data$pop) %>%
      tibble::as_tibble()
  } else if (source == "ibge"){
    res <- ibge_pop() %>%
      dplyr::mutate(uf = substr(.data$code_muni, 0, 2)) %>%
      dtplyr::lazy_dt() %>%
      dplyr::group_by(.data$uf, .data$year) %>%
      dplyr::summarise(pop = sum(.data$pop, na.rm = TRUE)) %>%
      dplyr::ungroup() %>%
      dplyr::arrange(.data$uf, .data$year, .data$pop) %>%
      tibble::as_tibble()
  }


  return(res)
}
