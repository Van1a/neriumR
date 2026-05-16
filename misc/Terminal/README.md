# macOs terminal
![holder](https://github.com/Van1a/neriumR/blob/main/asset/macos.png?raw=true)

## Loadstring
```luau
loadstring(game:HttpGet("https://raw.githubusercontent.com/Van1a/neriumR/refs/heads/main/misc/Terminal/macOS"))()
```
## Built-in Commands

- `code` - Opens the built-in code editor where you can write and execute Luau code.
- `run code` - Executes the current code from the editor.
- `console` - Opens the built-in console, similar to Roblox `/console`, which logs all `print`, `warn`, and `error` outputs.
- `clearconsole` - Clears all current logs inside the console window.
- `clear` - Clears all commands and output currently displayed in the terminal.


## Parameter ( Optional )
- `raw` the original non-converted input from the user.  
The terminal automatically lowercases commands before matching them against the registry.
- `cmd` Converted to lowercase

If you register a command as `help` and the user enters `HeLp`, the terminal will still execute the command successfully since all user input is automatically converted to lowercase before checking the command registry.


---

## Registering Commands

Create your own command using:

```luau
register(cmd: string, function(raw: string, cmd: string)
    print(cmd, raw)
end)
```

Example:

```luau
register("Please", function(raw, cmd)
     print("Please no skiddadles")
end)
```

---

## Terminal Logging

The terminal includes built-in logging helpers for output, warnings, and errors.

### Terminal Output

Prints directly into the terminal window.

```luau
terminalPrint("Hello world")
```

### Terminal Warning

Displays a yellow warning message.

```luau
terminalWarn("This action may be unsafe")
```

### Terminal Error

Displays a red error message.

```luau
terminalError("Failed to execute command")
```

---

## Console Logging

The console window also supports its own logging functions.

### Console Output

```luau
consolePrint("Loaded successfully")
```

### Console Warning

```luau
consoleWarn("Possible issue detected")
```

### Console Error

```luau
consoleError("Runtime exception")
```

