/*
* Copyright (C) 2010 - 2024 Eluna Lua Engine <https://elunaluaengine.github.io/>
* This program is free software licensed under GPL version 3
* Please see the included DOCS/LICENSE.md for more information
*/

#ifndef SPELLMETHODS_H
#define SPELLMETHODS_H

/***
 * An instance of a spell, created when the spell is cast by a [Unit].
 *
 * Inherits all methods from: none
 */
namespace LuaSpell
{
    /**
     * Returns `true` if the [Spell] is automatically repeating, `false` otherwise.
     *
     * @return bool isAutoRepeating
     */
    int IsAutoRepeat(Eluna* E, Spell* spell)
    {
        E->Push(spell->IsAutoRepeat());
        return 1;
    }

    /**
     * Returns the [Unit] that casted the [Spell].
     *
     * @return [Unit] caster
     */
    int GetCaster(Eluna* E, Spell* spell)
    {
        E->Push(spell->GetCaster());
        return 1;
    }

    /**
     * Returns the cast time of the [Spell].
     *
     * @return int32 castTime
     */
    int GetCastTime(Eluna* E, Spell* spell)
    {
        E->Push(spell->GetCastTime());
        return 1;
    }

    /**
     * Returns the entry ID of the [Spell].
     *
     * @return uint32 entryId
     */
    int GetEntry(Eluna* E, Spell* spell)
    {
        E->Push(spell->m_spellInfo->Id);
        return 1;
    }

    /**
     * Returns the power cost of the [Spell].
     *
     * @return uint32 powerCost
     * enum Powers // (6.0)
        {
            POWER_MANA                          = 0,
            POWER_RAGE                          = 1,
            POWER_FOCUS                         = 2,
            POWER_ENERGY                        = 3,
            POWER_COMBO_POINTS                  = 4,
            POWER_RUNES                         = 5,
            POWER_RUNIC_POWER                   = 6,
            POWER_SOUL_SHARDS                   = 7,
            POWER_ECLIPSE                       = 8,
            POWER_HOLY_POWER                    = 9,
            POWER_ALTERNATE_POWER               = 10,           // Used in some quests
            POWER_DARK_FORCE                    = 11,
            POWER_CHI                           = 12,
            POWER_SHADOW_ORBS                   = 13,
            POWER_BURNING_EMBERS                = 14,
            POWER_DEMONIC_FURY                  = 15,
            POWER_ARCANE_CHARGES                = 16,
            MAX_POWERS                          = 17,
            POWER_ALL                           = 127,          // default for class?
            POWER_HEALTH                        = 0xFFFFFFFE    // (-2 as signed value)
        };
     */
    int GetPowerCost(Eluna* E, Spell* spell)
    {
        int8 power = E->CHECKVAL<int8>(2);

        for (SpellInfo::CostData const& cost : spell->GetPowerCost())
            if (cost.Power == power)
                E->Push(cost.Amount);

        return 1;
    }

    /**
     * Returns the spell duration of the [Spell].
     *
     * @return int32 duration
     */
    int GetDuration(Eluna* E, Spell* spell)
    {
        E->Push(spell->GetSpellInfo()->GetDuration());
        return 1;
    }

    /**
     * Returns the target destination coordinates of the [Spell].
     *
     * @return float x : x coordinate of the [Spell]
     * @return float y : y coordinate of the [Spell]
     * @return float z : z coordinate of the [Spell]
     */
    int GetTargetDest(Eluna* E, Spell* spell)
    {
        if (!spell->m_targets.HasDst())
            return 3;

        float x, y, z;
        spell->m_targets.GetDstPos()->GetPosition(x, y, z);

        E->Push(x);
        E->Push(y);
        E->Push(z);
        return 3;
    }

    /**
     * Returns the target [Object] of the [Spell].
     *
     * The target can be any of the following [Object] types:
     * - [Player]
     * - [Creature]
     * - [GameObject]
     * - [Item]
     * - [Corpse]
     *
     * @return [Object] target
     */
    int GetTarget(Eluna* E, Spell* spell)
    {
        if (GameObject* target = spell->m_targets.GetGOTarget())
            E->Push(target);
        else if (Item* target = spell->m_targets.GetItemTarget())
            E->Push(target);
        else if (Corpse* target = spell->m_targets.GetCorpseTarget())
            E->Push(target);
        else if (Unit* target = spell->m_targets.GetUnitTarget())
            E->Push(target);
        else if (WorldObject* target = spell->m_targets.GetObjectTarget())
            E->Push(target);
        return 1;
    }

    /**
     * Sets the [Spell] to automatically repeat.
     *
     * @param bool repeat : set variable to 'true' for spell to automatically repeat
     */
    int SetAutoRepeat(Eluna* E, Spell* spell)
    {
        bool repeat = E->CHECKVAL<bool>(2);
        spell->SetAutoRepeat(repeat);
        return 0;
    }

    /**
     * Casts the [Spell].
     *
     * @param bool skipCheck = false : skips initial checks to see if the [Spell] can be casted or not, this is optional
     */
    int Cast(Eluna* E, Spell* spell)
    {
        bool skipCheck = E->CHECKVAL<bool>(2, false);
        spell->cast(skipCheck);
        return 0;
    }

    /**
     * Cancels the [Spell].
     */
    int Cancel(Eluna* /*E*/, Spell* spell)
    {
        spell->cancel();
        return 0;
    }

    /**
     * Finishes the [Spell].
     */
    int Finish(Eluna* /*E*/, Spell* spell)
    {
        spell->finish();
        return 0;
    }

    int IsMountSummon(Eluna* E, Spell* spell)
    {
        SpellInfo const* spellInfo = spell->m_spellInfo;
        E->Push((spellInfo->GetEffectMechanic(EFFECT_0, DIFFICULTY_NORMAL) == MECHANIC_MOUNT));
        return 1;
    }
    
    ElunaRegister<Spell> SpellMethods[] =
    {
        // Getters
        { "GetCaster", &LuaSpell::GetCaster },
        { "GetCastTime", &LuaSpell::GetCastTime },
        { "GetEntry", &LuaSpell::GetEntry },
        { "GetDuration", &LuaSpell::GetDuration },
        { "GetPowerCost", &LuaSpell::GetPowerCost },
        { "GetTargetDest", &LuaSpell::GetTargetDest },
        { "GetTarget", &LuaSpell::GetTarget },

        // Setters
        { "SetAutoRepeat", &LuaSpell::SetAutoRepeat },

        // Boolean
        { "IsAutoRepeat", &LuaSpell::IsAutoRepeat },
        { "IsMountSummon", &LuaSpell::IsMountSummon },

        // Other
        { "Cancel", &LuaSpell::Cancel },
        { "Cast", &LuaSpell::Cast },
        { "Finish", &LuaSpell::Finish },

        { NULL, NULL, METHOD_REG_NONE }
    };
};
#endif
