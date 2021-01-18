;Pokemon NetLogo Edition v0.1b
breed [enemies enemy]
breed [allies ally]

turtles-own [pokename
  maxhp hp atk def spdef spatk spd
  type1 type2
  nonvolatile confused? confusedur
  move1 move2 move3 move4
  currentmove movetype cat power acc prio
  modifier effectiveness atkstage damage]

;temporary setup to test things
to setup
  ca
  create-ordered-allies 1 [
    setxy 25 25
    set size 5]
  create-ordered-enemies 1 [
    setxy -25 -25
    set size 5]
end

to doTurn
  ifelse [prio] of ally 0 > 0 or [prio] of enemy 1 > 0
  [ifelse [prio] of ally 0) > or [prio] of enemy 1
    [attackEnemy
      attackAlly]
    [attackAlly
      attackEnemy]]
  [if [spd] of ally 0 > [spd] of enemy 1 [
    attackEnemy
    attackAlly]
    if [spd] of ally 0 < [spd] of enemy 1 [
      attackAlly
      attackEnemy]
    if [spd] of ally 0 = [spd] of enemy 1 [
      ifelse random 2 = 0
      [attackAlly
        attackEnemy]
      [attackEnemy
        attackAlly]]]
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
    set move2 "stun_spore"
    set move3 "energy_ball"
    set move4 "sludge_bomb"
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
  if currentmove = "stun_spore" [
    set movetype "grass"
    set cat "status"
    set power 0
    set acc 75
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
end

;status moves AGAINST the enemy
to statusMovesEnemy
  if currentmove = "swords_dance" and -6 <= atkstage and atkstage <= 4 [
    set atkstage atkstage + 2]
  if [nonvolatile] of ally 0 = 0 [
    if currentmove = "toxic" [
      if random 100 < acc [
        ask enemy 1 [
          set nonvolatile "badly_poisoned"]]]
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
      if random 100 < acc [
        ask enemy 1 [
          set nonvolatile "paralyzed"]]]
  ]
  if [confused?] of enemy 1 = false [
    if currentmove = "confuse_ray" [
      ask enemy 1 [
        set confused? true]]
  ]
  ask enemy 1 [
  if (type1 = "fire" or type2 = "fire") and nonvolatile = "burned" [
    set nonvolatile 0]
  if (type1 = "poison" or type2 = "poison") and nonvolatile = "poisoned" [
    set nonvolatile 0]
  if (type1 = "electric" or type2 = "electric") and nonvolatile = "paralyzed" [
    set nonvolatile 0]
  ]
  if currentmove = "flare_blitz" [
      set hp hp - ((1 / 3) * damage)]
end

;status moves AGAINST the ally
to statusMovesAlly
  if currentmove = "swords_dance" and -6 <= atkstage and atkstage <= 6 [
    set atkstage atkstage + 2]
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
  ]
  if [confused?] of ally 0 = false [
    if currentmove = "confuse_ray" [
      ask ally 0 [
        set confused? true]]
  ]
  ask ally 0 [
  if (type1 = "fire" or type2 = "fire") and nonvolatile = "burned" [
    set nonvolatile 0]
  if (type1 = "poison" or type2 = "poison") and (nonvolatile = "poisoned" or nonvolatile = "badly_poisoned") [
    set nonvolatile 0]
  if (type1 = "electric" or type2 = "electric") and nonvolatile = "paralyzed" [
    set nonvolatile 0]
  ]
  if currentmove = "flare_blitz" [
      set hp hp - ((1 / 3) * damage)]
end

;attacks the enemy
to attackEnemy
  ask ally 0 [
    resetTempStats
    moveTostats
    ifelse power = 0 [
      set damage 0]
    [
    if cat = "physical" [
        ifelse currentmove = "cross_poison"
        [calcDamage atk ([def] of enemy 1) power 1]
        [calcDamage atk ([def] of enemy 1) power 0]]
    if cat = "special" [
      calcDamage spatk ([spdef] of enemy 1) power 0]
    ask enemy 1 [
      set hp hp - ([damage] of ally 0)]
    ]
    statusMovesEnemy
  ]
end

;attacks the ally
to attackAlly
  ask enemy 1 [
    resetTempStats
    moveTostats
    ifelse power = 0 [
      set damage 0]
    [
    if cat = "physical" [
        ifelse currentmove = "cross_poison"
        [calcDamage atk ([def] of ally 0) power 1]
        [calcDamage atk ([def] of ally 0) power 0]]
    if cat = "special" [
      calcDamage spatk ([spdef] of ally 0) power 0]
    ask ally 0 [
      set hp hp - ([damage] of enemy 1)]
    ]
    statusMovesAlly
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




;n is movetype w is ???
@#$#@#$#@
GRAPHICS-WINDOW
314
10
751
448
-1
-1
13.0
1
10
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
22
46
85
79
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
21
106
160
139
make ally infernape
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
21
170
161
203
make enemy crobat
ask enemy 1 [\nset pokename \"crobat\"\npokenameTostats\nset color magenta\n]
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
14
225
286
258
make infernape use close combat
ask ally 0 [\nset currentmove move1\nattackEnemy]\n
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
23
368
205
401
make crobat use acrobatics
ask enemy 1 [\nset currentmove move2\nattackAlly]\n
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
316
400
422
445
hp of infernape
report_hp ([hp] of ally 0)
1
1
11

MONITOR
578
14
748
59
hp of crobat
report_hp ([hp] of enemy 1)
1
1
11

BUTTON
22
408
216
441
make crobat use cross poison
ask enemy 1 [\nset currentmove move3\nattackAlly]\n
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
13
265
207
298
make infernape use flare blitz
ask ally 0 [\nset currentmove move3\nattackEnemy]\n
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
32
450
191
483
make crobate use toxic
ask enemy 1 [\nset currentmove move4\nattackAlly]\n
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
32
330
251
363
make infernape use swords dance
ask ally 0 [\nset currentmove move4\nattackEnemy]\n
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

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

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
