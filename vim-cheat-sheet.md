
## NAVIAGTION
- h, l , j, k : navigate Left, Right, Down, Up respectively
- e : to end of word
- E : to end of word (word can contains punctuation)
- w : to beginning of next word
- W : toward next word (word can contains punctuation)
- b : to beginning of current word
- B : to beginning of current work (word can contains punctuation)
- H : to Top of visible screen
- ^ : jump to beginning of non-blank character of the line
- g_ : jump to end of non-blank character of the line
- { , } : Jump Paragraph Above, Below respectively
- gg  : go to the TOP of file
- G   : go to the Bottom of file
- % : move to match character such as (, [, {,  
- f< Any character > : go to first match of specific character given
- /< any string> : find the next matching string
- . : repeated previous action

## EDITING
### INSERT
- i : Enter Insert mode in the CURRENT CURSOR position
- I : Enter Insert mode at the BEGINNING of current LINE
- a : Enter Insert mode as Appending to the CURRENT position
- A : Enter Insert mode as Appending to the END of current LINE
- o : Enter New Line in to ONE line BELOW
- O : Enter New Line in to ONE line ABOVE
- ss : in .vimrc set **nnoremap ss i<space><esc>** to give space WITHOUT staying in Insert Mode

`NOTE:` To make the editing more efficient, we don't need to enter Insert mode while doing the ** new line** or **space** operation.
### DELETING
- x  : Delete one Character to the RIGHT
- X  : Delete one character to the LEFT
- dd : Delete Current LINE
- D  : Delete to the END of Line same to motion d$

#### DELETE / EDITING -  MOTION
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
- C : Change till the end of Line, means delete till end of line from current cursor and enter Insert mode

### VISULIZE
- v : Enter Visualize mode in current cursor
- V : Enter Visualize mode and Select current line

#### VISUALIZE - MOTION
- v< h,j,k,l > : selecting navigation
- ve : select till end of current word
- v$ : Select to the end of line
- vb : select to the beginning of word
- bv$: select till beginning of word.
- bve : select current word
- ggvG : select the whole file.

## COPY/PASTE
- y : **Y**ank a single character
- Y : **Y**ank the line
- p : **P**aste the copied
- P : **P**aste to Above line
- YP : Duplicate line, meaning **Y**ank and **P**aste

## SAVE / EXITING
- <leader>w : Map this in .vimrc file for quick **W**rite **nmap <leader>w :w!<cr>**
- ZZ        : Quick Save and Close
- ZQ        : Quick Close WITHOUT Saving
- :q!, :wq! : Quit, Save Quit respectively

## COMMAND / PANE
- :!< terminal command >  : **Execute** any terminal command
- :vsp <path_to_file>   : **V**ertical **S**plit **p**ane and set the recent opened pane active
- :sp <path_to_file>    : **S**plit **p**ane horizontally and set the recent opened pane active
- c-ww                  : Ctrl+ww navigate through all the opened pane/**W**indow
- c-wo                  : Close **O**ther panes
- c-wq                  : **q**uit window
- c-wv                   : Create new vertical window/pane with of the current file
- c-wh                  : Create new horizontal window/pane with of the current file
- :o < file >           : **O**pen file
- :e < file >           : Open/**E**xplore File (Open file in buffer)
- :bn                   : Switch to **n**ext **b**uffer
- :bp                  : Switch to **p**revious **b**uffer
