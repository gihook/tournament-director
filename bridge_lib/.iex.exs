IO.puts("=== Hello world ===")

table1 = %Table{
  number: 1,
  rounds: [
    %Round{number: 1, ns_pair_id: 1, ew_pair_id: 2, board_set: 1, board_numbers: [1, 2, 3]},
    %Round{number: 2, ns_pair_id: 1, ew_pair_id: 4, board_set: 2, board_numbers: [4, 5, 6]},
    %Round{number: 3, ns_pair_id: 1, ew_pair_id: 6, board_set: 3, board_numbers: [7, 8, 9]},
    %Round{number: 4, ns_pair_id: 1, ew_pair_id: 5, board_set: 4, board_numbers: [10, 11, 12]},
    %Round{number: 5, ns_pair_id: 1, ew_pair_id: 3, board_set: 5, board_numbers: [13, 14, 15]}
  ]
}

table2 = %Table{
  number: 2,
  rounds: [
    %Round{number: 1, ns_pair_id: 3, ew_pair_id: 4, board_set: 3, board_numbers: [10, 11, 12]},
    %Round{number: 2, ns_pair_id: 2, ew_pair_id: 6, board_set: 3, board_numbers: [10, 11, 12]},
    %Round{number: 3, ns_pair_id: 4, ew_pair_id: 5, board_set: 1, board_numbers: [1, 2, 3]},
    %Round{number: 4, ns_pair_id: 6, ew_pair_id: 3, board_set: 1, board_numbers: [1, 2, 3]},
    %Round{number: 5, ns_pair_id: 5, ew_pair_id: 2, board_set: 5, board_numbers: [13, 14, 15]}
  ]
}

table3 = %Table{
  number: 3,
  rounds: [
    %Round{number: 1, ns_pair_id: 5, ew_pair_id: 6, board_set: 2, board_numbers: [4, 5, 6]},
    %Round{number: 2, ns_pair_id: 3, ew_pair_id: 5, board_set: 3, board_numbers: [10, 11, 12]},
    %Round{number: 3, ns_pair_id: 2, ew_pair_id: 3, board_set: 2, board_numbers: [4, 5, 6]},
    %Round{number: 4, ns_pair_id: 4, ew_pair_id: 2, board_set: 3, board_numbers: [10, 11, 12]},
    %Round{number: 5, ns_pair_id: 6, ew_pair_id: 4, board_set: 5, board_numbers: [13, 14, 15]}
  ]
}

movement = %Movement{type: "Howell 3", tables: [table1, table2, table3]}
