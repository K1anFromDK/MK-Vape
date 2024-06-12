local loop = false
local lib = lib

function loadAnimDict(Anim)
    while not HasAnimDictLoaded(Anim) do
      RequestAnimDict(Anim)
      Wait(100)
    end
  end

function StartLoop()
    loop = true
    while loop do 
        if IsControlJustPressed(0, 354) then
            lib.hideTextUI()
            ClearPedTasks(PlayerPedId())
            loop = false
        elseif IsControlJustPressed(0, 38) then
            loadAnimDict("mp_player_inteat@burger")
            TaskPlayAnim(PlayerPedId(), "mp_player_inteat@burger", "mp_player_int_eat_burger", 8.0, 8.0, -1, 50, 0, false, false, false)
            Wait(1000)
            loadAnimDict("anim@heists@humane_labs@finale@keycards")
            TaskPlayAnim(PlayerPedId(), "anim@heists@humane_labs@finale@keycards", "ped_a_loop", 8.0, 8.0, -1, 50, 0, false, false, false)
            if not HasNamedPtfxAssetLoaded("cut_fbi5b") then
                RequestNamedPtfxAsset("cut_fbi5b")
                while not HasNamedPtfxAssetLoaded("cut_fbi5b") do
                    Wait(10)
                end
            end

            
            UseParticleFxAsset("cut_fbi5b")
            StartNetworkedParticleFxLoopedOnEntityBone("cs_cig_exhale_mouth", PlayerPedId(), 0.0, 0.0, 0.6, 0.0, 0.0, 0.0, 'SKEL_Head', 3.0, false, false, false)
            lib.notify({
                description = 'Du tog et sug',
                type = 'success',
            })
        end
        Wait(1)
    end
end

RegisterNetEvent('vapestarted', function()
    loadAnimDict("anim@heists@humane_labs@finale@keycards")
    TaskPlayAnim(PlayerPedId(), "anim@heists@humane_labs@finale@keycards", "ped_a_loop", 8.0, 8.0, -1, 50, 0, false, false, false)
    lib.showTextUI('[E] - Tag et sug I [X] stop med at ryge')
    StartLoop()
end)