# QE-TDM
Quake Enhanced - Team Deathmatch (Multiplayer Mod)

## What is it?
<<<<<<< HEAD
This is a multiplayer deathmatch mod for Quake Enhanced that adds basic capture the flag gamemode.
Only selected maps are supported. There is partial bot support.

## Bot support
Bot support is partial. The bots do understand teams, however they cannot distinguish between team-owned flags / items.
They will ocasionally capture the flag.

## How to install
1. Go to your 'Saved games' quake folder, NOT THE STEAM FOLDER. You can go to it by pressing Windows+R and typing: %userprofile%\Saved Games\Nightdive Studios\Quake
2. Create a folder called 'id1'
=======
This is a multiplayer deathmatch mod focused primarily for Quake Enhanced that adds basic team-play support and some other fun additions. This started as a fork of QECTF that focused only on the teamplay improvements that make sense for deathmatch.

## How to download
1. Download a packaged release here or just the latest progs.dat file from the repository above.

## How to install
1. Go to your 'Saved games' quake folder, NOT THE STEAM FOLDER. You can go to it by pressing Windows+R and typing: %userprofile%\Saved Games\Nightdive Studios\Quake\
2. Create a folder called 'id1' if it does not already exist.
>>>>>>> 73e8ab7 (fixing repo)
3. Create another folder and call it 'mpmod'. If you already have this folder, skip this step.
4. If you downloaded a release, unzip it. Move the progs.dat file into the 'id1' folder you created on step 2. 
   * If you already have an 'id1' folder, it's likely from another mod. Unfortunately, you'll have to replace it.

## How to install support for Dissolution of Eternity
1. Go to your 'Saved games' quake folder.
2. Create a folder called 'rogue', in the same folder where you created 'id1'
3. Extract the zip into the 'rogue' folder that you created on the previous step.
4. Rename the pak0.pak file to pak1.pak
5. Go to your steam quake folder (Usually c:\program files (x86)\Steam\Steamapps\common\quake\rerelease)
6. Go to the 'rogue' folder
7. Copy the pak0.pak from here to the 'rogue' folder that you created in Step 2

## How to run the mod
1. Open console and type 'game mpmod'
2. Start a multiplayer game

<<<<<<< HEAD
### Technical explanation
When you change to mpmod, it sets the root folder to be Saved Games, so next time the game goes into id1 it will use the files from Saved Games and override.

## How to set gamemodes
1. Open console and set the variable 'saved1' to the value you want.
2. Restart map

## Supported maps
* dm3
* dm6
* e3m6
* ctf1 (Requires Dissolution of Eternity support)

## Adding map support
You can do this by doing simple entity replacements in the maps, or coding it directly into the code. The latter is how the supported maps were added.

Only one new entity is available:
* ctf_flag

Specify the "team" keyvalue on items, armor, spawns and flags to specify which team they belong to. trigger_teleport also supports it.

### Team IDs
Red: 5
Blue: 14

=======
>>>>>>> 73e8ab7 (fixing repo)
## Credits
JPiolho: Author of QECTF, which is this is originally forked from.
AngryPunk: Author of QE-TDM.
