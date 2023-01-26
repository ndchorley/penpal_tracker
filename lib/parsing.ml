let parse_penpals lines =
  List.map
    (String.split_on_char '|')
    lines
