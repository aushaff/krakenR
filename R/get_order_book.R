#'@title Get order book
#'@description Returns current orders for bid and ask
#'@param pair asset pair to get market depth for
#'@param count maximum number of asks/bids (not currently implemented)
#'@export
get_order_book <- function(pair = "XBTEUR", count = NULL) {

  base_url <- "https://api.kraken.com/0/public/Depth"
  url <- paste0(base_url, "?", "pair=", pair)

  ordbk_out <- jsonlite::fromJSON(url)

  return(ordbk_out)
}
