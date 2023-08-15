tellraw @s ["\n", \
	{"text":"Plagiatus' Statistics and Books Help\n", "color":"gold", "bold": true}, \
	{"text":"For more info and extended explanation, click here.\n", "color":"blue", "underlined": true, "italic": true, "clickEvent":{"action":"open_url","value":"https://github.com/Plagiatus/Statistic-Books-MC"}, "hoverEvent": {"action": "show_text", "contents":["github.com/Plagiatus/Statistic-Books-MC"]}}, \
	{"text":"To create a compatible book, follow these steps:"},\
	"\n    1. Choose a scoreboard to track. Either create it, or choose one of the built-in ones (see the link above for more info).", \
	"\n    2. Write the internal name of the scoreboard as the only text into the book.", \
	"\n    3. Name the book \"MCStats\".", \
	"\n    4. Place the book into a lectern.", \
  "\n"]

execute if score refreshType sb.settings matches 1 run tellraw @s ["", \
	{"text": "Book Updates\n", "color":"yellow", "bold": true}, \
	"Books only update when a player stands on top of the lectern and runs ",\
	{"text": "/trigger sb.update", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/trigger sb.update"}}, \
	"."]
execute if score refreshType sb.settings matches 2 run tellraw @s ["", \
	{"text": "Book Updates\n", "color":"yellow", "bold": true}, \
	"Books only update when a player stands in a 16 block radius of the lectern and runs ",\
	{"text": "/trigger sb.update", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/trigger sb.update"}}, \
	"."]
execute if score refreshType sb.settings matches 3 run tellraw @s ["", \
	{"text": "Book Updates\n", "color":"yellow", "bold": true}, \
	"All loaded lecterns update automatically every 5 minutes.",\
	""]
execute if score refreshType sb.settings matches 4 run tellraw @s ["", \
	{"text": "Book Updates\n", "color":"yellow", "bold": true}, \
	"Books don't update unless admins run a command.",\
	""]
execute if score autoOptIn sb.settings matches 0 run tellraw @s ["", \
	{"text": "Opting in/out\n", "color":"yellow", "bold": true}, \
	"Using ", {"text": "/trigger sb.optin", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/trigger sb.optin"}}, \
	" you can toggle whether you want to be included in the books or not.", \ 
	""]
execute if score allowSecret sb.settings matches 1 run tellraw @s ["", \
	{"text": "Secrets\n", "color":"yellow", "bold": true}, \
	"To hide either names or scores in a given book, stand on the lectern and run ", \
	{"text": "/trigger sb.secret", "underlined": true, "clickEvent": {"action": "suggest_command", "value": "/trigger sb.secret"}}, \
	"."]

scoreboard players set @s sb.help 0