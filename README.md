# Oh No! My Friends!
A match 3 game where all of my friends die if you line three of them in a row. You have to get 500 points on each level.

VOLUME WARNING!

There might be some viewport/layout design issues, since the viewport is a bit too tall for my computer's resolution, and whenever I ran the program the window appeared ~200 pixels wider than it should have, even when I changed the window width.

## Implementation
Tweening for swapping and falling tiles

Tiles fall from above when spawning

Game now waits until everything is done moving to allow the player to watch chains unfold

Tiles are now animated sprites of my friends I'm using for another project (I dunno if this is necessary but character designs go to Hexa/Cryo, Btd456Creeper and Vihart, Phoenix, and Evertone)

Removing a friend tile from the board produces one of 12 sounds at variable pitches

Removed tiles fall away, spin randomly, shrink a bit, and fade away

Selected tiles show their original coloration and dance faster

Environment glow was added

Every removed tile makes the background flash its colour (if multiple colors are removed at once it's combinatory)

Two levels. Level 2 has a larger board and an extra colour.

## References
Based on a Match-3 project created by [Mister Taft Creates](https://github.com/mistertaftcreates/Godot_match_3) (with an accompanying [YouTube series](https://www.youtube.com/playlist?list=PL4vbr3u7UKWqwQlvwvgNcgDL1p_3hcNn2))

Sprites made using Piskelapp

Menu text and win screen drawn in Krita

Tile removal sound recorded and edited in Audacity

## Future Development
Add bonuses for setting up chains

Add tiles that have special properties

More levels

## Created by
Airtoum
