breed [ ompa omp ]
breed [ ompat ompt ]
breed [ fmpa fmp ]
breed [ fmpat fmpt ]
breed [ occa occ ]
breed [ fcca fcc ]
breed [ ofba ofb ]
breed [ ffba ffb ]
breed [ osda osd ]
breed [ fsda fsd ]
breed [ ocpa ocp ]
breed [ fcpa fcp ]
breed [ ocpat ocpt ]
breed [ fcpat fcpt ]
breed [ ota ot ]
breed [ fta ftd ]
breed [ ocra ocr ]
breed [ ocrat ocrt ]
breed [ fcra fcr ]
breed [ fcrat fcrt ]
breed [ oaa oa ]
breed [ faa fa ]
breed [ oaat oat ]
breed [ faat fat ]
breed [ osba osb ]
breed [ fsba fsb ]
breed [ ogda ogd ]
breed [ fgda fgd ]
breed [ oeba oeb ]
breed [ feba feb ]
breed [ osa os ]
breed [ fsa fs ]
breed [ osea ose ]
breed [ fsea fse ]
breed [ odca odc ]
breed [ odcat odct ]
breed [ fdca fdc ]
breed [ fdcat fdct ]
breed [ oca oc ]
breed [ fca fc ]
breed [ oea oe ]
breed [ fea fe ]

to ownMachPunchAnimation
  create-ompa 1
  [ set size 55
    set heading 35
    set color red
    set shape "fist"
    set xcor 20
    set ycor -77 ]
  repeat 8 [
    ask ompa
    [ hatch 1
      [ set breed ompat
        set size 25
        set heading 35
        set color red ]
      fd 20
      wait .0625 ]]
  ask ompa
  [ die ]
  ask ompat
  [ die ]
end

to foeMachPunchAnimation
  create-fmpa 1
  [ set size 55
    set color red
    set shape "fist"
    set heading 215
    set xcor 27
    set ycor 88 ]
  repeat 8 [
    ask fmpa
    [ hatch 1
      [ set breed fmpat
        set size 25
        set heading 215
        set color red ]
      fd 20
      wait .0625 ]]
  ask fmpa
  [ die ]
  ask fmpat
  [ die ]
end

to ownCloseCombatAnimation
  create-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 15
    set ycor 105 ]
  create-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 20
    set ycor 105 ]
  create-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 25
    set ycor 105 ]
  create-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 15
    set ycor 90 ]
  create-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 20
    set ycor 90 ]
  create-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 25
    set ycor 90 ]
  ask occa
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask occa
  [ set xcor xcor + 110
    set ycor ycor - 10 ]
  ask occa
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask occa
  [ set xcor xcor - 50
    set ycor ycor - 110 ]
  ask occa
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask occa
  [ set xcor xcor + 20
    set ycor ycor + 90 ]
  ask occa
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask occa
  [ set xcor xcor + 30
    set ycor ycor - 50 ]
  ask occa
  [ repeat 3 [
    fd 2
    wait .0125]
    die]
end

to foeCloseCombatAnimation
  create-fcca 1
  [ set size 25
    set shape "fist"
    set color orange
    set heading 0
    set xcor -135
    set ycor -20 ]
  create-fcca 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor -130
    set ycor -20 ]
  create-fcca 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor -125
    set ycor -20 ]
  create-fcca 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor -135
    set ycor -35 ]
  create-fcca 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor -130
    set ycor -35 ]
  create-fcca 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor -125
    set ycor -35 ]
  ask fcca
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fcca
  [ set xcor xcor + 60
    set ycor ycor - 115 ]
  ask fcca
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fcca
  [ set xcor xcor - 20
    set ycor ycor + 90 ]
  ask fcca
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fcca
  [ set xcor xcor - 30
    set ycor ycor - 50 ]
  ask fcca
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fcca
  [ set xcor xcor + 100
    set ycor ycor - 20 ]
  ask fcca
  [ repeat 3 [
    fd 2
    wait .0125]
    die]
end

to ownFlareBlitzAnimation
  create-ofba 1
  [ set size 50
    set color red
    set heading 55
    set shape "circle"
    set xcor 60
    set ycor -38 ]
  repeat 20 [
    ask ofba [
      wait .02
      fd 5]]
  ask ofba [die]
  create-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 103
    set ycor 151]
  create-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 167
    set ycor 101]
  create-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 103
    set ycor 80]
  create-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 57
    set ycor 40]
  create-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 32
    set ycor 101]
  create-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 156
    set ycor 40]
  ask ofba
  [ repeat 18 [
    fd 1
    wait .00625]]
  ask ofba
  [ die ]
end

to foeFlareBlitzAnimation
  create-ffba 1
  [ set size 50
    set color red
    set heading 220
    set shape "circle"
    set xcor 42
    set ycor 88 ]
  repeat 20 [
    ask ffba [
      wait .02
      fd 5]]
  ask ffba [die]
  create-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -103
    set ycor -151]
  create-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -167
    set ycor -101]
  create-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -103
    set ycor -80]
  create-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -57
    set ycor -40]
  create-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -32
    set ycor -101]
  create-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -156
    set ycor -40]
  ask ffba
  [ repeat 18 [
    fd 1
    wait .00625]]
  ask ffba
  [ die ]
end

to ownSwordsDanceAnimation
  create-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -160 ]
  create-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -130 ]
  create-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -180
    set ycor -130 ]
  create-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -120
    set ycor -130 ]
  create-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -100 ]
  create-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -70 ]
  ask osda
  [ fd 10
    wait .02 ]
  ask osda
  [ fd 10
    wait .02 ]
  ask osda
  [ fd 10
    wait .02 ]
  ask osda
  [ set xcor xcor + 150
    set ycor ycor - 30 ]
  ask osda
  [ fd 10
    wait .02 ]
  ask osda
  [ fd 10
    wait .02 ]
  ask osda
  [ fd 10
    wait .02
    die ]
end

to foeSwordsDanceAnimation
  create-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 30 ]
  create-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 60 ]
  create-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -15
    set ycor 60 ]
  create-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 45
    set ycor 60 ]
  create-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 90 ]
  create-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 120 ]
  ask fsda
  [ fd 10
    wait .02 ]
  ask fsda
  [ fd 10
    wait .02 ]
  ask fsda
  [ fd 10
    wait .02 ]
  ask fsda
  [ set xcor xcor + 125
    set ycor ycor - 30 ]
  ask fsda
  [ fd 10
    wait .02 ]
  ask fsda
  [ fd 10
    wait .02 ]
  ask fsda
  [ fd 10
    wait .02
    die ]
end

to ownSludgeBombAnimation
  create-osba 1
  [ set size 50
    set color violet
    set heading 55
    set shape "circle"
    set xcor 60
    set ycor -38 ]
  ask osba
  [ wait .02 ]
  repeat 20
  [ ask osba
  [ fd 5
      wait .02 ] ]
  ask osba
  [ die ]
end

to foeSludgeBombAnimation
  create-fsba 1
  [ set size 50
    set color violet
    set heading 220
    set shape "circle"
    set xcor 42
    set ycor 88 ]
  ask fsba
  [ wait .02 ]
  repeat 20
  [ ask fsba
  [ fd 5
      wait .02 ] ]
  ask fsba
  [ die ]
end

to ownEnergyBallAnimation
  create-oeba 1
  [ set size 50
    set color green
    set heading 55
    set shape "circle"
    set xcor 60
    set ycor -38 ]
  ask oeba
  [ wait .02 ]
  repeat 20
  [ ask oeba
  [ fd 5
      wait .02 ] ]
  ask oeba
  [ die ]
end

to foeEnergyBallAnimation
  create-feba 1
  [ set size 50
    set color green
    set heading 220
    set shape "circle"
    set xcor 42
    set ycor 88 ]
  ask feba
  [ wait .02 ]
  repeat 20
  [ ask feba
  [ fd 5
      wait .02 ] ]
  ask feba
  [ die ]
end

to ownSporeAnimation
  create-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 115 ]
  create-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 115 ]
  create-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 25
    set ycor 115 ]
  create-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 100 ]
  create-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 100 ]
  create-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 25
    set ycor 100 ]
  repeat 3
  [ ask osa
  [ fd 5
      wait .025 ] ]
  ask osa
  [ set xcor xcor + 120
    set ycor ycor - 15 ]
  repeat 3
  [ ask osa
  [ fd 5
      wait .025 ] ]
  ask osa
  [ set xcor xcor - 60
    set ycor ycor - 45 ]
  repeat 3
  [ ask osa
  [ fd 5
      wait .025 ] ]
  ask osa
  [ die ]
end

to foeSporeAnimation
  create-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -10 ]
  create-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -10 ]
  create-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -125
    set ycor -10 ]
  create-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -25 ]
  create-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -35 ]
  create-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -125
    set ycor -35 ]
  repeat 3
  [ ask fsa
  [ fd 5
      wait .025 ] ]
  ask fsa
  [ set xcor xcor + 120
    set ycor ycor - 15 ]
  repeat 3
  [ ask fsa
  [ fd 5
      wait .025 ] ]
  ask fsa
  [ set xcor xcor - 60
    set ycor ycor - 45 ]
 repeat 3
  [ ask fsa
  [ fd 5
      wait .025 ] ]
  ask fsa
   [ die ]
end

to ownGigaDrainAnimation
  create-ogda 1
  [ set size 25
    set color green
    set heading 55
    set xcor 37
    set ycor 88 ]
  create-ogda 1
  [ set size 25
    set color green
    set heading 220
    set xcor 90
    set ycor 45 ]
  create-ogda 1
  [ set size 25
    set color green
    set heading 220
    set xcor 115
    set ycor 15 ]
  repeat 5 [ask ogda
  [ rt random 360
      wait .02 ] ]
  ask ogda
  [ set heading 220
    wait .02 ]
  repeat 15 [ask ogda
  [ fd 10
      wait .02 ] ]
  ask ogda
  [ die ]
  create-ogda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -151]
  create-ogda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor -167
    set ycor -101]
  create-ogda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -80]
  create-ogda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor -57
    set ycor -40]
  create-ogda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor -32
    set ycor -101]
  create-ogda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor -156
    set ycor -40]
  ask ogda
  [ repeat 18 [
    fd 1
    wait .00625]]
  ask ogda
  [ die ]
end

to foeGigaDrainAnimation
  create-fgda 1
  [ set size 25
    set color green
    set heading 220
    set xcor 55
    set ycor -38 ]
  create-fgda 1
  [ set size 25
    set color green
    set heading 220
    set xcor -10
    set ycor -100 ]
  create-fgda 1
  [ set size 25
    set color green
    set heading 220
    set xcor -80
    set ycor -50 ]
  repeat 5 [ask fgda
  [ rt random 360
      wait .02 ] ]
  ask fgda
  [ set heading 30
      wait .02 ]
  repeat 10 [ ask fgda
    [ fd 10
      wait .02 ] ]
  ask fgda
  [ die ]
  create-fgda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 151]
  create-fgda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor 167
    set ycor 101]
  create-fgda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 80]
  create-fgda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor 57
    set ycor 40]
  create-fgda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor 32
    set ycor 101]
  create-fgda 1 [
    set size 45
    set color green
    set shape "circle"
    set heading 0
    set xcor 156
    set ycor 40]
  ask fgda
  [ repeat 18 [
    fd 1
    wait .00625]]
  ask fgda
  [ die ]
end

to ownToxicAnimation
  create-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 115 ]
  create-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 115 ]
  create-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 25
    set ycor 115 ]
  create-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 100 ]
  create-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 100 ]
  create-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 25
    set ycor 100 ]
  repeat 3
  [ ask ota
  [ fd 5
      wait .025 ] ]
  ask ota
  [ set xcor xcor + 120
    set ycor ycor - 15 ]
  repeat 3
  [ ask ota
  [ fd 5
      wait .025 ] ]
  ask ota
  [ set xcor xcor - 60
    set ycor ycor - 45 ]
  repeat 3
  [ ask ota
  [ fd 5
      wait .025 ] ]
  ask ota
  [ die ]
end

to foeToxicAnimation
  create-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -20 ]
  create-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -20 ]
  create-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -125
    set ycor -20 ]
  create-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -35 ]
  create-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -35 ]
  create-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -125
    set ycor -35 ]
  repeat 3
  [ ask fta
  [ fd 5
      wait .025 ] ]
  ask fta
  [ set xcor xcor + 120
    set ycor ycor - 15 ]
  repeat 3
  [ ask fta
  [ fd 5
      wait .025 ] ]
  ask fta
  [ set xcor xcor - 60
    set ycor ycor - 45 ]
 repeat 3
  [ ask fta
  [ fd 5
      wait .025 ] ]
  ask fta
   [ die ]
end

to ownCrossPoisonAnimation
  create-ocpa 1
  [ set size 25
    set heading 135
    set color violet
    set xcor -15
    set ycor 170 ]
  repeat 13 [ask ocpa
  [ hatch 1
    [ set breed ocpat
      set size 25
      set heading 135
      set color violet ]
    fd 20
      wait .02 ] ]
  ask ocpat
  [ die ]
  ask ocpa
  [ die ]
  create-ocpa 1
  [ set size 25
    set heading 225
    set color violet
    set xcor 190
    set ycor 170 ]
  repeat 13 [ ask ocpa
  [ hatch 1
    [ set breed ocpat
      set size 25
      set heading 225
      set color violet ]
    fd 20
      wait .02 ] ]
  ask ocpat
  [ die ]
  ask ocpa
  [ die ]
  create-ocpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 151]
  create-ocpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor 167
    set ycor 101]
  create-ocpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 80]
  create-ocpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor 57
    set ycor 40]
  create-ocpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor 32
    set ycor 101]
  create-ocpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor 156
    set ycor 40]
  ask ocpa
  [ repeat 18 [
    fd 1
    wait .00625]]
  ask ocpa
  [ die ]
end

to foeCrossPoisonAnimation
  create-fcpa 1
  [ set size 25
    set heading 135
    set color violet
    set xcor -190
    set ycor 0 ]
  repeat 13 [ask fcpa
  [ hatch 1
    [ set breed fcpat
      set size 25
      set heading 135
      set color violet ]
    fd 20
      wait .02 ] ]
  ask fcpat
  [ die ]
  ask fcpa
  [ die ]
  create-fcpa 1
  [ set size 25
    set heading 225
    set color violet
    set xcor 50
    set ycor 0 ]
  repeat 13 [ask fcpa
  [ hatch 1
    [ set breed fcpat
      set size 25
      set heading 225
      set color violet ]
    fd 20
      wait .02 ] ]
  ask fcpat
  [ die ]
  ask fcpa
  [ die ]
  create-fcpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -151]
  create-fcpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor -167
    set ycor -101]
  create-fcpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -80]
  create-fcpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor -57
    set ycor -40]
  create-fcpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor -32
    set ycor -101]
  create-fcpa 1 [
    set size 45
    set color violet
    set shape "circle"
    set heading 0
    set xcor -156
    set ycor -40]
  ask fcpa
  [ repeat 18 [
    fd 1
    wait .00625]]
  ask fcpa
  [ die ]
end

to ownAcrobaticsAnimation
  repeat 2 [create-oaa 1
    [ set size 25
      set heading 315
      set color gray
      set xcor 169
      set ycor -14 ]
    repeat 13 [ ask oaa
      [ hatch 1
        [ set breed oaat
          set size 25
          set heading 315
          set color gray ]
        fd 20
        wait .02 ] ]
    ask oaat
    [ die ]
    ask oaa
    [ die ]
    create-oaa 1
    [ set size 25
      set heading 45
      set color gray
      set xcor 6
      set ycor -14 ]
    repeat 13 [ask oaa
      [ hatch 1
        [ set breed oaat
          set size 25
          set heading 45
          set color gray ]
        fd 20
        wait .02 ] ]
    ask oaat
    [ die ]
    ask oaa
    [ die ] ]
end

to foeAcrobaticsAnimation
  repeat 2 [create-faa 1
    [ set size 25
      set heading 315
      set color gray
      set xcor -6
      set ycor -184 ]
    repeat 13 [ask faa
      [ hatch 1
        [ set breed faat
          set size 25
          set heading 315
          set color gray ]
        fd 20
        wait .02 ] ]
    ask faat
    [ die ]
    ask faa
    [ die ]
    create-faa 1
    [ set size 25
      set heading 45
      set color gray
      set xcor -134
      set ycor -184 ]
    repeat 13 [ask faa
      [ hatch 1
        [ set breed faat
          set size 25
          set heading 45
          set color gray ]
        fd 20
        wait .02 ] ]
    ask faat
    [ die ]
    ask faa
    [ die ] ]
end

to ownConfuseRayAnimation
  create-ocra 1
  [ set size 25
    set color yellow
    set heading 25
    set xcor 20
    set ycor -77 ]
  repeat 8 [
    ask ocra
    [ hatch 1
      [ set breed ocrat
        set size 25
        set heading 25
        set color yellow ]
      fd 20
      wait .0625 ]]
  ask ocrat [die]
  ask ocra [
    set xcor 50
    set ycor 110
    set heading 0 ]
  repeat 8
  [repeat 5 [ask ocra
    [ fd 10
      wait .02 ] ]
    ask ocra
    [ rt 90
      fd 10
      wait .02 ] ]
  ask ocra
  [ die ]
end

to foeConfuseRayAnimation
  create-fcra 1
  [ set size 25
    set color yellow
    set heading 205
    set xcor 27
    set ycor 88 ]
  repeat 8 [
    ask fcra
    [ hatch 1
      [ set breed fcrat
        set size 25
        set heading 205
        set color yellow ]
      fd 20
      wait .0625 ]]
  ask fcrat [die]
  ask fcra
  [ set xcor -100
    set ycor -70
    set heading 0 ]
  repeat 8
  [ repeat 5 [ask fcra
  [ fd 10
        wait .02 ] ]
  ask fcra
  [ rt 90
    fd 10
        wait .02 ] ]
  ask fcra
  [ die ]
end

to ownStoneEdgeAnimation
  create-osea 1
  [ set size 50
    set color brown
    set heading 55
    set shape "pentagon"
    set xcor 60
    set ycor -38 ]
  ask osea
  [ wait .02 ]
  repeat 20
  [ ask osea
  [ fd 5
      wait .02 ] ]
  ask osea
  [ die ]
end

to foeStoneEdgeAnimation
  create-fsea 1
  [ set size 50
    set color brown
    set heading 220
    set shape "pentagon"
    set xcor 42
    set ycor 88 ]
  ask fsea
  [ wait .02 ]
  repeat 20
  [ ask fsea
  [ fd 5
      wait .02 ] ]
  ask fsea
  [ die ]
end

to ownDragonClawAnimation
create-odca 1
  [ set size 25
    set heading 225
    set color blue
    set xcor 190
    set ycor 170 ]
  repeat 13 [ ask odca
  [ hatch 1
    [ set breed odcat
      set size 25
      set heading 225
      set color blue ]
    fd 20
      wait .02 ] ]
  ask odcat
  [ die ]
  ask odca
  [ die ]
end

to foeDragonClawAnimation
  create-fdca 1
  [ set size 25
    set heading 225
    set color blue
    set xcor 120
    set ycor 0 ]
  repeat 13 [ask fdca
  [ hatch 1
    [ set breed fdcat
      set size 25
      set heading 225
      set color blue ]
    fd 20
      wait .02 ] ]
  ask fdcat
  [ die ]
  ask fdca
  [ die ]
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
619
420
-1
-1
1.0
1
10
1
1
1
0
1
1
1
-200
200
-200
200
0
0
1
ticks
30.0

BUTTON
15
21
186
54
NIL
ownMachPunchAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
25
415
88
448
setup
ask turtles [ die ]
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
114
439
177
472
ii
import-pcolors \"ii.png\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
16
71
182
104
NIL
foeMachPunchAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
18
120
199
153
NIL
ownCloseCombatAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
15
168
192
201
NIL
foeCloseCombatAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
18
209
176
242
NIL
ownFlareBlitzAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
19
254
173
287
NIL
foeFlareBlitzAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
21
297
205
330
NIL
ownSwordsDanceAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
21
343
165
376
NIL
foeSwordsDanceAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
204
442
267
475
cc
import-pcolors \"cc.png\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
283
445
346
478
aa
import-pcolors \"aa.png\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
637
23
812
56
NIL
ownSludgeBombAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
824
27
990
60
NIL
ownEnergyBallAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
638
72
809
105
NIL
foeSludgeBombAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
828
77
990
110
NIL
foeEnergyBallAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
641
121
782
154
NIL
ownSporeAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
638
168
774
201
NIL
foeSporeAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
833
120
995
153
NIL
ownGigaDrainAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
828
173
985
206
NIL
foeGigaDrainAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
640
225
775
258
NIL
owntoxicAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
642
274
775
307
NIL
foeToxicAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
820
228
995
261
NIL
ownCrossPoisonAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
820
322
986
355
NIL
ownAcrobaticsAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
817
279
988
312
NIL
foeCrossPoisonAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
821
369
983
402
NIL
foeAcrobaticsAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
640
326
817
359
NIL
ownConfuseRayAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
642
377
814
410
NIL
foeConfuseRayAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
355
451
418
484
hh
import-pcolors \"hh.png\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
436
453
499
486
kk
import-pcolors \"kk.png\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
516
451
579
484
nn
import-pcolors \"nn.png\"
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1020
37
1189
70
NIL
ownStoneEdgeAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1024
85
1188
118
NIL
foeStoneEdgeAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1215
37
1390
70
NIL
ownDragonClawAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
1215
91
1386
124
NIL
foeDragonClawAnimation
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fire
false
0
Polygon -7500403 true true 151 286 134 282 103 282 59 248 40 210 32 157 37 108 68 146 71 109 83 72 111 27 127 55 148 11 167 41 180 112 195 57 217 91 226 126 227 203 256 156 256 201 238 263 213 278 183 281
Polygon -955883 true false 126 284 91 251 85 212 91 168 103 132 118 153 125 181 135 141 151 96 185 161 195 203 193 253 164 286
Polygon -2674135 true false 155 284 172 268 172 243 162 224 148 201 130 233 131 260 135 282

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

fist
true
0
Rectangle -7500403 true true 150 45 195 150
Rectangle -7500403 true true 150 45 195 150
Rectangle -7500403 true true 105 45 150 150
Rectangle -7500403 true true 60 45 105 150
Line -16777216 false 105 150 105 90
Line -16777216 false 150 150 150 90
Rectangle -7500403 true true 195 45 240 150
Line -16777216 false 195 150 195 90
Rectangle -7500403 true true 150 150 240 195
Line -16777216 false 150 150 240 150

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
