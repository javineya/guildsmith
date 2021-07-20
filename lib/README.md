GAME LOGIC

puzzle-forge:
    show inactive forge grid
    player taps blueprint
        blueprint popup with available blueprints
        player taps blueprint
            show active board with blueprint
    player chooses material
    player taps cell
        piece is placed
        board is checked for matches
            if match: merge into newest piece's tile
                check board again for new matches (recursive function)
            else: add shadow border* to denote piece's current level
                play continues             
    player holds piece:
        piece is picked up
            if moved to blueprint: piece checked against blueprint quality demand
                if match-or-better: piece is fused into blueprint
                    check for finished blueprint
                        if finished: create item
                            move item to inventory
                            ask P input: make another, equip to hero, end the day
                                make another: return to blueprint screen
                                equip hero: go to hero screen
                                end the day: advance time, return to kingdom screen
                else: piece is rejected and returned to original position
            else: piece returns to original position
    
            
*shadow border:     no border: base material unable to be used for blueprint
                    red: +0% stat
                    orange: +10% stat
                    yellow: +15% stat
                    green: +20% stat
                    blue: +25% stat
                    purple: +30% stat
                    prismatic: +40% stat
                    
STATS
HP: Health Points
PA: Physical Attack
MA: Magic Attack
PD: Physical Defense
MD: Magic Defense
EV: Evasion %
BL: Block %
CR: Critical Hit %

HERO POTENTIAL AND GROWTH:
                RED     ORANGE      YELLOW      GREEN       BLUE        PURPLE      PRISMATIC
    RED           0%       5%          10%         15%         20%         30%         50%
    ORANGE       10%      15% 
    YELLOW       20%      
    GREEN        30%
    BLUE         50%
    PURPLE       75%
    PRISMATIC   100%

Damage is calculated by
    Evasion check: success negates all damage
    Block Check: success negates all damage
    Crit Check: success doubles all damage
    PA - PD = Total Physical Damage
    MA - MD = Total Magical Damage
                    
Example First Encounter:
    Ghoul            vs         Hero
        HP: 10                      HP: 20
        PA:  2                      PA: 10
        MA:  0                      MA:  0
        PD:  0                      PD: 10
        MD:  2                      MD:  0
        EV:  0                      EV:  5
        BL:  0                      BL:  5
        CR: 10                      CR:  5
ROUND 1:
    Hero attacks Ghoul
    Ghoul doesn't even try to evade.
    Ghoul doesn't even try to block.
    Hero's attack is not aimed well, and the crit fails.
    Hero's attack lands:
    10PA - 0PD = 10 physical damage.
    Ghoul dies.
        