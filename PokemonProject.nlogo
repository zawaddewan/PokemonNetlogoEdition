;Pokemon NetLogo Edition v0.1b
breed [enemies enemy]
breed [allies ally]
globals [allyanimation enemyanimation]
;ANIMATION BREEDS-------------------------------------------------------------------------------------------------------------------------
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
breed [ fta ft ]
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
breed [ ohsa ohs ]
breed [ fhsa fhs ]
breed [ ooa oo ]
breed [ foa fo ]
breed [ oma om ]
breed [ fma fm ]
breed [ omat omt ]
breed [ fmat fmt ]
breed [ opja opj ]
breed [ fpja fpj ]
breed [ ocsa ocs ]
breed [ fcsa fcs ]
;------------------------------------------------------------------------------------------------------------------------------------------


turtles-own [pokename
  maxhp hp atk def spdef spatk spd
  type1 type2
  nonvolatile nonvolatiledur confused? confusedur outragedur
  move1 move2 move3 move4
  currentmove movetype cat power acc prio
  modifier effectiveness atkstage defstage spdefstage damage]


to menu
  ca
  import-pcolors "menu.png"
  if mouse-down? = true [
    if ((round mouse-xcor) >= -200 and (round mouse-xcor) <= -5) and ((round mouse-ycor) <= -95 and (round mouse-ycor) >= -180)
    [ca
      create-ordered-allies 1 [
        setxy -100 -100
        set size 50
        set pokename "haxorus"
        pokenameTostats
        set color yellow
        set atkstage 0 ]
      genEnemy
      stop]
    if ((round mouse-xcor) >= 1 and (round mouse-xcor) <= 198) and ((round mouse-ycor) <= -105 and (round mouse-ycor) >= -195)
    [ca
      create-ordered-allies 1 [
        setxy -100 -100
        set size 50
        set pokename "nidoking"
        pokenameTostats
        set color magenta
        set atkstage 0 ]
      genEnemy
      stop]
    if ((round mouse-xcor) >= -198 and (round mouse-xcor) <= -2) and ((round mouse-ycor) <= 11 and (round mouse-ycor) >= -85)
        [ca
          create-ordered-allies 1 [
            setxy -100 -100
            set size 50
            set pokename "crobat"
            pokenameTostats
            set color violet
            set atkstage 0 ]
          genEnemy
          stop]
    if ((round mouse-xcor) >= -197 and (round mouse-xcor) <= 0) and ((round mouse-ycor) <= 114 and (round mouse-ycor) >= 17)
        [ca
          create-ordered-allies 1 [
            setxy -100 -100
            set size 50
            set pokename "amoonguss"
            pokenameTostats
            set color green
            set atkstage 0 ]
          genEnemy
          stop]
    if ((round mouse-xcor) >= 1 and (round mouse-xcor) <= 197) and ((round mouse-ycor) <= 95 and (round mouse-ycor) >= 0)
        [ca
          create-ordered-allies 1 [
            setxy -100 -100
            set size 50
            set pokename "infernape"
            pokenameTostats
            set color red
            set atkstage 0 ]
          genEnemy
          stop]
    if ((round mouse-xcor) >= 0 and (round mouse-xcor) <= 198) and ((round mouse-ycor) <= -3 and (round mouse-ycor) >= -98)
        [ca
          create-ordered-allies 1 [
            setxy -100 -100
            set size 50
            set pokename "krookodile"
            pokenameTostats
            set color brown
            set atkstage 0 ]
          genEnemy
          stop]]
end

to genEnemy
        create-ordered-enemies 1 [
        setxy 100 100
        set size 50
        set pokename one-of ["haxorus" "nidoking" "crobat" "amoonguss" "infernape" "krookodile"]
        pokenameTostats
        set atkstage 0 ]
end

;temporary setup to test things
to setup
  ca
  create-ordered-allies 1 [
    setxy -100 -100
    set size 50]
  create-ordered-enemies 1 [
    setxy 100 100
    set size 50]
end

;TESTING THE TURN
to DOTURNTEST
  ask turtles [
  resetTempStats
    moveTostats]
  ifelse [prio] of ally 0 > 0 or [prio] of enemy 1 > 0
  [ifelse [prio] of ally 0 > [prio] of enemy 1
    [attackEnemy
      wait 1
      attackAlly]
    [attackAlly
      wait 1
      attackEnemy]]
  [if [spd] of ally 0 > [spd] of enemy 1 [
    attackEnemy
    wait 1
    attackAlly]
    if [spd] of ally 0 < [spd] of enemy 1 [
      attackAlly
      wait 1
      attackEnemy]
    if [spd] of ally 0 = [spd] of enemy 1 [
      ifelse random 2 = 0
      [attackAlly
        wait 1
        attackEnemy]
      [attackEnemy
        wait 1
        attackAlly]]]
  ask ally 0 [
    statusEffects]
  ask enemy 1 [
    statusEffects]
  ask turtles [
    if hp <= 0
    [die]
    if hp > maxhp
    [set hp maxhp]]
end

;THE REAL TURN
to doTurn
  enemyTurn
  ask turtles [
  resetTempStats
    moveTostats]
  ifelse [prio] of ally 0 > 0 or [prio] of enemy 1 > 0
  [ifelse [prio] of ally 0 > [prio] of enemy 1
    [attackEnemy
      wait 1
      attackAlly]
    [attackAlly
      wait 1
      attackEnemy]]
  [if [spd] of ally 0 > [spd] of enemy 1 [
    attackEnemy
    wait 1
    attackAlly]
    if [spd] of ally 0 < [spd] of enemy 1 [
      attackAlly
      wait 1
      attackEnemy]
    if [spd] of ally 0 = [spd] of enemy 1 [
      ifelse random 2 = 0
      [attackAlly
        wait 1
        attackEnemy]
      [attackEnemy
        wait 1
        attackAlly]]]
  ask ally 0 [
    statusEffects]
  ask enemy 1 [
    statusEffects]
  ask turtles [
    if hp <= 0
    [die]
    if hp > maxhp
    [set hp maxhp]]
end

;resets all temporary stats for the next turn
to resetTempStats
  set movetype 0
  set cat 0
  set power 0
  set acc 0
  set prio 0
  set modifier 0
  set effectiveness 0
  set damage 0
end

;calculates the stats depending on what pokemon the turtle is
to pokenameTostats
  if pokename = "crobat" [
    calcHP 85 0 0
    set hp maxhp
    calcatk 90 0 0
    calcdef 80 0 0
    calcspatk 70 0 0
    calcspdef 80 0 0
    calcspd 130 0 0
    set type1 "flying"
    set type2 "poison"
    set move1 "confuse_ray"
    set move2 "acrobatics"
    set move3 "cross_poison"
    set move4 "toxic"
  ]
  if pokename = "infernape" [
    calcHP 76 0 0
    set hp maxhp
    calcatk 104 0 0
    calcdef 71 0 0
    calcspatk 104 0 0
    calcspdef 71 0 0
    calcspd 108 0 0
    set type1 "fire"
    set type2 "fighting"
    set move1 "close_combat"
    set move2 "mach_punch"
    set move3 "flare_blitz"
    set move4 "swords_dance"
  ]
  if pokename = "amoonguss" [
    calcHP 114 0 0
    set hp maxhp
    calcatk 85 0 0
    calcdef 70 0 0
    calcspatk 85 0 0
    calcspdef 80 0 0
    calcspd 30 0 0
    set type1 "grass"
    set type2 "poison"
    set move1 "spore"
    set move2 "giga_drain"
    set move3 "energy_ball"
    set move4 "sludge_bomb"
  ]
  if pokename = "krookodile" [
    calcHP 95 0 0
    set hp maxhp
    calcatk 117 0 0
    calcdef 80 0 0
    calcspatk 65 0 0
    calcspdef 70 0 0
    calcspd 92 0 0
    set type1 "ground"
    set type2 "dark"
    set move1 "earthquake"
    set move2 "crunch"
    set move3 "stone_edge"
    set move4 "dragon_claw"
  ]
  if pokename = "haxorus" [
    calcHP 76 0 0
    set hp maxhp
    calcatk 147 0 0
    calcdef 90 0 0
    calcspatk 60 0 0
    calcspdef 70 0 0
    calcspd 97 0 0
    set type1 "dragon"
    set type2 "null"
    set move1 "swords_dance"
    set move2 "earthquake"
    set move3 "poison_jab"
    set move4 "outrage"
  ]
  if pokename = "nidoking" [
    calcHP 81 0 0
    set hp maxhp
    calcatk 102 0 0
    calcdef 77 0 0
    calcspatk 85 0 0
    calcspdef 75 0 0
    calcspd 85 0 0
    set type1 "poison"
    set type2 "ground"
    set move1 "earthquake"
    set move2 "head_smash"
    set move3 "megahorn"
    set move4 "outrage"
  ]
end

;calculates hp
to calcHP [basehp IV EV]
  set maxhp (floor
  ((((basehp + IV) * 2 + (floor ((ceiling (sqrt IV)) / 4))) * 50) / 100)) + 50 + 10
end

;calculates stats other than hp
to calcatk [basestat IV EV]
  set atk (floor
  ((((basestat + IV) * 2 + (floor ((ceiling (sqrt IV)) / 4))) * 50) / 100)) + 5
end
to calcdef [basestat IV EV]
  set def (floor
  ((((basestat + IV) * 2 + (floor ((ceiling (sqrt IV)) / 4))) * 50) / 100)) + 5
end
to calcspatk [basestat IV EV]
  set spatk (floor
  ((((basestat + IV) * 2 + (floor ((ceiling (sqrt IV)) / 4))) * 50) / 100)) + 5
end
to calcspdef [basestat IV EV]
  set spdef (floor
  ((((basestat + IV) * 2 + (floor ((ceiling (sqrt IV)) / 4))) * 50) / 100)) + 5
end
to calcspd [basestat IV EV]
  set spd (floor
  ((((basestat + IV) * 2 + (floor ((ceiling (sqrt IV)) / 4))) * 50) / 100)) + 5
end

;changes the stats of pokemon depending on the currentmove
to moveTostats
  if currentmove = "confuse_ray" [
    set movetype "ghost"
    set cat "status"
    set power 0
    set acc 100
    set prio 0]
  if currentmove = "acrobatics" [
    set movetype "flying"
    set cat "physical"
    set power 110
    set acc 100
    set prio 0]
  if currentmove = "cross_poison" [
    set movetype "poison"
    set cat "physical"
    set power 70
    set acc 100
    set prio 0]
  if currentmove = "toxic" [
    set movetype "poison"
    set cat "status"
    set power 0
    set acc 90
    set prio 0]
  if currentmove = "close_combat" [
    set movetype "fighting"
    set cat "physical"
    set power 120
    set acc 100
    set prio 0]
  if currentmove = "mach_punch" [
    set movetype "fighting"
    set cat "physical"
    set power 40
    set acc 100
    set prio 1]
  if currentmove = "flare_blitz" [
    set movetype "fire"
    set cat "physical"
    set power 120
    set acc 100
    set prio 0]
  if currentmove = "swords_dance" [
    set movetype "normal"
    set cat "status"
    set power 0
    set acc 100
    set prio 0]
  if currentmove = "spore" [
    set movetype "grass"
    set cat "status"
    set power 0
    set acc 100
    set prio 0]
  if currentmove = "giga_drain" [
    set movetype "grass"
    set cat "special"
    set power 75
    set acc 100
    set prio 0]
  if currentmove = "energy_ball" [
    set movetype "grass"
    set cat "special"
    set power 90
    set acc 100
    set prio 0]
  if currentmove = "sludge_bomb" [
    set movetype "poison"
    set cat "special"
    set power 90
    set acc 100
    set prio 0]
  if currentmove = "earthquake" [
    set movetype "ground"
    set cat "physical"
    set power 100
    set acc 100
    set prio 0]
  if currentmove = "crunch" [
    set movetype "dark"
    set cat "physical"
    set power 80
    set acc 100
    set prio 0]
  if currentmove = "stone_edge" [
    set movetype "rock"
    set cat "physical"
    set power 100
    set acc 80
    set prio 0]
  if currentmove = "dragon_claw" [
    set movetype "dragon"
    set cat "physical"
    set power 80
    set acc 100
    set prio 0]
  if currentmove = "poison_jab" [
    set movetype "poison"
    set cat "physical"
    set power 80
    set acc 100
    set prio 0]
  if currentmove = "outrage" [
    set movetype "dragon"
    set cat "physical"
    set power 120
    set acc 100
    set prio 0]
  if currentmove = "head_smash" [
    set movetype "rock"
    set cat "physical"
    set power 150
    set acc 80
    set prio 0]
  if currentmove = "megahorn" [
    set movetype "bug"
    set cat "physical"
    set power 120
    set acc 85
    set prio 0]
end

;does the confused status (placed after damage)
to confusedStatus
  if confused? = true [
    ifelse random 4 < confusedur
    [set confused? false
     set confusedur 0]
    [ifelse random 3 = 0
      [
      set damage (((((((2 * 50) / 5) + 2) * 40 * (atk * (1 + (atkstage / 2)))) / def) / 50) + 2)
      set hp hp - damage
      set confusedur (confusedur + 1)
      set currentmove 0
      set damage 0
      resetTempStats
      ]
      [set confusedur (confusedur + 1)]
    ]
  ]
end

;does part of the confused status which lowers speed
to paralyzedStatus
  if nonvolatile = "paralyzed" [
    if nonvolatiledur = 0 [
      set spd (spd / 2)]
    set nonvolatiledur (nonvolatiledur + 1)]
end

;asleep
to asleepStatus
  if nonvolatile = "asleep" [
    ifelse nonvolatiledur = 0 [
      set damage 0
      set nonvolatiledur (nonvolatiledur + 1)]
      [ifelse random 3 < nonvolatiledur [
        set nonvolatile 0
        set nonvolatiledur 0]
       [set damage 0
        set nonvolatiledur (nonvolatiledur + 1)]]]
end

to outrageMechanic
  if outragedur > 0 [
      ifelse outragedur > 1 [
        if outragedur = 3 [
          set outragedur 0
          set confused? true]
        if outragedur = 2 [
          ifelse random 2 = 0 [
          set outragedur 0
          set confused? true]
        [set outragedur outragedur + 1]]]
        [set outragedur outragedur + 1]]
  if currentmove = "outrage" and outragedur = 0 [
    set outragedur 1]
end

;nonvolatile status effects that occur after the turn
to statusEffects
  if nonvolatile = "burned" [
    set hp hp - (maxhp / 16)
    set nonvolatiledur (nonvolatiledur + 1)]
  if nonvolatile = "poisoned" [
    set hp hp - (maxhp / 8)
    set nonvolatiledur (nonvolatiledur + 1)]
  if nonvolatile = "badly_poisoned" [
    set hp hp - (nonvolatiledur * (maxhp / 16))
    set nonvolatiledur (nonvolatiledur + 1)]
end

;status moves AGAINST the enemy
to statusMovesEnemy
  ifelse nonvolatile = "paralyzed" [
  if random 4 = 0 [
  if currentmove = "swords_dance" and -6 <= atkstage and atkstage <= 4 [
        set atkstage atkstage + 2]]]
  [if currentmove = "swords_dance" and -6 <= atkstage and atkstage <= 4 [
    set atkstage atkstage + 2]]
  if nonvolatile != "paralyzed" [
  if [nonvolatile] of enemy 1 = 0 [
    if currentmove = "toxic" [
        ask enemy 1 [
          set nonvolatile "badly_poisoned"]]
    if currentmove = "cross_poison" [
      if random 100 < 10 [
        ask enemy 1 [
          set nonvolatile "poisoned"]]]
    if currentmove = "flare_blitz" [
      if random 100 < 10 [
        ask enemy 1 [
            set nonvolatile "burned"]]]
    if currentmove = "spore" [
      ask enemy 1 [
        set nonvolatile "asleep"]]
    if currentmove = "stun_spore" [
        ask enemy 1 [
          set nonvolatile "paralyzed"]]
    if currentmove = "slude_bomb" or currentmove = "poison_jab" [
      if random 100 < 30 [
        ask enemy 1 [
          set nonvolatile "poisoned"]]]
  ]
  if [confused?] of enemy 1 = false [
    if currentmove = "confuse_ray" [
      ask enemy 1 [
        set confused? true]]
  ]
  ask enemy 1 [
  if (type1 = "fire" or type2 = "fire") and nonvolatile = "burned" [
    set nonvolatile 0]
  if (type1 = "poison" or type2 = "poison" or type1 = "steel" or type2 = "steel") and nonvolatile = "poisoned" [
    set nonvolatile 0]
  if (type1 = "electric" or type2 = "electric") and nonvolatile = "paralyzed" [
    set nonvolatile 0]
  ]
  if currentmove = "flare_blitz" [
      set hp hp - ((1 / 3) * damage)]
  if currentmove = "giga_drain" [
      set hp hp + (damage * 0.5)]
  if currentmove = "energy_ball" and -6 <= [spdefstage] of enemy 1 and [spdefstage] of enemy 1 <= 5 [
      if random 100 < 10 [
        ask enemy 1 [
          set spdefstage spdefstage - 1]]]
  if currentmove = "crunch" and -6 <= [defstage] of enemy 1 and [defstage] of enemy 1 <= 5 [
      if random 100 < 20 [
        ask enemy 1 [
          set defstage defstage - 1]]]
  if currentmove = "head_smash" [
      set hp hp - (0.5 * damage)]
  ]
end

;status moves AGAINST the ally
to statusMovesAlly
  ifelse nonvolatile = "paralyzed" [
  if random 4 = 0 [
  if currentmove = "swords_dance" and -6 <= atkstage and atkstage <= 4 [
        set atkstage atkstage + 2]]]
  [if currentmove = "swords_dance" and -6 <= atkstage and atkstage <= 4 [
    set atkstage atkstage + 2]]
  if nonvolatile != "paralyzed" [
  if [nonvolatile] of ally 0 = 0 [
    if currentmove = "toxic" [
      if random 100 < acc [
        ask ally 0 [
          set nonvolatile "badly_poisoned"]]]
    if currentmove = "cross_poison" [
      if random 100 < 10 [
        ask ally 0 [
          set nonvolatile "poisoned"]]]
    if currentmove = "flare_blitz" [
      if random 100 < 10 [
        ask ally 0 [
            set nonvolatile "burned"]]]
    if currentmove = "spore" [
      ask ally 0 [
        set nonvolatile "asleep"]]
    if currentmove = "stun_spore" [
      if random 100 < acc [
        ask ally 0 [
          set nonvolatile "paralyzed"]]]
    if currentmove = "slude_bomb" or currentmove = "poison_jab" [
      if random 100 < 30 [
        ask ally 0 [
          set nonvolatile "poisoned"]]]
  ]
  if [confused?] of ally 0 = false [
    if currentmove = "confuse_ray" [
      ask ally 0 [
        set confused? true]]
  ]
  ask ally 0 [
  if (type1 = "fire" or type2 = "fire") and nonvolatile = "burned" [
    set nonvolatile 0]
  if (type1 = "poison" or type2 = "poison" or type1 = "steel" or type2 = "steel") and (nonvolatile = "poisoned" or nonvolatile = "badly_poisoned") [
    set nonvolatile 0]
  if (type1 = "electric" or type2 = "electric") and nonvolatile = "paralyzed" [
    set nonvolatile 0]
  ]
  if currentmove = "flare_blitz" [
      set hp hp - ((1 / 3) * damage)]
  if currentmove = "giga_drain" [
      set hp hp + (damage * 0.5)]
  if currentmove = "energy_ball" and -6 <= [spdefstage] of ally 0 and [spdefstage] of ally 0 <= 5 [
      if random 100 < 10 [
        ask ally 0 [
          set spdefstage spdefstage - 1]]]
  if currentmove = "crunch" and -6 <= [defstage] of ally 0 and [defstage] of ally 0 <= 5 [
      if random 100 < 20 [
        ask ally 0 [
          set defstage defstage - 1]]]
  if currentmove = "head_smash" [
      set hp hp - (0.5 * damage)]
  ]
end

;attacks the enemy
to attackEnemy
  ask ally 0 [
    ifelse hp <= 0
    [set currentmove 0]
    [
    moveAnimationAlly
    outrageMechanic
        if outragedur > 0 [
          set currentmove "outrage"
          moveToStats]
    ifelse random 100 < acc [
    paralyzedStatus
    ifelse nonvolatile = "asleep"
    [asleepStatus
     if nonvolatile = 0 [
        attackEnemy]]
    [
      ifelse power = 0 [
        set damage 0]
      [
        if cat = "physical" [
          ifelse currentmove = "cross_poison" or currentmove = "stone_edge"
          [calcDamage atk ([def] of enemy 1) power 1]
          [calcDamage atk ([def] of enemy 1) power 0]]
        if cat = "special" [
          calcDamage spatk ([spdef] of enemy 1) power 0]
        confusedStatus
        if nonvolatile = "paralyzed" [
          if random 4 = 0 [
            set damage 0]]
          if movetype = "ground" and ([type1] of enemy 1 = "flying" or [type2] of enemy 1 = "flying") [
            set damage 0]
        ask enemy 1 [
          set hp hp - ([damage] of ally 0)]
      ]
      statusMovesEnemy
    ]
    ]
    [set currentmove 0]
    ]
  ]
end

;attacks the ally
to attackAlly
  ask enemy 1 [
    ifelse hp <= 0
    [set currentmove 0]
    [
    moveAnimationEnemy
    outrageMechanic
        if outragedur > 0 [
          set currentmove "outrage"
          moveToStats]
    ifelse random 100 < acc [
    paralyzedStatus
    ifelse nonvolatile = "asleep"
    [asleepStatus
     if nonvolatile = 0 [
        attackAlly]]
    [
      ifelse power = 0 [
        set damage 0]
      [
        if cat = "physical" [
          ifelse currentmove = "cross_poison" or currentmove = "stone_edge"
          [calcDamage atk ([def] of ally 0) power 1]
          [calcDamage atk ([def] of ally 0) power 0]]
        if cat = "special" [
          calcDamage spatk ([spdef] of ally 0) power 0]
        confusedStatus
        if nonvolatile = "paralyzed" [
          if random 4 = 0 [
            set damage 0]]
          if movetype = "ground" and ([type1] of ally 0 = "flying" or [type2] of ally 0 = "flying") [
            set damage 0]
        ask ally 0 [
          set hp hp - ([damage] of enemy 1)]
      ]
      statusMovesAlly
    ]
    ]
    [set currentmove 0]
    ]
  ]
end

;makes enemy move random
to enemyTurn
  ask enemy 1 [
    set currentmove random 4
    ifelse currentmove = 0
    [set currentmove move1]
    [ifelse currentmove = 1
      [set currentmove move2]
      [ifelse currentmove = 2
        [set currentmove move3]
        [set currentmove move4]]]
  ]
end

;A is attack D is defense, calculates damage
to calcDamage [A D pow critmod]
  calcModifier critmod
  set damage (((((((2 * 5) / 5) + 2) * pow * (A * (1 + (atkstage / 2)))) / D) / 50) + 2) * modifier
end

;calculates modifier for calcDamage
to calcModifier [n]
  ifelse breed = allies [
  calcEffectiveness movetype ([type1] of enemy 1) ([type2] of enemy 1)
  set modifier 1
  ifelse n = 1
     [if random 8 = 0
       [set modifier modifier * 1.5]]
     [if random 24 = 0
       [set modifier modifier * 1.5]]
  set modifier modifier * (1 - (random 15 / 100))
  if nonvolatile = "burned" and cat = "physical" [
    set modifier modifier * 0.5]
  if movetype = type1 or movetype = type2 [
      set modifier modifier * 15]
  set modifier modifier * effectiveness
  ]
  [
  calcEffectiveness movetype ([type1] of ally 0) ([type2] of ally 0)
  set modifier 1
  ifelse n = 1
     [if random 8 = 0
       [set modifier modifier * 1.5]]
     [if random 24 = 0
       [set modifier modifier * 1.5]]
  set modifier modifier * (1 - (random 15 / 100))
  if nonvolatile = "burned" and cat = "physical" [
    set modifier modifier * 0.5]
  if movetype = type1 or movetype = type2 [
      set modifier modifier * 1.5]
  set modifier modifier * effectiveness
  ]
end

;calculates effectivenss for calcModifier
to calcEffectiveness [atktype enemytype1 enemytype2]
  set effectiveness 1
  if atktype = "normal" [
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ghost") or (enemytype2 = "ghost") [set effectiveness effectiveness * 0]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
  if atktype = "fire" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "water") or (enemytype2 = "water") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ice") or (enemytype2 = "ice") [set effectiveness effectiveness * 2]
    if (enemytype1 = "bug") or (enemytype2 = "bug") [set effectiveness effectiveness * 2]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 2]]
  if atktype = "water" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 2]
    if (enemytype1 = "water") or (enemytype2 = "water") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ground") or (enemytype2 = "ground") [set effectiveness effectiveness * 2]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 0.5]]
  if atktype = "electric" [
    if (enemytype1 = "water") or (enemytype2 = "water") [set effectiveness effectiveness * 2]
    if (enemytype1 = "electric") or (enemytype2 = "electric") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ground") or (enemytype2 = "ground") [set effectiveness effectiveness * 0]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 0.5]]
  if atktype = "grass" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "water") or (enemytype2 = "water") [set effectiveness effectiveness * 2]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ground") or (enemytype2 = "ground") [set effectiveness effectiveness * 2]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "bug") or (enemytype2 = "bug") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
  if atktype = "ice" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "water") or (enemytype2 = "water") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ice") or (enemytype2 = "ice") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ground") or (enemytype2 = "ground") [set effectiveness effectiveness * 2]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
  if atktype = "fighting" [
    if (enemytype1 = "normal") or (enemytype2 = "normal") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ice") or (enemytype2 = "ice") [set effectiveness effectiveness * 2]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "psychic") or (enemytype2 = "psychic") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "bug") or (enemytype2 = "bug") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ghost") or (enemytype2 = "ghost") [set effectiveness effectiveness * 0]
    if (enemytype1 = "dark") or (enemytype2 = "dark") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 2]
    if (enemytype1 = "fairy") or (enemytype2 = "fairy") [set effectiveness effectiveness * 0.5]]
  if atktype = "poison" [
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 2]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ground") or (enemytype2 = "ground") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ghost") or (enemytype2 = "ghost") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0]
    if (enemytype1 = "fairy") or (enemytype2 = "fairy") [set effectiveness effectiveness * 2]]
  if atktype = "ground" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 2]
    if (enemytype1 = "electric") or (enemytype2 = "electric") [set effectiveness effectiveness * 2]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 2]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 0]
    if (enemytype1 = "bug") or (enemytype2 = "bug") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 2]]
  if atktype = "flying" [
    if (enemytype1 = "electric") or (enemytype2 = "electric") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 2]
    if (enemytype1 = "fighting") or (enemytype2 = "fighting") [set effectiveness effectiveness * 2]
    if (enemytype1 = "bug") or (enemytype2 = "bug") [set effectiveness effectiveness * 2]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
  if atktype = "psychic" [
    if (enemytype1 = "fighting") or (enemytype2 = "fighting") [set effectiveness effectiveness * 2]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 2]
    if (enemytype1 = "psychic") or (enemytype2 = "psychic") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "dark") or (enemytype2 = "dark") [set effectiveness effectiveness * 0]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
  if atktype = "bug" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "grass") or (enemytype2 = "grass") [set effectiveness effectiveness * 2]
    if (enemytype1 = "fighting") or (enemytype2 = "fighting") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "psychic") or (enemytype2 = "psychic") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ghost") or (enemytype2 = "ghost") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "fairy") or (enemytype2 = "fairy") [set effectiveness effectiveness * 0.5]]
  if atktype = "rock" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ice") or (enemytype2 = "ice") [set effectiveness effectiveness * 2]
    if (enemytype1 = "fighting") or (enemytype2 = "fighting") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ground") or (enemytype2 = "ground") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "flying") or (enemytype2 = "flying") [set effectiveness effectiveness * 2]
    if (enemytype1 = "bug") or (enemytype2 = "bug") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
  if atktype = "ghost" [
    if (enemytype1 = "normal") or (enemytype2 = "normal") [set effectiveness effectiveness * 0]
    if (enemytype1 = "psychic") or (enemytype2 = "psychic") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ghost") or (enemytype2 = "ghost") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dark") or (enemytype2 = "dark") [set effectiveness effectiveness * 0.5]]
  if atktype = "dragon" [
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "fairy") or (enemytype2 = "fairy") [set effectiveness effectiveness * 0]]
  if atktype = "dark" [
    if (enemytype1 = "fighting") or (enemytype2 = "fighting") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "psychic") or (enemytype2 = "psychic") [set effectiveness effectiveness * 2]
    if (enemytype1 = "ghost") or (enemytype2 = "ghost") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dark") or (enemytype2 = "dark") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "fairy") or (enemytype2 = "fairy") [set effectiveness effectiveness * 0.5]]
  if atktype = "steel" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "water") or (enemytype2 = "water") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "electric") or (enemytype2 = "electric") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "ice") or (enemytype2 = "ice") [set effectiveness effectiveness * 2]
    if (enemytype1 = "rock") or (enemytype2 = "rock") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "fairy") or (enemytype2 = "fairy") [set effectiveness effectiveness * 2]]
  if atktype = "fairy" [
    if (enemytype1 = "fire") or (enemytype2 = "fire") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "fighting") or (enemytype2 = "fighting") [set effectiveness effectiveness * 2]
    if (enemytype1 = "poison") or (enemytype2 = "poison") [set effectiveness effectiveness * 0.5]
    if (enemytype1 = "dragon") or (enemytype2 = "dragon") [set effectiveness effectiveness * 2]
    if (enemytype1 = "dark") or (enemytype2 = "dark") [set effectiveness effectiveness * 2]
    if (enemytype1 = "steel") or (enemytype2 = "steel") [set effectiveness effectiveness * 0.5]]
end

to-report report_hp [yea]
  report (yea)
end

to-report report_move [bruh]
  report bruh
end


;ANIMATIONS------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
;----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
to moveAnimationAlly
  if [nonvolatile] of ally 0 = "asleep"
    [set allyanimation 0]
  if [hp] of ally 0 > 0 [
    if [nonvolatile] of ally 0 != "asleep" [
  ask ally 0 [
  if currentmove = 0
    [set allyanimation 0]
  if currentmove = "confuse_ray"
    [set allyanimation "ocra"]
  if currentmove = "acrobatics"
    [set allyanimation "oaa"]
  if currentmove = "cross_poison"
    [set allyanimation "ocpa"]
  if currentmove = "toxic"
    [set allyanimation "ota"]
  if currentmove = "close_combat"
    [set allyanimation "occa"]
  if currentmove = "mach_punch"
    [set allyanimation "ompa"]
  if currentmove = "flare_blitz"
    [set allyanimation "ofba"]
  if currentmove = "swords_dance"
    [set allyanimation "osda"]
  if currentmove = "spore"
    [set allyanimation "osa"]
  if currentmove = "giga_drain"
    [set allyanimation "ogda"]
  if currentmove = "energy_ball"
    [set allyanimation "oeba"]
  if currentmove = "sludge_bomb"
    [set allyanimation "osba"]
  if currentmove = "earthquake"
    [set allyanimation "oea"]
  if currentmove = "crunch"
    [set allyanimation "oca"]
  if currentmove = "stone_edge"
    [set allyanimation "osea"]
  if currentmove = "dragon_claw"
    [set allyanimation "odca"]
  if currentmove = "poison_jab"
    [set allyanimation "opja"]
  if currentmove = "outrage" or (outragedur > 0 and outragedur < 3)
    [set allyanimation "ooa"]
  if currentmove = "head_smash"
    [set allyanimation "ohsa"]
  if currentmove = "megahorn"
    [set allyanimation "oma"]
  ]

  if [confused?] of ally 0 = true
  [ownConfusedStatusAnimation]
  if allyanimation = "ocra"
  [ownConfuseRayAnimation]
  if allyanimation = "oaa"
  [ownAcrobaticsAnimation]
  if allyanimation = "ocpa"
  [ownCrossPoisonAnimation]
  if allyanimation = "ota"
  [ownToxicAnimation]
  if allyanimation = "occa"
  [ownCloseCombatAnimation]
  if allyanimation = "ompa"
  [ownMachPunchAnimation]
  if allyanimation = "ofba"
  [ownFlareBlitzAnimation]
  if allyanimation = "osda"
  [ownSwordsDanceAnimation]
  if allyanimation = "osa"
  [ownSporeAnimation]
  if allyanimation = "ogda"
  [ownGigaDrainAnimation]
  if allyanimation = "oeba"
  [ownEnergyBallAnimation]
  if allyanimation = "osba"
  [ownSludgeBombAnimation]
  if allyanimation = "oea"
  [ownEarthquakeAnimation]
  if allyanimation = "oca"
  [ownCrunchAnimation]
  if allyanimation = "osea"
  [ownStoneEdgeAnimation]
  if allyanimation = "odca"
  [ownDragonClawAnimation]
  if allyanimation = "opja"
  [ownPoisonJabAnimation]
  if allyanimation = "ooa"
  [ownOutrageAnimation]
  if allyanimation = "ohsa"
  [ownHeadSmashAnimation]
  if allyanimation = "oma"
  [ownMegahornAnimation]
  ]
  ]
end

to moveAnimationEnemy
  if [nonvolatile] of enemy 1 = "asleep"
    [set allyanimation 0]
  if [hp] of enemy 1 > 0 [
    if [nonvolatile] of enemy 1 != "asleep" [
  ask enemy 1 [
  if currentmove = 0
    [set enemyanimation 0]
  if currentmove = "confuse_ray"
    [set enemyanimation "fcra"]
  if currentmove = "acrobatics"
    [set enemyanimation "faa"]
  if currentmove = "cross_poison"
    [set enemyanimation "fcpa"]
  if currentmove = "toxic"
    [set enemyanimation "fta"]
  if currentmove = "close_combat"
    [set enemyanimation "fcca"]
  if currentmove = "mach_punch"
    [set enemyanimation "fmpa"]
  if currentmove = "flare_blitz"
    [set enemyanimation "ffba"]
  if currentmove = "swords_dance"
    [set enemyanimation "fsda"]
  if currentmove = "spore"
    [set enemyanimation "fsa"]
  if currentmove = "giga_drain"
    [set enemyanimation "fgda"]
  if currentmove = "energy_ball"
    [set enemyanimation "feba"]
  if currentmove = "sludge_bomb"
    [set enemyanimation "fsba"]
  if currentmove = "earthquake"
    [set enemyanimation "fea"]
  if currentmove = "crunch"
    [set enemyanimation "fca"]
  if currentmove = "stone_edge"
    [set enemyanimation "fsea"]
  if currentmove = "dragon_claw"
    [set enemyanimation "fdca"]
  if currentmove = "poison_jab"
    [set enemyanimation "fpja"]
  if currentmove = "outrage" or (outragedur > 0 and outragedur < 3)
    [set enemyanimation "foa"]
  if currentmove = "head_smash"
    [set enemyanimation "fhsa"]
  if currentmove = "megahorn"
    [set enemyanimation "fma"]
  ]

  if [confused?] of enemy 1 = true
  [foeConfusedStatusAnimation]
  if enemyanimation = "fcra"
  [foeConfuseRayAnimation]
  if enemyanimation = "faa"
  [foeAcrobaticsAnimation]
  if enemyanimation = "fcpa"
  [foeCrossPoisonAnimation]
  if enemyanimation = "fta"
  [foeToxicAnimation]
  if enemyanimation = "fcca"
  [foeCloseCombatAnimation]
  if enemyanimation = "fmpa"
  [foeMachPunchAnimation]
  if enemyanimation = "ffba"
  [foeFlareBlitzAnimation]
  if enemyanimation = "fsda"
  [foeSwordsDanceAnimation]
  if enemyanimation = "fsa"
  [foeSporeAnimation]
  if enemyanimation = "fgda"
  [foeGigaDrainAnimation]
  if enemyanimation = "feba"
  [foeEnergyBallAnimation]
  if enemyanimation = "fsba"
  [foeSludgeBombAnimation]
  if enemyanimation = "fea"
  [foeEarthquakeAnimation]
  if enemyanimation = "fca"
  [foeCrunchAnimation]
  if enemyanimation = "fsea"
  [foeStoneEdgeAnimation]
  if enemyanimation = "fdca"
  [foeDragonClawAnimation]
  if enemyanimation = "fpja"
  [foePoisonJabAnimation]
  if enemyanimation = "foa"
  [foeOutrageAnimation]
  if enemyanimation = "fhsa"
  [foeHeadSmashAnimation]
  if enemyanimation = "fma"
  [foeMegahornAnimation]
  ]
  ]
end

to ownMachPunchAnimation
  hatch-ompa 1
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
  hatch-fmpa 1
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
  hatch-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 15
    set ycor 105 ]
  hatch-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 20
    set ycor 105 ]
  hatch-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 25
    set ycor 105 ]
  hatch-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 15
    set ycor 90 ]
  hatch-occa 1
  [ set size 25
    set color orange
    set shape "fist"
    set heading 0
    set xcor 20
    set ycor 90 ]
  hatch-occa 1
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
  hatch-fcca 1
  [ set size 55
    set shape "fist"
    set color orange
    set heading 0
    set xcor -135
    set ycor -20 ]
  hatch-fcca 1
  [ set size 55
    set color orange
    set shape "fist"
    set heading 0
    set xcor -130
    set ycor -20 ]
  hatch-fcca 1
  [ set size 55
    set color orange
    set shape "fist"
    set heading 0
    set xcor -125
    set ycor -20 ]
  hatch-fcca 1
  [ set size 55
    set color orange
    set shape "fist"
    set heading 0
    set xcor -135
    set ycor -35 ]
  hatch-fcca 1
  [ set size 55
    set color orange
    set shape "fist"
    set heading 0
    set xcor -130
    set ycor -35 ]
  hatch-fcca 1
  [ set size 55
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
  hatch-ofba 1
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
  hatch-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 103
    set ycor 151]
  hatch-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 167
    set ycor 101]
  hatch-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 103
    set ycor 80]
  hatch-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 57
    set ycor 40]
  hatch-ofba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor 32
    set ycor 101]
  hatch-ofba 1 [
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
  hatch-ffba 1
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
  hatch-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -103
    set ycor -151]
  hatch-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -167
    set ycor -101]
  hatch-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -103
    set ycor -80]
  hatch-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -57
    set ycor -40]
  hatch-ffba 1 [
    set size 45
    set color red
    set shape "fire"
    set heading 0
    set xcor -32
    set ycor -101]
  hatch-ffba 1 [
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
  hatch-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -160 ]
  hatch-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -130 ]
  hatch-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -180
    set ycor -130 ]
  hatch-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -120
    set ycor -130 ]
  hatch-osda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -150
    set ycor -100 ]
  hatch-osda 1
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
  hatch-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 30 ]
  hatch-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 60 ]
  hatch-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor -15
    set ycor 60 ]
  hatch-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 45
    set ycor 60 ]
  hatch-fsda 1
  [ set size 40
    set color blue
    set heading 0
    set xcor 15
    set ycor 90 ]
  hatch-fsda 1
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
  hatch-osba 1
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
  hatch-fsba 1
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
  hatch-oeba 1
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
  hatch-feba 1
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
  hatch-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 115 ]
  hatch-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 115 ]
  hatch-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 25
    set ycor 115 ]
  hatch-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 100 ]
  hatch-osa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 100 ]
  hatch-osa 1
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
  hatch-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -10 ]
  hatch-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -10 ]
  hatch-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -125
    set ycor -10 ]
  hatch-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -25 ]
  hatch-fsa 1
  [ set size 25
    set color gray
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -35 ]
  hatch-fsa 1
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
  hatch-ogda 1
  [ set size 25
    set color green
    set heading 55
    set xcor 37
    set ycor 88 ]
  hatch-ogda 1
  [ set size 25
    set color green
    set heading 220
    set xcor 90
    set ycor 45 ]
  hatch-ogda 1
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
  hatch-ogda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -151]
  hatch-ogda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor -167
    set ycor -101]
  hatch-ogda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -80]
  hatch-ogda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor -57
    set ycor -40]
  hatch-ogda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor -32
    set ycor -101]
  hatch-ogda 1 [
    set size 20
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
  hatch-fgda 1
  [ set size 25
    set color green
    set heading 220
    set xcor 55
    set ycor -38 ]
  hatch-fgda 1
  [ set size 25
    set color green
    set heading 220
    set xcor -10
    set ycor -100 ]
  hatch-fgda 1
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
  hatch-fgda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 151]
  hatch-fgda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor 167
    set ycor 101]
  hatch-fgda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 80]
  hatch-fgda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor 57
    set ycor 40]
  hatch-fgda 1 [
    set size 20
    set color green
    set shape "circle"
    set heading 0
    set xcor 32
    set ycor 101]
  hatch-fgda 1 [
    set size 20
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
  hatch-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 115 ]
  hatch-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 115 ]
  hatch-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 25
    set ycor 115 ]
  hatch-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 15
    set ycor 100 ]
  hatch-ota 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor 20
    set ycor 100 ]
  hatch-ota 1
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
  hatch-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -20 ]
  hatch-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -20 ]
  hatch-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -125
    set ycor -20 ]
  hatch-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -135
    set ycor -35 ]
  hatch-fta 1
  [ set size 25
    set color violet
    set heading 180
    set shape "circle"
    set xcor -130
    set ycor -35 ]
  hatch-fta 1
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
  hatch-ocpa 1
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
  hatch-ocpa 1
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
  hatch-ocpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 151]
  hatch-ocpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor 167
    set ycor 101]
  hatch-ocpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor 103
    set ycor 80]
  hatch-ocpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor 57
    set ycor 40]
  hatch-ocpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor 32
    set ycor 101]
  hatch-ocpa 1 [
    set size 20
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
  hatch-fcpa 1
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
  hatch-fcpa 1
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
  hatch-fcpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -151]
  hatch-fcpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor -167
    set ycor -101]
  hatch-fcpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor -103
    set ycor -80]
  hatch-fcpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor -57
    set ycor -40]
  hatch-fcpa 1 [
    set size 20
    set color violet
    set shape "circle"
    set heading 0
    set xcor -32
    set ycor -101]
  hatch-fcpa 1 [
    set size 20
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
  repeat 2 [hatch-oaa 1
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
    hatch-oaa 1
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
  repeat 2 [hatch-faa 1
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
    hatch-faa 1
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
  hatch-ocra 1
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
  hatch-fcra 1
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
  hatch-osea 1
  [ set size 50
    set color brown
    set heading 35
    set shape "pentagon"
    set xcor 60
    set ycor -38 ]
  hatch-osea 1
  [ set size 50
    set color brown
    set heading 35
    set shape "pentagon"
    set xcor 47
    set ycor -63 ]
  hatch-osea 1
  [ set size 50
    set color brown
    set heading 35
    set shape "pentagon"
    set xcor 12
    set ycor -33 ]
  ask osea
  [ wait .02 ]
  ask osea
  [ repeat 20 [
    fd 5
    wait .02 ]]
  ask osea
  [ die ]
end

to foeStoneEdgeAnimation
  hatch-fsea 1
  [ set size 50
    set color brown
    set heading 215
    set shape "pentagon"
    set xcor 42
    set ycor 88 ]
  hatch-fsea 1
  [ set size 50
    set color brown
    set heading 215
    set shape "pentagon"
    set xcor 20
    set ycor 75 ]
  hatch-fsea 1
  [ set size 50
    set color brown
    set heading 215
    set shape "pentagon"
    set xcor 67
    set ycor 56 ]
  ask fsea
  [ wait .02 ]
  ask fsea
  [ repeat 25 [
    fd 5
    wait .015 ] ]
  ask fsea
  [ die ]
end

to ownDragonClawAnimation
hatch-odca 1
  [ set size 25
    set heading 225
    set color blue
    set xcor 190
    set ycor 170 ]
  hatch-odca 1
  [ set size 25
    set heading 207
    set color blue
    set xcor 100
    set ycor 170 ]
  hatch-odca 1
  [ set size 25
    set heading 243
    set color blue
    set xcor 190
    set ycor 80 ]
  repeat 10 [ ask odca
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
  hatch-fdca 1
  [ set size 25
    set heading 225
    set color blue
    set xcor 40
    set ycor 0 ]
  hatch-fdca 1
  [ set size 25
    set heading 243
    set color blue
    set xcor 40
    set ycor -90 ]
  hatch-fdca 1
  [ set size 25
    set heading 207
    set color blue
    set xcor -50
    set ycor 0 ]
  repeat 10 [ask fdca
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

to ownEarthquakeAnimation
  hatch-oea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor 25
    set ycor 10]
  hatch-oea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor 80
    set ycor -20]
  hatch-oea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor 160
    set ycor -15]
  hatch-oea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor 170
    set ycor 20]
  repeat 15
  [ ask oea
    [ set heading random 360
      fd 5
      wait .02 ] ]
  ask oea
  [ die ]
end

to foeEarthquakeAnimation
  hatch-fea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor -160
    set ycor -120]
  hatch-fea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor -120
    set ycor -110]
  hatch-fea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor 35
    set ycor -130]
  hatch-fea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor 90
    set ycor -170]
  hatch-fea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor -84
    set ycor -152 ]
  hatch-fea 1
  [ set size 25
    set color brown
    set shape "pentagon"
    set xcor -20
    set ycor -171 ]
  repeat 15
  [ ask fea
    [ set heading random 360
      fd 5
      wait .02 ] ]
  ask fea
  [ die ]
end

to ownCrunchAnimation
  hatch-oca 1
  [ set size 100
    set color gray
    set heading 0
    set shape "jaw"
    set xcor 120
    set ycor 75 ]
  hatch-oca 1
  [ set size 100
    set color gray
    set heading 180
    set shape "jaw"
    set xcor 120
    set ycor 25 ]
  repeat 6
  [ ask oca
    [ bk 5
      wait .02 ] ]
  ask oca [ wait .15 ]
  ask oca
  [ die ]
end

to foeCrunchAnimation
  hatch-fca 1
  [ set size 130
    set color gray
    set heading 0
    set shape "jaw"
    set xcor -60
    set ycor -50 ]
  hatch-fca 1
  [ set size 130
    set color gray
    set heading 180
    set shape "jaw"
    set xcor -60
    set ycor -100 ]
  repeat 6
  [ ask fca
    [ bk 5
      wait .02 ] ]
  ask fca [ wait .15 ]
  ask fca
  [ die ]
end

to ownMegahornAnimation
  hatch-oma 1
    [ set size 25
      set heading 35
      set color green
      set xcor 6
      set ycor -14 ]
  repeat 15 [
    ask oma [
      set size size + 5
      wait .05 ]]
  repeat 6 [
    ask oma
    [ hatch 1
      [ set breed omat
        set size 25
        set heading 35
        set color green ]
      fd 20
      wait .0625 ]]
  ask oma [ die ]
  ask omat [ die ]
end

to foeMegahornAnimation
 hatch-fma 1
    [ set size 25
      set heading 215
      set color green
      set xcor 42
      set ycor 129 ]
  repeat 15 [
    ask fma [
      set size size + 5
      wait .05 ]]
  repeat 6 [
    ask fma
    [ hatch 1
      [ set breed fmat
        set size 25
        set heading 215
        set color green ]
      fd 20
      wait .0625 ]]
  ask fma [ die ]
  ask fmat [ die ]
end

to ownOutrageAnimation
  hatch-ooa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor -160
    set ycor -120]
  hatch-ooa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor -120
    set ycor -110]
  hatch-ooa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor 35
    set ycor -130]
  hatch-ooa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor 90
    set ycor -170]
  repeat 15
  [ ask ooa
    [ set heading random 360
      fd 5
      wait .02 ] ]
  ask ooa
  [ die ]
  hatch-ooa 1 [
    set size 100
    set color blue
    set shape "circle"
    set heading 0
    set xcor 100
    set ycor 80]
  repeat 20
  [ ask ooa
    [ set size size - 5
      wait .02 ] ]
  ask ooa
  [ die ]
end

to foeOutrageAnimation
  hatch-foa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor 25
    set ycor 10]
  hatch-foa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor 80
    set ycor -20]
  hatch-foa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor 160
    set ycor -15]
  hatch-foa 1
  [ set size 25
    set color blue
    set shape "circle"
    set xcor 170
    set ycor 20]
  repeat 15
  [ ask foa
    [ set heading random 360
      fd 5
      wait .02 ] ]
  ask foa
  [ die ]
  hatch-foa 1 [
    set size 100
    set color blue
    set shape "circle"
    set heading 0
    set xcor -75
    set ycor -100]
  repeat 20
  [ ask foa
    [ set size size - 5
      wait .02 ] ]
  ask foa
  [ die ]
end

to ownHeadSmashAnimation
  hatch-ohsa 1 [
    set size 100
    set color gray
    set shape "circle"
    set heading 0
    set xcor 100
    set ycor 80]
  repeat 20
  [ ask ohsa
    [ set size size - 5
      wait .02 ] ]
  ask ohsa
  [ die ]
end

to foeHeadSmashAnimation
  hatch-fhsa 1 [
    set size 100
    set color gray
    set shape "circle"
    set heading 0
    set xcor -75
    set ycor -100]
  repeat 20
  [ ask fhsa
    [ set size size - 5
      wait .02 ] ]
  ask fhsa
  [ die ]
end

to ownPoisonJabAnimation
  hatch-opja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor 15
    set ycor 105 ]
  hatch-opja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor 20
    set ycor 105 ]
  hatch-opja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor 25
    set ycor 105 ]
  hatch-opja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor 15
    set ycor 90 ]
  hatch-opja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor 20
    set ycor 90 ]
  hatch-opja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor 25
    set ycor 90 ]
  ask opja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask opja
  [ set xcor xcor + 110
    set ycor ycor - 10 ]
  ask opja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask opja
  [ set xcor xcor - 50
    set ycor ycor - 110 ]
  ask opja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask opja
  [ set xcor xcor + 20
    set ycor ycor + 90 ]
  ask opja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask opja
  [ set xcor xcor + 30
    set ycor ycor - 50 ]
  ask opja
  [ repeat 3 [
    fd 2
    wait .0125]
    die]
end

to foePoisonJabAnimation
  hatch-fpja 1
  [ set size 55
    set shape "fist"
    set color violet
    set heading 0
    set xcor -135
    set ycor -20 ]
  hatch-fpja 1
  [ set size 55
    set color violet
    set shape "fist"
    set heading 0
    set xcor -130
    set ycor -20 ]
  hatch-fpja 1
  [ set size 55
    set color violet
    set shape "fist"
    set heading 0
    set xcor -125
    set ycor -20 ]
  hatch-fpja 1
  [ set size 55
    set color violet
    set shape "fist"
    set heading 0
    set xcor -135
    set ycor -35 ]
  hatch-fpja 1
  [ set size 55
    set color violet
    set shape "fist"
    set heading 0
    set xcor -130
    set ycor -35 ]
  hatch-fpja 1
  [ set size 25
    set color violet
    set shape "fist"
    set heading 0
    set xcor -125
    set ycor -35 ]
  ask fpja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fpja
  [ set xcor xcor + 60
    set ycor ycor - 115 ]
  ask fpja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fpja
  [ set xcor xcor - 20
    set ycor ycor + 90 ]
  ask fpja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fpja
  [ set xcor xcor - 30
    set ycor ycor - 50 ]
  ask fpja
  [ repeat 3 [
    fd 2
    wait .0125]]
  ask fpja
  [ set xcor xcor + 100
    set ycor ycor - 20 ]
  ask fpja
  [ repeat 3 [
    fd 2
    wait .0125]
    die]
end

to foeConfusedStatusAnimation
  hatch-fcsa 1
  [ set size 25
    set color yellow
    set heading 25
    set xcor 20
    set ycor -77 ]
  ask fcsa [
    set xcor 50
    set ycor 110
    set heading 0 ]
  repeat 12
  [repeat 5 [ask fcsa
    [ fd 10
      wait .02 ] ]
    ask fcsa
    [ rt 90
      fd 10
      wait .02 ] ]
  ask fcsa
  [ die ]
end

to ownConfusedStatusAnimation
  hatch-ocsa 1
  [ set size 25
    set color yellow
    set heading 205
    set xcor 27
    set ycor 88 ]
  ask ocsa
  [ set xcor -100
    set ycor -70
    set heading 0 ]
  repeat 12
  [ repeat 5 [ask ocsa
  [ fd 10
        wait .02 ] ]
  ask ocsa
  [ rt 90
    fd 10
        wait .02 ] ]
  ask ocsa
  [ die ]
end
@#$#@#$#@
GRAPHICS-WINDOW
314
10
723
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
0
10
63
43
NIL
setup
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
0
46
89
79
ally infernape
ask ally 0 [\nset pokename \"infernape\"\npokenameTostats\nset color red\nset atkstage 0\n]
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
0
98
91
131
enemy nidoking
ask enemy 1 [\nset pokename \"nidoking\"\npokenameTostats\nset color magenta\n]
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
122
233
258
266
ally use move1
ask ally 0 [\nset currentmove move1]\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
314
419
420
464
hp of ally
report_hp ([hp] of ally 0)
1
1
11

MONITOR
722
11
892
56
hp of enemy
report_hp ([hp] of enemy 1)
1
1
11

BUTTON
65
523
155
556
NIL
doturntest
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
0
228
111
273
Move1 of ally
report_move [move1] of ally 0
17
1
11

MONITOR
2
281
89
326
Move2 of ally
report_move [move2] of ally 0
17
1
11

MONITOR
4
332
91
377
Move3 of ally
report_move [move3] of ally 0
17
1
11

MONITOR
5
384
92
429
Move4 of ally
report_move [move4] of ally 0
17
1
11

BUTTON
120
284
259
317
ally use move2
ask ally 0 [\nset currentmove move2]\n
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
130
339
243
372
ally use move3
ask ally 0 [\nset currentmove move3]\n
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
127
391
240
424
ally use move4
ask ally 0 [\nset currentmove move4]\n
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
284
477
389
522
Move1 of enemy
report_move [move1] of enemy 1
17
1
11

MONITOR
453
477
558
522
Move2 of enemy
report_move [move2] of enemy 1
17
1
11

MONITOR
622
478
727
523
Move3 of enemy
report_move [move3] of enemy 1
17
1
11

MONITOR
803
476
908
521
Move4 of enemy
report_move [move4] of enemy 1
17
1
11

BUTTON
271
533
406
566
enemy  use move1
ask enemy 1 [\nset currentmove move1]\n
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
440
534
572
567
enemy use move2
ask enemy 1 [\nset currentmove move2]\n
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
613
537
745
570
enemy use move3
ask enemy 1 [\nset currentmove move3]\n
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
787
536
919
569
enemy use move4
ask enemy 1 [\nset currentmove move4]\n
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
90
46
188
79
ally haxorus
ask ally 0 [\nset pokename \"haxorus\"\npokenameTostats\nset color green\nset atkstage 0\n]
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
184
46
285
79
ally amoonguss
ask ally 0 [\nset pokename \"amoonguss\"\npokenameTostats\nset color green\nset atkstage 0\n]
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
90
98
189
131
enemy crobat
ask enemy 1 [\nset pokename \"crobat\"\npokenameTostats\nset color violet\nset atkstage 0\n]
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
188
98
283
131
enemy krookodile
ask enemy 1 [\nset pokename \"krookodile\"\npokenameTostats\nset color red\nset atkstage 0\n]
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
37
157
106
190
NIL
doturn
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
131
10
194
43
NIL
menu
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
Zawad Dewan, Donald Bi, and Jeffery Tang, Pd 4

## WHAT IS IT?

This is an implementation of Pokemon in NetLogo. It simulates 1v1 battles with teams of 1 pokemon each, with 6 pokemon to choose from and a pool of 20 moves. Each pokemon has its own moveset, health, and stats. Each move and status affect also has its own corresponding animation.

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

Press the 'menu' button, which will bring up a menu of 6 pokemon to choose from. Click on whatever pokemon you choose, and then the reporters showing the moves will show what moves your pokemon of choice has available to it. Select one, and then press 'doTurn' to initiate the turn. You can do this until you die or you beat the pokemon. To restart, press the 'menu' button again.

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

jaw
true
0
Polygon -7500403 true true 60 150 45 135 45 120 60 90 90 75 135 60 165 60 210 75 240 90 255 120 255 135 240 150 240 135 240 120 150 90 60 120 60 150 60 150
Polygon -1 true false 60 120 75 135 90 105 105 135 120 90 135 135 150 90 165 135 180 90 195 135 210 105 225 135 240 120 210 105 180 90 165 75 150 90 135 75 120 90 90 105 60 120

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
