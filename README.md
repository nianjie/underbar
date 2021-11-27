<img src="https://cdn.rawgit.com/oh-my-fish/oh-my-fish/e4f1c2e0219a17e2c748b824004c8d0b38055c16/docs/logo.svg" align="left" width="144px" height="144px"/>

#### underbar
> A plugin for [Oh My Fish][omf-link].

[![MIT License](https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square)](/LICENSE)
[![Fish Shell Version](https://img.shields.io/badge/fish-v3.0.0-007EC7.svg?style=flat-square)](https://fishshell.com)
[![Oh My Fish Framework](https://img.shields.io/badge/Oh%20My%20Fish-Framework-007EC7.svg?style=flat-square)](https://www.github.com/oh-my-fish/oh-my-fish)

<br/>


## Install

```fish
$ omf install underbar
```


## Usage
This plugin warps a command so the stdout will be assigned to a dedicated variable.  
It is supposed to work with a custom key binding.  
The default key binding is not provided, so after the installation, bind a preferred key sequence with this plugin before use.  
For example:
```fish
# bind alt+g
$ bind \eg underbar
# type a command in command line, then press alt+g to let the function expand your command, and finally press enter to execute it.
$ echo 'foo
bar'
# then the content of stdout is kept in the global variable underbar, and you can manipulate it like any other Fish variables,
# or inspect.
$ set --show underbar
```
> $underbar: set in global scope, unexported, with 2 elements  
> $underbar[1]: |foo|  
> $underbar[2]: |bar|  

By pressing the binding key again, the wrap is toggle-off.  

By binding another function named `underbar_show`, it will be easy to inspect the variable.  
For example:
```fish
# bind alt+i
$ bind \ei underbar_show
# then press alt+i, `set --show underbar` is executed, and prior content is shown.
```

# License

[MIT][mit] © [nj][author] et [al][contributors]


[mit]:            https://opensource.org/licenses/MIT
[author]:         https://github.com/nianjie
[contributors]:   https://github.com/nianjie/plugin-underbar/graphs/contributors
[omf-link]:       https://www.github.com/oh-my-fish/oh-my-fish

[license-badge]:  https://img.shields.io/badge/license-MIT-007EC7.svg?style=flat-square
