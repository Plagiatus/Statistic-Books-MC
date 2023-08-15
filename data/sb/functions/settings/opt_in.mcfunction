scoreboard players set @s sb.optedin 1
scoreboard players set @s sb.optin 0

tellraw @s [{"translate":"sb.opt_in","color":"gray","italic":true,"text":"You have chosen to be included in the statistics."}]