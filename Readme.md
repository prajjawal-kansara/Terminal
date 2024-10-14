# Custom Shell Script

This is a custom shell script that enhances the default Bash experience by providing additional built-in commands, custom prompts, and command completion features.

## Features

- **Custom Prompt**: Displays the username, hostname, and current working directory in color.
- **History Management**: Saves command history to a custom history file (`~/.custom_shell_history`) and appends each session's history to it automatically.
- **Command Completion**: Supports command auto-completion based on available system commands.
- **Built-in Commands**:
  - `hello`: Prints a custom greeting message.
  - `calc`: Allows basic arithmetic expressions to be evaluated using `bc`.
  - `cd`: Change directories, similar to the default Bash `cd` command.
- **Aliases**:
  - `ll`: Alias for `ls -la` (detailed directory listing).
  - `h`: Alias for `history` (to view command history).

## Setup

Follow these steps to use the custom shell:

1. **Download the script**: Save the script as `custom_shell.sh` or any preferred name in your home directory or another location.
   
2. **Make the script executable**: Run the following command to give execute permissions:
   
         chmod +x custom_shell.sh
  
 3. **Run the script**: Start the custom shell by executing:
 
        ./custom_shell.sh
  
## Usage

Once inside the custom shell, you can:

- **Run system commands:** Use it like a regular Bash shell.

- **Use built-in commands:**
    - `hello`: Type hello to see a greeting.
    - `calc`: Type calc <expression> to evaluate basic arithmetic.
    - `cd`: Type cd <directory> to change directories.

    Example:
     - Type `hello` to receive a greeting.
     - Type `calc 5 + 3` to evaluate an arithmetic expression.  

- **Use aliases:**
    - `ll`: Displays detailed directory listings.
    - `h`: Shows command history.

## Customization

 - **History**: History is stored in `~/.custom_shell_history`. Change the file location, or size by modifying `HISTFILE`, `HISTFILESIZE`, and `HISTSIZE` in the script.
 - **Prompt**: Customize the prompt's colors and format in the `prompt()` function.
 - **Aliases**: Add more aliases by updating the alias section.
 - **Command Completion**: Modify the `command_complete()` function to enhance or change command completion behavior.

## Exit

To exit the custom shell, type `exit` or press `Ctrl+D`.

## Requirements
  - Ensure that `bc` (basic calculator) is installed on your system for the `calc` command to work correctly.
  - bc: The calc command uses bc for arithmetic calculations. If it is not installed, add it using:

        sudo apt install bc
