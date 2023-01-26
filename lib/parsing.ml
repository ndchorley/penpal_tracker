open Model

let parse_penpal line =
  let parts = (String.split_on_char '|' line) in
    {name = (List.nth parts 0);
     address = (List.nth parts 1);
     letter_sent = (String.contains (List.nth parts 2) 'x')}

let parse_penpals lines =
  List.map
    parse_penpal
    lines
