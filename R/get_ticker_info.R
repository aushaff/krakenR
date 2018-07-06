#'@title gets recent trades from a 'since' date
#'@description returns recent trades for a specifed asset
#'@param pair_list comma delimite vector of pairs to get ticker info on
#'@return list of pair names and asset info
#'@export
get_ticker_info <- function(pair_list = "XBTEUR"){

  url <- paste0("https://api.kraken.com/0/public/Ticker?pair=", pair_list)
  ticker_out <- jsonlite::fromJSON(url)
  return(ticker_out)
}
