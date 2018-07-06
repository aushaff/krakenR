#'@title Get recent spread data
#'@description Returns recent spread data for a specified asset
#'@param pair asset pair to get market depth for
#'@param since return trade data since given id (optional; default: 0)
#'@export
get_recent_spread <- function(pair = "XBTEUR", since = 0) {

  base_url <- "https://api.kraken.com/0/public/Spread"
  url <- paste0(base_url, "?", "pair=", pair, "&", "since=", since)

  spread_out <- jsonlite::fromJSON(url)

  return(spread_out)
}
