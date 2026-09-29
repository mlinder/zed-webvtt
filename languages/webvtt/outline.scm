; One entry per cue: its start time and the first words of its text,
; skipping leading tags: "00:00:41.920 Det här är min storebror."
(cue
  timing: (cue_timing start: (timestamp) @name)
  .
  (cue_text . (start_tag)* . (text) @context)?) @item

; Regions by id: "REGION bottom"
(region
  "REGION" @context
  (setting
    name: (setting_name) @_name
    value: (setting_value) @name)
  (#eq? @_name "id")) @item
