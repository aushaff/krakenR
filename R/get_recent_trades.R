#  https://api.kraken.com/0/public/Trades
#
get_recent_trades <- function(pair = "XBTEUR") {

  base_url <- "https://api.kraken.com/0/public/Trades"
  url <- paste0(base_url, "?", "pair=", pair)

  trades_out <- jsonlite::fromJSON(url)

  return(trades_out)
}
