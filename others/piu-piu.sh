#!/usr/bin/env bash
#----------------------------{ Copyright }----------------------------------
#Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
#Upstream-Name: piu-piu
#Upstream-Contact: Ivan Marov <ie.marov@gmail.com>
#Source: https://github.com/vaniacer/piu-piu-SH

#Files: *
#Copyright: 2016-2018 Ivan Marov
#License: MIT
#	Permission is hereby granted, free of charge, to any person obtaining a copy
#	of this software and associated documentation files (the "Software"), to deal
#	in the Software without restriction, including without limitation the rights
#	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#	copies of the Software, and to permit persons to whom the Software is
#	furnished to do so, subject to the following conditions:
#	The above copyright notice and this permission notice shall be included in all
#	copies or substantial portions of the Software.
#	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#	SOFTWARE.

# check bash version
case ${BASH_VERSINFO[@]::2} in [1-3]' '[0-9][0-9]|[1-3]' '[0-9]|'4 '[0-1])
	echo -e "\nYour BASH is too short!) 4.2+ required to run this game, your is - ${BASH_VERSINFO[@]}"
    exit 1;;
esac

#--------------------------------------------------------------------+
#Color picker, usage: printf ${BLD}${CUR}${RED}${BBLU}"Hello!)"${DEF}|
#-------------------------+--------------------------------+---------+
#       Text color        |       Background color         |         |
#-----------+-------------+--------------+-----------------+         |
# Base color|Lighter shade| Base color   | Lighter shade   |         |
#-----------+-------------+--------------+-----------------+         |
BLK='\e[30m'; blk='\e[90m'; BBLK='\e[40m'; bblk='\e[100m' #| Black   |
RED='\e[31m'; red='\e[91m'; BRED='\e[41m'; bred='\e[101m' #| Red     |
GRN='\e[32m'; grn='\e[92m'; BGRN='\e[42m'; bgrn='\e[102m' #| Green   |
YLW='\e[33m'; ylw='\e[93m'; BYLW='\e[43m'; bylw='\e[103m' #| Yellow  |
BLU='\e[34m'; blu='\e[94m'; BBLU='\e[44m'; bblu='\e[104m' #| Blue    |
MGN='\e[35m'; mgn='\e[95m'; BMGN='\e[45m'; bmgn='\e[105m' #| Magenta |
CYN='\e[36m'; cyn='\e[96m'; BCYN='\e[46m'; bcyn='\e[106m' #| Cyan    |
WHT='\e[37m'; wht='\e[97m'; BWHT='\e[47m'; bwht='\e[107m' #| White   |
#----------------------------------------------------------+---------+
# Effects                                                            |
#--------------------------------------------------------------------+
DEF='\e[0m'   #Default color and effects                             |
BLD='\e[1m'   #Bold\brighter                                         |
DIM='\e[2m'   #Dim\darker                                            |
CUR='\e[3m'   #Italic font                                           |
UND='\e[4m'   #Underline                                             |
INV='\e[7m'   #Inverted                                              |
COF='\e[?25l' #Cursor Off                                            |
CON='\e[?25h' #Cursor On                                             |
#--------------------------------------------------------------------+
# Text positioning, usage: XY 10 10 "Hello World!"                   |
XY   () { printf "\e[$2;$1H$3"; } #                                  |
#--------------------------------------------------------------------+
# Print line, usage: line - 10 | line -= 20 | line "Hello World!" 20 |
line () { printf %.s"$1" `seq $2`; } #                               |
#--------------------------------------------------------------------+

function start_opt {
#------------------------{ Start opt }------------------------{ description }--------------{ def. values }--------------
 msngr_line1=' Die alien scum '                     # text on messanger plane line1       ' Die alien scum '
 msngr_line2='      DIE!      '                     # text on messanger plane line2       '      DIE!      '
  background=true									# background objects visibility				(true)
    bossborn=										# boss starter
    tillboss=100									# frags needed to fight with boss			(100)
     bhealth=100									# boss' health								(100)
     enumber=0										# current enemy counter						(0)
     bonuses=("ammo" "life" "ammo" "gunup" "ammo")	# bonuses, more ammo, less life ang gunup
      goback=false									# need 4 boss movement
       enmax=10										# max number of akiens						(10)
       month=`date +'%m'`							# get current month
       frags=0										# frags counter								(0)
        jump=false
        life=3										# life counter								(3)
        ammo=100									# ammo counter								(100)
        FPSL=100									# lower FPS initial value					(100)
        FPSM=0										# maximum FPS initial value					(0)
        FPSC=0										# FPS counter								(0)
         MSN=1111                                   # messanger randomizer                      (1111)
         day=`date +'%d'`                          # get current  day
         rnd=10										# random seed 4 bonuses						(10)
         spd=0.0001									# game\read speed							(0.0001)
         DHC=$BLK									# default hero color						($BLK)
         DSC=$RED									# default symbol color						($red)
         DHS=★										# default symbol							(★)
         OBJ=()										# start obj array
         PIU=()										# start piu array
          BJ=10                                     # boss jumps
          BY=$[`tput lines` / 2]					# boss start Y
          BX=$[`tput  cols` + 1]					# boss start X
          BC=0										# boss' sprite cutter
          LX=1										# grass X counter
           X=1										# hero X									(1)
           Y=1										# hero Y									(1)
           L=0										# sprites animation counter
           J=0										# boss' bullet animation counter
           K=0										# boss' fire rate counter
           S=0										# Sun animation counter
           G=1										# gun 										(1)(max 5)

#--------------------{ Multipleyer config }-------------------{ description }--------------{ def. values }---------------
      server=                                       # if server
      client=                                       # if client
      frags2=0										# frags counter								(0)
       life2=3										# life counter								(3)
       ammo2=100									# ammo counter								(100)
       caddr=(`ip a | grep 'inet ' | sed '/127.0.0.1/d; s/.*inet //g; s|/.*$||g'`)
       saddr=
       sport=54321
       cport=54322
          G2=1

[ -e piu.conf ] && . piu.conf						# load start conf from file
}; start_opt
#------------------------{ Messages }-----------------------------------------------------------------------------------

case "$day$month" in
    1101)
        msngr_line1=' Happy birthday '
        msngr_line2='     Yura $)    ';;

    0202)
        msngr_line1=" It's groundhog "
        msngr_line2='     day !)     ';;

    0228)
        msngr_line1=' Happy birthday '
        msngr_line2='   Matvey !)    ';;

    0703)
        msngr_line1='The 8th of March'
        msngr_line2='  is comming... ';;

    0803)
        msngr_line1=' Hold on guyz $)'
        msngr_line2='                ';;
esac

function sprite_help {

           x=$[$endx/2-25/2]
           y=$[$endy/2-5]

      sprite=(         "\e[$y;${x}H                   ^"
            "\e[$[$y+1];${x}H                   ${RED}W$DEF"
  "\e[$[$y+2];${x}H${BLD}Control with:$DEF  < ${RED}A S D$DEF >"
                  "\e[$[$y+3];${x}H                   v"
  "\e[$[$y+5];${x}H${BLD}Shoot\select with:$DEF ${YLW}P $BLD$red-=$GRN>$DEF")
}

function sprite_lose {

           x=$[$endx/2-25/2]
           y=$[$endy/2-5]
         CM1=$BLD$red; CM2=$DIM$RED

      sprite=("\e[$y;${x}H$CM1  ____    _    __  __ _____$DEF"
         "\e[$[$y+1];${x}H$red / ___|  / \  |  \/  | ____|$DEF"
         "\e[$[$y+2];${x}H$red| | __  / _ \ | |\/| |  _|$DEF"
         "\e[$[$y+3];${x}H$RED| |_\ \/ ___ \| |  | | |___$DEF"
         "\e[$[$y+4];${x}H$CM2 \____/_/   \_\_|__|_|_____|$DEF"
         "\e[$[$y+5];${x}H$CM1  / _ \ \   / / ____|  _ \ $DEF"
         "\e[$[$y+6];${x}H$red | | | \ \ / /|  _| | |_) |$DEF"
         "\e[$[$y+7];${x}H$RED | |_| |\ V / | |___|  _ < $DEF"
         "\e[$[$y+8];${x}H$CM2  \___/  \_/  |_____|_| \_|$DEF")
}

function sprite_win {

           x=$[$endx/2-25/2]
           y=$[$endy/2-5]
         CM1=$BLD$grn; CM2=$DIM$GRN

      sprite=("\e[$y;${x}H${CM1}__        ______ _    _$DEF"
           "\e[$[$y+1];${x}H$grn\ \      / /____| |  | |$DEF"
           "\e[$[$y+2];${x}H$grn \ \ /\ / /  _| | |  | |$DEF"
           "\e[$[$y+3];${x}H$GRN  \ V  V /| |___| |__| |__$DEF"
           "\e[$[$y+4];${x}H$CM2 __\_/\_/_|_____|____|____|$DEF"
           "\e[$[$y+5];${x}H$CM1|  _ \ / _ \| \ | | ____| |$DEF"
           "\e[$[$y+6];${x}H$grn| | | | | | |  \| |  _| | |$DEF"
           "\e[$[$y+7];${x}H$GRN| |_| | |_| | |\  | |___|_|$DEF"
           "\e[$[$y+8];${x}H$CM2|____/ \___/|_| \_|_____(_)$DEF")
}

#------------------------{ Sprites }-------------------------------------------------------------------------------------
case $month in	0[1-4]|12)	SKY=$DEF$bwht			# winter & early spring sky
							LND=$DEF$BLD$WHT$BWHT	# winter & early spring land
							CLD=30					# winter & early spring clouds rnd
							TRE=50;;				# winter & early spring trees rnd

				0[5-8]   )	SKY=$DEF$bcyn			# late spring & summer sky
							LND=$DEF$DIM$GRN$bgrn	# late spring & summer land
							CLD=50					# late spring & summer clouds rnd
							TRE=20;;				# late spring & summer trees rnd

				09|1[0-1])	SKY=$DEF$BCYN			# autumn sky
							LND=$DEF$DIM$YLW$BGRN	# autumn land
							CLD=20					# autumn clouds rnd
							TRE=50;;				# autumn trees rnd
esac

         gun=(─ ─ ═ ≡ ≣ 𝄚)

       grass=(│ ' ' ║ ' ' ░ ' ' ▒ ' ' ▓ ' ' █) # grass types

#------------------------{ Cycle slow }----------------------------------------------------------------------------------
         big=(' O   O '
		      'O   O  '
              '   O   '
              '  O   O')

       small=('o  '
              '   '
              '  o'
              ' o ')

#------------------------{ Cycle fast }----------------------------------------------------------------------------------
        big2=($RED' O   O '$SKY
		      $RED'O   O  '$SKY
              $RED"   ${BLD}O   "$SKY
              $RED'  O   O'$SKY)

        big3=($BLU'  O   O'$SKY
              $BLU"   ${BLD}O   "$SKY
		      $BLU'O   O  '$SKY
              $BLU' O   O '$SKY)

      small2=($YLW" ${BLD}o "$SKY
              $YLW'  o'$SKY
              $YLW'   '$SKY
              $YLW'o  '$SKY)

#------------------------{ Shoots }--------------------------------------------------------------------------------------

              # -=>
              # <=-

       shoot=("$SKY $RED-$SKY$BLD$GRN>$SKY"
              "$BLD$red-=$SKY$GRN>$SKY"
              "$red=-$SKY$BLD$GRN>$SKY"
              "$RED-$SKY $GRN>$SKY")

      shoot2=("$SKY$BLD$GRN<$SKY$RED-$SKY "
              "$SKY$GRN<$BLD$red=-$SKY"
              "$SKY$BLD$GRN<$SKY$red-=$SKY"
              "$SKY$GRN<$SKY $RED-$SKY")

      bshoot=('█▓▒░ '
              '▓▒░▒ '
              '▒░▒▓ '
              '░▒▓█ '
              '▒▓█▓ '
              '▓█▓▒ '); bshootH=1; bshootW=4

 bshoot_color=("$ylw $ylw $ylw $ylw")

function sprite_bfire {

       hight=$bshootH
       width=$bshootW
       color=("${bshoot_color[@]}")
	  target=("$OX $[$OY+1]" "$[$OX+1] $OY")

      sprite="\e[$OY;${OX}H$ylw${bshoot[$J]}$SKY "
     sprite2="${bshoot[$J]} "
}

#------------------------{ Bonuses }-------------------------------------------------------------------------------------
       ammob=('-=> '
              '-=> '
              '-=> '); ammobH=${#ammob[*]}; ammobW=${#ammob[1]}

         CM1=$BLD$red; CM2=$SKY$GRN
 ammob_color=("$CM1 $CM1 $CM2 $SKY"
              "$CM1 $CM1 $CM2 $SKY"
              "$CM1 $CM1 $CM2 $SKY")

function sprite_ammob {

       hight=$ammobH
       width=$ammobW
       color=("${ammob_color[@]}")
	  target=("$OX $OY" "$OX $[$OY+1]" "$OX $[$OY+2]")

      sprite=("\e[$OY;${OX}H$BLD$red-=$SKY$GRN>$SKY "
         "\e[$[$OY+1];${OX}H$BLD$red-=$SKY$GRN>$SKY "
         "\e[$[$OY+2];${OX}H$BLD$red-=$SKY$GRN>$SKY ")

     sprite2=("${ammob[@]}")
}

       lifep=('/V\ '
              '\ / '
              ' V  '); lifepH=${#lifep[*]}; lifepW=${#lifep[1]}

 lifep_color=("$RED $RED $RED $SKY"
              "$RED $RED $RED $SKY"
              "$SKY $RED $SKY $SKY")

function sprite_lifep {

       hight=$lifepH
       width=$lifepW
       color=("${lifep_color[@]}")
	  target=("$OX $OY" "$OX $[$OY+1]" "$OX $[$OY+2]")

      sprite=("\e[$OY;${OX}H$SKY$RED/V"'\\'"$SKY "
         "\e[$[$OY+1];${OX}H$SKY$RED\ /$SKY "
     "\e[$[$OY+2];$[$OX+1]H$SKY${RED}V$SKY ")

     sprite2=("${lifep[@]}")
}

function sprite_gunup {

       hight=3
       width=5
	  target=("$OX $OY"      "$OX $[$OY+1]"      "$OX $[$OY+2]"
              "$[$OX+1] $OY" "$[$OX+1] $[$OY+1]" "$[$OX+1] $[$OY+2]")

	case ${G} in

		1) sprite=("\e[$OY;${OX}H$BLK||$blk--$SKY "
		      "\e[$[$OY+1];${OX}H$BLK||$SKY "
		      "\e[$[$OY+2];${OX}H$BLK||$blk--$SKY ")

          sprite2=('||-- '
		           '|| '
		           '||-- ')

            color=("$BLK $BLK $blk $blk $SKY"
                   "$BLK $BLK $SKY $SKY $SKY"
                   "$BLK $BLK $blk $blk $SKY");;

		2) sprite=("\e[$OY;${OX}H$BLK||$blk--$SKY "
		      "\e[$[$OY+1];${OX}H$BLK||$blk--$SKY "
		      "\e[$[$OY+2];${OX}H$BLK||$blk--$SKY ")

          sprite2=('||-- '
		           '||-- '
		           '||-- ')

            color=("$BLK $BLK $blk $blk $SKY"
                   "$BLK $BLK $blk $blk $SKY"
                   "$BLK $BLK $blk $blk $SKY");;

		3) sprite=("\e[$OY;${OX}H$BLK||$blk==$SKY "
		      "\e[$[$OY+1];${OX}H$BLK||$SKY "
		      "\e[$[$OY+2];${OX}H$BLK||$blk==$SKY ")

          sprite2=('||== '
		           '|| '
		           '||== ')

            color=("$BLK $BLK $blk $blk $SKY"
                   "$BLK $BLK $SKY $SKY $SKY"
                   "$BLK $BLK $blk $blk $SKY");;

		*) sprite=("\e[$OY;${OX}H$BLK||$blk==$SKY "
		      "\e[$[$OY+1];${OX}H$BLK||$blk--$SKY "
		      "\e[$[$OY+2];${OX}H$BLK||$blk==$SKY ")

          sprite2=('||== '
		           '||-- '
		           '||== ')

            color=("$BLK $BLK $blk $blk $SKY"
                   "$BLK $BLK $blk $blk $SKY"
                   "$BLK $BLK $blk $blk $SKY");; esac
}

#------------------------{ Clouds }--------------------------------------------------------------------------------------
      cloud1=('Z,-., '
              '(    ) '
              'Z`+-` '); cloud1H=${#cloud1[*]}; cloud1W=${#cloud1[1]}

	case $month in	0[1-4]|12) C1C=$SKY$DIM$CYN;; # winter & early spring
					0[5-8]   ) C1C=$SKY$DIM$WHT;; # late spring & summer
					09|1[0-1]) C1C=$SKY$blk    ;; # autumn
	esac

cloud1_color=("$SKY $C1C $C1C $C1C $C1C $SKY $SKY"
              "$C1C $SKY $SKY $SKY $SKY $C1C $SKY"
              "$SKY $C1C $C1C $C1C $C1C $SKY $SKY")

function sprite_cloud1 {

       hight=$cloud1H
       width=$cloud1W
       color=("${cloud1_color[@]}")

      sprite=("\e[$OY;$[$OX+1]H"$SKY$C1C',-.,'"$SKY "
           "\e[$[$OY+1];${OX}H"$SKY$C1C'(    )'"$SKY "
         "\e[$[$OY+2];$[$OX+1]H"$SKY$C1C'`+-`'"$SKY ")

     sprite2=("${cloud1[@]}")
}

      cloud2=('Z,-._., '
              '(      ) '
              'Z`-...` '); cloud2H=${#cloud2[*]}; cloud2W=${#cloud2[1]}

	case $month in	0[1-4]|12) C2C=$SKY$CYN;; # winter & early spring
					0[5-8]   ) C2C=$SKY$WHT;; # late spring & summer
					09|1[0-1]) C2C=$SKY$BLK;; # autumn
	esac

         CM1=$SKY$DIM
cloud2_color=("$SKY $C2C $C2C $C2C $C2C $C2C $C2C $SKY $SKY"
              "$C2C $SKY $SKY $SKY $SKY $SKY $SKY $C2C $SKY"
              "$SKY $C2C $C2C $C2C $C2C $C2C $C2C $SKY $SKY")

function sprite_cloud2 {

       hight=$cloud2H
       width=$cloud2W
       color=("${cloud2_color[@]}")

      sprite=("\e[$OY;$[$OX+1]H"$SKY$C2C',-._.,'"$SKY "
           "\e[$[$OY+1];${OX}H"$SKY$C2C'(      )'"$SKY "
         "\e[$[$OY+2];$[$OX+1]H"$SKY$C2C'`-...`'"$SKY ")

     sprite2=("${cloud2[@]}")
}

      cloud3=('Z,-"`.-"`. '
              '(         ) '
              'Z`--.....` '); cloud3H=${#cloud3[*]}; cloud3W=${#cloud3[1]}

	case $month in	0[1-4]|12) C3C=$SKY$BLD$CYN;; # winter & early spring
					0[5-8]   ) C3C=$SKY$BLD$WHT;; # late spring & summer
					09|1[0-1]) C3C=$SKY$DIM$BLK;; # autumn
	esac

cloud3_color=("$SKY $C3C $C3C $C3C $C3C $C3C $C3C $C3C $C3C $C3C $SKY $SKY"
              "$C3C $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $C3C $SKY" 
              "$SKY $C3C $C3C $C3C $C3C $C3C $C3C $C3C $C3C $C3C $SKY $SKY")

function sprite_cloud3 {

       hight=$cloud3H
       width=$cloud3W
       color=("${cloud3_color[@]}")

      sprite=("\e[$OY;$[$OX+1]H"$SKY$C3C',-"`.-"`.'"$SKY "
           "\e[$[$OY+1];${OX}H"$SKY$C3C'(         )'"$SKY "
         "\e[$[$OY+2];$[$OX+1]H"$SKY$C3C'`--.....`'"$SKY ")

     sprite2=("${cloud3[@]}")
}

       msngr=('ZZZZZZZ__ Z+----------------+ '
              'Z_____/ /_/|'"$msngr_line1"'| '
              '(° \ | / Z\|'"$msngr_line2"'| '
              'ZZZZ\| ZZZZ+----------------+ '); msngrH=${#msngr[*]}; msngrW=${#msngr[2]}

         CM4=$SKY$DIM$GRN; CM5=$SKY$GRN; CM6=$SKY$BLD$GRN
         CM8=$SKY$DIM$UND; TXT=$SKY$bwht$RED

 msngr_color=("$SKY $SKY $SKY $SKY $SKY $SKY $SKY $CM5 $CM5 $SKY $SKY $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $SKY"  #        __  +----------------+
              "$SKY $CM5 $CM5 $CM5 $CM5 $CM5 $CM4 $SKY $CM6 $BLK $BLK $blk $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $blk $SKY"  #  _____/ /_/| Die alien scum |
              "$CM5 $CM8 $CM8 $CM4 $SKY $CM6 $CM8 $CM6 $SKY $SKY $BLK $blk $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $TXT $blk $SKY"  # (° \ |_/  \|      DIE!      |
              "$SKY $SKY $SKY $SKY $CM4 $CM6 $SKY $SKY $SKY $SKY $SKY $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $blk $SKY") #     \|     +----------------+

function sprite_msngr {

       hight=$msngrH
       width=$msngrW
       color=("${msngr_color[@]}")

         CM4=$SKY$DIM$GRN; CM5=$SKY$GRN; CM6=$SKY$BLD$GRN
         CM8=$SKY$DIM$UND; TXT=$SKY$bwht$RED

      sprite=("\e[$OY;$[$OX+7]H"$CM5"__$SKY \e[$OY;$[$OX+11]H$blk+----------------+$SKY "
        "\e[$[$OY+1];$[$OX+1]H"$CM5"_____$CM4/$SKY $CM6/${BLK}_/$blk|$TXT$msngr_line1$blk|$SKY "
          "\e[$[$OY+2];${OX}H"$CM5"($CM8° $CM4\ $CM6|$CM8 $CM6/$SKY \e[$[$OY+2];$[$OX+10]H$BLK"'\\'"$blk|$TXT$msngr_line2$blk|$SKY "
        "\e[$[$OY+3];$[$OX+4]H$SKY"$CM4'\\'"$CM6|$SKY \e[$[$OY+3];$[$OX+11]H$blk+----------------+$SKY ")

     sprite2=("${msngr[@]}")
}

#------------------------{ Trees }---------------------------------------------------------------------------------------

	case $month in
        0[1-4]|12) T1C=$SKY$DIM$WHT;; # winter & early spring
        0[5-8]   ) T1C=$SKY$DIM$GRN;; # late spring & summer
        09|1[0-1]) T1C=$SKY$DIM$YLW;; # autumn
	esac

       tree1=('Z_ '
              '/ \ '
              '\|/ '
              'Z| '); tree1W=${#tree1[1]}

         CM1=$SKY$DIM$blk
 tree1_color=("$SKY $T1C $SKY $SKY"  # _
              "$T1C $T1C $T1C $SKY"  #/ \
              "$T1C $CM1 $T1C $SKY"  #\|/
              "$SKY $CM1 $SKY $SKY") # |

      wtree1=('Z|/ '
              '\| '
              'Z| ')

wtree1_color=("$SKY $T1C $T1C $SKY"  # |/
              "$T1C $CM1 $SKY $SKY"  #\|
              "$SKY $CM1 $SKY $SKY") # |

	case $month in 0[1-4]|12) # change winter sprite
        tree1=("${wtree1[@]}")
        tree1_color=("${wtree1_color[@]}")
        tree1W=${#tree1[0]};;
	esac

      tree1H=${#tree1[*]}

function sprite_tree1 {

       hight=$tree1H
       width=$tree1W
       color=("${tree1_color[@]}")
         CM1=$SKY$DIM$blk

    case $month in
        0[1-4]|12)
      sprite=("\e[$OY;$[$OX+1]H$SKY$T1C|/$SKY "
  "\e[$[$OY+1];${OX}H$SKY$T1C"'\\'"$CM1|$SKY "
         "\e[$[$OY+2];$[$OX+1]H$SKY$CM1|$SKY ");;

        *)
      sprite=("\e[$OY;$[$OX+1]H$SKY${T1C}_$SKY "
             "\e[$[$OY+1];${OX}H$SKY$T1C/ "'\\'"$SKY "
           "\e[$[$OY+2];${OX}H$SKY$T1C"'\\'"$CM1|$T1C/$SKY "
           "\e[$[$OY+3];$[$OX+1]H$SKY$CM1|$SKY ");;
    esac

     sprite2=("${tree1[@]}")
}

	case $month in
        0[1-4]|12) T2C=$SKY$WHT;; # winter & early spring
        0[5-8]   ) T2C=$SKY$GRN;; # late spring & summer
        09|1[0-1]) T2C=$SKY$YLW;; # autumn
	esac

       tree2=('Z_._ '
              '/   \ '
              '\ | / '
              'Z\║/\ '
              'ZZ║_/ '
              'ZZ║ '); tree2W=${#tree2[1]}

         CM1=$SKY$T2C
 tree2_color=("$SKY $T2C $T2C $T2C $SKY $SKY"   # _._
              "$T2C $T2C $T2C $T2C $T2C $SKY"   #/   \
              "$T2C $T2C $blk $CM1 $T2C $SKY"   #\ | /
              "$SKY $T2C $blk $CM1 $T2C $SKY"   # \║/\
              "$SKY $SKY $blk $CM1 $T2C $SKY"   #  ║_/
              "$SKY $SKY $blk $CM1 $SKY $SKY")  #  ║

      wtree2=('ZZZ|_ '
              '\||/ '
              'Z\║|_ '
              'ZZ║/ '
              'ZZ║ ')

wtree2_color=("$SKY $SKY $SKY $T2C $T2C $SKY"   #   |_
              "$T2C $T2C $blk $blk $SKY $SKY"   #\||/
              "$SKY $blk $blk $T2C $T2C $SKY"   # \║|_
              "$SKY $SKY $blk $blk $SKY $SKY"   #  ║/
              "$SKY $SKY $blk $SKY $SKY $SKY")  #  ║

	case $month in 0[1-4]|12) # change winter sprite
        tree2=("${wtree2[@]}")
        tree2_color=("${wtree2_color[@]}")
        tree2W=${#tree2[0]};;
	esac

      tree2H=${#tree2[*]}

function sprite_tree2 {

       hight=$tree2H
       width=$tree2W
       color=("${tree2_color[@]}")

    case $month in
        0[1-4]|12)
      sprite=("\e[$OY;$[$OX+3]H$SKY$T2C|/$SKY "
        "\e[$[$OY+1];${OX}H$T2C\|$blk|/$SKY "
      "\e[$[$OY+2];$[$OX+1]H$blk\║$T2C|_$SKY "
       "\e[$[$OY+3];$[$OX+2]H$blk║/$SKY "
       "\e[$[$OY+4];$[$OX+2]H$blk║$SKY ");;

        *)
      sprite=("\e[$OY;$[$OX+1]H$SKY${T2C}_._$SKY "
             "\e[$[$OY+1];${OX}H$SKY$T2C/   "'\\'"$SKY "
           "\e[$[$OY+2];${OX}H$SKY$T2C"'\\'"$blk | $T2C/$SKY "
         "\e[$[$OY+3];$[$OX+1]H$SKY$T2C"'\\'"$blk║$T2C/"'\\'"$SKY "
            "\e[$[$OY+4];$[$OX+2]H$SKY$blk║${T2C}_/$SKY "
            "\e[$[$OY+5];$[$OX+2]H$SKY$blk║$SKY ");;
    esac

     sprite2=("${tree2[@]}")
}

	case $month in
        0[1-4]|12) T3C=$SKY$BLD$cyn;; # winter & early spring
        0[5-8]   ) T3C=$SKY$BLD$GRN;; # late spring & summer
        09|1[0-1]) T3C=$SKY$DIM$red;; # autumn
	esac

       tree3=('ZZZ_._ '
              'ZZ/   \ '
              'Z_\ | / '
              '/  \║/__ '
              '\_\/║/  \ '
              'ZZZ\║|/_/ '
              'ZZZZ║/ '
              'ZZZZ║ '
              'ZZZZ║ '); tree3W=${#tree3[5]}


         CM1=$SKY$BLK
 tree3_color=("$SKY $SKY $SKY $T3C $T3C $T3C $SKY $SKY $SKY $SKY"       #   _._
              "$SKY $SKY $T3C $SKY $SKY $SKY $T3C $SKY $SKY $SKY"       #  /   \
              "$SKY $T3C $T3C $SKY $CM1 $SKY $T3C $SKY $SKY $SKY"       # _\ | /
              "$T3C $SKY $SKY $T3C $CM1 $T3C $T3C $T3C $SKY $SKY"       #/  \║/__
              "$T3C $T3C $CM1 $T3C $CM1 $T3C $SKY $SKY $T3C $SKY"       #\_\/║/  \
              "$SKY $SKY $SKY $CM1 $CM1 $T3C $CM1 $T3C $T3C $SKY"       #   \║|/_/
              "$SKY $SKY $SKY $SKY $CM1 $CM1 $SKY $SKY $SKY $SKY"       #    ║/
              "$SKY $SKY $SKY $SKY $CM1 $SKY $SKY $SKY $SKY $SKY"       #    ║
              "$SKY $SKY $SKY $SKY $CM1 $SKY $SKY $SKY $SKY $SKY")      #    ║

      wtree3=('ZZ\| '
              'ZZZ\|\/ '
              '_\_ ║/ '
              'Z/\ ║ Z\/_ '
              'ZZZ\║ Z/ '
              'ZZZZ║_/ '
              'ZZZZ║ '
              'ZZZZ║ ')

wtree3_color=("$SKY $SKY $T3C $T3C $SKY $SKY $SKY $SKY $SKY $SKY $SKY"  #  \|
              "$SKY $SKY $SKY $CM1 $CM1 $T3C $T3C $SKY $SKY $SKY $SKY"  #   \|\/
              "$T3C $T3C $T3C $SKY $CM1 $CM1 $SKY $SKY $SKY $SKY $SKY"  #_\_ ║/
              "$SKY $T3C $CM1 $SKY $CM1 $SKY $SKY $T3C $T3C $T3C $SKY"  # /\ ║  \/_
              "$SKY $SKY $SKY $CM1 $CM1 $SKY $SKY $CM1 $SKY $SKY $SKY"  #   \║  /
              "$SKY $SKY $SKY $SKY $CM1 $CM1 $CM1 $SKY $SKY $SKY $SKY"  #    ║_/
              "$SKY $SKY $SKY $SKY $CM1 $SKY $SKY $SKY $SKY $SKY $SKY"  #    ║
              "$SKY $SKY $SKY $SKY $CM1 $SKY $SKY $SKY $SKY $SKY $SKY") #    ║

      xtree3=('ZZZZZZ★ '
              'ZZZZZZ/\ '
              'ZZZZ_❅|● '
              'ZZZZ-/○|❄- '
              'ZZZZ●/||\○ '
              'ZZ_/❄/●\❅\ '
              'ZZ○///||❄\● '
              '_/❅/●/|○\❅\- '
              'ZZZZZZ║ ')

xtree3_color=("$SKY $SKY $SKY $SKY $SKY $SKY $RED $SKY $SKY $SKY $SKY $SKY $SKY"  #       ★
              "$SKY $SKY $SKY $SKY $SKY $SKY $GRN $GRN $SKY $SKY $SKY $SKY $SKY"  #       /\
              "$SKY $SKY $SKY $SKY $GRN $cyn $GRN $BLU $SKY $SKY $SKY $SKY $SKY"  #     _❅|●
              "$SKY $SKY $SKY $SKY $SKY $GRN $YLW $GRN $CYN $GRN $SKY $SKY $SKY"  #     -/○|❄-
              "$SKY $SKY $SKY $SKY $RED $GRN $grn $grn $GRN $ylw $SKY $SKY $SKY"  #     ●/||\○
              "$SKY $SKY $GRN $GRN $cyn $GRN $blu $GRN $cyn $GRN $SKY $SKY $SKY"  #   _/❄/●\❅\
              "$SKY $SKY $red $GRN $GRN $grn $grn $GRN $CYN $GRN $RED $SKY $SKY"  #   ○///||❄\●
              "$GRN $GRN $cyn $GRN $YLW $GRN $grn $RED $GRN $cyn $GRN $GRN $SKY"  # _/❅/●/|○\❅\-
              "$SKY $SKY $SKY $SKY $SKY $SKY $BLK $SKY $SKY $SKY $SKY $SKY $SKY") #        ║

	case $month in 0[1-4]|12) # change winter sprite
        tree3=("${wtree3[@]}")
        tree3_color=("${wtree3_color[@]}")
        tree3W=${#tree3[3]};;
	esac


    case "$day$month" in 2[1-9]12|3[0-1]12|0[1-9]01|1001)
        tree3=("${xtree3[@]}")
        tree3_color=("${xtree3_color[@]}")
        tree3W=${#tree3[7]};;
    esac

      tree3H=${#tree3[*]}

function sprite_tree3 {

       hight=$tree3H
       width=$tree3W
       color=("${tree3_color[@]}")
         CM1=$SKY$BLK

    case "$day$month" in

        2[1-9]12|3[0-1]12|0[1-9]01|1001)
      sprite=("\e[$OY;$[$OX+6]H$RED★$SKY "
         "\e[$[$OY+1];$[$OX+6]H$GRN/"'\\'"$SKY "
     "\e[$[$OY+2];$[$OX+4]H${GRN}_$cyn❅$GRN|$BLU●$SKY "
      "\e[$[$OY+3];$[$OX+4]H$GRN-/$YLW○$GRN|$CYN❄$GRN-$SKY "
      "\e[$[$OY+4];$[$OX+4]H$RED●$GRN/$grn||$GRN"'\\'"$ylw○$SKY "
   "\e[$[$OY+5];$[$OX+2]H${GRN}_/$cyn❄$GRN/$blu●$GRN"'\\'"$cyn❅$GRN"'\\'"$SKY "
   "\e[$[$OY+6];$[$OX+2]H$red○$GRN//$grn/|$GRN|$CYN❄$GRN"'\\'"$RED●$SKY "
   "\e[$[$OY+7];${OX}H${GRN}_/$cyn❅$GRN/$YLW●$GRN/$grn|$RED○$GRN"'\\'"$cyn❅$GRN\-$SKY "
              "\e[$[$OY+8];$[$OX+6]H$BLK║$SKY ");;

        ??0[1-4]|??12)
      sprite=("\e[$OY;$[$OX+2]H$SKY$T3C\|$SKY "
     "\e[$[$OY+1];$[$OX+3]H$SKY$CM1"'\\'"|$SKY$T3C\/$SKY "
"\e[$[$OY+2];${OX}H$SKY${T3C}_\_$SKY $CM1║/$SKY "
    "\e[$[$OY+3];$[$OX+1]H$SKY$T3C/$CM1\ ║$SKY \e[$[$OY+3];$[$OX+7]H$T3C\/_$SKY "
          "\e[$[$OY+4];$[$OX+3]H$SKY$CM1\║$SKY \e[$[$OY+4];$[$OX+7]H$CM1/$SKY "
           "\e[$[$OY+5];$[$OX+4]H$SKY$CM1║_/$SKY "
           "\e[$[$OY+6];$[$OX+4]H$SKY$CM1║$SKY "
           "\e[$[$OY+7];$[$OX+4]H$SKY$CM1║$SKY ");;

        *)
      sprite=("\e[$OY;$[$OX+3]H$SKY${T3C}_._$SKY "
          "\e[$[$OY+1];$[$OX+2]H$SKY$T3C/   "'\\'"$SKY "
       "\e[$[$OY+2];$[$OX+1]H$SKY${T3C}_\ $CM1|$T3C /$SKY "
           "\e[$[$OY+3];${OX}H$SKY$T3C/  "'\\'"$CM1║$T3C/__$SKY "
           "\e[$[$OY+4];${OX}H$SKY$T3C\_$CM1"'\\'"$T3C/$CM1║$T3C/  "'\\'"$SKY "
               "\e[$[$OY+5];$[$OX+3]H$CM1\║$T3C|$CM1/${T3C}_/$SKY "
                "\e[$[$OY+6];$[$OX+4]H$CM1║/$SKY "
                "\e[$[$OY+7];$[$OX+4]H$CM1║$SKY "
                "\e[$[$OY+8];$[$OX+4]H$CM1║$SKY ");;
    esac

     sprite2=("${tree3[@]}")
}

#------------------------{ Aliens slow }---------------------------------------------------------------------------------
       alien=('Z___ '
              '(   ) '
              'Z`¯´ '); alienH=${#alien[*]}; alienW=${#alien[1]}

      pumtop=( '\\' '|' '|' '/')
     pumface=('O…o'
              '…o '
              'o  '
              '   '
              '  O'
              ' O…')

         CM1=$SKY$DIM$BLK; CM2=$SKY$BLD$BLK

    case "$day$month" in 3110)
        CM1=$SKY$DIM$ylw; CM2=$SKY$UND$DIM$grn;;
    esac

 alien_color=("$SKY $CM1 $CM2 $CM1 $SKY $SKY"
              "$CM1 $red $red $red $CM1 $SKY"
              "$SKY $CM1 $CM1 $CM1 $SKY $SKY")

function sprite_alien {

       hight=$alienH
       width=$alienW
       color=("${alien_color[@]}")
	  target=("$OX $[$OY+1]" "$[$OX+1] $[$OY+1]")



    case "$day$month" in

        3110)
         CM1=$SKY$DIM$ylw; CM2=$SKY$UND$DIM$grn
	  sprite=("\e[$OY;$[$OX+1]H${CM1}_$CM2${pumtop[$L]}${CM1}_$SKY "
              "\e[$[$OY+1];${OX}H${CM1}(${red}${pumface[$Q]}${CM1})$SKY "
              "\e[$[$OY+2];$[$OX+1]H"${CM1}'`¯´'"$SKY ")

     sprite2=("Z_${pumtop[$L]}_ "
              "(${pumface[$Q]}) "
              'Z`¯´ ');;

		*)
         CM1=$SKY$DIM$BLK; CM2=$BLD$BLK
	  sprite=("\e[$OY;$[$OX+1]H${CM1}_${CM2}_${CM1}_$SKY "
              "\e[$[$OY+1];${OX}H${CM1}(${red}${small[$L]}${CM1})$SKY "
              "\e[$[$OY+2];$[$OX+1]H"${CM1}'`¯´'"$SKY ")

     sprite2=('Z___ '
              "(${small[$L]}) "
              'Z`¯´ ');;
	esac
}
    case "$day$month" in

        3110)

    mouthtop=('/VVVVV\'
              '/vvvvv\'
              '.-----.'
              '       '
              '.-----.'
              '/vvvvv\'
              '/VVVVV\')

    mouthlow=('VvvvvvV'
              'V^^^^^V'
              '`¯¯¯¯¯´'
              ' ‾‾‾‾‾ '
              '`-----´'
              'V^^^^^V'
              'VvvvvvV')

        boss=('ZZ         '
              'ZZZ.--._.-.  '
              'ZZ/(⁐ ) () \ '
              'Z❲ /VVVVV\ ❳ '
              'ZZ\VvvvvvV /  '
              'ZZZ`¯----¯´  '
              'ZZ         '); bossH=${#boss[*]}; bossW=${#boss[3]}

         CM1=$SKY$DIM$ylw; CM2=$DIM$UND$grn; CM6=$BLD$RED
#                                        center point
  boss_color=("$SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY"
              "$SKY $SKY $SKY $CM1 $CM1 $CM1 $CM2 $CM1 $CM1 $CM1 $SKY $SKY $SKY"
              "$SKY $SKY $CM1 $CM6 $CM6 $CM6 $CM6 $SKY $CM6 $CM6 $SKY $CM1 $SKY"
              "$SKY $CM1 $SKY $RED $RED $RED $RED $RED $RED $RED $SKY $CM1 $SKY"
              "$SKY $SKY $CM1 $RED $RED $RED $RED $RED $RED $RED $SKY $CM1 $SKY"
              "$SKY $SKY $SKY $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $SKY $SKY"
              "$SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY");;

		*)
        boss=('ZZZZ     '
              'ZZZZZ___   '
              'ZZZ_/   \_  '
              'ZZ/       \  '
              'Z(         ) '
              'ZZ`¯¯---¯¯´  '
              'Z           '); bossH=${#boss[*]}; bossW=${#boss[4]}


         CM1=$DIM$BLK; CM2=$BLD$BLK; CM3=$SKY$BLK; CM4=$SKY$BLU; CM5=$BLD$YLW; CM6=$BLD$RED; CM7=$BLD$BLU; CM8=$SKY$YLW; CM9=$SKY$RED
#                                        center point
  boss_color=("$SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY"
              "$SKY $SKY $SKY $SKY $SKY $CM1 $CM2 $CM1 $SKY $SKY $SKY $SKY $SKY"
              "$SKY $SKY $SKY $CM1 $CM1 $YLW $CM5 $CM8 $CM1 $CM1 $SKY $SKY $SKY"
              "$SKY $SKY $CM1 $RED $RED $RED $CM6 $CM9 $RED $RED $CM1 $SKY $SKY"
              "$SKY $CM1 $SKY $BLU $BLU $BLU $CM7 $CM4 $BLU $BLU $SKY $CM1 $SKY"
              "$SKY $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $CM1 $SKY $SKY"
              "$SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY $SKY");;
	esac


function sprite_boss {

       hight=$bossH
       width=$bossW
       color=("${boss_color[@]}")
	  target=("$[$OX+0] $[$OY+2]" "$[$OX+1] $[$OY+3]" "$[$OX+2] $[$OY+4]"
              "$[$OX+1] $[$OY+2]" "$[$OX+2] $[$OY+3]" "$[$OX+3] $[$OY+4]")

          EX=$[$OX+2]
          EY=$[$OY+5]; [[ $EY -gt $enmyendy ]] && EY=$enmyendy
          YY=$[$Y-1]

	# kill client first
	[[ $Y2 ]] && YY=$[$Y2-1] || YY=$[$Y-1]

    if [[ $bhealth -gt 0 ]]; then
	    # Boss fire
	    [[ $OY -eq $YY && $K -eq 0 ]] && OBJ+=("$[$OX - 4] $[$OY + 4] 0 bfire")

	    # Boss move
	    [[ $OY -lt $YY                               ]] && ((OY++))
	    [[ $OY -gt $YY                               ]] && ((OY--))
	    [[ $OX -gt $[$endx / 2] && $goback = 'false' ]] && ((OX--)) || goback=true
	    [[ $OX -lt $bossendx    && $goback = 'true'  ]] && ((OX++)) || goback=false
    else # when boss' health goes to 0 it starts to fall, explodes and bounces on the ground
        spd=0.1; ((OX--))
	    [[ $OY -lt   $bossendy      && $jump = 'false' ]] && ((OY++)) || { jump=true; ((BJ--)); }
	    [[ $OY -gt $[$bossendy-$BJ] && $jump = 'true'  ]] && ((OY--)) ||   jump=false
        [[ $OX -gt 0 && $L -eq 0 ]] && BOOM $OX $OY
        [[ $OX -le -$bossW       ]] && gamend='win'
    fi

    case "$day$month" in

        3110)
         CM1=$SKY$DIM$ylw; CM2=$DIM$UND$grn; CM6=$BLD$RED
      sprite=("\e[$OY;$[$OX+2]H$SKY         "
              "\e[$[$OY+1];${OX}H$SKY   $CM1.--.$CM2${pumtop[$L]}$CM1.-.$SKY  "
              "\e[$[$OY+2];${OX}H$SKY  $CM1/$CM6(⁐ ) () $CM1"'\\'"$SKY "
              "\e[$[$OY+3];${OX}H$SKY $CM1❲ $RED${mouthtop[$Q]} $CM1❳$SKY "
           "\e[$[$OY+4];${OX}H$SKY  $CM1"'\\'"$RED${mouthlow[$Q]} $CM1/$SKY  "
             "\e[$[$OY+5];${OX}H$SKY   $CM1"'`¯----¯´'"$SKY  "
              "\e[$[$OY+6];$[$OX+2]H$SKY         ")

     sprite2=('ZZ         '
              "ZZZ.--.${pumtop[$L]}.-.  "
              'ZZ/(⁐ ) () \ '
              "Z❲ ${mouthtop[$Q]} ❳ "
              'ZZ\'"${mouthlow[$Q]} / "
              'ZZZ`¯----¯´  '
              'ZZ         ');;

		*)
         CM1=$DIM$BLK; CM2=$BLD$BLK
      sprite=("\e[$OY;$[$OX+4]H$SKY     "
       "\e[$[$OY+1];$[$OX+2]H$SKY   ${CM1}_${CM2}_${CM1}_$SKY   "
      "\e[$[$OY+2];$[$OX+1]H$SKY  ${CM1}_/${small2[$L]}${CM1}\_$SKY  "
        "\e[$[$OY+3];${OX}H$SKY  ${CM1}/${big2[$L]}"${CM1}'\\'"$SKY  "
        "\e[$[$OY+4];${OX}H$SKY ${CM1}( ${big3[$L]} ${CM1})$SKY "
      "\e[$[$OY+5];${OX}H$SKY  ${CM1}"'`¯¯---¯¯´'"$SKY  "
      "\e[$[$OY+6];$[$OX+1]H$SKY           ")

     sprite2=('ZZZZ     '
              'ZZZZZ___   '
              "ZZZ_/${small[$L]}\_  "
              "ZZ/${big[$L]}\  "
              "Z( ${big[$L]} ) "
              'ZZ`¯¯---¯¯´  '
              'Z           ');;
	esac

	((cuter++)); OBJ[$i]="$OX $OY $cuter $type"
}

#------------------------{ Animations }---------------------------------------------------------------------------------
        boom=('.-.'
             '(   )'
              '`-`'

             ', - .'
            '(     )'
             '. _ .'

              '`  "'
           '(       )'
             '_ _ .'); boomN=${#boom[@]}; boomC=3

function sprite_boom {

	[[ $cuter -gt $boomN ]] && { erase_obj $i $boomC; return; }

        boom=(  "\e[$OY;$[$OX+3]H${red}.-."$SKY
          "\e[$[$OY+1];$[$OX+2]H${red}(   )"$SKY
         "\e[$[$OY+2];$[$OX+3]H${red}"'`-`'$SKY

               "\e[$OY;$[$OX+2]H${RED}, - ."$SKY
         "\e[$[$OY+1];$[$OX+1]H${RED}(     )"$SKY
          "\e[$[$OY+2];$[$OX+2]H${RED}. _ ."$SKY

        "\e[$OY;$[$OX+2]H${DIM}${RED}"'`  "'$SKY
     "\e[$[$OY+1];${OX}H${DIM}${RED}(       )"$SKY
    "\e[$[$OY+2];$[$OX+2]H${DIM}${RED}_ _ ."$SKY)

    screen+="${boom[*]:$cuter:$boomC}"
    [[ $E -eq 0 ]] && { ((cuter+=${boomC})); OBJ[$i]="$OX $OY $cuter boom"; }
}

         Sun=('       ___ |       '
              '---````    \       '
              '           _`.     '
              '        ../   `..__'
              '     ../        /  '
              '    /          /   '
              '              /    '
              '              /    '
              '             /     '

              '_...---``  |       '
              '        _.-\       '
              '   _.--`    `.     '
              ' -`          ,`..__'
              '           ,`     |'
              '         ,`       |'
              '       _`        | '
              '                 | '
              '                 | '

              '     _...--|       '
              '..--`      \       '
              '         .. `.     '
              '     _.-`     `..__'
              '  ..`         .`   '
              '             /     '
              '            /      '
              '          .`       '
              '         `         '); SunN=${#Sun[@]}; SunC=9

function sprite_Sun {

         Sun=("\e[1;${Sunsendx}H$SKY$YLW"'       ___ |       '
              "\e[2;${Sunsendx}H$SKY$YLW"'---````    \       '
              "\e[3;${Sunsendx}H$SKY$YLW"'           _`.     '
          "\e[4;${Sunsendx}H$SKY$BLD$YLW"'        ../   `..__'
              "\e[5;${Sunsendx}H$SKY$YLW"'     ../        /  '
              "\e[6;${Sunsendx}H$SKY$YLW"'    /          /   '
          "\e[7;${Sunsendx}H$SKY$BLD$YLW"'              /    '
              "\e[8;${Sunsendx}H$SKY$YLW"'              /    '
              "\e[9;${Sunsendx}H$SKY$YLW"'             /     '

              "\e[1;${Sunsendx}H$SKY$YLW"'_...---``  |       '
          "\e[2;${Sunsendx}H$SKY$BLD$YLW"'        _.-\       '
              "\e[3;${Sunsendx}H$SKY$YLW"'   _.--`    `.     '
              "\e[4;${Sunsendx}H$SKY$YLW"' -`          ,`..__'
          "\e[5;${Sunsendx}H$SKY$BLD$YLW"'           ,`     |'
              "\e[6;${Sunsendx}H$SKY$YLW"'         ,`       |'
              "\e[7;${Sunsendx}H$SKY$YLW"'       _`        | '
          "\e[8;${Sunsendx}H$SKY$BLD$YLW"'                 | '
              "\e[9;${Sunsendx}H$SKY$YLW"'                 | '

          "\e[1;${Sunsendx}H$SKY$BLD$YLW"'     _...--|       '
              "\e[2;${Sunsendx}H$SKY$YLW"'..--`      \       '
          "\e[3;${Sunsendx}H$SKY$BLD$YLW"'         .. `.     '
              "\e[4;${Sunsendx}H$SKY$YLW"'     _.-`     `..__'
              "\e[5;${Sunsendx}H$SKY$YLW"'  ..`         .`   '
          "\e[6;${Sunsendx}H$SKY$BLD$YLW"'             /     '
              "\e[7;${Sunsendx}H$SKY$YLW"'            /      '
          "\e[8;${Sunsendx}H$SKY$BLD$YLW"'          .`       '
              "\e[9;${Sunsendx}H$SKY$YLW"'         `         ')

    [[ $Q -eq 0 ]] && screen+="${Sun[*]:$S:$SunC}"
}


   mainrotor=('___________' '    ___    ' '     _     ' '    ___    ')
   tailrotor=('\\' '─' '/' '|')

function sprite_hero {

#         HX=$[$X+9]; HY=$[$Y+3] # Hero collide coordinates
          HX=$[$X+11]; HY=$[$Y+3] # Hero collide coordinates

         CM4=$SKY$DIM$HC ; CM5=$SKY$HC; CM6=$SKY$BLD$HC; CM7=$SKY$SC$HS$HC$BLD
         CM8=$SKY$DIM$UND; CM9=$SKY$HC$BLD

                                       #     new hero
                                       # __ ___________
                                       # |X\___.-╨─｡_
                                       # `─´‾‾‷\°★ º¯]─
                                       #        ‾‾‾‾‾
      sprite=("\e[$Y;${X}H$SKY                  "
            "\e[$[$Y+1];${X}H$CM5 __ $blk${mainrotor[$L]}$SKY "
            "\e[$[$Y+2];${X}H$CM4 |$blk${tailrotor[$L]}$CM6"'\\'"$CM5${UND}___$CM5.-╨─$CM6$UND｡ $SKY  "
          "\e[$[$Y+3];${X}H$CM4"' `─´‾‾‷\\'"$blk°$CM7$SKY$blk º¯$CM9]$SKY$BLK${gun[$G]}$SKY   "
        "\e[$[$Y+4];${X}H$SKY        $CM4‾‾‾‾‾$SKY     "
                "\e[$[$Y+5];$[$X+7]H$SKY       ")

	screen+="${sprite[*]}"
}

function sprite_hero2 {

    case `nc -l -p $sport` in

		'w'|'W') [[ $Y2    -gt 1                 ]] && ((Y2--));;
		'a'|'A') [[ $X2    -gt 1                 ]] && ((X2--));;
		's'|'S') [[ $Y2    -lt $heroendy         ]] && ((Y2++));;
		'd'|'D') [[ $X2    -lt $heroendx         ]] && ((X2++));;
		'p'|'P') [[ $ammo2 -ge $G2 && $CD2 -eq 0 ]] && { CD2=7; case $G2 in
            1) PIU+=("$HX2 $HY2 2");;
            2) PIU+=("$HX2 $[$HY2+1] 2" "$HX2 $[$HY2-1] 2");;
            3) PIU+=("$HX2 $[$HY2+1] 2" "$HX2 $[$HY2-1] 2" "$[$HX2+1] $HY2 2");;
            4) PIU+=("$[$HX2+1] $[$HY2+1] 2" "$[$HX2+1] $[$HY2-1] 2" "$HX2 $[$HY2+2] 2" "$HX2 $[$HY2-2] 2");;
            5) PIU+=("$[$HX2+1] $[$HY2+1] 2" "$[$HX2+1] $[$HY2-1] 2" "$HX2 $[$HY2+2] 2" "$HX2 $[$HY2-2] 2" "$[$HX2+2] $HY2 2");;
        esac; ((ammo2-=$G2)); };;

	esac

         CM4=$SKY$DIM$HC2; CM5=$SKY$HC2; CM6=$SKY$BLD$HC2; CM7=$SKY$SC2$HS2$HC2$BLD
         CM8=$SKY$DIM$UND; CM9=$SKY$HC2$BLD

    case $game_type in

    'duel')
                                   #    new hero
                                   # ___________ __
                                   #   _｡─╨-.___/X|
                                   # ─[¯º★°/‴‾‾`─´
                                   #   ‾‾‾‾‾

      sprite=("\e[$Y2;${X2}H$SKY                  "
         "\e[$[$Y2+1];${X2}H$SKY $blk${mainrotor[$L]}$CM5 __$SKY "
         "\e[$[$Y2+2];${X2}H$CM4   $UND ｡─$CM5╨$CM6-.${CM5}___/$blk${tailrotor[$L]}$CM6|$SKY "
          "\e[$[$Y2+3];${X2}H$SKY $BLK${gun[$G2]}$CM4[$blk¯º$CM7$SKY $blk°$CM4/‴‾‾"'`─´'"$SKY "
                        "\e[$[$Y2+4];${X2}H$SKY   $CM4‾‾‾‾‾$SKY      "
                           "\e[$[$Y2+5];$[$X2+3]H$SKY       ")

         HX2=$[$X2+3] # Hero collide
         HY2=$[$Y2+3] # coordinates
    ;;

    'team')
                                   #     new hero
                                   # __ ___________
                                   # |X\___.-╨─｡_
                                   # `─´‾‾‷\°★ º¯]─
                                   #        ‾‾‾‾‾
      sprite=("\e[$Y2;${X2}H$SKY                  "
            "\e[$[$Y2+1];${X2}H$CM5 __ $blk${mainrotor[$L]}$SKY "
            "\e[$[$Y2+2];${X2}H$CM4 |$blk${tailrotor[$L]}$CM6"'\\'"$CM5${UND}___$CM5.-╨─$CM6$UND｡ $SKY  "
          "\e[$[$Y2+3];${X2}H$CM4"' `─´‾‾‷\\'"$blk°$CM7$SKY$blk º¯$CM9]$SKY$BLK${gun[$G]}$SKY   "
        "\e[$[$Y2+4];${X2}H$SKY        $CM4‾‾‾‾‾$SKY     "
                "\e[$[$Y2+5];$[$X2+7]H$SKY       ")



         HX2=$[$X2+11] # Hero collide
         HY2=$[$Y2+3]  # coordinates

    ;; esac

	screen+="${sprite[*]}"
}

#------------------------{ Intro }--------------------------------------------------------------------------------------
           D=$DEF; C1=$BLU; C2=$RED; C3=$YLW; C4=$red; C5=$BLD$YLW; C6=$BLD$GRN; C7=$blu; C8=$BLD$RED

				#   ░   ░░░ ░░     ░  ░░      ░░  ░░ ░
				# ░   ░  ▒██████ ░▒██████ ▒██░  ▒██
				#   ░ ░░▒▓██ ▒▓██ ▓▓▓██▓ ▒▓██ ░▒▓██░░ ░
				#░ ░ ░░▒▓██ ▒▓██ ▒▒▒▓██ ░▒▓██░ ▒▓██░
				#      ▒▓██████░ ░▒▓██ ░▒▓██ ░▒▓██░░ ░ ░
				#  ░  ▒▓██▓▓▓▓  ░ ▒▓██░ ▒▓██░░▒▓██ ░
				#   ▒▓████▒▒▒░ ░ ▓██████ ▒▓██████░░ ░
				#░ ░▒▓▓▓▓ ░ ░░▒▓▓▓▓▓▓ ░ ▒▓▓▓▓▓░
				# ░ ▒▒ ░ ░ ░ ░▒▒▒▒▒▒ ░ ░░▒▒▒▒░  ░

         piu=(	"$C1   " "░  "    " ░░"    "░ ░" "░  " "   " "░  " "░░ " "   " "  ░" "░  " "░░ " "░$D  " "   "
				"$C1 ░ " "  ░" "  $C2▒" "$C3███" "███" " $C1░$C2▒" "$C3███" "███" " $C2▒$C3█" "█$C1░ " " $C2▒$C3█" "█$D  " "   " "   "
				"$C1   " "░ ░" "░$C2▒$C4▓" "$C3██ " "$C2▒$C4▓$C3█" "█ $C4▓" "▓▓$C3█" "█$C4▓ " "$C1▒$C4▓$C3█" "█ $C1░" "$C2▒$C4▓$C3█" "█$C1░░" " ░$D " "   "
				"$C1░ ░" " ░░" "$C2▒$C4▓$C3█" "█ $C2▒" "$C4▓$C3██" " $C2▒▒" "▒$C4▓$C3█" "█ $C2░" "▒$C4▓$C3█" "█$C1░ " "$C2▒$C4▓$C3█" "█$C1░$D " "   " "   "
				"$C1   " "   " "$C2▒$C4▓$C5█" "███" "██$C1░" " ░$C2▒" "$C4▓$C3██" " $C1░$C2▒" "$C4▓$C3██" " $C1░$C2▒" "$C4▓$C3██" "$C1░░ " "░ ░$D" "   "
				"$C1  ░" "  $C2▒" "$C4▓$C3██" "$C4▓▓▓" "▓  " "$C1░ $C2▒" "$C4▓$C3██" "$C1░ $C2▒" "$C4▓$C3██" "$C1░░$C2▒" "$C4▓$C3██" " $C1░$D " "   " "   "
				"$C2   " "▒$C4▓$C3█" "███" "$C2▒▒▒" "$C1░ ░" " $C4▓$C3█" "███" "██ " "$C1▒$C4▓$C3█" "███" "██$C1░" "░ ░$D" "   " "   "
				"$C1░ ░" "$C2▒$C4▓▓" "▓▓ " "$C1░ ░" "░$C2▒$C4▓" "▓▓▓" "▓▓ " "$C1░ $C2▒" "$C4▓▓▓" "▓▓$C1░$D" "   " "   " "   " "   "
				"$C1 ░ " "▒▒ " "░ ░" " ░ " "░▒▒" "▒▒▒" "▒ ░" " ░░" "▒▒▒" "▒░ " " ░ " "   " "   " "$D   "); piuN=${#piu[*]}; piuC=14

				#          ░░ ▒▒███░
				#     ░░░ ▒████ ▒▓███░
				# ░ ▒████▒▓▓▓▓ ░░▒▓▓███ ░░ ░
				#░ ▒▓▓▓▓ ▒████░▒▓███░░
				# ▒ ▒▒  ▒▓▓▓▓▒▓███░
				#    ░░░ ▒▒▒ ░░▒▒░

         arr=(	"   " "   " "   " "   " " $C7░░" " $C3▒▒" "$C6███" "$C7░$D  " ""    ""
				"   " "   " "  $C7░" "░░ " "$C2▒$C8██" "██ " "$C7▒$C3▓$C6█" "██$C7░$D" ""    ""
				"   " " $C7░ " "▒$C8██" "██$D$C2▒" "$C3▓▓▓" "▓ $C7░" "░$C7▒$C3▓" "▓$C6██" "█ $C7░" "░ ░$D"
				"   " "$C7░ $C2▒" "$C3▓▓▓" "▓ $C2▒" "$C8███" "█$D$C7░$C3▒" "$C3▓$C6██" "█$C7░░$D" "   " ""
				"   " " $C7▒ " "▒▒ " " $C2▒$C3▓" "▓▓▓" "$C7▒$C3▓$C6█" "██$C7░$D" "   " ""    ""
				"   " "   " " $C7░░" "░ ▒" "▒▒ " "░░▒" "▒░$D " "   " ""    ""); arrN=${#arr[*]}; arrC=10

#------------------------{ Functions }-----------------------------------------------------------------------------------
function cut_in () {

	for ((h=0; h<$hight; h++)); do spr=
		for ((c=0; c<$cuter; c++)); do
			color2=(${color[$h]})
            symbol=${sprite2[$h]:$c:1}
            symbol=${symbol//'\'/'\\'}
            symbol=${symbol//'Z'/"\e[$[$OY+$h];$[$OX+$c+1]H"}
			spr+="${color2[$c]}$symbol"
		done
		sprite[$h]="$SKY\e[$[$OY+$h];${OX}H$spr"
	done
}

function cut_out () {

	for ((h=0; h<$hight; h++)); do spr=; stp=1
		for ((w=$[1-$OX]; w<$width; w++)); do ((stp++))
			color2=(${color[$h]})
            symbol="${sprite2[$h]:$w:1}"
            symbol=${symbol//'\'/'\\'}
            symbol=${symbol//'Z'/"\e[$[$OY+$h];${stp}H"}
			spr+="${color2[$w]}$symbol"
		done
		sprite[$h]="\e[$[$OY+$h];1H$spr"
	done
}

function get_dimensions {
    size=(`stty size`)
    endx=${size[1]}
    endy=${size[0]}
bullendx=$[$endx-4 ]
heroendx=$[$endx-15] # old - 12
heroendy=$[$endy-7 ]
enmyendy=$[$endy-7 ]
bossendx=$[$endx-11]
bossendy=$[$endy-7 ]
bosshbar=$[$endx-10]
lineendy=$[$endy-2 ]
Sunsendx=$[$endx-18]
tre1endy=$[$endy-$tree1H-2]
tre2endy=$[$endy-$tree2H-2]
tre3endy=$[$endy-$tree3H-2]
}

function default { HC=${DHC}; SC=${DSC}; HS=${DHS}; }
function bye ()  { stty echo; printf "${CON}${DEF}"; clear; ls --color=auto; exit $1; }
function remove_obj () { unset OBJ[$1]; OBJ=("${OBJ[@]}"); ((NO--)); }
function remove_piu () { unset PIU[$1]; PIU=("${PIU[@]}"); ((NP--)); screen+="\e[$PY;${PX}H$SKY   "; }
function erase_obj  () { remove_obj $1; for (( k=0; k<$2; k++ )); do screen+="\e[$[$OY+$k];${OX}H$SKY         "; done; }

function mess () { XY 1 1 ${DEF}; clear

	case $1 in
		"win" )	sprite_win ; printf "${sprite[*]}"; XY 0 ${endy}; read -t3 -n1000 trash; bye 0;;
		"lose")	sprite_lose; printf "${sprite[*]}"; XY 0 ${endy}; read -t3 -n1000 trash; bye 1;;
		"help")	sprite_help; printf "${sprite[*]}";;
	esac
}

function left () { N=$1; C=$2

		# move
		[ $OX -ge $end ] && {

			((OX-=3)); [ $cuter -ne $C ] && ((cuter++))

			for ((j=0; j<$N; j+=$C)); do

				line=("${sprite[@]:$j:$cuter}"); YY=$[$OY+$j/$C]; spr=
				for part in "${line[@]}"; do spr+="${part}"; done; XY $OX $YY "${spr}"

			done; OBJ[$i]="$OX $OY $cuter $end $type $pause"
		} || { remove_obj $i; ((Q++)); OBJ+=("${scenario[$Q]}"); }
}

function right () { N=$1; C=$2

		# move
		[ $OX -le $end ] && {

			[ $cuter -ne $C ] && ((cuter++)) || ((OX+=3))

			for ((j=0; j<$N; j+=$C)); do

				line=("${sprite[@]:$j:$C}"); YY=$[$OY+$j/$C]; spr=
				for ((k=$[$C-$cuter]; k<$C; k++)); do spr+="${line[k]}"; done; XY $OX $YY "${spr}"

			done; OBJ[$i]="$OX $OY $cuter $end $type $pause"
		} || { remove_obj $i; ((Q++)); OBJ+=("${scenario[$Q]}"); }
}

function intro {

	get_dimensions; Q=0

    scenario=( # Scenario 4 intro
	#----------+-------+-----+------------+----+
	# start X  |start Y|cuter|    end X   |type|
	#----------+-------+-----+------------+----+
	"$[$endx+1]   3       0   $[endx/2-34] piu"
	"$[$endx+1]   3       0   $[endx/2+2]  piu"
	"-2           12      0   $[endx/2-16] arr"
    "0            0       0   0            end"); OBJ=("${scenario[$Q]}")


	while true; do sleep 0.005; NO=${#OBJ[@]}; for (( i=0; i<$NO; i++ )); do
		OI=(${OBJ[$i]}); OX=${OI[0]}; OY=${OI[1]}; cuter=${OI[2]}; end=${OI[3]}; type=${OI[4]}

		case $type in
			#----------+---------------------+-------+-----+-----+-------+
			# OBJ type |        sprite       | func. |items|width|comment|
			#----------+---------------------+-------+-----+-----+-------+
			"arr" )		sprite=("${arr[@]}") ; right  $arrN $arrC;; #
			"piu" )		sprite=("${piu[@]}") ; left   $piuN $piuC;; #
			"end" )		                      return             ;; #

	esac; done; done
}

function configure {

  hero_color=($BLK $RED $GRN $YLW $BLU $MGN $CYN $WHT); HCN=${#hero_color[*]}; HCI=0;
  star_color=($BLK $RED $GRN $YLW $BLU $MGN $CYN $WHT); SCN=${#star_color[*]}; SCI=0;
   hero_star=(★ ☭ ✚ ✙ ✠ ✡ ✦ ✧ ✩ ✪ ☘ ☠ ☢ ☣ ☯ ❃ ❂ ❁ ✿ ❀ ✣ ♣ ♠ ♥ ♦ ❤ ● ☻ ♀ ♂)
        menu=( 'hero' 'star' 'symbol' 'apply' 'back' )
         HSI=0; HSN=${#hero_star[*]}; menuN=${#menu[*]}; menuI=$[$menuN-1]
        selL='>'; selR='<'; selN=' '

	function deselect {
		selectedHCL=$selN; selectedHCR=$selN
		selectedSCL=$selN; selectedSCR=$selN
		selectedHSL=$selN; selectedHSR=$selN
		selectedAP=$DEF  ; selectedBK=$DEF
    }

	while true; do get_dimensions; timings

         CM4=$SKY$DIM$HC  ; CM5=$SKY$HC
         CM6=$SKY$BLD$HC  ; CM7=$SKY$SC$HS$HC$BLD
         CM8=$SKY$DIM$UND ; CM9=$SKY$HC$BLD

        hero=("$CM5 __ $blk${mainrotor[$L]}$SKY   "
             "$CM4 |$blk${tailrotor[$L]}$CM6"'\\'"$CM5${UND}___$CM5.-╨─$CM6$UND｡ $SKY     "
           "$CM4"' `─´‾‾‷\\'"$blk°$CM7$SKY$blk º¯$CM9]$SKY$BLK${gun[$G]}$SKY   "
                "$SKY        $CM4‾‾‾‾‾$SKY     ")

		#-{ Get keys }-------------------------------------------------------------------------------------------------------
		read -t${spd} -n1 input 2> /dev/null; input=${input:0:1}; case $input in

			's'|'S') ((menuI++)); [ $menuI -gt $[$menuN-1] ] && menuI=$[$menuN-1];;
			'w'|'W') ((menuI--)); [ $menuI -lt 0           ] && menuI=0;;
			'd'|'D') case ${menu[$menuI]}	in	'hero'  ) ((HCI++)); [ $HCI -gt $[$HCN-1] ] && HCI=$[$HCN-1];;
												'star'  ) ((SCI++)); [ $SCI -gt $[$SCN-1] ] && SCI=$[$SCN-1];;
												'symbol') ((HSI++)); [ $HSI -gt $[$HSN-1] ] && HSI=$[$HSN-1];; esac;;

			'a'|'A')  case ${menu[$menuI]}	in	'hero'  ) ((HCI--)); [ $HCI -lt 0 ] && HCI=0;;
												'star'  ) ((SCI--)); [ $SCI -lt 0 ] && SCI=0;;
												'symbol') ((HSI--)); [ $HSI -lt 0 ] && HSI=0;; esac;;

			'p'|'P') case ${menu[$menuI]}	in	'hero'  ) HC=${hero_color[$HCI]};;
												'star'  ) SC=${star_color[$SCI]};;
												'symbol') HS=${hero_star[$HSI]} ;;
												'apply' )          back; clear; return;;
												'back'  ) default; back; clear; return;; esac;;
		esac

		#----------------------------------{ Print hero }----------------------------------
		for (( i=0; i<${#hero[@]}; i++ )); do XY $[$endx/2-9] $[5+$i] "$SKY ${hero[$i]} "; done

		#----------------------------------{ Print controls }-------------------------------------------------------------
		for ((i=0; i<${HCN}; i++ )); do [ $i -eq $HCI ] && selectedHC=$BLD || selectedHC=$DEF
										XY $[$endx/2 - 4 + $i*3] $[$endy/2]   "$selectedHC${hero_color[$i]}██$DEF"; done
		for ((i=0; i<${SCN}; i++ )); do [ $i -eq $SCI ] && selectedSC=${BLD} || selectedSC=${DEF}; SL=; SR=
										XY $[$endx/2 - 4 + $i*3] $[$endy/2+2] "$selectedSC${star_color[$i]}██$DEF"; done
		for ((i=0; i<$[${HSN}/2]; i++ )); do [ $i -eq $HSI ] && selectedHS=$BLD$RED || selectedHS=$DEF; SL=; SR=
										XY $[$endx/2 - 15 + $i*3] $[$endy/2+4] "$selectedHS${hero_star[$i]} $DEF" ; done
		for ((i=$[${HSN}/2]; i<${HSN}; i++ )); do [ $i -eq $HSI ] && selectedHS=$BLD$RED || selectedHS=$DEF; SL=; SR=
										XY $[$endx/2 - 60 + $i*3] $[$endy/2+5] "$selectedHS${hero_star[$i]} $DEF" ; done

		case ${menu[$menuI]} in 'apply' )	deselect; selectedAP=$BLD$RED;;
								'back'  )	deselect; selectedBK=$BLD$RED;;
								'hero'  )	deselect; selectedHCL=$selL; selectedHCR=$selR;;
								'star'  )	deselect; selectedSCL=$selL; selectedSCR=$selR;;
								'symbol')	deselect; selectedHSL=$selL; selectedHSR=$selR;;
								*       )	deselect;;esac

		XY $[$endx/2 - 18] $[$endy/2]   "$selectedHCL Hero color: "  ; XY $[$endx/2 + 20] $[$endy/2]   "$selectedHCR"
		XY $[$endx/2 - 20] $[$endy/2+2] "$selectedSCL Symbol color: "; XY $[$endx/2 + 20] $[$endy/2+2] "$selectedSCR"
		XY $[$endx/2 - 30] $[$endy/2+4] "$selectedHSL Hero symbol: " ; XY $[$endx/2 + 30] $[$endy/2+4] "$selectedHSR"

		XY $[$endx/2 - 2]  $[$endy/2+7] "${selectedAP}apply$DEF"
		XY $[$endx/2 - 2]  $[$endy/2+9] "${selectedBK}back$DEF"

	done

}

function clr  {
	for ((i=0; i<${#start_menu[*]}; i++)); do XY $[$endx/2-12] $[$endy-5+$i] "                       "; done
}

function back {
	start_menu=("start  ${cors:-single}" 'multiplayer' 'conf' 'exit')
	menu=("${start_menu[@]}"); menuI=0; menuN=${#menu[*]}; clr
}

function selector {

	#-{ Get keys }-------------------------------------------------------------------------------------------------------
	read -t0.005 -n1 input 2> /dev/null; input=${input:0:1}; case $input in

		's'|'S') ((menuI++)); [[ $menuI -gt $[$menuN-1] ]] && menuI=$[$menuN-1];;
		'w'|'W') ((menuI--)); [[ $menuI -lt 0           ]] && menuI=0;;
		'd'|'D') menuI=$[$menuN-1];;
		'a'|'A') menuI=0;;

	esac

	for ((i=0; i<$menuN; i++)); do

		[[ $i -eq $menuI ]] && selected=$BLD$RED || selected=$DEF
		XY $[$endx/2-${#menu[$i]}/2-3] $[$endy-5+$i] " $selected${menu[$i]}$DEF "

	done
}

function enter_server {

	XY $[$endx/2-10] $[$endy-5] "${RED}Enter server IP: "; XY $[$endx/2-10] $[$endy-4] "$CON$BLD$WHT"
	stty echo; read -p ' ' -e saddr; printf "$COF"; stty -echo; clr; return
}

function client_or_server {

	menu=('server' 'client' 'team' 'back'); menuN=${#menu[*]}; menuI=$[$menuN-1]

	while true; do selector; case $input in 'p'|'P') case ${menu[$menuI]} in

		'server'       ) server=true; client=; cors='server'; game_type=${menu[2]}; back; return;;
		'client'       ) client=true; server=; cors='client'; game_type='clnt'; clr; enter_server; back; return;;
		'team' | 'duel') case ${menu[2]} in 'team') menu[2]='duel';; 'duel') menu[2]='team';; esac;;
		'back'         ) back; return;; esac;;

	esac; done
}

function main_menu {

	intro; back

	while true; do selector; case $input in 'p'|'P') case ${menu[$menuI]} in

		'start'*     ) return;;
		'multiplayer') clr   ; client_or_server;;
		'conf'       ) clear ; configure; intro;;
		'exit'       ) bye  ;; esac;;

	esac; done
}

function fps_counter {

	[[ $SECONDS -gt $sec ]] && {\
		FPS=$FPSC
		[[ $FPS -gt $FPSM ]] && FPSM=$FPS
		[[ $FPS -lt $FPSL ]] && FPSL=$FPS
		sec=$SECONDS
		FPSC=0
	} || ((FPSC++))
}

function mover () { timer=$1

	# collisions with plane1
	[[ $life -gt 0 ]] && {
		case  $type:"$HX $HY" in
			'alien':${target[0]}| 'alien':${target[1]}| 'alien':${target[2]}) erase_obj $i $hight; BOOM $X $Y; ((life--)); ((frags++)); ((enumber--)); OBJ+=("$OX $OY 0 boom"); return;;
			'bfire':${target[0]}| 'bfire':${target[1]}| 'bfire':${target[2]}) erase_obj $i $hight; BOOM $X $Y; ((life--)) ; return;;
			'gunup':${target[0]}| 'gunup':${target[1]}| 'gunup':${target[2]}) erase_obj $i $hight; [[ ${G} -lt 5 ]] && ((G++)); return;;
			 'ammo':${target[0]}|  'ammo':${target[1]}|  'ammo':${target[2]}) erase_obj $i $hight; ((ammo+=100)); return;;
			 'life':${target[0]}|  'life':${target[1]}|  'life':${target[2]}) erase_obj $i $hight; ((life++))   ; return;;
			 'boss':${target[0]}|  'boss':${target[1]}|  'boss':${target[2]}) ((life--)); ((bhealth-=10)); return;;
		esac
	}

	# collisions with plane2
	[[ $server && $life2 -gt 0 ]] && {
		case  $type:"$HX2 $HY2" in
			'alien':${target[0]}| 'alien':${target[1]}| 'alien':${target[2]}) erase_obj $i $hight; BOOM $X2 $Y2; ((life2--)); ((frags2++)); ((enumber--)); OBJ+=("$OX $OY 0 boom"); return;;
			'bfire':${target[0]}| 'bfire':${target[1]}| 'bfire':${target[2]}) erase_obj $i $hight; BOOM $X2 $Y2; ((life2--)); return;;
			'gunup':${target[0]}| 'gunup':${target[1]}| 'gunup':${target[2]}) erase_obj $i $hight; [[ ${G2} -lt 5 ]] && ((G2++)); return;;
			 'ammo':${target[0]}|  'ammo':${target[1]}|  'ammo':${target[2]}) erase_obj $i $hight; ((ammo2+=100)); return;;
			 'life':${target[0]}|  'life':${target[1]}|  'life':${target[2]}) erase_obj $i $hight; ((life2++))   ; return;;
			 'boss':${target[0]}|  'boss':${target[1]}|  'boss':${target[2]}) ((life2--)); ((bhealth-=10)); return;;
		esac
	}

	# alien's collisions with pius
	case $type in 'alien' | 'boss')

		for (( t=0; t<$NP; t++ )); do PI=(${PIU[$t]}); PX=${PI[0]}; PY=${PI[1]}; owner=${PI[2]}

			case "$PX $PY" in # hit by bullet

				"${target[0]}"| "${target[1]}"| "${target[2]}"| "${target[3]}"| "${target[4]}"| "${target[5]}")

					case $type in
						'alien') case $[RANDOM % $rnd] in 0)  OBJ+=("$OX $OY 0 ${bonuses[$[RANDOM % ${#bonuses[@]}]]}");; esac # get bonus
								 case $owner in 1) ((frags++));; 2) ((frags2++));; esac
								 ((enumber--)); erase_obj $i $hight; remove_piu $t; OBJ+=("$OX $OY 0 boom"); return;;
						'boss' ) remove_piu $t; ((bhealth--)); continue;;
					esac
			esac
		done
	esac

	# print
	[[ $cuter -lt  $width ]] && cut_in
	[[    $OX -le  1      ]] && cut_out #                fly away                                       or         print
	[[    $OX -le -$width ]] && { remove_obj $i; case $type in 'alien') ((enumber--));; esac; return; } || screen+="${sprite[*]}"

	# move
	case $timer in 0) ((OX--)); ((cuter++)); OBJ[$i]="$OX $OY $cuter $type";; esac
}

function timings {

	[[ $K   -ge 20 ]] && K=0 || ((K++))	# boss' fire rate
	[[ $L   -ge 3  ]] && L=0 || ((L++))	# sprites animation
	[[ $J   -ge 5  ]] && J=0 || ((J++))	# boss' bullet animation
	[[ $Q   -ge 6  ]] && Q=0 || ((Q++))	# tree1\cloud1(small)  speed
	[[ $W   -ge 4  ]] && W=0 || ((W++))	# tree2\cloud2(medium) speed
	[[ $E   -ge 2  ]] && E=0 || ((E++))	# tree3\cloud3(large)  speed
    [[ $CD  -gt 0  ]] && ((CD--))       # hero1 cooldown timer
    [[ $CD2 -gt 0  ]] && ((CD2--))      # hero2 cooldown timer
	[[ $E   -eq 0  ]] && { ((S+=$SunC)); [[ $S -gt $SunN ]] && S=0; }	# Sun animation
}

function server_read {

	read -t$spd -s -n1 input &> /dev/null
    case $input in

		'w'|'W') [[ $Y    -gt 1               ]] && ((Y--));;
		'a'|'A') [[ $X    -gt 1               ]] && ((X--));;
		's'|'S') [[ $Y    -lt $heroendy       ]] && ((Y++));;
		'd'|'D') [[ $X    -lt $heroendx       ]] && ((X++));;
		'p'|'P') [[ $ammo -ge $G && $CD -eq 0 ]] && { CD=7; case $G in
            1) PIU+=("$HX $HY 1");;
            2) PIU+=("$HX $[$HY+1] 1" "$HX $[$HY-1] 1");;
            3) PIU+=("$HX $[$HY+1] 1" "$HX $[$HY-1] 1" "$[$HX+1] $HY 1");;
            4) PIU+=("$[$HX+1] $[$HY+1] 1" "$[$HX+1] $[$HY-1] 1" "$HX $[$HY+2] 1" "$HX $[$HY-2] 1");;
            5) PIU+=("$[$HX+1] $[$HY+1] 1" "$[$HX+1] $[$HY-1] 1" "$HX $[$HY+2] 1" "$HX $[$HY-2] 1" "$[$HX+2] $HY 1");;
        esac; ((ammo-=$G)); };;

	esac
}

function add_backgound {
    case $background in true)
        #-{ Add msngr }----------------------------------------------------------------------------------------------
        case $[RANDOM % $MSN] in 0) OBJ+=("$[$endx + 1] $[RANDOM % $heroendy + 2] 0 msngr");; esac

        #-{ Add cloud }----------------------------------------------------------------------------------------------
        case $[RANDOM % $CLD] in 0) OBJ+=("$[$endx + 1] $[RANDOM % 10 + 2] 0 cloud$[RANDOM % 3 + 1]");; esac

        #-{ Add tree }-----------------------------------------------------------------------------------------------
        case $[RANDOM % $TRE]:$[RANDOM % 3 + 1] in
            0:1) OBJ+=("$[$endx + 1] $tre1endy 0 tree1");;
            0:2) OBJ+=("$[$endx + 1] $tre2endy 0 tree2");;
            0:3) OBJ+=("$[$endx + 1] $tre3endy 0 tree3");;
        esac;;
    esac
}

function fill_screen {
	#-{ Fill screen }----------------------------------------------------------------------------------------------------
	for ((i=0;         i<$lineendy; i++)); do printf "$SKY%${endx}s"; done
	for ((i=$lineendy; i<$endy;     i++)); do printf "$LND%${endx}s"; done
}

function BOOM () {
    #         X       Y
    OBJ+=("  $1      $2    0 boom"
          "$[$1+5]   $2    0 boom"
          "$[$1+1] $[$2+2] 0 boom"
          "$[$1+5] $[$2+2] 0 boom"
          "  $1    $[$2+1] 0 boom")
}

function client_read { read -t$spd -s -n1 input &> /dev/null; }
function sender () { until nc -q0 $1 $2 2> /dev/null <<< "$3"; do :; done; }

function game_team {
    #======================================{ Main game loop single or server team mode }=================================
    while true; do

        #-{ Empty screen, count fps, add backrount objects, set timings and print Sun }----------------------------------
	    screen=; fps_counter; add_backgound; timings; sprite_Sun

	    #-{ Print moving land }------------------------------------------------------------------------------------------
	    screen+="\e[$lineendy;1H$LND${land:$[1-$LX]:$endx}"; [[ $LX -lt -$[$LN/2] ]] && LX=-1 || ((LX--))

	    #-{ Print game status }------------------------------------------------------------------------------------------
	    [[ $server ]] && {
		    screen+="\e[$endy;2H$LND$SC2$HS2 ${BLK}killed aliens: $LND$RED$frags2$LND  ${BLK}Life: $LND$RED$life2$LND  ${BLK}Ammo: $LND$RED$ammo2$LND "
		    screen+="\e[1;2H$SKY$SC$HS ${BLK}killed aliens: $SKY$RED$frags$SKY  ${BLK}Life: $SKY$RED$life$SKY  ${BLK}Ammo: $SKY$RED$ammo$SKY "
		    screen+="\e[$endy;$[$endx-10]H$LND${BLK}FPS: $RED$FPS  "
	    } || {
		    screen+="\e[1;2H$SKY${BLK}killed aliens: $SKY$RED$frags$SKY  ${BLK}Life: $SKY$RED$life$SKY  ${BLK}Ammo: $SKY$RED$ammo$SKY "
		    screen+="\e[$endy;2H$LND${BLK}FPS: $RED$FPS ${BLK}FPS max: $RED$FPSM ${BLK}FPS low: $RED$FPSL "
	    }

	    #-{ Print heroes and get keys }----------------------------------------------------------------------------------
	    [[ $life -gt 0 ]] && { sprite_hero; server_read; }
        [[ $server     ]] &&   sprite_hero2

	    #-{ Move\check\print all flying to hero objects }----------------------------------------------------------------
	    NO=${#OBJ[@]}; for (( i=0; i<$NO; i++ )); do OI=(${OBJ[$i]}); OX=${OI[0]}; OY=${OI[1]}; cuter=${OI[2]}; type=${OI[3]}; case $type in

           #----------+---------------+------------+-----+----------+
           # OBJ type |  sprite maker |sprite mover|timer|  comment |
           #----------+---------------+------------+-----+----------+
		    'msngr' )	sprite_msngr;     mover      $E ;; # messanger plane

		    'tree1' )	sprite_tree1 ;    mover      $Q ;; #
		    'tree2' )	sprite_tree2 ;    mover      $W ;; # Trees
		    'tree3' )	sprite_tree3 ;    mover      $E ;; #

		    'cloud1')	sprite_cloud1;    mover      $Q ;; #
		    'cloud2')	sprite_cloud2;    mover      $W ;; # Clouds
		    'cloud3')	sprite_cloud3;    mover      $E ;; #

		    'boss'  )	sprite_boss  ;    mover       1 ;; # Boss
		    'alien' )	sprite_alien ;    mover       0 ;; # Aliens

		    'bfire' )	sprite_bfire ;    mover       0 ;; # Boss' plasma shot

		    'ammo'  )	sprite_ammob ;    mover       0 ;; # Ammo bonus
		    'life'  )	sprite_lifep ;    mover       0 ;; # Life bonus
		    'gunup' )	sprite_gunup ;    mover       0 ;; # Gun powerup bonus

           # Explosions, not moving, print in place
		    'boom'  )	sprite_boom;;

	    esac; done

	    #-{ BOSS }-------------------------------------------------------------------------------------------------------
	    if [[ $[$frags+$frags2] -ge $tillboss ]]; then

		    # add boss object
		    [[ $bossborn ]] || { OBJ+=("$BX $BY 0 boss"); bossborn=true; }

		    # Health bar
		    bar=; hp=$[$bosshbar * $bhealth / 100]; hm=$[$endx - 10]
		    for (( i=0  ; i<${hp}; i++ )); do bar="█$bar"; done
		    for (( i=$hp; i<${hm}; i++ )); do bar="$bar "; done
		    screen+="\e[$[$endy - 1];1H$LND $BLD${RED}BOSS: $LND$BLK|$BLD$RED$bar$LND$BLK|$LND"

		    # Add enemy
		    [[ $enumber -lt $enmax && $J -eq 0 && $bhealth -gt 0 ]] && { ((enumber++)); OBJ+=("$EX $EY 0 alien"); }
	    else
		    [[ $enumber -lt $enmax && $J -eq 0 && $bhealth -gt 0 ]] && { ((enumber++)); OBJ+=("$[$endx + 1] $[RANDOM % $enmyendy + 3] 0 alien"); }
	    fi

	    #-{ Move\check\print hero bullets }------------------------------------------------------------------------------
	    NP=${#PIU[@]}; for (( t=0; t<${NP}; t++ )); do PI=(${PIU[$t]}); PX=${PI[0]}; PY=${PI[1]}; owner=${PI[2]}

		    # Move
		    ((PX++))

		    # Fly away
		    [[ $PX -ge $bullendx ]] && { remove_piu $t; continue; } || { PIU[$t]="$PX $PY $owner"; }

		    # print
		    screen+="\e[$PY;${PX}H$SKY ${shoot[$L]}"

	    done

        if [[ $server ]]; then

            [[ $gamend ]] && {
                sender $caddr $cport $gamend
                mess $gamend
            }

	        [[ $life2 -gt 0 ]] && sender $caddr $cport "$screen" || {
		        sender $caddr $cport 'lose'
		        server=; Y2=; cors='single'
	        }

        else
            [[ $gamend     ]] && mess $gamend
	        [[ $life -le 0 ]] && mess lose
        fi

        printf "$screen"

    done
}

function game_duel {
    #========================================={ Main game loop server duel mode }========================================
    while true; do

        #-{ Empty screen, count fps, add backrount objects; set timings and print Sun }----------------------------------
	    screen=; fps_counter; add_backgound; timings; sprite_Sun

	    #-{ Print moving land }------------------------------------------------------------------------------------------
	    screen+="\e[$lineendy;1H$LND${land:$[1-$LX]:$endx}"; [[ $LX -lt -$[$LN/2] ]] && LX=-1 || ((LX--))

	    #-{ Print game status }------------------------------------------------------------------------------------------
	    screen+="\e[$endy;2H$LND$SC2$HS2 ${BLK}Life: $LND$RED$life2$LND  ${BLK}Ammo: $LND$RED$ammo2$LND "
	    screen+="\e[1;2H$SKY$SC$HS ${BLK}Life: $SKY$RED$life$SKY  ${BLK}Ammo: $SKY$RED$ammo$SKY         "
	    screen+="\e[$endy;$[$endx-10]H$LND${BLK}FPS: $RED$FPS  "

	    #-{ Print heroes }-----------------------------------------------------------------------------------------------
	    server_read; sprite_hero; sprite_hero2

	    #-{ Move\check\print all flying to hero objects }----------------------------------------------------------------
	    NO=${#OBJ[@]}; for (( i=0; i<$NO; i++ )); do OI=(${OBJ[$i]}); OX=${OI[0]}; OY=${OI[1]}; cuter=${OI[2]}; type=${OI[3]}

            case $type in

               #----------+---------------+------------+-----+----------+
               # OBJ type |  sprite maker |sprite mover|timer|  comment |
               #----------+---------------+------------+-----+----------+
    		    'msngr' )	sprite_msngr;     mover      $E ;; # messanger plane

		        'tree1' )	sprite_tree1 ;    mover      $Q ;; #
		        'tree2' )	sprite_tree2 ;    mover      $W ;; # Trees
		        'tree3' )	sprite_tree3 ;    mover      $E ;; #

		        'cloud1')	sprite_cloud1;    mover      $Q ;; #
		        'cloud2')	sprite_cloud2;    mover      $W ;; # Clouds
		        'cloud3')	sprite_cloud3;    mover      $E ;; #
	        esac
        done

	    #-{ Move\check\print heroes' bullets }---------------------------------------------------------------------------
	    NP=${#PIU[@]}; for (( t=0; t<${NP}; t++ )); do PI=(${PIU[$t]}); PX=${PI[0]}; PY=${PI[1]}; owner=${PI[2]}

		    # Move\Fly away\Collision
		    case $owner in

                '1') ((PX++))
                     sprite="$SKY ${shoot[$L]}"
                     [[ $PX -ge $bullendx ]] && { remove_piu $t; continue; } || { PIU[$t]="$PX $PY $owner"; }
                     case "$[$PX+2] $PY" in "$HX2 $HY2"| "$[$HX2+1] $HY2") remove_piu $t; ((life2--)); continue;; esac;;

                '2') ((PX--))
                     sprite="${shoot2[$L]}$SKY "
                     [[ $PX -le 1         ]] && { remove_piu $t; continue; } || { PIU[$t]="$PX $PY $owner"; }
                     case "$PX $PY" in "$HX $HY"| "$[$HX-1] $HY") remove_piu $t; ((life--)); continue;; esac;;

            esac

		    # print
		    screen+="\e[$PY;${PX}H$sprite"

	    done

        [[ $life2 -le 0 ]] && { sender $caddr $cport 'lose'; mess  'win'; }
        [[ $life  -le 0 ]] && { sender $caddr $cport 'win' ; mess 'lose'; }

	    printf "$screen";  sender $caddr $cport "$screen"

    done
}

function game_client {
    #========================================={ Main game loop client mode }=============================================
    while true; do

        client_read
	    sender $saddr $sport $input
	    screen="`nc -l -p $cport`"
	    case $screen in
            'win' | 'lose') mess   "$screen";;
            *             ) printf "$screen";;
        esac
    done
}

#--------------------------------------------------{ Initialisation }----------------------------------------------------
trap bye INT TERM SIGINT SIGTERM EXIT
trap : ALRM

stty -echo; printf "$COF"
get_dimensions; default
clear; mess "help"; sleep 2
clear; main_menu
clear; fill_screen
stty -echo; printf "$COF"
OBJ=()

#-{ Generate grass }-----------------------------------------------------------------------------------------------------
for ((i=0; i<$endx; i++)); do land+=${grass[$[RANDOM % ${#grass[*]}]]}; done; land+=$land; LN=${#land}

#-{ If server }----------------------------------------------------------------------------------------------------------
[[ $server ]] && {

    XY 2 1 $SKY$RED"${game_type^} mode. Waiting for client..."; CLD=80; TRE=70
      clnt=(`nc -l -p $sport`)
     caddr=${clnt[0]}
     cport=${clnt[1]}
       HC2=${clnt[2]}
       HS2=${clnt[3]}
       SC2=${clnt[4]}
}

#-{ If client }----------------------------------------------------------------------------------------------------------
[[ $client ]] && {

    XY 2 1 $SKY$RED"Waiting for server..."
    sender $saddr $sport "${caddr[0]} $cport $HC $HS $SC" ':'
    game_client
}

#-{ Start game }---------------------------------------------------------------------------------------------------------
XY 2 1 "$SKY                                                " # Erase waiting for ...
sec=$SECONDS # set timer for FPS counter

case $game_type in
        '') game_team;;
    'clnt') game_client;;
    'team') X2=1; Y2=$heroendy; game_team;;
    'duel') X2=$heroendx; Y2=$[RANDOM % $[$heroendy-2]+2]; game_duel;;
esac

# vim: ts=4
