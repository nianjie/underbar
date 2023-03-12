<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### underbar
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-≥v3.0.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


## Install

```fish
$ omf install underbar
```
The installation also attempts to add following key sequences.
* bind \eg underbar #<kbd>alt</kbd>+<kbd>g</kbd>
* bind \ei underbar_paste #<kbd>alt</kbd>+<kbd>i</kbd>

## Usage
This plugin wraps a command so the contents of stdout will be captured into a dedicated variable, named `underbar`.
It is supposed to work with a custom key binding(default is <kbd>alt</kbd>+<kbd>g</kbd>).

For example:
```fish
# bind alt+g
$ bind \eg underbar
# type a command in command line, then press alt+g to let the function wraps your command.
$ echo 'foo
bar'
# will become
$ set -g underbar (echo 'foo
bar')
# then the content of stdout is kept in the global variable `underbar' after execution, and you can manipulate it like any other fish variables,
# or inspect.
$ set --show underbar
```
> $underbar: set in global scope, unexported, with 2 elements  
> $underbar[1]: |foo|  
> $underbar[2]: |bar|  

By pressing the binding key again, the wrap is toggle-off.  

### Bonus
`underbar_paste`(default bind to <kbd>alt</kbd>+<kbd>i</kbd>)

This function allows user to select one of items the `$underbar` variable contains to insert into current command line to complete.
If fzf is available, items can be filtered out.

`underbar_show`

It inspects the variable. 

As it will repaint the command line after showing information, by binding to a key , it will tell you what is saved in the `$underbar` with no distraction.
```fish
# bind alt+i
$ bind \ei underbar_show
# then press alt+i, `set --show underbar` is executed
```

# License

[MIT][mit] © [nj][author]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/nianjie
[contributors]:   https://github.com/nianjie/underbar/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish
[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
