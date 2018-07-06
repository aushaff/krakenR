#'@title Get asset information
#'@description Currently only works with defaults; returns all information
#'about all asset classes
#'@return list of asset names and their information
#'@export

get_asset_info <- function() {

  url <- "https://api.kraken.com/0/public/Assets"
  asset_out <- jsonlite::fromJSON(url)

  return(asset_out)
}
