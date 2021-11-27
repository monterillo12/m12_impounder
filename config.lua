Config = {}

-- Select your idiom->      Spanish('es') - English('en')
Config.Locale = 'en'

-- Name of your police job
Config.allowedJobs = {'police', 'sheriff'}

Config.command = {
    -- TRUE for enabling command execution.
    enabled = true,

    -- Comand to execute in chat for impounding vehicle
    name = 'dvp'
}

-- Enable impound vehicles from inside (less real but never fails)
Config.insideImpound = true

-- Max distance to delete the vehicle
Config.distanceToCheck = 5.0

--Max num of tries to delete de vehicle if the game dont found it at first time
Config.numRetries = 5