# WebVTT for Zed

[WebVTT](https://www.w3.org/TR/webvtt1/) (Web Video Text Tracks) support for
[Zed](https://zed.dev): subtitles, captions, chapters and metadata tracks in
`.vtt` and `.webvtt` files, including HLS subtitle segments.

## Features

- **Syntax highlighting** for the header and its metadata (`Kind:`,
  HLS `X-TIMESTAMP-MAP`), cue identifiers, timestamps, cue settings,
  `NOTE` comments, `REGION` blocks, and cue text tags (`<b>`, `<i>`, `<u>`,
  `<c.class>`, `<v Speaker>`, `<lang>`, `<ruby>`), karaoke timestamps and
  entities
- **Typos stand out**: cue settings, region settings and tag names that the
  specification doesn't define are shown as plain text, so `positon:18%` or
  `<cc>` catch your eye
- **CSS in `STYLE` blocks**, highlighted by Zed's CSS support
- **Outline** (`cmd-shift-o` and the outline panel): one entry per cue, with
  its start time and full text without tags, so you can search the dialogue;
  `STYLE` with its `::cue` rules, and regions by id
- **Snippets**: `webvtt`, `cue`, `cue-settings`, `note`, `style`, `region`,
  `voice` and `class`

The grammar is [tree-sitter-webvtt](https://github.com/mlinder/tree-sitter-webvtt).

## Installation

Open the Extensions page (`zed: extensions`), search for **WebVTT** and click
**Install**. Files ending in `.vtt` or `.webvtt`, and other files whose first
line is `WEBVTT`, are recognized automatically.

## Known limitations

- This is syntax highlighting, not validation: timestamps aren't checked for
  order, and unbalanced tags aren't reported.
- WebVTT has no line comments, so `cmd-/` does nothing. Use a `NOTE` block.

## Development

1. Clone this repository and
   [tree-sitter-webvtt](https://github.com/mlinder/tree-sitter-webvtt).
2. To try local grammar changes, point `[grammars.webvtt]` in
   `extension.toml` at your checkout, e.g.
   `repository = "file:///path/to/tree-sitter-webvtt"`, and set `rev` to a
   commit that includes the regenerated `src/`. Delete this repository's
   `grammars/` folder whenever the repository URL changes.
3. In Zed, run `zed: install dev extension` and select this directory. After
   changing queries, snippets or `rev`, click **Rebuild** on the WebVTT
   extension in the Extensions page.

## License

[MIT](LICENSE)
