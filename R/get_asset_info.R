#'@title
#'@description
# https://api.kraken.com/0/public/Assets?info='currency'

get_asset_info <- function() {

  url <- "https://api.kraken.com/0/public/Assets"
  asset_out <- jsonlite::fromJSON(url)

  return(asset_out)
}
