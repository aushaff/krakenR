#  https://api.kraken.com/0/public/Depth
#
get_order_book <- function(pair = "XBTEUR") {

  base_url <- "https://api.kraken.com/0/public/Depth"
  url <- paste0(base_url, "?", "pair=", pair)

  ordbk_out <- jsonlite::fromJSON(url)

  return(ordbk_out)
}
