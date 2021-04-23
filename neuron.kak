define-command -docstring '
	Creates a new neuron note and opens it.

	All the arguments are appended after the `neuron new` command.
' -params .. neuron-new %{ evaluate-commands %sh{
	printf "%s\n" "edit \"$(neuron new "$@" 2>/dev/null)\""
} }

define-command -docstring '
	Performs an interactive neuron search in a new terminal window.
	Whatever file is selected will be opened.

	All the arguments are appended after the `neuron search` command.
' -params .. neuron-search-and-open %{ evaluate-commands %sh{
	script="$(mktemp)"

	cat << EOF > $script
found_file="\$(neuron search $@)"

if [ -n "\$found_file" ]; then
	printf "%s\n" "evaluate-commands -client \"$kak_client\" edit \"\$found_file\"" | kak -p $kak_session
fi

rm "$script"
EOF

	chmod +x "$script"
	printf "%s\n" "terminal \"$script\""
} }

define-command -docstring '
	Performs an interactive neuron search in a new terminal window.
	Whatever file is selected, its zettel ID will be inserted into the current cursor position.

	All the arguments are appended after the `neuron search` command.
' -params .. neuron-search-and-insert %{ evaluate-commands %sh{
	script="$(mktemp)"

	cat << EOF > $script
found_file="\$(neuron search $@)"

if [ -n "\$found_file" ]; then
	stripped_name="\$(basename -s ".md" "\$found_file")"
	printf "%s\n" "execute-keys -client \"$kak_client\" \"i\$stripped_name<esc>\"" | kak -p $kak_session
fi

rm "$script"
EOF

	chmod +x "$script"
	printf "%s\n" "terminal \"$script\""
} }

