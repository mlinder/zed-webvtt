; Settings and tag names the specification doesn't define get no capture,
; so they show as plain text: typos such as `positon:` or `<cc>` stand out.

; --- Header ---

"WEBVTT" @tag.doctype
(header title: (title) @title)

(metadata name: (metadata_name) @property)
(metadata ["=" ":"] @punctuation.delimiter)
(metadata value: (metadata_value) @string)

; --- Blocks ---

(comment) @comment
["STYLE" "REGION"] @keyword

(cue_identifier) @label

; --- Timing and settings ---

(timestamp) @number
"-->" @operator

((cue_timing (setting name: (setting_name) @property))
 (#any-of? @property "vertical" "line" "position" "size" "align" "region"))

((region (setting name: (setting_name) @property))
 (#any-of? @property
   "id" "width" "lines" "regionanchor" "viewportanchor" "scroll"))

(setting ":" @punctuation.delimiter)

; Region names: region:bottom, id:bottom
((setting
   name: (setting_name) @_name
   value: (setting_value) @string)
 (#any-of? @_name "region" "id"))

; Numbers and percentages: 3, 18%, -1, 0%,100%
((setting
   name: (setting_name) @_name
   value: (setting_value) @number)
 (#not-any-of? @_name "region" "id")
 (#match? @number "^-?[0-9.]+%?(,-?[0-9.]+%?)?$"))

; Keywords: start, center, rl, up, auto, line-left, …
((setting
   name: (setting_name) @_name
   value: (setting_value) @constant @variant)
 (#not-any-of? @_name "region" "id")
 (#not-match? @variant "^-?[0-9.]+%?(,-?[0-9.]+%?)?$"))

; --- Cue text ---

((start_tag name: (tag_name) @tag)
 (#any-of? @tag "b" "i" "u" "c" "v" "lang" "ruby" "rt"))

((end_tag name: (tag_name) @tag)
 (#any-of? @tag "b" "i" "u" "c" "v" "lang" "ruby" "rt"))

(start_tag class: (class_name) @attribute)
(start_tag "." @punctuation.delimiter)

; Speaker (<v Anna>) and language (<lang sv>)
(start_tag annotation: (annotation) @string)

(start_tag ["<" ">"] @punctuation.bracket)
(end_tag ["</" ">"] @punctuation.bracket)
(timestamp_tag ["<" ">"] @punctuation.bracket)

(entity) @string.escape
