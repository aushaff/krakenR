#  https://api.kraken.com/0/public/OHLC
# can be a service unavailabe error if too soon
get_ohlc_data <- function(pair = "XBTEUR",
                          interval = 1,
                          since = 0) {

  base_url <- "https://api.kraken.com/0/public/OHLC"
  url <- paste0(base_url, "?", "pair=", pair)

  ohlc_out <- jsonlite::fromJSON(url)

  return(ohlc_out)
}
