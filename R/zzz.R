# CRAN Note avoidance. I hate this check.
# Inspiration: https://github.com/HughParsonage/grattan/blob/master/R/zzz.R
# Also:
if(getRversion() >= "2.15.1")
  utils::globalVariables(
    # underlying data used for behind-the-scenes handsomeness
    c("capitals", "ccode_democracy", "cow_alliance", "cow_contdir",
      "cow_ddy", "cow_gw_years", "cow_majors", "cow_states",
      "gml_dirdisp", "gw_ddy", "gw_states", "maoz_powers", "cow_nmc")
  )