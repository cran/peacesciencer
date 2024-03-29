globalVariables(c('.', 'capitals', 'cow_ddy'))

#' Add capital-to-capital distance to a data frame
#'
#' @description \code{add_capital_distance()} allows you to add capital-to-capital
#' distance to a (dyad-year, leader-year, leader-dyad-year, state-year) data frame. The capitals are coded in the
#' \code{cow_capitals} and \code{gw_capitals}
#' data frames, along with their latitudes and longitudes. The distance variable that
#' emerges \code{capdist} is calculated using the "Vincenty" method (i.e. "as the crow
#' flies") and is expressed in kilometers.
#'
#' @return \code{add_capital_distance()} takes a (dyad-year, leader-year, leader-dyad-year, state-year) data frame and adds the
#' capital-to-capital distance between the first state and the second state (in dyad-year data) or the minimum
#' capital-to-capital distance for a given state in a given year. A minor
#' note about this function: cases of capital transition are recorded in the
#' underlying data but, in the conversion to capital-years (and eventual
#' merging into a dyad-year data frame), the Jan. 1 capital is used for calculating
#' distances.
#'
#' @details The function leans on attributes of the data that are provided by one of the "create" functions
#' in this package (e.g. \code{create_dyadyear()} or \code{create_stateyear()}).
#'
#' @author Steven V. Miller
#'
#' @param data a data frame with appropriate \pkg{peacesciencer} attributes
#'
#' @examples
#'
#' \donttest{
#' # just call `library(tidyverse)` at the top of the your script
#' library(magrittr)
#' cow_ddy %>% add_capital_distance()
#'
#' create_stateyears() %>% add_capital_distance()
#' }
#'
#'
#' @importFrom rlang .data
#' @importFrom rlang .env
#'



#
# add_capital_distance <- function(data) {
#
#   cow_capitals %>% rowwise() %>%
#     mutate(year = list(seq(.data$styear, .data$endyear))) %>%
#     unnest(.data$year) %>%
#     select(.data$ccode, .data$year, .data$lat, .data$lng) %>%
#     # There will be duplicates for when the country moved.
#     # Under those conditions, the first capital should be first. It's basically the Jan. 1 capital, if you will.
#     group_by(.data$ccode, .data$year) %>% slice(1) %>% ungroup() -> capital_years
#
#   if (length(attributes(data)$ps_data_type) > 0 && attributes(data)$ps_data_type == "dyad_year") {
#     if (!all(i <- c("ccode1", "ccode2") %in% colnames(data))) {
#
#       stop("add_capital_distance() merges on two Correlates of War codes (ccode1, ccode2), which your data don't have right now. Make sure to run create_dyadyears() at the top of the pipe. You'll want the default option, which returns Correlates of War codes.")
#
#
#     } else {
#
#     data %>%
#       left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode1"="ccode","year"="year")) %>%
#       rename(lat1 = .data$lat,
#              lng1 = .data$lng) %>%
#       left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode2"="ccode","year"="year")) %>%
#       rename(lat2 = .data$lat,
#              lng2 = .data$lng) -> data
#
#     latlng1 <- data %>% select(.data$lng1, .data$lat1)
#     latlng2 <- data %>% select(.data$lng2, .data$lat2)
#     data$capdist <- distVincentySphere(latlng1, latlng2) / 1000
#     data %>% select(-.data$lat1, -.data$lng1, -.data$lat2, -.data$lng2) -> data
#
#   return(data)
#     }
#
#   } else if (length(attributes(data)$ps_data_type) > 0 && attributes(data)$ps_data_type == "state_year") {
#     if (!all(i <- c("ccode") %in% colnames(data))) {
#
#       stop("add_capital_distance() merges on Correlates of War codes (ccode1, ccode2 for dyad-year data, ccode for state-year), which your data don't have right now. Make sure to run create_dyadyears() or create_stateyears() at the top of the pipe. You'll want the default option, which returns Correlates of War codes.")
#
#
#     } else {
#     cow_ddy %>%
#       left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode1"="ccode","year"="year")) %>%
#       rename(lat1 = .data$lat,
#              lng1 = .data$lng) %>%
#       left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode2"="ccode","year"="year")) %>%
#       rename(lat2 = .data$lat,
#              lng2 = .data$lng) -> hold_this
#
#     latlng1 <- hold_this %>% select(.data$lng1, .data$lat1)
#     latlng2 <- hold_this %>% select(.data$lng2, .data$lat2)
#     hold_this$capdist <- distVincentySphere(latlng1, latlng2) / 1000
#     hold_this %>% select(-.data$lat1, -.data$lng1, -.data$lat2, -.data$lng2) -> hold_this
#
#     hold_this %>% group_by(.data$ccode1, .data$year) %>%
#       summarize(mincapdist = min(.data$capdist)) %>% ungroup() %>%
#       rename(ccode = .data$ccode1) %>%
#       left_join(data, .) -> data
#
#     return(data)
#
#     }
#
#   } else  {
#     stop("add_capital_distance() requires a data/tibble with attributes$ps_data_type of state_year or dyad_year. Try running create_dyadyears() or create_stateyears() at the start of the pipe.")
#
#     }
#
# }


add_capital_distance <- function(data) {

  if (length(attributes(data)$ps_data_type) > 0 && attributes(data)$ps_data_type %in% c("dyad_year", "leader_dyad_year")) {

    if (length(attributes(data)$ps_system) > 0 && attributes(data)$ps_system == "cow") {

      cow_capitals %>% rowwise() %>%
        mutate(year = list(seq(.data$styear, .data$endyear))) %>%
        unnest(.data$year) %>%
        select(.data$ccode, .data$year, .data$lat, .data$lng) %>%
        # There will be duplicates for when the country moved.
        # Under those conditions, the first capital should be first. It's basically the Jan. 1 capital, if you will.
        group_by(.data$ccode, .data$year) %>% slice(1) %>% ungroup() -> capital_years

      data %>%
        left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode1"="ccode","year"="year")) %>%
        rename(lat1 = .data$lat,
               lng1 = .data$lng) %>%
        left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode2"="ccode","year"="year")) %>%
        rename(lat2 = .data$lat,
               lng2 = .data$lng) -> data

      latlng1 <- data %>% select(.data$lng1, .data$lat1)
      latlng2 <- data %>% select(.data$lng2, .data$lat2)
      data$capdist <- distVincentySphere(latlng1, latlng2) / 1000
      data %>% select(-.data$lat1, -.data$lng1, -.data$lat2, -.data$lng2) -> data

      return(data)

    } else { # Assuming it's G-W system

      gw_capitals %>% rowwise() %>%
        mutate(year = list(seq(.data$styear, .data$endyear))) %>%
        unnest(.data$year) %>%
        select(.data$gwcode, .data$year, .data$lat, .data$lng) %>%
        # There will be duplicates for when the country moved.
        # Under those conditions, the first capital should be first. It's basically the Jan. 1 capital, if you will.
        group_by(.data$gwcode, .data$year) %>% slice(1) %>% ungroup() -> capital_years

      data %>%
        left_join(., capital_years %>% select(.data$gwcode, .data$year, .data$lat, .data$lng), by=c("gwcode1"="gwcode","year"="year")) %>%
        rename(lat1 = .data$lat,
               lng1 = .data$lng) %>%
        left_join(., capital_years %>% select(.data$gwcode, .data$year, .data$lat, .data$lng), by=c("gwcode2"="gwcode","year"="year")) %>%
        rename(lat2 = .data$lat,
               lng2 = .data$lng) -> data

      latlng1 <- data %>% select(.data$lng1, .data$lat1)
      latlng2 <- data %>% select(.data$lng2, .data$lat2)
      data$capdist <- distVincentySphere(latlng1, latlng2) / 1000
      data %>% select(-.data$lat1, -.data$lng1, -.data$lat2, -.data$lng2) -> data

      return(data)

    }


  } else if (length(attributes(data)$ps_data_type) > 0 && attributes(data)$ps_data_type %in% c("state_year", "leader_year")) {

    if (length(attributes(data)$ps_system) > 0 && attributes(data)$ps_system == "cow") {

      cow_capitals %>% rowwise() %>%
        mutate(year = list(seq(.data$styear, .data$endyear))) %>%
        unnest(.data$year) %>%
        select(.data$ccode, .data$year, .data$lat, .data$lng) %>%
        # There will be duplicates for when the country moved.
        # Under those conditions, the first capital should be first. It's basically the Jan. 1 capital, if you will.
        group_by(.data$ccode, .data$year) %>% slice(1) %>% ungroup() -> capital_years

      cow_ddy %>%
        left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode1"="ccode","year"="year")) %>%
        rename(lat1 = .data$lat,
               lng1 = .data$lng) %>%
        left_join(., capital_years %>% select(.data$ccode, .data$year, .data$lat, .data$lng), by=c("ccode2"="ccode","year"="year")) %>%
        rename(lat2 = .data$lat,
               lng2 = .data$lng) -> hold_this

      latlng1 <- hold_this %>% select(.data$lng1, .data$lat1)
      latlng2 <- hold_this %>% select(.data$lng2, .data$lat2)
      hold_this$capdist <- distVincentySphere(latlng1, latlng2) / 1000
      hold_this %>% select(-.data$lat1, -.data$lng1, -.data$lat2, -.data$lng2) -> hold_this

      hold_this %>% group_by(.data$ccode1, .data$year) %>%
        summarize(mincapdist = min(.data$capdist, na.rm=TRUE)) %>% ungroup() %>%
        rename(ccode = .data$ccode1) %>%
        left_join(data, .) -> data

      return(data)


    } else { # Assuming it's G-W system

      gw_capitals %>% rowwise() %>%
        mutate(year = list(seq(.data$styear, .data$endyear))) %>%
        unnest(.data$year) %>%
        select(.data$gwcode, .data$year, .data$lat, .data$lng) %>%
        # There will be duplicates for when the country moved.
        # Under those conditions, the first capital should be first. It's basically the Jan. 1 capital, if you will.
        group_by(.data$gwcode, .data$year) %>% slice(1) %>% ungroup() -> capital_years

      create_dyadyears(system = 'gw') %>%
        left_join(., capital_years %>% select(.data$gwcode, .data$year, .data$lat, .data$lng), by=c("gwcode1"="gwcode","year"="year")) %>%
        rename(lat1 = .data$lat,
               lng1 = .data$lng) %>%
        left_join(., capital_years %>% select(.data$gwcode, .data$year, .data$lat, .data$lng), by=c("gwcode2"="gwcode","year"="year")) %>%
        rename(lat2 = .data$lat,
               lng2 = .data$lng) -> hold_this

      latlng1 <- hold_this %>% select(.data$lng1, .data$lat1)
      latlng2 <- hold_this %>% select(.data$lng2, .data$lat2)
      hold_this$capdist <- distVincentySphere(latlng1, latlng2) / 1000
      hold_this %>% select(-.data$lat1, -.data$lng1, -.data$lat2, -.data$lng2) -> hold_this

      hold_this %>% group_by(.data$gwcode1, .data$year) %>%
        summarize(mincapdist = min(.data$capdist)) %>% ungroup() %>%
        rename(gwcode = .data$gwcode1) %>%
        left_join(data, .) -> data

      return(data)


    }
  }
  else  {
    stop("add_capital_distance() requires a data/tibble with attributes$ps_data_type of state_year or dyad_year. Try running create_dyadyears() or create_stateyears() at the start of the pipe.")

  }
}
