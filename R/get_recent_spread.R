#  https://api.kraken.com/0/public/Spread
#
get_recent_spread <- function(pair = "XBTEUR") {

  base_url <- "https://api.kraken.com/0/public/Spread"
  url <- paste0(base_url, "?", "pair=", pair)

  spread_out <- jsonlite::fromJSON(url)

  return(spread_out)
}
