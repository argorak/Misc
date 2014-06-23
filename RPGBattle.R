## This is a simple RPG battle manager.
##
## It takes a hero character and a moblist
## and automatically forces a battle.

startBattle <- function(hero) {
    
    rollencounter <- function() {
        roll <- sample(1:100, 1)
        mob <- moblist$rate > roll
        
        i <- 1
        while(!mob[i]) {
            i <- i + 1
        }
        mobchar <- makeCharacter(moblist$hp[i], moblist$hp[i], moblist$atk[i], 
                                 moblist$def[i], moblist$name[i])
    }
    
    applydamage <- function(atker, defer) {
        dmg <- atker$getatk() - defer$getdef()
        if(dmg < 0)
            dmg <- 0
        hpset <- defer$gethp() - dmg
        defer$sethp(hpset)
        
        show(paste(c(atker$getname(), "dealt", as.character(dmg), "damage!"), sep = "", collapse = " "))
    }
   
    mobchar <- rollencounter()
    
    ## battle loop
    while((hero$gethp() > 0 && mobchar$gethp() > 0)) {
        if(sample(0:1, 1) == 1)
            applydamage(hero, mobchar)
        else
            applydamage(mobchar, hero)
    }
    
    ## battle results
    if(hero$gethp() > 0)
        defeated <- mobchar$getname()
    else
        defeated <- hero$getname()
    
    show(paste(defeated, " was defeated!", sep = "", collapse = " "))
}

## contains monster data
moblist <- list(name = c("slime", "wolf", "goblin", "troll", "demon"),
                hp = c(5, 10, 15, 20, 25), atk = c(1, 3, 6, 15, 30),
                def = c(1, 2, 4, 8, 16), rate = c(50, 75, 88, 94, 100))