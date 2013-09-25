# http://stackoverflow.com/questions/6461209/how-to-round-up-to-the-nearest-10-or-100-or-x
# http://stackoverflow.com/questions/3502925/include-files-r
roundUp <- function(x) 10^ceiling(log10(x))
roundUpNice <- function(x, nice=c(1,2,4,5,6,8,10)) {
    if(length(x) != 1) stop("'x' must be of length 1")
    10^floor(log10(x)) * nice[[which(x <= 10^floor(log10(x)) * nice)[[1]]]]
}
round_up <- function(x, round=10) ceiling(max(x+10^-9)/round + 1/round)*round
