# Statistic-Books-MCA Datapack that tracks all statistics in scores and allows to display highscores in books.

[![Modrinth Downloads](https://img.shields.io/modrinth/dt/statisticbooks?style=for-the-badge&label=Modrinth%20Downloads&logo=modrinth&color=%231bd96a)](https://modrinth.com/datapack/statisticbooks)

### MINECRAFT VERSION 23w31a (1.20.2) and above!

**To use this datapack, download it from [modrinth](https://modrinth.com/datapack/statisticbooks) to go the [latest release](https://github.com/Plagiatus/Statistic-Books-MC/releases/latest) and download the zip file.**

Run `/trigger sb.help` to get a setting-sensitive in-game overview of how it works for players. Admins/OPs and more informed players should read on.

## Table of contents
- [What it does](#what-it-does)
	- [Limitations](#limitations)
	- [How to get a book](#how-to-get-a-book)
		- [How to know the scoreboard name](#how-to-know-the-scoreboard-name)
	- [Secret Mode](#secret-mode)
- [Settings](#settings)
	- [`autoOptIn`](#autooptin)
	- [`allowSecret`](#allowsecret)
	- [`refreshType`](#refreshtype)
- [Other modifications](#other-modifications)
	- [Text](#text)
    - [Combining Scoreboards](#combining-scoreboards)
	- [Administrative work](#administrative-work)

## What it does

This datapack allows you to track any and all statistics or other scoreboard objectives in a book in a lectern. It sorts it by highest and thus shows whoever has the best score.

NOTE: All statistics are tracked through scoreboards. Because of this they cannot start tracking before they are created. So remember to create your scoreboards early. This pack comes with a built-in function that sets up all possible objectives for you, see [How to know the scoreboard name](#how-to-know-the-scoreboard-name).

### Limitations

Because under the hood it has to use scoreboard objectives, and scoreboard objectives only start tracking numbers when they are created and don't retroactively include the already happened things, the pack only starts tracking all the built-in statistics from the point it is added, not the point of world creation. It is thus **recommended to add the pack at world creation** or immediately afterwards.  
**If you want to add it later to a world, you can use my [stats to scoreboards](https://plagiatus.github.io/Statistic-Books-MC/generator/stats_to_scoreboard) tool to bring the new scoreboard objectives up to sync with your existing stats.**

Because the way scoreboards work, only online players can be queried for their scores. To be able to also include offline players, this pack caches all players tracked scores **every 5 minutes**. This has various implications:


- Scores aren't updated live, but at max every 5 minutes.
- Players who aren't online for at least 5 minutes might not have their scores recorded.
- Only players who were online (for 5+ minutes) after a books creation can be included in the book.

**Only books placed in lecterns will be updated!**

### How to get a book

To get a book that works in the system, you take a writable book, put the name of the objective you want to track as the only text in the book on the first page (no spaces or newlines), sign the book and name it "MCStats". The book gets converted _automatically when first put into a lectern_. You know it worked when the books content is replaced by the statistics (or empty at first, it takes up to 5 minutes to fill).

For the book to actually receive updates about the tracked statistics, **it needs to be placed inside a lectern** and, depending on the settings, be loaded when a refresh occurs.

#### How to know the scoreboard name

You can track **any scoreboard objective**, not just the built-in ones but ones you create yourself as well. The pack comes with a function that creates all statistic type scoreboards the game has to offer - just shy of 8000 of them. **If you want to add that, run `/function sb:setup_objectives` right after loading the datapack!**

To find out what statistics are available, consult the wiki: https://minecraft.fandom.com/wiki/Statistics

Resource locations in the game are named in the form `A.B:C.D`. Since `A` and `C` are both always `minecraft` for vanilla things, I chose to omit them and only include the other two. The convention for named objectives of this datapack is `sb.<B>.<C>`. 

Here are some examples:

| Vanilla | Statistics Book Datapack |
|-|-|
| `minecraft.custom:minecraft.walk_one_cm` | `sb.custom.walk_one_cm` |  
|`minecraft.mined:minecraft.stone` | `sb.mined.stone` |
|`minecraft.killed:minecraft.zombie` | `sb.killed.zombie` |

### Secret Mode

If enabled in the settings, players can enable **secret mode** for any book inside a lectern by standing on the lectern and running `/trigger sb.secret`. This will cycle through the different modes:

**Default**: Everything is shown.  
**Secret Names**: Names are hidden, scores are visible.  
**Secret Scores**: Names are visible, scores are hidden.

## Settings

There are various settings you can use to adjust the datapacks behavior to your liking. All of these are stored in the `sb.settings` objective and can only be changed by an OP of lvl 2 or above through a scoreboard command.

    /scoreboard players set <settingName> sb.settings <value>

You can show all current settings by setting the sidebar to display `sb.settings`.

    /scoreboard objectives setdisplay sidebar sb.settings

To hide them again, run the same command without the `sb.settings` at the end.

### `autoOptIn`
_Default: 1_  
If `autoOptIn` is set to 1, everyone is automatically included in the statistics collection and they cannot opt-out. If set to 0, players need to run `/trigger sb.optin` to be included in the statistics collection.  
If a player that was previously opted in chooses to opt-out, their scores are removed from the storage and will be removed from the books in the next update.

_Note: If you switch this value from 1 to 0, all collected values will stay included (but won't get updated anymore) unless a player specifically opts out again._

### `allowSecret`
_Default: 1_  
When set to 1 it allows players to use `/trigger sb.secret` to toggle a books "secretive" mode (see above).  
Setting it to 2 keeps the secrecy status active, but the stati can only be changed by admins using `/function sb:admin/secret`.

Setting it to 0 does disable secrets, but books remember their status, so if it's re-enabled the books will turn secretive again.

### `refreshType` 
_Default: 0_  
Refreshing books can be a resource intensive task, depending on the amount of players a server has, how many books need to be updated and more. These options allow you to finetune when and how books are supposed to be updated.

| Value | Type | Description|
|-|-|-|
|0|Upon Opening| _(Default)_ Updates a book every time someone interacts with the lectern the book is placed on. Probably best option for most servers. Not recommended if you have more than 30+ players that show up in the statistics.
|1|Single Trigger| Updates the book inside the lectern the player is standing on when running `/trigger sb.update`. 
|2|Area Trigger| Updates all books in lecterns in a 16 block radius around the player running `/trigger sb.update`.
|3|Global Timer| Will automatically refresh all loaded lecterns every 5 minutes (together with the statistics storage update).
|4|Admin Only| Only updates when an admin / moderator runs the respective commands as described below.

- `/function sb:admin/one`: Updates the book inside the lectern the player is standing on.
- `/function sb:admin/area`: Updates all books in lecterns in a 16 block radius around the player.
- `/function sb:admin/all` Updates all loaded lecterns.

## Other modifications

### Text

The pack uses **translation text** for all its texts, including the title and the lore of the books. So if you want to adjust that, you can create a language file in a resourcepack that include whatever texts you want to override and it should use those texts instead.
List of included texts:

| Identifier | Text |
|-|-|
|sb.update.success|Lectern(s) updated.|
|sb.update.fail|No lectern found.|
|sb.book.title|Statistics Book|
|sb.book.lore.1|Automatically lists everyones statistic.|
|sb.book.lore.2|Needs to be placed in lectern.|
|sb.book.lore.3|Tracked statistic:|
|sb.opt_in|You have chosen to be included in the statistics.|
|sb.opt_out|You have chosen not to be included in the statistics. Your scores will be removed the next time the books are updated.|
|sb.secret.default|Secret Mode: No secrets.|
|sb.secret.names|Secret Mode: Names hidden.|
|sb.secret.scores|Secret Mode: Scores hidden.|

### Combining Scoreboards

Sometimes you want to have a scoreboard that isn't easily tracked by the default stats, because it's a combination of two different scores / stats.  
Starting in `v1.5.1` you can register a function to the `sb:run_before` function tag that is run `as @a` before the player scores are stored in the storage.  
This lets you easily add combined scoreboards that are tallied up just-in-time instead of needing to combine them constantly.

You can use [this Scoreboard Combiner Utility](https://plagiatus.github.io/Statistic-Books-MC/generator/combined_scoreboards/) to create such combined scoreboards easily.

### Administrative work
If you want / need to get into the nitty gritty of the administrative side (removing tracked statistics, removing players, etc), it's probably easiest to contact me directly at contact@plagiatus.net or use my [contact form](https://plagiatus.net/#contact) on my website.
