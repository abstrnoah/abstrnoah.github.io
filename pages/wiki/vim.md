---
permalink: /wiki/vim
---

A text editor that the author thinks is very cool.

* homepage: [vim]

# for beginner vimmers

## notes

* There are many existing [resources](#resources) for Vim, so I'm not going to
  try writing an exhaustive tutorial. Instead, I'll just list some jumping-off
  points.

* Vim just might be the single best documented software in existence. Its
  documentation is accessible via the `:help` command. See [below](#docs)
  for recommended places to start.

* Before reading any further, you might want to consider [neovim]. I'm set in my
  ways and haven't had time to make the transition, but I hear that it's nice
  over there. In particular, neovim supports [tree-sitter].

* Vim is not an IDE, and you shouldn't expect it to be one. Nor is it an
  operating system (looking at you Emacs). It's just a damn good editor.

* Summary of Vim's __mental model__, which notoriously sets it apart from most
  other editors:
    * There are different *modes*, and the meaning of keystrokes differs between
      modes. The most important modes are "normal" and "insert". Normal mode is
      where Vim, and where you go when you hit <kbd>esc</kbd>. Insert mode is
      where Vim behaves like a "usual editor"; you get into insert mode by
      hitting <kbd>i</kbd> from normal mode.
    * (There are also other modes, namely visual and command mode; see `:help
      vim-modes`.)
    * In normal mode, keystrokes comprise something of a primitive *language*,
      with *verbs*, *modifiers*, and *objects*. Keep this in mind as you
      continue your journey, and try to spot which is which.

* A great zeroth step is to walk through `vimtutor`. It should come installed
  with Vim and can be invoked on the command line.

* After running through `vimtutor` and before continuing your journey, I
  recommend reading through a substantial amount of __documentation__. Some
  folks would probably disagree but, in my experience, pre-loading a bunch of
  documentation (even if you don't remember it all the first time) is the best
  way to get up the steep learning curve. See the [section below](#docs).

* If you find it cumbersome to hit <kbd>esc</kbd>, then use the
  more ergonomic equivalent <kbd>ctrl-[</kbd>. (I haven't touched the
  <kbd>esc</kbd> key in six years.) If you really wanna go hard-core, then map
  <kbd>capslock</kbd> to <kbd>ctrl</kbd> (I prefer this over mapping
  <kbd>capslock</kbd> to <kbd>esc</kbd> because <kbd>ctrl</kbd> is more
  versatile; many keystrokes have <kbd>ctrl-</kbd> aliases).

* If you're new to the terminal, then hop over to a list of [tools](/wiki/tools)
  that you might find useful, namely [tmux].


## docs

Here are some help tags I recommend reading first.

Like I said above, Vim is extremely well documented, and all the documentation
is accessible from inside Vim via `:help`. In fact, there are two internal
manuals: the _Reference manual_ and the _User manual_ (as outlined in `:help
usr_01`).

* `:help` - The top of the _Reference manual_. Explains how the internal
  documentation is organised.

* `:help usr_01` - The first chapter of the _User manual_.

* Windows, buffers, tabs, splitting (`:help windows`, `buffers`, `tabpage`,
  `usr_07`, `usr_08`)
    * I'll emphasise the associated __mental model__: Windows are contained in
      tabs, not the other way around. A single buffer can be opened in
      multiple windows, or no windows at all. Thus, don't hesitate to
      create/destroy windows and tabs frequently; the actual buffer (along with
      current location and undo history) will remain in memory.

* Text objects (`:help 04.8`)
    * This is one of Vim's most powerful features---it's ability to recognise
      text *structure*. Basic examples are the "word", "sentence", and
      "paragraph" text objects; but there are many more, including
      language-specific text objects (for example, the [vimtex] plugin
      introduces a LaTeX environment text object).

* Completion (`:help ins-completion`)
    * This is something many folks think requires a plugin. In fact, Vim has
      solid built-in completion support. In a similar vein, you might want to
      read about tags (requires external binary); see `:help ctags` and `tags`.

* Registers (`:help registers`)
    * You can go far just <kbd>y</kbd>anking and <kbd>p</kbd>asting without any
      knowledge of registers, but learning Vim's register system can make a lot
      of tasks more efficient.
    * The special expression register (`:help "=`) is particularly useful.

## plugins and scripting

Okay soapbox time:
* Use plugins as little as possible. Do some research before installing plugins
  to determine if Vim can already solve your problem.
* When you do use plugins, look for those that do things the "Vim way" rather
  than ones that try to emulate other tools. In particular,
    * Plugins should implement relevant text objects ([vimtex] is a great
      example of this done correctly). (In contrast, I've seen some plugins that
      try "re-implementing" text objects which tends to come at a performance
      cost.
    * Plugins should not overwrite existing mappings; they should make their
      mappings optional or configurable. Ideally, plugins should map to
      "virtual" `<plug>` maps that can then be mapped by the user as needed (see
      `:help <Plug>`).
    * Plugins should follow the [Unix philosophy][unix-phil] of "do one thing
      well". Plugins that try to do highlighting, navigation, completions, etc.
      all at once tend to be a pain to work with and conflict with pre-existing
      configuration/plugins.
* Prefer default mappings and only change them if you really need to. Don't be
  the fool that customises Vim so hard that you're incapable of vimming on
  another machine without your configuration. Definitely try to avoid changing
  the low-level maps like <kbd>h</kbd>, <kbd>j</kbd>, <kbd>k</kbd>,
  <kbd>l</kbd>, <kbd>w</kbd>, <kbd>a</kbd>, etc. I've found that a lot of
  plugins like modifying <kbd>Enter</kbd>, which can lead to annoying conflicts
  and performance costs.
* Don't copy other people's vimrc. The reason is that every time you copy
  someone's vimrc, according to [romainl][idiomatic-vimrc], a panda goes to
  jail.

That all said, you will eventually want to write a vimrc and install plugins.
Here are some places to start.

* See [romainl]'s [idiomatic-vimrc] for some vimrc guidelines.
* Read chapters `usr_40` and above of the _User manual_.

* Recommended plugin manager: [junegunn/vim-plug][vim-plug]
    * Vim has a builtin "pack" system, but last time I checked it wasn't as
      elegant as vim-plug. In particular, vim-plug is entirely declarative (the
      state is determined by some lines of code in your vimrc), whereas the pack
      system is not.
* Recommended first plugin: [907th/vim-auto-save][vim-auto-save]
    * It automatically saves. Why would you ever edit things without saving? Use
      undo (`:help undo`) and [git] if you're worried about preserving the past.
    * I haven't had to interact with this plugin since the day I installed it.
      There are probably more modern plugins that do this, but this one is
      simple and dependable.

# vim community

Vim has a great welcoming community that's happy to help. In particular, the IRC
channel `#vim` on [libera] is frequented by a bunch of friendly characters
who are also very powerful Vim users. Check out the [webpage][vi-improved-org]
for details.

# resources

*Submit an issue if you think something should be added to the list!*

* Vim's *User manual* and *Reference manual*, accessible via `:help`; see
  [above](#docs).
* [Romainl][romainl]'s [*Idiomatic Vimrc*][idiomatic-vimrc].
* The famous Stack Overflow post, ["Your problem with Vim is that you don't grok
  vi."][grok].
* [Vim's community](#vim-community).
* [*Vim Tips Wiki*][vimtips] on Fandom.

[vim]: https://www.vim.org/
[romainl]: https://github.com/romainl
[idiomatic-vimrc]: https://github.com/romainl/idiomatic-vimrc
[grok]: http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118
[vimtips]: https://vim.fandom.com
[vim-plug]: https://github.com/junegunn/vim-plug
[vimtex]: https://github.com/lervag/vimtex
[vim-auto-save]: https://github.com/907th/vim-auto-save
[git]: https://git-scm.com/
[vi-improved-org]: https://www.vi-improved.org/
[neovim]: https://neovim.io/
[tree-sitter]: https://tree-sitter.github.io/tree-sitter/
[unix-phil]: https://en.wikipedia.org/wiki/Unix_philosophy
[libera]: https://libera.chat/
[tmux]: https://github.com/tmux/tmux/wiki
