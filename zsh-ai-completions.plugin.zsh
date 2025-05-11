#!/usr/bin/env zsh

# Plugin name
PLUGIN_NAME="zsh-ai-completions"
TOKEN_FILE="$HOME/.$PLUGIN_NAME/token"
OPERATING_SYSTEM_FILE="$HOME/.$PLUGIN_NAME/operating_system"

INSTRUCTIONS="This GPT is a tool for generating commands for a terminal or a shell. The outputs of this GPT should always be values that can be ran through the terminal. It should not add any explanations or whatsoever. The only outputs it will have is cli commands. The user will give a prompt to ask for help with generating these commands. Do not add anything else like the \` to format how it gets printed."

# Function to handle user input
_zsh_ai_completions_input() {
    zle -I
    BUFFER="generate_prompt"
    zle accept-line
}

generate_prompt() {
    # Create the directory if it doesn't exist
    if [[ ! -d "$HOME/.$PLUGIN_NAME" ]]; then
        mkdir "$HOME/.$PLUGIN_NAME"
        chmod 700 "$HOME/.$PLUGIN_NAME"
    fi

    # Try reading token or ask for it
    if [[ -f "$TOKEN_FILE" ]]; then
        OPENAI_TOKEN=$(<"$TOKEN_FILE")
    else
        echo "No token found. Enter your OpenAI API token: "
        read -s OPENAI_TOKEN
        echo "$OPENAI_TOKEN" > "$TOKEN_FILE"
        chmod 600 "$TOKEN_FILE"
    fi

    # Try reading operating system or ask for it
    if [[ -f "$OPERATING_SYSTEM_FILE" ]]; then
        OPERATING_SYSTEM=$(<"$OPERATING_SYSTEM_FILE")
    else
        echo "User's operating system is not set. Enter your operating system: "
        read OPERATING_SYSTEM
        echo "$OPERATING_SYSTEM" > "$OPERATING_SYSTEM_FILE"
        chmod 600 "$OPERATING_SYSTEM_FILE"
    fi

    echo -n "Ask GPT for a command:  "
    read prompt
    # Call the OpenAI API to generate a command
    command=$( \
        curl -s -X POST \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $OPENAI_TOKEN" \
        -d '{"model": "gpt-4o-mini", "messages": [{"role": "user", "content": "Instructions: '$INSTRUCTIONS' | Operating system: '$OPERATING_SYSTEM' | Prompt: '$prompt'"}]}' \
        https://api.openai.com/v1/chat/completions \
    | jq -r '.choices[0].message.content')
    print -z "$command"
}
# Create the widget
zle -N _zsh_ai_completions_input

# Bind CTRL+K to our function
bindkey '^K' _zsh_ai_completions_input
