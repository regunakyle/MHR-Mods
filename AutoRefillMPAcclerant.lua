local MP_ACCELERANT_ID = 68159442

local MOD_NAME = "Auto Refill MP Accelerant"

local function autoRefillAccelerant(retval)
    local dataManager = sdk.get_managed_singleton("snow.data.DataManager")
    local itemBox = dataManager:call("get_PlItemBox")
    itemBox:call("tryAddGameItem(snow.data.ContentsIdSystem.ItemId, System.Int32)", MP_ACCELERANT_ID, 1)
end

local function pre_function(args)
    return sdk.PreHookResult.CALL_ORIGINAL -- calls the original function, same as not returning anything
end

sdk.hook(sdk.find_type_definition("snow.data.AlchemyFunction"):get_method("consumeSkipTicket"),
    pre_function,
    autoRefillAccelerant)
