% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/uf_pop_totals.R
\name{uf_pop_totals}
\alias{uf_pop_totals}
\title{UF yearly population totals}
\usage{
uf_pop_totals(source = "datasus")
}
\arguments{
\item{source}{character. \code{datasus} for Brazilian Health Ministry old estimates (2000 to 2021), \code{datasus2024} for Brazilian Health Ministry new estimates (2000 to 2024), \code{ufrn} for UFRN-DEM-LEPP estimates (2010 to 2030), or \code{ibge} for IBGE estimates (2000 to 2022).}
}
\value{
A tibble.
}
\description{
This function provides a tibble containing total population estimates for Brazilian UFs ("Unidades Federativas") totals.
}
\seealso{
\link{datasus_mun_male_pop}, \link{datasus_mun_female_pop}, \link{ufrn_mun_male_pop}, \link{ufrn_mun_female_pop}, \link{ibge_pop}.
}
