# Wi-Fi Filter & Forget for Omarchy

Omarchy's own Wi-Fi panel with two additions: type to filter a long network
list, and Forget on every saved network, including the one you're connected
to. It looks and behaves like the stock panel otherwise, and replaces it on the
bar when enabled.

- **Type to filter.** Start typing and the list narrows to networks whose name
  contains what you typed (case-insensitive). The filter shows above the list;
  Backspace edits it. Esc clears the filter, and a second Esc closes the panel.
- **Forget any saved network.** Every network with a saved profile shows the
  Forget button, the connected one included (forgetting it also disconnects).
  The stock panel only offers Forget on saved networks you're not connected to,
  and hides it until hover. Delete forgets the highlighted network.
- **Same shortcuts, moved off the letter keys** so typing can filter: rescan is
  Ctrl+R and Wi-Fi on/off is Ctrl+W (stock: `r` and `w`). Arrow keys navigate;
  h/j/k/l no longer do.

Open it like the stock panel: click the Wi-Fi icon on the bar, or Super+Ctrl+W.

## Keyboard

| Key | Action |
|-----|--------|
| letters, digits, symbols | filter by network name |
| Backspace | edit the filter |
| ↑ / ↓ | move between networks |
| → / ← | move to / from a row's Forget button |
| Enter | connect, or disconnect the connected network |
| Delete | forget the highlighted saved network |
| Ctrl+R | rescan |
| Ctrl+W | turn Wi-Fi on or off |
| Tab | move to the next panel |
| Esc | clear the filter, then close |

## Install

```bash
omarchy plugin add https://github.com/yeutterg/omarchy-wifi-filter --enable
```

Enabling it swaps it in for Omarchy's `omarchy.network` panel; nothing else is
configured. It needs nothing beyond Omarchy itself (it uses the same
NetworkManager integration as the stock panel).

## Remove

```bash
omarchy plugin remove io.github.yeutterg.wifi-filter
```

Omarchy's stock Wi-Fi panel comes back in its place.

## Notes

- This is a copy of Omarchy's `omarchy.network` panel (Omarchy 4.0.4) with the
  changes above. Fixes Omarchy makes to its own panel later won't appear here
  until this plugin is updated.
- Networks that are out of range aren't listed, so they can't be forgotten
  here; use `nmcli connection delete <name>` for those.

## License

MIT, as is Omarchy, which this is based on. See [LICENSE](LICENSE).
