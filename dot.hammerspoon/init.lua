-------------------------------------------------------------------------------
-- reload configuration
--
hs.hotkey.bind({"cmd", "shift", "ctrl"}, "r", function()
  hs.reload()
  print('config reloaded')
end)

local prevKeyCode
local semiColonCode = 41
local singleQuote = 39
-- local semiColonCode = 0x29

local function handleEvent(e)
  local getKeyCode = e:getKeyCode()
  local getChar = e:getCharacters()
  local isKeyDown = e:getType() == 10
  local isShiftKeyUp = e:getFlags()['shift']

  -- hs.application
  if isKeyDown then

    -- toggle : to ;
    if getKeyCode == semiColonCode then
      if isShiftKeyUp and getChar == ":" then
        return true, {
          hs.eventtap.event.newKeyEvent({}, 0x29, true),
          hs.eventtap.event.newKeyEvent({}, 0x29, false)
        }
      elseif not(isShiftKeyUp) and getChar == ";" then
        return true, {
          hs.eventtap.event.newKeyEvent({'shift'}, 0x29, true),
          hs.eventtap.event.newKeyEvent({'shift'}, 0x29, false)
        }
      end
    end

    -- toggle ' to "
    if getKeyCode == singleQuote then
      if isShiftKeyUp and getChar == "\"" then
        return true, {
          hs.eventtap.event.newKeyEvent({}, 0x27, true),
          hs.eventtap.event.newKeyEvent({}, 0x27, false)
        }
      elseif not(isShiftKeyUp) and getChar == "'" then
        return true, {
          hs.eventtap.event.newKeyEvent({'shift'}, 0x27, true),
          hs.eventtap.event.newKeyEvent({'shift'}, 0x27, false)
        }
      end
    end
    -- appsWatcher = hs.application.watcher.new(function (name, event, app)
    --   print(name)
    -- end):start()
    -- appsWatcher:start()
  end
end

eventtap = hs.eventtap.new({
  hs.eventtap.event.types.flagsChanged,
  hs.eventtap.event.types.keyDown,
  hs.eventtap.event.types.keyUp
}, handleEvent)
eventtap:start()

-- local function itermHandleEvent(e)
--   local getKeyCode = e:getKeyCode()
--   local getChar = e:getCharacters()
--   local isKeyDown = e:getType() == 10
--   local isControlKeyUp = e:getFlags()['control']
--   -- local isShiftKeyUp = e:getFlags()['shift']
--
--   if isKeyDown then
--     -- print(hs.inspect(e:getFlags()))
--     -- print(isControlKeyUp)
--   end
--
-- end

-- local function handleGlobalAppEvent(name, event, app)
--    if event == hs.application.watcher.activated then
--      -- print(name)
--      -- hs.alert.show(name)
--      if name == "iTerm2" or name == "MacVim" then
--        -- print("iterm2")
--        itermEventtap = hs.eventtap.new({
--          hs.eventtap.event.types.flagsChanged,
--          hs.eventtap.event.types.keyDown,
--          hs.eventtap.event.types.keyUp
--        }, itermHandleEvent)
--        itermEventtap:start()
--
--      -- else
--      --   print(name)
--      end
--    end
-- end

-- appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
-- appsWatcher:start()

-- local function keyCode(key, modifiers)
--   modifiers = modifiers or {}
--   return true, {
--     hs.eventtap.event.newKeyEvent(modifiers, key, true),
--     hs.eventtap.event.newKeyEvent(modifiers, key, false)
--   }
-- end


-- -- TODO: Consider about consumed per keys is necessary or not.
-- local pressedKeyTable = {}
-- local consumed = false
-- local keyCodeTable = {}
-- keyCodeTable[0x29] = true -- SemiColon
-- -- local semiColonCode = 0x29
-- --
-- eventtap = hs.eventtap.new({ hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp }, function(event)
--   local keyCode = event:getKeyCode()
--   if keyCodeTable[keyCode] == true then
--     if event:getType() == hs.eventtap.event.types.keyDown then
--       pressedKeyTable[keyCode] = true
--       return true
--     end
--     pressedKeyTable[keyCode] = false
--     local currentConsumed = consumed
--     consumed = false
--     if currentConsumed == true then
--       return true
--     end
--     -- TODO: Modifier
--     return true, {
--       hs.eventtap.event.newKeyEvent({}, keyCode, true),
--       hs.eventtap.event.newKeyEvent({}, keyCode, false)
--     }
--   end
--   local somePressed = false
--   for keyCode, pressed in pairs(pressedKeyTable) do
--     if pressed == true then
--       somePressed = true
--       break
--     end
--   end
--   if somePressed == true then
--     consumed = true
--     local flags = event:getFlags()
--     flags["alt"] = true
--     event:setFlags(flags)
--   end
-- end)
-- eventtap:start()

-- local prevKeyCode
-- local semiColonCode = 0x29
-- -- local semiColonCode = 41
-- -- local semicolon = 41
-- -- local escape = 0x35
-- -- local leftCommand = 0x37
-- -- local rightCommand = 0x36
-- -- local eisuu = 0x66
-- -- local kana = 0x68
--
-- local function keyStroke(modifiers, character)
--     hs.eventtap.keyStroke(modifiers, character)
-- end
--
-- local function semicolon()
--     keyStroke({}, semicolon)
-- end
--
-- local function colon()
--     keyStroke({"shift"}, semicolon)
-- end
--

  -- hs.hotkey.bind({}, 0x29, function()
  --   -- hs.eventtap.keyStroke({}, 'escape')
  --   print("semicolon")
  --   -- hs.hotkey.new({'shift'}, 0x29):enable()
  --
  -- end)
  -- local function keyCode(key, modifiers)
  --    modifiers = modifiers or {}
  --    return function()
  --       hs.eventtap.event.newKeyEvent(modifiers, key, true):post()
  --       hs.timer.usleep(1000)
  --       hs.eventtap.event.newKeyEvent(modifiers, key, false):post()
  --    end
  -- end
  --
  -- local function remapKey(modifiers, key, keyCode)
  --    hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
  -- end

  -- カーソル移動
  -- remapKey({}, 41, keyCode(0x29, {'shift'}))
  -- remapKey({'shift'}, 41, keyCode(0x29))

  -- remapKey({'ctrl'}, 'n', keyCode('down'))
  -- remapKey({'ctrl'}, 'p', keyCode('up'))

  -- local function keyCode(key, modifiers)
  --    modifiers = modifiers or {}
  --    print(key)
  --    return function()
  --       hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
  --       hs.timer.usleep(1000)
  --       hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
  --    end
  -- end
  --
  -- local function keyCodeSet(keys)
  --    return function()
  --       for i, keyEvent in ipairs(keys) do
  --          keyEvent()
  --       end
  --    end
  -- end
  --
  -- local function remapKey(modifiers, key, keyCode)
  --    hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
  -- end

  -- remapKey({}, 0x29, keyCodeSet({
  --   keyCode('a', {'shift'})
  -- }))
