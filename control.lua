
if remote.interfaces["aai-programmable-vehicles"].set_construction_denial_range then
    script.on_init(function()
        new_construction_denial_range = 50 * game.forces.enemy.evolution_factor
        remote.call("aai-programmable-vehicles", "set_construction_denial_range", new_construction_denial_range)
    end)

    script.on_nth_tick(3600, function()
        new_construction_denial_range = 50 * game.forces.enemy.evolution_factor
        remote.call("aai-programmable-vehicles", "set_construction_denial_range", new_construction_denial_range)
    end)
end
