;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; The Pit 4.17 bbs door game 
;;; featureing the missing levels calculation
;;; by Ram Narula github @rambkk ram@pluslab.com
;;; first published on github on 2022-05-20
;;;
;;; The code is provided AS-IS, without any restriction.
;;; If you like the code or have any questions kindly let me know
;;; It's always nice to get feedback. : -)
;;; 

;;; Data From The Pit 4.17 - pedit.doc
;;; (Released in 1995)
;
;
;                         LEVEL                SCORE
;                        ~~~~~~~~        ~~~~~~~~~~~~~~~~
;                        1                    0 -     249
;                        2                  250 -     499
;                        3                  500 -     999
;                        4                1,000 -   1,999
;                        5                2,000 -   3,999
;                        6                4,000 -   7,999
;                        7                8,000 -  15,999
;                        8               16,000 -  31,999
;                        9               32,000 -  63,999
;                        10              64,000 - 163,999
;                        +1 Level        +100,000
;


; The highest level a player can have is 499 with highest score of
; 49,063,999 'while playing'. 

;;;;;;;;;;;; FUNCTION STARTS
;; This will function will not run
;; code of this function will be copied to memory
;; it will replace the existing LEVEL function
;; This is the new calculation using SCORE to determine LEVEL
;; the LEVEL has 2 BYTES (16-bits integer), 


;;;The score is more than 2 bytes long so we are using 4 bytes
;;; in the format BXCX in THIS program
;;;BX is the bigger digit
;;;CX is the little one
;;;

;just to show
;MOV BX, [bp+08]
;MOV CX, [bp+06]



;x86 16-bit Assembly integer division
; 32-bit dividend and 16-bit divisor
; Dividend format : DXAX where DX is the major part of the divisor and AX is the minor
; CX the divisor
;Result:
; AX - division result
; DX - Remainder 
;
; or simply
; DIV (DX:AX / CX) = division result AX , remainder DX
;



;;COMPARE and JUMP if ABOVE or EQUAL for unsigned integer
;;If the SCORE more significant byte is >=1 then goto LVLHIGH 
;;as we are sure we the score is above 64,000 points
cmp BX,1
jae LVLHIGH


DOLOW:
;;;
;;; lvl2-250,lvl3-500,lvl4-1000,lvl5-2000,...,lvl10-64000
;;;
mov DX,00FAh ; 250 for left shift to get 500,1000,2000....64000
mov AX,00h
STARTTEN:
inc AL
cmp DX, CX
ja ENDPART
shl DX,1
cmp AL,9
jbe STARTTEN

LVLHIGH:
;the SCORE has 4 bytes or 2 words
;BX is [bp+8]
;AX is [bp+6]
;
;(cannot divide by 100000 as max of 16-bit is 2 bytes-65535)
;1 -- first divide by 10000
;2 -- then store the remainder in DX
;3 -- divide the division result of (2) by 10 to get the major part of the level
;4 -- check if remainder of (3)  
;   - if remainder >6 then add 1 to the level -> end
;   - if remainder <6 do nothing -> end
;   - if equal to 6 then 
;     --if check remainer DX from (2)
;         if equal or higher than 4000 then add 1 else -> end
;
;
mov DX,BX
mov AX,CX
mov CX,2710h ;10000 
div CX
mov BX,DX ;BX got last 4 digits of reminder (6)4000
xor DX,DX
mov CX,0Ah ;10
div CX ; DX now has the 5th digit (from right) of possible 64000
add AX,09h
cmp DX,6
ja ADDONE
jb ENDPART
;;; if equal to 6 then compare 1st remainder  with 4000
cmp BX,0FA0h ; 4000
jb ENDPART
ADDONE:
add AX,1

ENDPART:


;mov [bp-02], AX
;mov AX,[bp-02]
;mov sp,bp
;pop  bp         
;retf         
