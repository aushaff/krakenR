#'@title gets recent trades from a 'since' date
#'@description raw data return in form of:
#'pair name plus:
#' <price>, <volume>, <time>, <buy/sell>, <market/limit>, <miscellaneous>
#' and 'last'. the id to be used as since when polling for new trade data
#'@param base_url https://api.kraken.com/0/public/Trades
#
get_recent_trades <- function(pair = "XBTEUR",
                              since = 0) {

  base_url <- "https://api.kraken.com/0/public/Trades"
  url <- paste0(base_url, "?", "pair=", pair)

  trades_ret<- jsonlite::fromJSON(url)

  # if an error message is returned handle it
  # and return all the data
  err <- trades_ret$error
  if(length(err)>0) {
    cat("Error received retrieving data")
    return(trades_ret)

    # otherwise return the data and the last time
  } else {

    trades_out <- trades_ret$result
  }

  return(trades_out)
}
