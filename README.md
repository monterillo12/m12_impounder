<h1 align='center'>Police Impound by Monterillo12</h1>
<h5 align='center'><b>
<a href='https://github.com/monterillo12'>GitHub</a> - <a href='https://m12-store.tebex.io'>Tebex Webpage</a>
</b></h5>


#### m12_impounder is a script for impounding vehicles in police job with an easy command or form police menu, for avoiding the integrated impound esx_policejob problems and adding some features for people who dont know what to edit in main job (if you know how I recomend you to replace the code in esx_policejob for having all in one).

# Features:

- Automatic `do`
- Job restriction.
- Dedicated config for simple adjust.
- Easy to translate due to locale.

# Dependences

- [es_extended](https://github.com/esx-framework/esx-legacy/tree/main/%5Besx%5D/es_extended)
- [esx_policejob (Recomendable)](https://github.com/esx-framework/esx-legacy/tree/main/%5Besx_addons%5D/esx_policejob)

# Instalation

1. Download the .zip or clone the repository.
2. Unfile the zip (if you use download method).
3. Copy the full folder m12_impounder and paste it into `resources`
4. Edit `server.cfg`
5. Add with the rest of resources the following line: ensure m12_impounder.
6. (If you wan't to add it to policejob) Go to esx_policejob/client/main.lua and change line 359 (`ImpoundVehicle(vehicle)`) to `TriggerEvent('m12impounder:impoundVeh')`
7. Start the server and enjoy it!


If you start/restart the script while the server is open all players must reconect or set the job again (this is for better optimization).

I recomend not to edit the original files except config.lua if neccesary,
I am not responsible for future problems if you edit rest of the files.

# Change-Log

## --------------------- [ v1.0.2 - 19/10/2021 ] --------------------

- Fixed locale errors (missing files)
- Deleted /me (much text in chat)

## --------------------- [ v1.1.0 - 21/10/2021 ] --------------------

- Added simple animation when impounding the car from outside.

## --------------------- [ v1.2.0 - 10/11/2021 ] --------------------

- Added event for executing from other scripts.
- Remake README.md and translated to english.
- Added some restrictions in config.