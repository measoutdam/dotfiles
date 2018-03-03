
## NAVIAGTION
- h, l , j, k : navigate Left, Right, Down, Up respectively
- w, b :
- { , }
- gg
- G

## EDITING
### INSERT
- i : Enter Insert mode in the CURRENT CURSOR position
- I : Enter Insert mode at the BEGINNING of current LINE
- a : Enter Insert mode as Appending to the CURRENT position
- A : Enter Insert mode as Appending to the END of current LINE
- o : Enter New Line insert mode in to ONE line BELOW
- O : Enter New Line insert mode in to ONE line ABOVE

### DELETING
- x  : Delete one Character to the RIGHT
- X  : Delete one character to the LEFT
- dd : Delete Current LINE
- D  : Delete to the END of Line same to motion d$

### MOTIONS
#### DELETE / EDITING
`NOTE:` Most of the time d command do **CUT**
- dw : Delete from current Position to [End of WORD]
- db : Delete from Current Position to [Beginning of WORD]
- bdw : Delete current word. Meaning **back** to the beginning of word and do **dw**
- 0d$ : Delete current line. Meaning **back** to the beginning of line and do **d$**
- d$ : Delete from current Position to [End of LINE]
- d0 : Delete from current Position to [Beginning of LINE]
- dh, dl, dj, dk then . : Delete Left(character), Right(character), Down(line), Up(line) and . is used for repeated action
- dt<any character> : Delete til Specific Characters
- di< ( or " or ' or { or \[ >
- ci< ( or " or ' or { or \[ >
- f<Any character>

### VISULIZE
- v : Enter Visualize mode in current cursor
- V : Enter Visualize mode and Select current line

## COPY/PASTE
- y : Yank a single character
- Y : Yank the line
- p : Paste the copied
### VISUALIZE - MOTION
- v$ : Select to the end of line
- vb
- bv$
- bve : Select current word
- ggvG



## SAVE / EXITING
- <leader>w : Map this in .vimrc file for quick save - nmap <leader>w :w!<cr>
- ZZ        : Quick Save and Close
- ZQ        : Quick Close WITHOUT Saving

** COMMAND / PANE **
- :!<terminal command>  : Execute any terminal command
- :vsp <path_to_file>   : Split pane verically and set the recent opened pane active
- :sp <path_to_file>    : Split pane horizontally and set the recent opened pane active
- c-ww                  : Ctrl+ww navigate through all the opened pane
-
