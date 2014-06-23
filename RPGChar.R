## This file creates a simple RPG character in R.

makeCharacter <- function(hp, hpMAX, atk, def, name) {
    
    ## getter functions
    gethp <- function() hp
    gethpMAX <- function() hpMAX
    getatk <- function() atk
    getdef <- function() def
    getname <- function() name
    ## setter functions
    sethp <- function(x) hp <<- x
    sethpMAX <- function(x) hpMAX <<- x
    setatk <- function(x) atk <<- x
    setdef <- function(x) def <<- x
    setname <- function(x) name <<- x
    ## list of functions
    list(gethp = gethp, gethpMAX = gethpMAX, getatk = getatk, getdef = getdef,
         sethp = sethp, sethpMAX = sethpMAX, setatk = setatk, setdef = setdef,
         getname = getname, setname = setname)
}