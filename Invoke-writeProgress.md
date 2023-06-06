
# Invoke-writeProgess

`Invoke-writeProgess` is a PowerShell function designed to display a rotating progress message on the console. The rotation is achieved by cycling through two arrays of symbols. This function is capable of handling multiple stages of processing messages, which change with each rotation of the second symbol.

## Parameters

- **Message** (string array): An array of messages to display next to the rotating symbol.
- **RotatingSymbol** (string array): The first array of symbols to cycle through for the rotation. If no array is provided, the default symbols are '|', '/', '-', and '\'.
- **SecondRotatingSymbol** (string array): The second array of symbols to cycle through for the rotation after the first array.
- **LoopCount** (integer): The number of times to cycle through the rotating symbols. If no value is provided, the default is 1.

## Usage

```powershell
Invoke-writeProgess -Message @('Processing Stage 1...', 'Processing Stage 2...', 'Processing Stage 3...') -RotatingSymbol @('🌑', '🌒', '🌓', '🌔') -SecondRotatingSymbol @('❤️', '🧡', '💛') -LoopCount 2
```

```mermaid
graph TB
    A["Start: Invoke-writeProgess"] --> B{Check: Are the counts of Message and SecondRotatingSymbol arrays equal?}
    B -->|Yes| C[Begin Block: Initialize empty string]
    B -->|No| Z[End: Throw Exception]
    C --> D{Loop Start: For each symbol in SecondRotatingSymbol array}
    D --> E{Loop Start: For each count in LoopCount}
    E --> F{Loop Start: For each symbol in RotatingSymbol array}
    F --> G[Write the current rotating symbol, the corresponding message, and the current second rotating symbol]
    G --> H{Is there any remaining symbol in RotatingSymbol array?}
    H -->|Yes| F
    H -->|No| I{Is there any remaining count in LoopCount?}
    I -->|Yes| E
    I -->|No| J{Is there any remaining symbol in SecondRotatingSymbol array?}
    J -->|Yes| D
    J -->|No| K[End: Function execution complete]
```


