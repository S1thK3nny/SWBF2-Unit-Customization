To: Whoever has to maintain or create new downloadable content packs for Battlefront II

This folder contains basically all the stuff necessary to create the first downloadable content package for xbox live. To munge stuff in this dir, just open the VisualMunge.exe located in this folder's _BUILD directory, and munge away. You'll probably want to turn your xbox off before you do this, so it doesn't copy files over. For this pack, you need to munge common, the DLC side, and the worlds COR, KAS, MYG and NAB.

Now, you're left with some .lvl files inside _LVL_XBOX\, which will be used to create the content pack. Note, a content pack doesn't need *all* the .lvl's that are created with the munge process. The package itself is created with XLAST, so open that util (located in your xdk folder somewhere), and open the .xlast project located in XLAST_Data\. 

You'll notice it has the necessary .lvl files located in the tree view. To test the pack, just click action->test on local xbox. Also, you should probably test the package running from a burned copy of the *shipped* version of the game with the patch(es) installed (check out Battlefront2\Xbox Patches\ for info on the patch).

To get the files to show up in the mission list, we're using the same "addme.lua" hack from the first game. This script is located in the addme\ folder. It basically tells the game the names of the new levels and adds them to the mission list. It gets run sometime after the normal mission list has been created during the load process. However, the VisualMunge doesn't know that addme.lua exists, so you'll have to run the mungeAddme.bat located in the same folder. It's supposed to munge to _LVL_XBOX\addme.script, and will get loaded directly by the engine. Note: If you have trouble getting it to overwrite the current addme.script, delete the contents of the addme\munged\ folder.

Finally, ****don't forget to keep the manifest file up to date if you remove or add any files!!!!****