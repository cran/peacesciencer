#' Add Correlates of War National Military Capabilities Data
#'
#' @description \code{add_nmc()} allows you to add the Correlates of War National Material Capabilities data to dyad-yer or state-year data.
#'
#'
#' @return \code{add_nmc()} takes a dyad-year data frame or state-year data frame and adds information
#' about the national material capabilities for the state or two states in the dyad in a given year. If the data are dyad-year, the function
#' adds 12 total columns for the first state (i.e. \code{ccode1}) and the second state (i.e. \code{ccode2}) for all estimates of national
#' military capabilities provided by the Correlates of War project. If the data are state-year, the function returns six additional columns
#' to the original data that contain that same information for a given state in a given year.
#'
#' @details The function leans on attributes of the data that are provided by the \code{create_dyadyear()} or
#' \code{create_stateyear()} function. Make sure that function (or data created by that function) appear at the top
#' of the proverbial pipe.
#'
#' @author Steven V. Miller
#'
#' @param data a dyad-year data frame (either "directed" or "non-directed") or a state-year data frame.
#'
#' @references
#'
#' Singer, J. David, Stuart Bremer, and John Stuckey. (1972). "Capability Distribution, Uncertainty, and Major Power War, 1820-1965." in Bruce Russett (ed) Peace, War, and Numbers, Beverly Hills: Sage, 19-48.
#'
#' Singer, J. David. 1987. "Reconstructing the Correlates of War Dataset on Material Capabilities of States, 1816-1985" International Interactions, 14: 115-32.
#'
#'
#' @examples
#'
#' \dontrun{
#' library(magrittr)
#' cow_ddy %>% add_nmc()
#'
#' create_stateyears() %>% add_nmc()
#' }
#'
add_nmc <- function(data) {

  if (length(attributes(data)$ps_data_type) > 0 && attributes(data)$ps_data_type == "dyad_year") {

    data %>% left_join(., cow_nmc, by=c("ccode1"="ccode","year"="year")) %>%
      rename(milex1 = .data$milex,
             milper1 = .data$milper,
             irst1 = .data$irst,
             pec1 = .data$pec,
             tpop1 = .data$tpop,
             upop1 = .data$upop,
             cinc1 = .data$cinc) %>%
      left_join(., cow_nmc, by=c("ccode2"="ccode","year"="year")) %>%
      rename(milex2 = .data$milex,
             milper2 = .data$milper,
             irst2 = .data$irst,
             pec2 = .data$pec,
             tpop2 = .data$tpop,
             upop2 = .data$upop,
             cinc2 = .data$cinc) -> data


  } else if (length(attributes(data)$ps_data_type) > 0 && attributes(data)$ps_data_type == "state_year") {
    data %>%
      left_join(., cow_nmc) -> data

  } else  {
    stop("add_something() requires a data/tibble with attributes$ps_data_type of state_year or dyad_year. Try running create_dyadyears() or create_stateyears() at the start of the pipe.")
  }



  return(data)
}

