local hook = import("utils/hook.lua");
local logger = import("utils/logger.lua");

local httpHook = hook.new(game.HttpGet);

httpHook:set(newcclosure(function(_, ...) 
  logger.log("Http", ...);

  return httpHook.ret(_, ...);
end));