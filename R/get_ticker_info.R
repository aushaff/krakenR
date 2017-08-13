# https://api.kraken.com/0/public/Ticker?pair=XBTEUR
# pair = comma delimited list of asset pairs to get info on
get_ticker_info <- function(pair_list = "XBTEUR"){

  url <- paste0("https://api.kraken.com/0/public/Ticker?pair=", pair_list)
  ticker_out <- jsonlite::fromJSON(url)
  return(ticker_out)
}
