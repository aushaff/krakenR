#'@title gets recent trades from a 'since' date
#'@description returns recent trades for a specifed asset
#'@param pair asset pair to get trade data for
#'@param since return trade data since given id (optional; default: 0)
#'@export
get_recent_trades <- function(pair,
                              since = 0) {

  base_url <- "https://api.kraken.com/0/public/Trades"

  url <- paste0(base_url, "?", "pair=", pair, "&", "since=", since)

  trades_ret <- jsonlite::fromJSON(url)

  return(trades_ret)

}
