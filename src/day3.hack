use namespace HH\Lib\{C, Str, Vec};

class Day3 {
  private vec<vec<bool>> $lines = vec[];  

  public function __construct(string $file_name) {
    $handle = \fopen($file_name, "r");

    if ($handle) {
      $line = \fgets($handle);
      while ($line  !== false) {
        $this->lines[] = Str\trim($line)
          |> Str\split($$, '')
          |> Vec\map($$, $char ==> $char === '#');

        $line = \fgets($handle);
      }
    }
  }

  private function count_trees(int $right, int $down): int {
    $count = 0;
    $row = 0;
    $col = 0;
    
    while ($row < C\count($this->lines)) {
      $count += $this->lines[$row][$col] ? 1 : 0;
      $row += $down;
      $col = ($col + $right) % C\count($this->lines[0]);
    }

    return $count;
  }

  private function part_one(): int {
    return $this->count_trees(3, 1);
  }

  private function part_two(): int {
    return $this->count_trees(1, 1)
      |> $$ * $this->count_trees(3, 1)
      |> $$ * $this->count_trees(5, 1)
      |> $$ * $this->count_trees(7, 1)
      |> $$ * $this->count_trees(1, 2);
  }

  public static function solve(string $sample_file, string $input_file): string {
    $sample = new Day3($sample_file);
    $input = new Day3($input_file);

    $lines = vec[
      Str\format("part 1 : %d - %d", $sample->part_one(), $input->part_one()),
      \PHP_EOL,
      Str\format("part 2 : %d - %d", $sample->part_two(), $input->part_two()),
      \PHP_EOL,
    ];

    return Str\join($lines, '');
  }
}
