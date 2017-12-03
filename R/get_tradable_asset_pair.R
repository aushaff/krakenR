#'@title
#'@description
# https://api.kraken.com/0/public/AssetPairs

get_tradable_asset_pair <- function() {

  base_url <- "https://api.kraken.com/0/public/AssetPairs"
  tap_results <- jsonlite::fromJSON(base_url)

  # if an error message is returned handle it
  # and return all the data
  err <- tap_results$error
  if(length(err)>0) {
    cat("Error received retrieving data")
    return(tap_results)

    # otherwise return the two time formats
  } else {

    tap_out <- tap_results$result
  }

  return(tap_out)
}
