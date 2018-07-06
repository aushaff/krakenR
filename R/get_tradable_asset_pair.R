#'@title gets recent trades from a 'since' date
#'@description returns recent trades for a specifed asset
#'@param info info to retrieve (optional):
#' info: all (default); leverage = leverage info;
#' fees = fees schedule; margin = margin info
#'@param pair_list comma delimited list of asset pairs (default: all)
#'@export

get_tradable_asset_pair <- function(info = "info", pair_list = "XBTEUR") {

  #base_url <- "https://api.kraken.com/0/public/AssetPairs"
  base_url <- paste0("https://api.kraken.com/0/public/AssetPairs?info=", info,
                     "&pair=", pair_list)
  tap_results <- jsonlite::fromJSON(base_url)

  return(tap_results)
}
