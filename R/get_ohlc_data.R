#'@title Get OHLC data
#'@description Returns OHLC data for the specified asset and since
#'@param pair asset pair to get OHLC data for
#'@param interval time frame interval minutes (optional):
#' 1 (default), 5, 15, 30, 60, 240, 1440, 10080, 21600
#'@param since return committed OHLC data since given id (optional) default: 0
#'@export

#  https://api.kraken.com/0/public/OHLC
# can be a service unavailabe error if too soon
get_ohlc_data <- function(pair = "XBTEUR",
                          interval = 1,
                          since = 0) {

  base_url <- "https://api.kraken.com/0/public/OHLC"
  url <- paste0(base_url, "?", "pair=", pair,
                "&since=", since,
                "&interval=", interval)

  ohlc_out <- jsonlite::fromJSON(url)

  return(ohlc_out)
}
