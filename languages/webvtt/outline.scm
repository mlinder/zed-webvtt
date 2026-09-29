; Each cue by its timing, with one child entry per line of text, tags left
; out:
;
;   00:00:06.240 --> 00:00:10.880
;     — Etiam eu eros mauris.
;     — Cras laoreet in nisl quis lacinia.
;
; The lines can't go into the cue's own label: Zed computes breadcrumbs by
; querying a small range around the cursor, and a pattern that repeats over
; the cue's lines only matches once that range reaches the last line.
(cue
  timing: (cue_timing
    start: (timestamp) @name
    "-->" @name
    end: (timestamp) @name)) @item

(cue_text
  [(text) @name (entity) @name (start_tag) (end_tag) (timestamp_tag)]*) @item

; STYLE, with the CSS outline's ::cue rules nested below
(style
  "STYLE" @name) @item

; Regions by id: "REGION bottom"
(region
  "REGION" @context
  (setting
    name: (setting_name) @_name
    value: (setting_value) @name)
  (#eq? @_name "id")) @item
