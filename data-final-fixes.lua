do
  -- move AAI vehicles to later in the tech tree and update costs

  -- Haulers
  if data.raw.technology["basic-vehicles"] then
    data.raw.technology["basic-vehicles"].prerequisites = {"logistics-2", "engine"}
    data.raw.technology["automobilism"].prerequisites = {"basic-vehicles"}
    data.raw.technology["basic-vehicles"].unit.ingredients = {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1}
    }
    data.raw.technology["basic-vehicles"].unit.count = 100
    data.raw.recipe["vehicle-hauler"].normal.ingredients = {
      {"steel-plate", 20},
      {"engine-unit", 10},
      {"steel-chest", 5},
    }
    data.raw.recipe["vehicle-hauler"].expensive.ingredients = {
      {"steel-plate", 30},
      {"engine-unit", 20},
      {"steel-chest", 10}
    }
  end

  -- Flame Tanks
  if data.raw.technology["vehicle-flame-tank"] then
    data.raw.technology["vehicle-flame-tank"].prerequisites = {"tanks", "flamethrower"}
    data.raw.technology["vehicle-flame-tank"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1},
        {"chemical-science-pack", 1}
      }
    data.raw.technology["vehicle-flame-tank"].unit.count = 100
    data.raw.recipe["vehicle-flame-tank"].normal.ingredients = {
      {"steel-plate", 10},
      {"engine-unit", 8},
      {"iron-gear-wheel", 5},
      {"flamethrower", 1},
      {"tank", 1}
    }
    data.raw.recipe["vehicle-flame-tank"].expensive.ingredients = {
        {"steel-plate", 20},
        {"engine-unit", 6}, -- why less than normal? Because i'm factoring the expensive recipe for tank into the total cost
        {"iron-gear-wheel", 10},
        {"flamethrower", 1},
        {"tank", 1}
    }
  end

  -- Miners
  if data.raw.technology["vehicle-miner"] and data.raw.technology["basic-vehicles"] and data.raw.technology["electric-mining"] then
    data.raw.technology["vehicle-miner"].prerequisites = {"basic-vehicles", "electric-mining"}
  elseif data.raw.technology["vehicle-miner"] and data.raw.technology["electric-mining"] then
    data.raw.technology["vehicle-miner"].prerequisites = {"logistics-2", "engine", "electric-mining"}
  elseif data.raw.technology["vehicle-miner"] and data.raw.technology["basic-vehicles"]then
    data.raw.technology["vehicle-miner"].prerequisites = {"basic-vehicles"}
  elseif data.raw.technology["vehicle-miner"] then
    data.raw.technology["vehicle-miner"].prerequisites = {"logistics-2", "engine"}
  end

  if data.raw.technology["vehicle-miner"] then
    data.raw.technology["vehicle-miner"].unit.ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        }
    data.raw.technology["vehicle-miner"].unit.count = 100

    data.raw.technology["vehicle-miner-2"].unit.ingredients = {
          {"automation-science-pack", 1},
          {"logistic-science-pack", 1}
        }
    data.raw.technology["vehicle-miner-2"].unit.count = 150
    data.raw.recipe["vehicle-miner"].normal.ingredients = {
      {"electric-mining-drill", 1},
      {"steel-plate", 20},
      {"engine-unit", 10}
    }
    data.raw.recipe["vehicle-miner"].expensive.ingredients = {
        {"electric-mining-drill", 1},
        {"steel-plate", 20},
        {"engine-unit", 10}
    }
  end

  -- Chaingunners
  if data.raw.technology["vehicle-chaingunner"] and data.raw.technology["basic-vehicles"] then
    data.raw.technology["vehicle-chaingunner"].prerequisites = {"basic-vehicles", "military-science-pack"}
  elseif data.raw.technology["vehicle-chaingunner"] then
    data.raw.technology["vehicle-chaingunner"].prerequisites = {"logistics-2", "engine"}
  end

  if data.raw.technology["vehicle-chaingunner"] then
    -- moving tanks after chaingunner not only fits thematically but also creates a "military vehicle specialization" branch to the tech tree
    data.raw.technology["tanks"].prerequisites = {"vehicle-chaingunner"}
    data.raw.technology["vehicle-chaingunner"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"military-science-pack", 1}
      }
    data.raw.technology["vehicle-chaingunner"].unit.count = 100
    data.raw.recipe["vehicle-chaingunner"].normal.ingredients = {
      {type="item", name="steel-plate", amount=16},
      {type="item", name="engine-unit", amount=8},
      {type="item", name="gun-turret", amount=1},
    }
    data.raw.recipe["vehicle-chaingunner"].expensive.ingredients = {
        {type="item", name="steel-plate", amount=20},
        {type="item", name="engine-unit", amount=10},
        {type="item", name="gun-turret", amount=1},
    }
  end

  -- Position Beacon
  if data.raw.technology["position-beacon"] and data.raw.technology["basic-vehicles"] then
    data.raw.technology["position-beacon"].prerequisites = {"basic-vehicles"}
  elseif data.raw.technology["position-beacon"] then
    data.raw.technology["position-beacon"].prerequisites = {"logistics-2", "engine"}
  end

  if data.raw.technology["position-beacon"] then
    data.raw.technology["position-beacon"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      }
    data.raw.technology["position-beacon"].unit.count = 100
  end

  -- Programmable Vehicle Structures
  if data.raw.technology["programmable-vehicle-structures"] and data.raw.technology["basic-vehicles"] and data.raw.technology["programmable=structures"] then
    data.raw.technology["programmable-vehicle-structures"].prerequisites = {"programmable=structures", "basic-vehicles"}
  elseif data.raw.technology["programmable-vehicle-structures"] and data.raw.technology["basic-vehicles"] then
    data.raw.technology["programmable-vehicle-structures"].prerequisites = {"basic-vehicles"}
  elseif data.raw.technology["programmable-vehicle-structures"] and data.raw.technology["programmable=structures"] then
    data.raw.technology["programmable-vehicle-structures"].prerequisites = {"programmable=structures"}
  end

  -- Fuel Processing
  -- with vehicles moved deeper into the tech tree only makes sense to move vehicle fuel back as well
  if data.raw.technology["fuel-processing"] then
    data.raw.technology["fuel-processing"].prerequisites = {"flammables"}
    data.raw.technology["rocket-fuel"].prerequisites = {"fuel-processing"}
    data.raw.technology["fuel-processing"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      }
    data.raw.technology["fuel-processing"].unit.count = 200
    data.raw.recipe["fuel-processor"].normal.ingredients = {
      {"glass", 10},
      {"steel-plate", 10},
      {"electric-motor", 10},
      {"pipe", 10},
      {"stone-brick", 10},
    }
    data.raw.recipe["fuel-processor"].expensive.ingredients = {
      {"glass", 15},
      {"steel-plate", 15},
      {"electric-motor", 15},
      {"pipe", 15},
      {"stone-brick", 15},
    }
  end

  -- Vehicle Depot
  if data.raw.technology["vehicle-depot"] then
    data.raw.technology["vehicle-depot"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      }
    data.raw.technology["vehicle-depot"].unit.count = 100
    data.raw.recipe["vehicle-depot"].ingredients = {
     {"steel-chest", 8},
     {"electronic-circuit", 10},
     {"steel-plate", 20},
     {"stone-brick", 20}
    }
  end

  -- Vehcile Deployment
  if data.raw.technology["vehicle-deployment"] then
    data.raw.technology["vehicle-deployment"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      }
    data.raw.technology["vehicle-deployment"].unit.count = 100
    data.raw.recipe["vehicle-deployer"].ingredients = {
    {"electronic-circuit", 10},
    {"steel-plate", 10},
    {"stone-brick", 10}
    }
  end

  -- AAI removes a prerequisite for engines making them faster to aquire (and therefore vehicles)
  data.raw.technology["engine"].prerequisites = {"logistic-science-pack", "steel-processing"}

  data.raw.technology["engine"].unit.ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1}
      }
  data.raw.technology["engine"].unit.count = 100
  data.raw.technology["engine"].unit.time = 15
  data.raw.technology["automobilism"].unit.time = 30

end

