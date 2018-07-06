krakenR API interface
================
Austin Haffenden
2018-07-06

Introduction
============

This package interfaces with the kraken API. Currently only for the the GET functions and not all are implemented. It is a work in progress.

Get asset information
=====================

Interogate the API for information on the existing assets. Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Currently default settings so returns information on all assets:

-   asset\_name = asset name
-   altname = alternate name
-   aclass = asset class (e.g. currency)
-   decimals = scaling decimal places for record keeping
-   display\_decimals = scaling decimals for output display

``` r
ast_inf <- get_asset_info()

ast_inf$error
#> list()

ast_inf$result[[1]]
#> $aclass
#> [1] "currency"
#> 
#> $altname
#> [1] "BCH"
#> 
#> $decimals
#> [1] 10
#> 
#> $display_decimals
#> [1] 5
```

Get OHLC data
=============

Get market history OHLC data for a specified asset pair. Time frame interval is specifed in minutes: 1 (default), 5, 15, 30, 60, 240, 1440, 10080, 21600. Since can also be provided in Unix long form. Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Result contains two elements: the returned OHLC data and the 'last' date in the data set. The default since is 0 (earliest). Data returned:
time; open; high; low; close; vwap; volume; count

``` r
ohlc <- get_ohlc_data(pair = "BCHEUR", interval = 30, since = 0)

ohlc$error
#> list()

head(ohlc$result$BCHEUR)
#>      [,1]         [,2]    [,3]    [,4]    [,5]    [,6]    [,7]        
#> [1,] "1530843000" "624.2" "624.2" "624.2" "624.2" "0.0"   "0.00000000"
#> [2,] "1530843060" "624.2" "624.2" "624.2" "624.2" "0.0"   "0.00000000"
#> [3,] "1530843120" "624.2" "624.2" "624.2" "624.2" "0.0"   "0.00000000"
#> [4,] "1530843180" "624.2" "624.2" "624.2" "624.2" "0.0"   "0.00000000"
#> [5,] "1530843240" "624.2" "624.2" "624.2" "624.2" "0.0"   "0.00000000"
#> [6,] "1530843300" "624.2" "625.8" "624.2" "625.8" "625.8" "0.00272000"
#>      [,8]
#> [1,] "0" 
#> [2,] "0" 
#> [3,] "0" 
#> [4,] "0" 
#> [5,] "0" 
#> [6,] "1"

ohlc$result$last
#> [1] 1530886080
```

Get order book
==============

Return the current bid and ask orders for a specific asset. Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Result contains two elements: asks; bids. Optional to pass 'count', the maximum number of asks/bids (not implemented). Data returned as:
price; volume; timestamp

``` r
ord <- get_order_book("BCHEUR")

ord$error
#> list()

head(ord$result$BCHEUR$asks)
#>      [,1]         [,2]     [,3]        
#> [1,] "617.000000" "12.378" "1530886167"
#> [2,] "617.100000" "11.000" "1530886167"
#> [3,] "617.900000" "3.721"  "1530886163"
#> [4,] "618.200000" "4.799"  "1530886158"
#> [5,] "618.300000" "16.000" "1530886159"
#> [6,] "618.400000" "0.156"  "1530886161"

head(ord$result$BCHEUR$bids)
#>      [,1]         [,2]     [,3]        
#> [1,] "615.500000" "0.080"  "1530886164"
#> [2,] "615.300000" "50.198" "1530886167"
#> [3,] "615.100000" "0.753"  "1530886161"
#> [4,] "615.000000" "0.002"  "1530886130"
#> [5,] "614.900000" "0.028"  "1530886125"
#> [6,] "614.800000" "0.138"  "1530886138"
```

Get recent spread data
======================

Returns the recent spread data for a specified asset from a specified since. Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Result contains two elements: the spread entries for the asset; last, the id to be used as since when polling for new spread data. Data returned as: time; bid; ask

``` r
sprd <- get_recent_spread("BCHEUR", since = "1530876860")

sprd$error
#> list()

head(sprd$result$BCHEUR)
#>      [,1]         [,2]         [,3]        
#> [1,] "1530885496" "616.700000" "618.200000"
#> [2,] "1530885500" "616.800000" "618.200000"
#> [3,] "1530885512" "616.900000" "618.200000"
#> [4,] "1530885518" "616.500000" "618.200000"
#> [5,] "1530885518" "616.700000" "618.200000"
#> [6,] "1530885520" "616.800000" "618.200000"

sprd$result$last
#> [1] 1530886164
```

Get recent trades
=================

Returns the recent trades for a specified asset from a specified since (default is zero). Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Result contains two elements: the trade data for the specified asset over the specified period; last, the id to be used as since when polling for new trade data. Data returned as: price; volume; time; buy/sell; market/limit; miscellaneous

``` r
trd <- get_recent_trades("BCHEUR", since = "1501605300157840478")

trd$error
#> list()

head(trd$result$BCHEUR)
#>      [,1]         [,2]         [,3]              [,4] [,5] [,6]
#> [1,] "201.000000" "4.40412300" "1501605300.1686" "s"  "l"  ""  
#> [2,] "201.000000" "0.37757218" "1501605301.187"  "s"  "l"  ""  
#> [3,] "200.000000" "0.96634400" "1501605301.2016" "s"  "l"  ""  
#> [4,] "200.000000" "0.38140082" "1501605301.2054" "s"  "l"  ""  
#> [5,] "200.000000" "0.94320800" "1501605301.7552" "s"  "l"  ""  
#> [6,] "227.000000" "5.92377490" "1501605304.2953" "b"  "m"  ""

trd$result$last
#> [1] "1501606753013048489"
```

Get server time
===============

Returns a unix timestamp and an RFC 1123 time format. This is to aid in approximating the skew time between server and client.

``` r
get_server_time()
#> $unixtime
#> [1] 1530886173
#> 
#> $rfc1123
#> [1] "Fri,  6 Jul 18 14:09:33 +0000"
```

Get ticker info
===============

Returns the ticker info for a comma seperated list of assets. Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Data returned for each pair:

-   a = ask array(price, whole lot volume, lot volume)
-   b = bid array(price, whole lot volume, lot volume)
-   c = last trade closed array(price, lot volume)
-   v = volume array(today, last 24 hours)
-   p = volume weighted average price array(today, last 24 hours)
-   t = number of trades array(today, last 24 hours)
-   l = low array(today, last 24 hours)
-   h = high array(today, last 24 hours)
-   o = today's opening price

``` r
pair_list <- paste("BCHEUR", "XBTEUR", sep = ",")
tick <- get_ticker_info(pair_list)

tick$error
#> list()

tick$result$BCHEUR
#> $a
#> [1] "616.900000" "11"         "11.000"    
#> 
#> $b
#> [1] "615.500000" "1"          "1.000"     
#> 
#> $c
#> [1] "616.000000" "0.16298701"
#> 
#> $v
#> [1] "1547.71314167" "2466.59111471"
#> 
#> $p
#> [1] "618.767691" "621.254172"
#> 
#> $t
#> [1] 1160 2253
#> 
#> $l
#> [1] "596.700000" "596.700000"
#> 
#> $h
#> [1] "635.300000" "645.100000"
#> 
#> $o
#> [1] "635.000000"
```

Get tradeable asset pair
========================

Returns the requested information for a comma seperated list of tradeable asset pairs. Information requested can be: "info": all info (default); "leverage": leverage info; fees: fees schedule; margin: margin info.Output returned as a list with two elements: error and result. The error element is empty if no error occured. The result element is empty if an error occured. Data returned is:

-   pair\_name = pair name
-   altname = alternate pair name
-   aclass\_base = asset class of base component
-   base = asset id of base component
-   aclass\_quote = asset class of quote component
-   quote = asset id of quote component
-   lot = volume lot size
-   pair\_decimals = scaling decimal places for pair
-   lot\_decimals = scaling decimal places for volume
-   lot\_multiplier = amount to multiply lot volume by to get currency volume
-   leverage\_buy = array of leverage amounts available when buying
-   leverage\_sell = array of leverage amounts available when selling
-   fees = fee schedule array in \[volume, percent fee\] tuples
-   fees\_maker = maker fee schedule array in \[volume, percent fee\] tuples (if on maker/taker)
-   fee\_volume\_currency = volume discount currency
-   margin\_call = margin call level
-   margin\_stop = stop-out/liquidation margin level

``` r
tap <- get_tradable_asset_pair(info = "margin", 
                               pair_list = "BCHEUR, XBTEUR")

tap$error
#> list()

tap$result$BCHEUR
#> $margin_call
#> [1] 80
#> 
#> $margin_level
#> [1] 40
```
