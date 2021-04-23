# neuron-kak

This repository contains useful commands for interacting with
[neuron](https://neuron.zettel.page) command line tool.

## Requirements

You need to have [neuron installed](https://neuron.zettel.page/install).

## Installing and configuring

The recommended approach is to use [plug.kak](https://github.com/andreyorst/plug.kak)
for installing this plugin.

The snippet below shows how to install the plugin and also contains the
recommended configuration (AKA how I personally use it).

```kak
plug "MilanVasko/neuron-kak" config %{
	# the following is a recommended configuration

	declare-user-mode neuron
	map global neuron n -docstring "create new neuron note with random ID" ": neuron-new<ret>"
	map global neuron N -docstring "create new neuron note"                ": neuron-new "
	map global neuron s -docstring "search titles and open zettel"         ": neuron-search-and-open<ret>"
	map global neuron S -docstring "search all and open zettel"            ": neuron-search-and-open -a<ret>"
	map global neuron i -docstring "search titles and insert zettel ID"    ": neuron-search-and-insert<ret>"
	map global neuron I -docstring "search all and insert zettel ID"       ": neuron-search-and-insert -a<ret>"
}
```

## Functionality

The following commands are provided:

- `neuron-new` - creates a new zettel (note)
- `neuron-search-and-open` - searches for zettels interactively
- `neuron-search-and-insert` - inserts the zettel ID of found zettel into the
  document

More commands may come in the future if I get ideas for new ones - all of the
existing ones have their origins in my personal need. For now, these should be
enough to make the most common tasks easier.

## Contributing

If you'd like to contribute, please do! There are no hard rules to follow, just
create an issue or a pull request and I'll try to get back to you (no promises
though).

