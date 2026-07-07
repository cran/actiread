## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = ""
)

## ----setup--------------------------------------------------------------------
library(actibase)
library(actiread)

## -----------------------------------------------------------------------------
gt3x_file = acti_example_gt3x()
cwa_file = acti_example_cwa()

gt3x = acti_read_gt3x(gt3x_file, verbose = FALSE)
cwa = acti_read_cwa(cwa_file, verbose = FALSE)

class(gt3x)
names(gt3x)
class(cwa)
names(cwa)

## -----------------------------------------------------------------------------
info = acti_info_gt3x(gt3x_file)
names(info)

## -----------------------------------------------------------------------------
gt3x_no_tz = acti_read_gt3x(
  gt3x_file,
  tz = NULL,
  apply_tz = FALSE,
  verbose = FALSE,
  fill_zeroes = FALSE
)

cwa_no_tz = acti_read_cwa(
  cwa_file,
  tz = NULL,
  apply_tz = FALSE,
  verbose = FALSE
)

get_transformations(gt3x_no_tz)
get_transformations(cwa_no_tz)

## -----------------------------------------------------------------------------
tzoffset_to_tz(c("+00:00", "-05:00", "+01:00"))

## -----------------------------------------------------------------------------
std = acti_standardize_data(gt3x)

head(std)

## -----------------------------------------------------------------------------
resampled = acti_resample(std, sample_rate = 30L)
get_transformations(resampled)

same_times = acti_resample_to_time(
  std,
  times = lubridate::floor_date(std$time, unit = "1 second")
)
get_transformations(same_times)

