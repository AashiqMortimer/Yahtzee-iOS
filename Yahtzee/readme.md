#  Remaining steps:

1. Dice movability
2. Control flow (Three attempts to roll before forcing selection. Selection ends turn. One selection per turn. Turn counter may be useful)
gameBrain.moveCount will reset to 0 when a score has been selected. Once 0, dice will reset to starting position. After first roll, dice will all display in open container. 
Furthermore, score selection prompts all dice images to revert to sixes to indicate roll reset. 
When moveCount hits 2 (third incrament of counter), roll button is no longer enabled so user cannot proceed further. 
IF logic controls where dice is displayed, if displayed in open container, randomiser will roll the dice. If not in open container, randomiser will not run. This enables user to save dice. 

Prevent user from selecting other scores after first by implementing logic to deactivate other score labels when one has been tapped. Achieved this by disabling interaction for all score buttons when one has been selected, these are re-enabled when roll button has been selected if the score colour is not green (if it is green, it means that the score has already been selected and should remain disabled). 

Move counter label: Share same UI as roll button?

3. AI player (Maybe not, just stick to End Game)
4. End game (who won, replay?)
Add UIView to Main. Change to hidden when game loads. Only make visible when game ends. 
Add Buttons to select whether user wants to restart game. 
Restart game prompt should reset totalScore, and background colours. Is there an easy way to restart? 

Roll out end game logic to other score selection functions. 

5. Move tracker
6. Optimise algorithm code


# Things I've looked up:

1. Programmatically initialising views such as containers
2. Tap recognisers
