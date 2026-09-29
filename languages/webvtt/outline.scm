; One entry per cue: its start time and all of its text, without tags:
; "00:00:41.920 Det här är min storebror. Han är 9 år och heter Tommy."
(cue
  timing: (cue_timing start: (timestamp) @name)
  (cue_text
    [(text) @name (entity) @name (start_tag) (end_tag) (timestamp_tag)]*)*) @item

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
