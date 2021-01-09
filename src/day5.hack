use namespace HH\Lib\{C, Str, Vec, Math};

class Day5 extends DayBase {
  public function __construct(string $file_name) {
    parent::load_file($file_name);
  }

  private static function row_to_id(string $row_file): int {
    $row = Str\slice($row_file, 0, 7);
    $seat = Str\slice($row_file, 7, 3);

    $r = 0;
    $s = 0;

    foreach(Str\split($row, '') as $i => $c) {      
      $p1 = (int)($c === 'F' ? 0 : 1);
      $p2 = (int)(Str\length($row) - $i - 1);
      $r += (int)($p1 * (2 ** $p2));
    }

    foreach(Str\split($seat, '') as $i => $c) {
      $p1 = (int)($c === 'L' ? 0 : 1);
      $p2 = (int)(Str\length($seat) - $i - 1);
      $s += (int)($p1 * (2 ** $p2));
    }

    return $r * 8 + $s;
  }

  private function part_one(): int {
    $test = Vec\map($this->lines, $line ==> self::row_to_id($line));
    return Math\max($test) ?? 0;
  }

  private function part_two(): int {
    $test = Vec\map($this->lines, $line ==> self::row_to_id($line));
    $test = Vec\sort($test);
    

    $index = 1;
    while ($test[$index] - $test[$index - 1] === 1) {
      $index += 1;
    }

    return $test[$index - 1]+1;
  }

  public static function solve(string $sample_file, string $input_file): string {
    $sample = new Day5($sample_file);
    $input = new Day5($input_file);

    return Str\join(vec[
      Str\format("part 1 : %d - %d", $sample->part_one(), $input->part_one()),
      \PHP_EOL,
      Str\format("part 2 : %d - %d", $sample->part_two(), $input->part_two()),
      \PHP_EOL,
    ], '');
  }
}