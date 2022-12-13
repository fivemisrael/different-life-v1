-- Script Made By Aljunier | Made For ESX Framework --

Config = {}

Config.MarkerType = 27 --https://docs.fivem.net/game-references/markers/

--Rental Cars
Config.RentalCars = {
    ['Asea'] = {
        ['Rental Info'] = {
            ['model'] = 'asea',
            ['information'] = 'Asea 50 NIS',
            ['price'] = 50
        }
    },
    ['Honda Civic'] = {
        ['Rental Info'] = {
            ['model'] = 'civic',
            ['information'] = 'Honda Civic 75 NIS',
            ['price'] = 75
        }
    },
    ['Felon'] = {
        ['Rental Info'] = {
            ['model'] = 'felon',
            ['information'] = 'Felon 50 NIS',
            ['price'] = 50
        },
    },
}
----NOTE: There is not a need to lower your 'Z' value by 1 anymore, the script handles that by itself!----
Config.RentalLocations = {

    -- Car Rentals
    ['Legion'] = {
        ['Marker'] = {
            ['Type'] = 'Car Rental',
            ['x'] = 215.22,
            ['y'] = -933.05,
            ['z'] = 24.14,
        },
        ['VehicleReturn'] = {
            ['x'] = 212.42,
            ['y'] = -943.96,
            ['z'] = 24.14,
        },
        ['VehicleSpawn'] = {
            ['x'] = 217.78,
            ['y'] = -935.33,
            ['z'] = 23.14,
            ['Heading'] = 312.87
        },
    },
}