local hook = {}; do 
  hook.__index = hook;

  function hook.new(closure) 
    return setmetatable({ closure = closure }, hook);
  end;

  function hook:set(closure) 
    local backup = hookfunction(self.closure, closure);
    self.backup = backup;

    return backup;
  end;

  function hook:undo() 
    hookfunction(self.closure, self.backup);
  end;
end;

return hook;