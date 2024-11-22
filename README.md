# AIZombies Supreme
AIZombies Supreme is a mod for MW3 that is a sequel to the MW2 mod "AIZombies eXtreme". This sequel improves many aspects over the previous mod and includes many new features and fixes. The mod originally released on TeknoMW3 years back.
This version of the mod is a port for PlutoIW5 that contains many fixes, new features and content, and overall improvements over the TeknoMW3 version.

## Mod Features
There are many features in this mod, and many new ones compared to the original MW2 mod. Here are many of the features this mod includes. Features highlighted in bold are new features not included in the original MW2 mod.

- Random Weapon Box that can give the player any random weapon
- Gambler Box that can do any random thing to the player from giving/taking points to killing the player
- Pack A Punch machine that allows you to upgrade your weapons with more damage and attachments
- Perk boxes that can give the player perks to such as Juggernog and Quick Revive Pro
- Power Box that activates perks, the upgrade machine, and other power-based things
- **Black Ops 1 styled teleporter that will teleport the player to a new location for a set amount of time. They will return after the timer reaches 0**
- Killstreak box that allows the player to buy additional killstreaks using bonus points
- Elevators that can move the player to higher or new locations
- **Buyable Doors that will open up new areas of some maps**
- Bonus Drops from killed zombies like Insta-Kill, Max Ammo, Double Points, and more
- **ATM Bank machine that can store up to 100k of your points to save for another game. Points will save in the ATM until you withdraw it, even in completely different maps and servers**
  
...and many many more features! 

### New PlutoIW5 features
This version of the mod has many new features that the TeknoMW3 version does not have due to modding limitations. Here are many of those new features.

- **ALL** content from the MW2 AIZombies eXtreme mod including all MW2 weapons and their upgrades, killstreaks, and maps
- Custom experiences like Der Riese and Nacht Der Untoten with all custom assets
- The real Black Ops Raygun and Thundergun
- Additional weapon upgrades, like an Akimbo G36C and the classic CoD4 AK-47
- Fixes for major bugs like the "CL_CGameNeedsServerCommand" crash
- Custom gamemode name in the server list

## How To Install
1. Download the latest release file in the Releases page.
2. Within the release, place the `aizombies3` folder in your Plutonium mods folder (located at `%localappdata%/Plutonium/storage/iw5/mods` or create a mods folder in the root of your server and place this folder there)
3. In your server install folder, go into `zone/english` and replace the `common_mp.ff` and `patch_mp.ff` with the two files in the aizombies3 folder. This is required for Plutonium to load the mod correctly. Failing to do this will cause the server to crash upon startup.
4. Start your server with the dvar `g_gametype` set to `aiz`
5. Have fun!

You may also play in a private match by loading the mod using the console command `loadmod aizombies3` and starting a game on any supported map with Team Deathmatch as the gamemode.

## Dvars/Tweaks
AIZombies Supreme includes a list of dvars that can tweak the experience. These dvars are included to allow server hosters to customize the gameplay to make it easier or harder.

- `aiz_spawnType`: dictates the weapons that the player spawns with. Valid options are `0` (spawn all players with the USP) and `1` (spawn with a random weapon)
- `aiz_maxHealth`: max player health without juggernog
- `aiz_maxHealth_jugg`: max player health with juggernog
- `aiz_botStartingHealth`: starting health of regular zombies
- `aiz_crawlerHealth`: starting health of crawler zombies
- `aiz_bossHealth`: starting health of boss zombies
- `aiz_botHealthFactor`: health that will be added to zombies each round
- `aiz_botDamage`: how much damage a zombie does to a player
- `aiz_perkDrops`: enable or disable perk powerup drops at the end of crawler rounds on hell maps
- `aiz_mapVoting`: enable or disable the map voting system at the end of a game. When disabled, a random map will automatically be switched to
- `aiz_dlcMaps`: enable or disable MW3 DLC maps from appearing in the map voting or being switched to at the end of a game
- `aiz_mw2Maps`: enable or disable MW2 maps from appearing in the map voting or being switched to at the end of the game
- `aiz_mw2MapsOnly`: enable or disable using only MW2 maps in the map voting or map rotation. Useful if you want to host a server that gives the same feel as playing the old MW2 mod with additional content
- `aiz_wawMaps`: enable or disable World at War zombie maps from appearing in the map voting or being switched to at the end of the game
- `aiz_perkLimit`: the limit to how many max perks a player can have. 0 is infinite
- `aiz_zombieDeathVoice`: enables or disables death voices from playing when a zombie is killed. Valid options are `0` (no voices play when a zombie dies), `1` (voices always play when a zombie dies), and `2` (voices only play on MW2 maps)
- `aiz_newPowerupModels`: enables or disables using the new Black Ops style powerup models. Setting this to 0 will use the old models that were used in the TeknoMW3 version of the mod
- `aiz_mw2Weapons`: enables or disables the entire list of MW2 weapons from appearing in the random weapon box. Valid options are `0` (no MW2 weapons are allowed in the box), `1` (MW2 weapons are in the box on all maps), and `2` (MW2 weapons are in the box only on MW2 maps)
- `aiz_mw2Killstreaks`: enables or disables the AIZombies eXtreme killstreaks. Valid options are `0` (MW2 killstreaks are disabled), `1` (MW2 killstreaks are available on all maps), and `2` (MW2 killstreaks are only available on MW2 maps)
- `aiz_mw2Perks`: enables or disables the AIZombies eXtreme perks. Valid options are `0` (MW2 perks are disabled), `1` (MW2 perks are available on all maps), and `2` (MW2 perks are only available on MW2 maps)
- `aiz_boWonderWeapons`: enables or disables the Black Ops Raygun and Thundergun in the weapon box
- `aiz_maxZombies`: the max amount of zombies that can be active at once
- `aiz_maxZombiesUnderLoad`: the max amount of zombies that can be active at once when there are 4 or more players in the game. This can be used to lower the max zombie counts with higher player counts to reduce server lag
- `aiz_fullFireSale`: enables or disables a fire sale powerup activating all box locations during the sale or only the current active box
- `aiz_damageGracePeriod`: a grace period that dictates how long it takes to allow a player to be hurt again after getting hurt from a zombie
- `aiz_variedZombieSpeed`: enables or disables zombie walking speeds being randomized or not. Valid options are `0` (zombie speeds are always the same as they are in the TeknoMW3 mod), `1` (zombie speeds are randomized on all maps), and `2` (zombie speeds are randomized on MW2 maps only)
- `aiz_randomZombieModels`: enables or disables zombies using random models. Valid options are `0` (zombies will use a single model like they do in the TeknoMW3 mod), `1` (zombies will always use a random body and head model), and `2` (zombies will use a random body and head model on MW2 maps only)

## Building The Mod
This mod uses several tools and files to build itself. You will need extensive knowledge on these tools and how to make mods for PlutoIW5 to build this mod.
Tools used:
- ZoneTool (https://github.com/Joelrau/zonetool)
- OpenAssetTools (https://github.com/Laupetin/OpenAssetTools)
- gsc-tool (https://github.com/xensik/gsc-tool)

### Building the pre-requisites
The AIZombies Supreme final mod files are built entirely using OpenAssetTools. Since OpenAssetTools does not support cross-game porting of assets, ZoneTool is used to assist OpenAssetTools in getting these assets for MW3. It gets these from two pre-built fastfiles in the source files: `aizombies_misc.ff` and `iw4_weapons.ff`. These two files are built using a special version of ZoneTool that is compatible with other versions of MW3. This version of ZoneTool is not available at the moment, so these fastfiles are provided pre-built. They are not used in the final mod build, just used for OAT to grab assets from. Place these fastfiles anywhere in your project directory. It is recommended to place them in the `zone_out` folder in your MW3 install directory for easy access.

Next, if you are modifying the GSC code of the mod, the final build of the mod uses gsc-tool to compile the raw .gsc files into compiled code files to use. This is optional, but is recommended if you are making a new release. Refer to the instructions of how to use gsc-tool to compile the AIZombies GSC files into the mod. Once compiled, place the newly compiled files into the OAT project folder in `maps/mp/gametypes/`. If you would rather use raw GSC files and skip compiling, you can place the raw GSC files in that same folder, and change the lines in the `aizombies.zone` file that reference the old ones (beginning with `scriptfile,`) to instead reference them as a `rawfile,` with its full filename and path. Refer to the OAT instructions on how to manage assets with the tool.

### Building the main mod
After this, you can build the full patch_mp.ff file for the mod by running the OAT Linker.exe with these parameters:
```
--load "<mw3InstallFolder>\zone_out\aizombies_misc.ff"
--load "<mw3InstallFolder>\zone_out\iw4_weapons.ff"
--load "<mw3InstallFolder>\zone\english\sp_berlin.ff"
--load "<mw3InstallFolder>\zone\english\castle.ff"
--load "<mw3InstallFolder>\zone\english\ny_harbor.ff"
--load "<mw3InstallFolder>\zone\english\so_timetrial_london.ff"
--load "<mw3InstallFolder>\zone\english\so_nyse_ny_manhattan.ff"
--load "<mw3InstallFolder>\zone\english\so_rescue_hijack.ff"
--load "<mw3InstallFolder>\zone\english\rescue_2.ff"
--load "<mw3InstallFolder>\zone\english\prague_escape.ff"
--load "<mw3InstallFolder>\zone\english\paris_ac130.ff"
--load "<mw3InstallFolder>\zone\english\mp_alpha.ff"
--load "<mw3InstallFolder>\zone\english\mp_dome.ff"
--load "<mw3InstallFolder>\zone\english\patch_mp.ff"
--load "<mw3InstallFolder>\zone\english\common_mp.ff"
--menu-permissive
--menu-no-optimization
aizombies
```
Replace `<mw3InstallFolder>` with your game folder path.

To build the common_mp.ff file for the mod (which is just a stripped down version of the base game's file), you can just use OAT with these parameters:
```
--load "<mw3InstallFolder>\zone\english\patch_mp.ff"
--load "<mw3InstallFolder>\zone\english\common_mp.ff"
--menu-permissive
--menu-no-optimization
common_mp_aiz
```
You don't need to recompile this file unless you are removing assets from it for space reasons.

The rest of the fastfiles are simply empty fastfiles (build using the `null.zone` for OAT) to remove unused files from them. You can build them normally using OAT, but likely will not ever need to be rebuilt since they are just empty.

## Troubleshooting
> My server is loading into normal Team Deathmatch instead of AIZombies.

Ensure you placed the mod files in the correct location listed above, especially placing `common_mp.ff` and `patch_mp.ff` in your server's `zone/english` folder.


> The game lags a lot when there are many players in the server.

This is due to the complexity of the mod. You can improve performance with higher playercounts by using the `aiz_maxZombiesUnderLoad` dvar. Lowering this dvar will improve performance when 4 or more players are in the server.
